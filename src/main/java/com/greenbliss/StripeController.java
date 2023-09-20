package com.greenbliss;

import com.greenbliss.dao.OrderRepository;
import com.greenbliss.dao.PaymentRepository;
import com.greenbliss.dao.ProductRepository;
import com.greenbliss.entities.Customer;
import com.greenbliss.entities.Orders;
import com.greenbliss.entities.Payment;
import com.greenbliss.entities.Product;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.PaymentIntent;
import com.stripe.param.PaymentIntentCreateParams;
import jakarta.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class StripeController {


    @Value("${stripeApikey}")
    private String apiKey;

    public final ApplicationContext context = ApplicationContextProvider.getApplicationContext();



    // **** Payment
    @RequestMapping(path="/payment" ,method = RequestMethod.POST)
    public ModelAndView payment (HttpSession httpSession , @RequestParam int amount ) throws StripeException {
        Stripe.apiKey = apiKey;

        ModelAndView model = new ModelAndView();
        if(httpSession.getAttribute("currentuser")!=null) {


            Customer customer = (Customer) httpSession.getAttribute("currentuser");


            PaymentIntentCreateParams params =
                    PaymentIntentCreateParams.builder()
                            .setAmount((long) amount)
                            .setCurrency("inr")
                            .setPaymentMethod("pm_card_visa")
                            .build();

            PaymentIntent paymentIntent = PaymentIntent.create(params);

            model.addObject("amount", amount);
            model.addObject("paymentId", paymentIntent.getId());
            System.out.println(paymentIntent.getId());
            model.setViewName("paymentsuccess");

            OrderRepository orderRepository = context.getBean(OrderRepository.class);

            Orders order = orderRepository.findByCidAndOdate(customer.getCid(), (String) httpSession.getAttribute("odate"));
            System.out.println(order);

            PaymentRepository paymentRepository = context.getBean(PaymentRepository.class);

            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            String pdate = dtf.format(now);

            Payment payment = new Payment(paymentIntent.getId(), customer.getCid(),order.getOid(),amount,pdate, "Successful");

            paymentRepository.save(payment);
            System.out.println(payment);


            order.setOstatus("Received");

            System.out.println(order);


            orderRepository.save(order);

            httpSession.removeAttribute("odate");

            String products = order.getOprods();
            JSONArray jsonArray = new JSONArray(products);

            List<Product> productList = new ArrayList<>();

            for (int i = 0; i < jsonArray.length(); i++) {
                JSONObject productObj = jsonArray.getJSONObject(i);
                int productId = productObj.getInt("productId");
                int productUnits = productObj.getInt("productUnits");

                Product product = new Product();
                product.setPid(productId);
                product.setPunits(productUnits);

                productList.add(product);
            }

            ProductRepository productRepository = context.getBean(ProductRepository.class);

            for(Product p: productList)
            {
                Product product = productRepository.getProductByPid(p.getPid());
                product.setPunits((product.getPunits()-p.getPunits()));
                productRepository.save(product);
            }

            return model;
        }
        else
        {
            model.setViewName("alerts/alertNotLoggedIn");
            return model;
        }


    }
}
