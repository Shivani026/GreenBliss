package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Payment;
import org.springframework.context.ApplicationContext;

public class PaymentDao {

    public static ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public static Payment getPayment(int id)
    {
        PaymentRepository paymentRepository = context.getBean(PaymentRepository.class);
        Payment payment = paymentRepository.findByOid(id);

        return payment;
    }

}
