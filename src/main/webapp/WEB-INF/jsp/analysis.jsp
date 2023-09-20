<%@ page import="com.greenbliss.dao.ProductDao" %>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@ page import="java.time.LocalDateTime" %>
<%@ page import="com.greenbliss.dao.OrderDao" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page import="java.time.YearMonth" %>
<%@ page import="com.greenbliss.dao.FeedbackDao" %>
<%@ page import="com.greenbliss.entities.*" %>
<%@ page import="java.time.Month" %>
<%@ page import="java.time.format.TextStyle" %>
<%@ page import="java.util.*" %>
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">

<%--<%--%>
<%--    Customer customer = (Customer) session.getAttribute("current-user")--%>
<%--%>--%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css"
          integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    
    <script type="module" src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.esm.js"></script>
   	<script nomodule src="https://unpkg.com/ionicons@7.1.0/dist/ionicons/ionicons.js"></script>
   	
   	
    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.3.0/dist/chart.umd.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    
    <title>GreenBliss - Analyze sales</title>
    
</head>
<body style="margin-bottom:100px;">

<%@ include file="components/adminloggedinnav.jsp" %>
<%
    OrderDao orderDao = new OrderDao();
    List<Orders> ordersList = orderDao.getAllOrders();

    DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
    LocalDateTime now = LocalDateTime.now();
    LocalDate nowDate = LocalDate.now();
    YearMonth nowMonth = YearMonth.now();
    String nowdatetime = dtf.format(now);

    int dailySales =0;
    int monthlySales=0;
    int earnings =0;

    for(Orders order: ordersList)
    {
        if(!order.getOstatus().contains("Pending"))
        {
            earnings += order.getOtotalamt();
            String odate = order.getOdate();
            LocalDateTime orderDate = LocalDateTime.parse(odate, dtf);
            if (orderDate.toLocalDate().equals(nowDate)) {
                JSONArray jsonArray = new JSONArray(order.getOprods());

                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject productObj = jsonArray.getJSONObject(i);
                    int productUnits = productObj.getInt("productUnits");

                    dailySales += productUnits;
                }
            }
            if (orderDate.getMonth().equals(nowMonth.getMonth())) {
                JSONArray jsonArray = new JSONArray(order.getOprods());

                for (int i = 0; i < jsonArray.length(); i++) {
                    JSONObject productObj = jsonArray.getJSONObject(i);
                    int productUnits = productObj.getInt("productUnits");

                    monthlySales += productUnits;
                }
            }
        }
    }
%>

<%
    FeedbackDao feedbackDao = new FeedbackDao();
    List<Feedback> feedbackList = feedbackDao.getAllFeedbacks();
    float avgRating = 0;
    for(Feedback feedback: feedbackList)
    {
        avgRating+=feedback.getFrating();
    }
    avgRating = avgRating/feedbackList.size();
%>

<%
    ArrayList<String> lastSixMonths = new ArrayList<>();
    ArrayList<Integer> lastSixMonthsSales = new ArrayList<>();
    ArrayList<Integer> lastSixMonthsEarnings = new ArrayList<>();
    HashMap<String, Integer> lastSixMonthProductSales = new HashMap<>();
    ArrayList<String> prodNamestopten = new ArrayList<>();
     ArrayList<String> prodNames = new ArrayList<>();
    ArrayList<Integer> pUnitstopten = new ArrayList<>();
      ArrayList<Integer> pUnits = new ArrayList<>();


    for (int k = 0; k <= 6; k++) {
        int prodUnits=0;
        int totalEarnings=0;
        LocalDate previousMonth = nowDate.minusMonths(k);
        Month month = previousMonth.getMonth();
        for(Orders order : ordersList)
        {
            if(!order.getOstatus().contains("Pending")) {
                String odate = order.getOdate();
                LocalDateTime orderDate = LocalDateTime.parse(odate, dtf);
                if (orderDate.getMonth().getValue() == month.getValue() && orderDate.getYear() == previousMonth.getYear()) {
                    JSONArray jsonArray = new JSONArray(order.getOprods());

                    for (int j = 0; j < jsonArray.length(); j++) {
                        JSONObject productObj = jsonArray.getJSONObject(j);
                        String productName = productObj.getString("productName");
                        int productUnits = productObj.getInt("productUnits");

                        prodUnits += productUnits;

                        if (lastSixMonthProductSales.containsKey(productName)) {
                            int value = lastSixMonthProductSales.get(productName);
                            value += productUnits;
                            lastSixMonthProductSales.replace(productName, value);
                        } else {
                            lastSixMonthProductSales.put(productName, productUnits);
                        }
                    }
                    totalEarnings += order.getOtotalamt();

                }
            }
        }
        String monthName = month.getDisplayName(TextStyle.FULL, Locale.ENGLISH);

        lastSixMonths.add("'"+monthName+"'");
        lastSixMonthsSales.add(prodUnits);
        lastSixMonthsEarnings.add(totalEarnings);
    }



    for(Map.Entry<String, Integer> entry : lastSixMonthProductSales.entrySet())
    {
        prodNames.add("'"+entry.getKey()+"'");
        pUnits.add(entry.getValue());
    }
    	if(prodNames.size()>10){
		for(int g=0;g<10;g++){
		prodNamestopten.add(prodNames.get(g));
		pUnitstopten.add(pUnits.get(g));
		}
	}
	else{
	prodNamestopten.addAll(prodNames);
	pUnitstopten.addAll(pUnits);
	}
	System.out.println(prodNamestopten);
	System.out.println(pUnitstopten);
	System.out.println(prodNames);
	System.out.println(pUnits);

