package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Orders;
import com.greenbliss.entities.Product;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class OrderDao {

    public static ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public static List<Orders> getAllOrders()
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);
        Iterable<Orders> ordersIter = orderRepository.findAll();

        List<Orders> ordersList = new ArrayList<>();

        Iterator<Orders> iterator = ordersIter.iterator();
        while (iterator.hasNext()) {
            Orders element = iterator.next();
            ordersList.add(element);
        }

        return ordersList;
    }

    public static  List<Orders> getByCid(int id)
    {
        OrderRepository orderRepository = context.getBean(OrderRepository.class);

        List<Orders> ordersList = orderRepository.findByCid(id);

        return ordersList;

    }


}
