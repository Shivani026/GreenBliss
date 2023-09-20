package com.greenbliss.dao;

import org.springframework.data.repository.CrudRepository;

import com.greenbliss.entities.Customer;

public interface CustomerRepository extends CrudRepository<Customer,Integer> {

	
    Customer findByCmailAndCpass(String cmail , String cpass);
    Customer findByCid(int id);
}
