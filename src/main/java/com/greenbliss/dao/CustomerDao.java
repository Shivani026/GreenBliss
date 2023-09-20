package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Customer;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Optional;

public class CustomerDao {

    public static ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public static List<Customer> getAllCustomers()
    {
        CustomerRepository customerRepository = context.getBean(CustomerRepository.class);
        Iterable<Customer> customerIterable = customerRepository.findAll();

        List<Customer> customerList = new ArrayList<>();

        Iterator<Customer> iterator = customerIterable.iterator();
        while (iterator.hasNext()) {
            Customer element = iterator.next();
            customerList.add(element);
        }

        return customerList;
    }

    public static Customer getCustomer(int id)
    {
        CustomerRepository customerRepository = context.getBean(CustomerRepository.class);
        Customer customer = customerRepository.findByCid(id);

        return customer;
    }

}
