package com.greenbliss.dao;

import org.springframework.context.annotation.Bean;
import org.springframework.data.repository.CrudRepository;

import com.greenbliss.entities.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminRepository extends CrudRepository<Admin,Integer> {

    Admin findByAmailAndApass(String amail , String apass);
}
