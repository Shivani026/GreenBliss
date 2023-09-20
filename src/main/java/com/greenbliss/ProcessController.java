package com.greenbliss;

import com.greenbliss.dao.*;
import com.greenbliss.entities.*;
import jakarta.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Optional;

@Controller

public class ProcessController {

    @Value("${imgPath}")
    private String rootPath;


    public final ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    // **** Customer SignUp
    @RequestMapping(path = "/signupprocess", method = RequestMethod.POST)
    public String handleSignUpForm(@ModelAttribute Customer customer)
    {
        try {
            System.out.println(customer);
            CustomerRepository customerRepository = context.getBean(CustomerRepository.class);
            customerRepository.save(customer);

        }
        catch(Exception e)
        {
            return "alerts/alertFailure";
        }
        return "alerts/alertSuccess";

    }


    // **** Admin SignUp
    @RequestMapping(path = "/adminsignupprocess", method = RequestMethod.POST)
    public String handleAdminSignUpForm(@ModelAttribute Admin admin)
    {
        try {
            System.out.println(admin);
            System.out.println(context);
            AdminRepository adminRepository = context.getBean(AdminRepository.class);
            adminRepository.save(admin);
            return "alerts/alertAdminSuccess";
        }
        catch(Exception e)
        {
            System.out.println(e);
            return "alerts/alertAddFailure";
        }
    }

    // **** Customer Login
    @RequestMapping(path = "/loginprocess", method = RequestMethod.POST)
    public String handleLoginForm(HttpSession httpSession, @RequestParam String Cmail , @RequestParam String Cpass)
    {

        try {

            CustomerRepository customerRepository = context.getBean(CustomerRepository.class);
            Customer customer = customerRepository.findByCmailAndCpass(Cmail, Cpass);
            String cusMail = customer.getcmail();

            httpSession.setAttribute("currentuser", customer);

            return "alerts/alertloginsuccess";
        }
        catch(Exception e)
        {

            return "alerts/alertLoginFailure";
        }
    }


    // **** Admin Login
    @RequestMapping(path = "/adminloginprocess", method = RequestMethod.POST)
    public String handleAdminLoginForm(HttpSession httpSession ,@RequestParam String amail ,@RequestParam String apass)
    {
        try {

            AdminRepository adminRepository = context.getBean(AdminRepository.class);
            Admin admin = adminRepository.findByAmailAndApass(amail, apass);
            String cusMail = admin.getAmail();

            httpSession.setAttribute("currentuser", admin);

            return "alerts/alertAdminLoginsuccess";
        }
        catch(Exception e)
        {

            return "alerts/alertAdminLoginFailure";
        }
    }


    // **** Admin Add Products
    @RequestMapping(path = "/addproductprocess", method = RequestMethod.POST)
    public String handleAddProducts(

            @RequestParam String pname,
            @RequestParam String pdetails,
            @RequestParam int pprice,
            @RequestParam int punits,
            @RequestParam String pcategory,
            @RequestParam MultipartFile pimg

    )
    {
        try {

            System.out.println(rootPath);
            String savePath = Base64.getEncoder().encodeToString(pimg.getBytes());
            ProductRepository productRepository = context.getBean(ProductRepository.class);
            Product product = new Product(pname,pdetails,pprice,punits, savePath, pcategory);
            productRepository.save(product);
            return "alerts/alertAddSuccess";
        }
        catch(Exception e)
        {
            System.out.println(e);
            return "alerts/alertAdminFailure";
        }

    }

    // **** Admin Delete Products
    @RequestMapping(path = "/deleteproductprocess/{pid}", method = RequestMethod.POST)
    public String handleDeleteProduct(@PathVariable String pid)
    {
        int ProdId = Integer.parseInt(pid);
        ProductRepository productRepository = context.getBean(ProductRepository.class);
        Product product = productRepository.getProductByPid(ProdId);

        productRepository.delete(product);
        return "redirect:/manageproducts";
    }

