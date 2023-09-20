package com.greenbliss.dao;

import com.greenbliss.entities.Orders;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OrderRepository extends CrudRepository<Orders,Integer> {

    Orders findByOid(int oid);

    Orders findByCidAndOdate(int cid, String date);

    List<Orders> findByCid(int cid);

}
