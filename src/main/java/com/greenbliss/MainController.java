package com.greenbliss;

import java.io.File;

import com.greenbliss.dao.ProductDao;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.greenbliss.dao.AdminRepository;
import com.greenbliss.dao.CustomerRepository;
import com.greenbliss.dao.ProductRepository;
import com.greenbliss.entities.Admin;
import com.greenbliss.entities.Customer;
import com.greenbliss.entities.Product;


@Controller
public class MainController {

	@RequestMapping("/login")
	public String login(HttpSession httpSession)
	{
		httpSession.removeAttribute("currentuser");
		return "login";
	}

	@RequestMapping("/signup")
	public String signup()
	{

		return "signup";
	}



	@RequestMapping("/index")
	public String index()
	{
		return "index";
	}

	@RequestMapping("/products")
	public String products(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		httpSession.setAttribute("prod", "All");
		return "products";
	}

	@RequestMapping("/productsCategory")
	public String productsCategory(HttpSession httpSession , @RequestParam String category)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		httpSession.setAttribute("prod", category);
		System.out.println(category);
		return "productsCategory";
	}

	@RequestMapping("/adminlogin")
	public String adminlogin(HttpSession httpSession)
	{
		httpSession.removeAttribute("currentuser");
		return "adminlogin";
	}


	@RequestMapping("/adminsignup")
	public String adminsignup()
	{

		return "adminsignup";
	}

	@RequestMapping("/addproducts")
	public String addproducts(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedInAdmin";
		}
		return "addproducts";
	}

	@RequestMapping("/admindash")
	public String admindash(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedInAdmin";
		}
		return "admindash";
	}

	@RequestMapping("/manageproducts")
	public String manageproducts(HttpSession httpSession)
	{

		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedInAdmin";
		}
		return "manageproducts";
	}

	@RequestMapping("/manageproductsCategory")
	public String manageproductsCategory(HttpSession httpSession , @RequestParam String category)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedInAdmin";
		}
		httpSession.setAttribute("prod", category);
		System.out.println(category);
		return "manageproductsCategory";
	}


	@RequestMapping(value = "/checkout")
	public String checkout(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}

		return "checkout";
	}

	@RequestMapping("/ticket")
	public String ticket(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "ticket";
	}
	@RequestMapping("/adminorders")
	public String adminorders(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "adminorders";
	}
	@RequestMapping("/managetickets")
	public String managetickets(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "managetickets";
	}

	@RequestMapping("/managefeedbacks")
	public String managefeedbacks(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "managefeedbacks";
	}
	@RequestMapping("/myorders")
	public String myorders(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "myorders";
	}
	@RequestMapping("/analysis")
	public String analysis(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser")==null)
		{
			return "alerts/alertNotLoggedIn";
		}
		return "analysis";
	}

	@RequestMapping("/userprofile")
	public String userProfile(HttpSession httpSession)
	{
		if(httpSession.getAttribute("currentuser") == null)
		{
			return "alerts/alertNogLoggedIn";
		}
		else {
			return "userprofile";
		}
	}

	@RequestMapping("/mytickets")
	public String myTickets(HttpSession httpSession) {
		if (httpSession.getAttribute("currentuser") == null) {
			return "alerts/alertNotLoggedIn";
		}

		else {
			return "mytickets";
		}
	}

	@RequestMapping("/aboutus")
	public String aboutus(HttpSession httpSession)
	{
				return "aboutus";
	}
	
}