    @RequestMapping(path = "/repaymentform", method = RequestMethod.POST)
    public String repaymentform(HttpSession httpSession, @RequestParam int oid)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Orders order = orderRepository.findByOid(oid);
        if(order.getOstatus().equals("Payment Pending")) {

            httpSession.setAttribute("oid", oid);
            return paymentform(httpSession, order.getOname(), order.getOmail(), order.getOmob(), order.getOadd(), order.getOprods(), order.getOtotalamt());
        }
        else
        {
            return "alerts/alertPaymentAlreadyDone";
        }
    }

    @RequestMapping(path = "/paymentform", method = RequestMethod.POST)
    public String paymentform(
            HttpSession httpSession,
            @RequestParam String oname,
            @RequestParam String omail,
            @RequestParam String omob,
            @RequestParam String oadd,
            @RequestParam String oprods,
            @RequestParam int amount
    )
    {

        JSONArray jsonArray = new JSONArray(oprods);

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
            if(product.getPunits()<p.getPunits())
            {
                return "alerts/alertQuantityUnavailable";
            }

        }

        Customer customer = (Customer) httpSession.getAttribute("currentuser");
        OrderRepository orderRepository = context.getBean(OrderRepository.class);

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String odate = dtf.format(now);
        if(httpSession.getAttribute("oid")!=null)
        {
            Orders order = orderRepository.findByOid((Integer)httpSession.getAttribute("oid"));
            httpSession.setAttribute("odate", order.getOdate());
            httpSession.setAttribute("amount", amount);
        }
        else
        {
            Orders order = new Orders(oname, omail, oadd, omob, oprods, odate, amount, "Payment Pending", customer.getCid());

            orderRepository.save(order);
            httpSession.setAttribute("odate", odate);
            httpSession.setAttribute("amount", amount);
        }

        return "paymentform";
    }


    @RequestMapping("/paymentsuccess")
    public String paymentsuccess(Model model)
    {
        return "paymentsuccess";
    }

    @RequestMapping("/raiseticket")
    public String raiseticket(HttpSession httpSession, @RequestParam String tsub, @RequestParam String tcon)
    {
        Customer customer = (Customer) httpSession.getAttribute("currentuser");
        TicketRepository ticketRepository = context.getBean(TicketRepository.class);

        Ticket ticket = new Ticket(tsub,tcon,customer.getCid());
        ticket.setTres("");
        ticketRepository.save(ticket);

        return "alerts/alertTicketSuccess";
    }
    @RequestMapping("/submitfeedback")
    public String submitfeedback(HttpSession httpSession, @RequestParam String fcomment, @RequestParam int frating)
    {
        Customer customer = (Customer) httpSession.getAttribute("currentuser");
        FeedbackRepository feedbackRepository = context.getBean(FeedbackRepository.class);

        Feedback feedback = new Feedback(fcomment,frating,customer.getCid());
        feedbackRepository.save(feedback);

        return "alerts/alertFeedbackSuccess";
    }
    @RequestMapping("/completeorderprocess")
    public String completeorderprocess(@RequestParam int id)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Orders order = orderRepository.findByOid(id);
        if(order.getOstatus().equals("Payment Pending"))
        {
            return "alerts/alertInvalidStatus";
        }
        else
        {

            order.setOstatus("Completed");
            orderRepository.save(order);
        }

        return "redirect:/adminorders";
    }
    @RequestMapping("/acceptorderprocess")
    public String acceptorderprocess(@RequestParam int id)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Orders order = orderRepository.findByOid(id);

        if(order.getOstatus().equals("Payment Pending"))
        {
            return "alerts/alertInvalidStatus";
        } else
        {
            order.setOstatus("Received");
            orderRepository.save(order);


            PaymentRepository paymentRepository = context.getBean(PaymentRepository.class);
            Payment payment = paymentRepository.findByOid(id);

            payment.setPayStatus("Successful");
            paymentRepository.save(payment);

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
        }

        return "redirect:/adminorders";
    }

    @RequestMapping("/respondtoticket/{id}")
    public String respondtoticket(@PathVariable int id, @RequestParam String tres)
    {
        TicketRepository ticketRepository = context.getBean(TicketRepository.class);
        Ticket ticket = ticketRepository.findByTid(id);

        ticket.setTres(tres);

        ticketRepository.save(ticket);

        return "redirect:/managetickets";
    }

    @RequestMapping("/payviaqr")
    public ModelAndView payviaqr(HttpSession httpSession,@RequestParam int amount,@RequestParam String payid)
    {
        ModelAndView model = new ModelAndView();

        Customer customer = (Customer) httpSession.getAttribute("currentuser");

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
        LocalDateTime now = LocalDateTime.now();
        String pdate = dtf.format(now);

        model.addObject("amount", amount);
        model.addObject("paymentId", payid);

        model.setViewName("paymentunderverification");

        OrderRepository orderRepository = context.getBean(OrderRepository.class);

        Orders order = orderRepository.findByCidAndOdate(customer.getCid(), (String) httpSession.getAttribute("odate"));

        PaymentRepository paymentRepository = context.getBean(PaymentRepository.class);

        Payment payment = new Payment(payid, customer.getCid(),order.getOid(),amount,pdate, "Pending");

        paymentRepository.save(payment);

        order.setOstatus("Pending with admin for verification for PaymentId : "+payid);

        System.out.println(order);

        orderRepository.save(order);

        httpSession.removeAttribute("odate");

        return model;
    }

    @RequestMapping("/deleteorderprocess")
    public String deleteOrder(@RequestParam int oid)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Orders order = orderRepository.findByOid(oid);
        if(order.getOstatus().equals("Payment Pending")) {
            orderRepository.delete(order);
        }
        else
        {
            return "alerts/alertDeleteOrderFailure";
        }

        return "myorders";

    }

    @RequestMapping("/admindeleteorderprocess")
    public String adminDeleteOrder(@RequestParam int oid)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Orders order = orderRepository.findByOid(oid);

        orderRepository.delete(order);

        return "adminorders";

    }

    @RequestMapping("/saveprofile")
    public String saveProfile(HttpSession httpSession,
                              @ModelAttribute Customer customer) {
        if (httpSession.getAttribute("currentuser") == null) {
            return "alerts/alertNotLoggedIn";
        }

        else {
            Customer sessionUser = (Customer) httpSession.getAttribute("currentuser");
            CustomerRepository customerRepository = context.getBean(CustomerRepository.class);
            Customer old = customerRepository.findByCid(sessionUser.getCid());

            old.setCname(customer.getCname());
            old.setcmail(customer.getcmail());
            old.setCadd(customer.getCadd());
            old.setCmob(customer.getCmob());
            old.setCpass(customer.getCpass());

            customerRepository.save(old);

            return "alerts/alertSavedSuccessfully";
        }
    }

@RequestMapping(path ="/updateProductQuantity", method = RequestMethod.POST)
    public String updateProductQuantity(@RequestParam int pid, @RequestParam int pQty, @RequestParam int prodPrice)
{
    ProductRepository productRepository = context.getBean(ProductRepository.class);
    Product product = productRepository.getProductByPid(pid);

    product.setPunits(pQty);
    product.setPprice(prodPrice);
    productRepository.save(product);

    return "redirect:/manageproducts";
}

}
