<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="com.greenbliss.entities.Product" %>
<%@ page import="java.util.List" %>
<%@ page import="com.greenbliss.dao.TicketDao" %>
<%@ page import="com.greenbliss.entities.Ticket" %>
<%@ page import="com.greenbliss.dao.CustomerDao" %>
<%@ page import="com.greenbliss.entities.Customer" %>
<%@ page import="java.util.Optional" %>
<%@ page import="com.greenbliss.dao.FeedbackDao" %>
<%@ page import="com.greenbliss.entities.Feedback" %><%--
    Document   : signup
    Created on : Jun 6, 2023, 1:04:39 PM
    Author     : Shiwani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Green Bliss - Feedbacks</title>
    <%@include file="components/common_css_js.jsp" %>
    <%
        HttpSession httpSession;
    %>
</head>
<body>
<%@include file="components/adminloggedinnav.jsp"%>
<%
    FeedbackDao feedbackDao =new FeedbackDao();
    List<Feedback> feedbackList = feedbackDao.getAllFeedbacks();


%>
<section class="vh-100 bg-light"  >

    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-left align-items-center h-100">
            <div class="col col-xl-10">
                <div class="card" style="border-radius: 1rem;height:auto;width:1100px;padding: 20px;">

                    <div class="card shadow-0 border rounded-3 " style="margin-bottom: 10px">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6 col-lg-6 col-xl-6">
                                    <h4>Manage Feedbacks</h4>
                                </div>
                            </div>
                        </div>
                    </div>


                <div>
                    <%
                        for(Feedback feedback:feedbackList)
                        { %>
<%--              <form action="/respondtoticket/<%=ticket.getTid()%>" method="POST" >--%>
                <div class="card shadow-0 border rounded-3" style="margin-bottom: 10px;">
                    <div class="card-body">
                        <div class="row">
                            <%
                                CustomerDao customerDao = new CustomerDao();
                                Customer customer = customerDao.getCustomer(feedback.getCid());
                            %>
                            <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                    <h5>User : <%=customer.getCname()%></h5>
                                    <h7 class="mb-1 me-1" >Feedback Id : <%=feedback.getFid()%></h7>
                                        <a href="#!">
                                            <div class="hover-overlay">
                                                <div class="mask" style="background-color: rgba(253, 253, 253, 0.15);"></div>
                                            </div>
                                        </a>
                                 </div>
                             </div>
                            <div class="col-md-6 col-lg-6 col-xl-6">

                                <h6><%=feedback.getFcomment()%></h6>
                                <p class="mb-5 mb-md-0 " style="width: 450px;font-size: 16px;color: gray;text-align: justify;text-justify: inter-word; ">
                                    <%=feedback.getFrating()%>&nbsp Stars
                                </p>




                            </div>

                        </div>
                    </div>
                </div>  <%  }
                    %>
                </div>

                 </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>
