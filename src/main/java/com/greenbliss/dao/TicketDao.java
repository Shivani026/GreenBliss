package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Orders;
import com.greenbliss.entities.Ticket;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class TicketDao {

    public static ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public static List<Ticket> getAllTickets()
    {
        TicketRepository ticketRepository = context.getBean(TicketRepository.class);
        Iterable<Ticket> ticketIterable = ticketRepository.findAll();

        List<Ticket> ticketList = new ArrayList<>();

        Iterator<Ticket> iterator = ticketIterable.iterator();
        while (iterator.hasNext()) {
            Ticket element = iterator.next();
            ticketList.add(element);
        }

        return ticketList;
    }

}
