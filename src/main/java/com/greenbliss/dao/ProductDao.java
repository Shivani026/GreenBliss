package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Product;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductDao {

    public final ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public List<Product> getAllProducts()
    {
        ProductRepository productRepository = context.getBean(ProductRepository.class);
        Iterable<Product> productIter = productRepository.findAll();

        List<Product> productList = new ArrayList<>();

        Iterator<Product> iterator = productIter.iterator();
        while (iterator.hasNext()) {
            Product element = iterator.next();
            productList.add(element);
        }

        return productList;
    }

}