%>

    <div class="container">
		
		<div class="row">
	
            <div class="col-sm-3 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                        <div style="float:right;"><ion-icon name="cart-outline" style="font-size:3em;"></ion-icon></div>
                                <h4 class="card-title"><%=dailySales%>&nbsp Products</h4>
                                <p class="card-text" style="font-size: 18px;">Daily products sales</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div style="float:right;"><ion-icon name="calendar-outline" style="font-size:3em;"></ion-icon></div>
                        <h4 class="card-title"><%=monthlySales%>&nbsp Products</h4>
                        <p class="card-text" style="font-size: 18px;">Monthly prod. sales</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div style="float:right;"><ion-icon name="star-outline" style="font-size:3em;"></ion-icon></div>
                        <h4 class="card-title"><%=String.format("%.2f", avgRating)%></h4>
                        <p class="card-text" style="font-size: 18px;">Average Rating</p>
                    </div>
                </div>
            </div>
            <div class="col-sm-3 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div style="float:right;"><ion-icon name="cash-outline" style="font-size:3em;"></ion-icon></div>
                        <h4 class="card-title">&#8377; <%=earnings%></h4>
                        <p class="card-text" style="font-size: 18px;">Total Earnings</p>
                    </div>
                </div>
            </div>
       
		</div>

		
		<div class="row">
		 
             <div class="col-sm-6 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div>
                      <canvas id="myChart3"></canvas>
                    </div>
                    </div>
                </div>
             </div>
          
               <div class="col-sm-6 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div>
                      <canvas id="myChart2" ></canvas>
                    </div>
                    </div>
                </div>
              </div>
           
		 </div>
		 
		 <div class="row">
		 
             <div class="col-sm-12 pt-3" >
                <div class="card" style="background-color:white;border-radius:20px;box-shadow: 5px 5px 5px 5px rgba(0,0,0,.1);">
                    <div class="card-body">
                    <div>
                      <canvas id="myChart"></canvas>
                    </div>
                    </div>
                </div>
              </div>
          	
		</div>
    </div>

</body>
<script>

