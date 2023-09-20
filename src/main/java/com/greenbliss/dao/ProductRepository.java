package com.greenbliss.dao;

import org.springframework.data.repository.CrudRepository;

import com.greenbliss.entities.Product;

public interface ProductRepository extends CrudRepository<Product,Integer> {

    @Override
    void delete(Product entity);

    Product getProductByPid(int pid);
}
