package com.greenbliss.dao;

import com.greenbliss.entities.Ticket;
import org.springframework.data.repository.CrudRepository;

public interface TicketRepository extends CrudRepository<Ticket, Integer> {

    Ticket findByTid(int id);
}
