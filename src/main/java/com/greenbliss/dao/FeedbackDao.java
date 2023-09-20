package com.greenbliss.dao;

import com.greenbliss.ApplicationContextProvider;
import com.greenbliss.entities.Feedback;
import com.greenbliss.entities.Ticket;
import org.springframework.context.ApplicationContext;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class FeedbackDao {

    public static ApplicationContext context = ApplicationContextProvider.getApplicationContext();

    public static List<Feedback> getAllFeedbacks()
    {
        FeedbackRepository feedbackRepository = context.getBean(FeedbackRepository.class);
        Iterable<Feedback> feedbackIterable = feedbackRepository.findAll();

        List<Feedback> feedbackList = new ArrayList<>();

        Iterator<Feedback> iterator = feedbackIterable.iterator();
        while (iterator.hasNext()) {
            Feedback element = iterator.next();
            feedbackList.add(element);
        }

        return feedbackList;
    }

}
