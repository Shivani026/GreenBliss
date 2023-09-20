package com.greenbliss.dao;

import com.greenbliss.entities.Payment;
import org.springframework.data.repository.CrudRepository;

public interface PaymentRepository extends CrudRepository<Payment, String> {

    Payment findByOid(int oid);
}