// bar chart


  const btx = document.getElementById('myChart');

  new Chart(btx, {
    type: 'bar',
    data: {
      labels: <%=prodNamestopten%>,
      datasets: [{
        label: 'Products Sold in Last Six Months',
        data: <%=pUnitstopten%>,
        borderWidth: 1,
        backgroundColor: [
        'rgba(254, 36, 36 ,0.2)',
        'rgba(54, 187, 253 ,0.2)',
        'rgba(255, 236, 0 ,0.2)',
        'rgba(47, 160, 17 ,0.2)',
        'rgba(187, 48, 252 ,0.2)',
        'rgba(254, 151, 19 ,0.2)',
        'rgba(134, 30, 144 ,0.2)',
        'rgba(172, 35, 120 ,0.2)',
        'rgba(65, 213, 42 ,0.2)',
        'rgba(225, 162, 37 ,0.2)',
        'rgba(37, 225, 208 ,0.2)',
        'rgba(28, 49, 255  ,0.2)'
        ],
        borderColor: [
        'rgba(254, 36, 36 ,1)',
        'rgba(54, 187, 253 ,1)',
        'rgba(255, 236, 0 ,1)',
        'rgba(47, 160, 17 ,1)',
        'rgba(187, 48, 252 ,1)',
        'rgba(254, 151, 19 ,1)',
        'rgba(134, 30, 144 ,1)',
        'rgba(172, 35, 120 ,1)',
        'rgba(65, 213, 42 ,1)',
        'rgba(225, 162, 37 ,1)',
        'rgba(37, 225, 208 ,1)',
        'rgba(28, 49, 255  ,1)'
        ],
      }]
    },
    options: {
     responsive: true,
    }
  });
  
  
  
  //Line chart
  
  
   const ptx = document.getElementById('myChart2');

  new Chart(ptx, {
    type: 'line',
    data: {
      labels: <%=lastSixMonths%>,
      datasets: [{
        label: 'Total Sales in Last Six Months',
        data: <%=lastSixMonthsSales%>,
        borderWidth: 1,
        backgroundColor: [
        'rgba(254, 36, 36 ,0.2)',
        'rgba(54, 187, 253 ,0.2)',
        'rgba(255, 236, 0 ,0.2)',
        'rgba(47, 160, 17 ,0.2)',
        'rgba(187, 48, 252 ,0.2)',
        'rgba(254, 151, 19 ,0.2)',
        'rgba(134, 30, 144 ,0.2)',
        'rgba(172, 35, 120 ,0.2)',
        'rgba(65, 213, 42 ,0.2)',
        'rgba(225, 162, 37 ,0.2)',
        'rgba(37, 225, 208 ,0.2)',
        'rgba(28, 49, 255  ,0.2)'
        ],
        borderColor: [
        'rgba(254, 36, 36 ,1)',
        'rgba(54, 187, 253 ,1)',
        'rgba(255, 236, 0 ,1)',
        'rgba(47, 160, 17 ,1)',
        'rgba(187, 48, 252 ,1)',
        'rgba(254, 151, 19 ,1)',
        'rgba(134, 30, 144 ,1)',
        'rgba(172, 35, 120 ,1)',
        'rgba(65, 213, 42 ,1)',
        'rgba(225, 162, 37 ,1)',
        'rgba(37, 225, 208 ,1)',
        'rgba(28, 49, 255  ,1)'
        ],
      }]
    },
    options: {
     responsive: true,
    }
  });
  
    
  //Polar area
  
  
   const ltx = document.getElementById('myChart3');

  new Chart(ltx, {
    type: 'polarArea',
    data: {
      labels: <%=lastSixMonths%>,
      datasets: [{
        label: 'Total Earnings in Last Six Months',
        data: <%=lastSixMonthsEarnings%>,
        borderWidth: 1,
        backgroundColor: [
        'rgba(254, 36, 36 ,0.2)',
        'rgba(54, 187, 253 ,0.2)',
        'rgba(255, 236, 0 ,0.2)',
        'rgba(47, 160, 17 ,0.2)',
        'rgba(187, 48, 252 ,0.2)',
        'rgba(254, 151, 19 ,0.2)',
        'rgba(134, 30, 144 ,0.2)',
        'rgba(172, 35, 120 ,0.2)',
        'rgba(65, 213, 42 ,0.2)',
        'rgba(225, 162, 37 ,0.2)',
        'rgba(37, 225, 208 ,0.2)',
        'rgba(28, 49, 255  ,0.2)'
        ],
        borderColor: [
        'rgba(254, 36, 36 ,1)',
        'rgba(54, 187, 253 ,1)',
        'rgba(255, 236, 0 ,1)',
        'rgba(47, 160, 17 ,1)',
        'rgba(187, 48, 252 ,1)',
        'rgba(254, 151, 19 ,1)',
        'rgba(134, 30, 144 ,1)',
        'rgba(172, 35, 120 ,1)',
        'rgba(65, 213, 42 ,1)',
        'rgba(225, 162, 37 ,1)',
        'rgba(37, 225, 208 ,1)',
        'rgba(28, 49, 255  ,1)'
        ],
      }]
    },
    options: {
     responsive: true,
    }
  });
    
</script>
</html>