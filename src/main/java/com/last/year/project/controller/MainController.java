package com.last.year.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.last.year.project.bean.Admin;
import com.last.year.project.bean.Atm;
import com.last.year.project.bean.AtmAdapter;
import com.last.year.project.bean.Bank;
import com.last.year.project.bean.Loging;
import com.last.year.project.bl.Algo;
import com.last.year.project.service.AdminService;
import com.sun.org.apache.bcel.internal.generic.ALOAD;

@Controller
public class MainController {

	@Autowired
	AdminService service;
	@Autowired
	Algo algo;

	@RequestMapping(value = { "/", "/signup**" }, method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Hello");

		model.setViewName("signup");
		return model;
	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage(HttpSession session) {

		ModelAndView model = new ModelAndView();

		model.addObject("banks", service.getAllBanks());
		model.setViewName("welcome");

		return model;

	}

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(
			@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout,
			HttpServletRequest request) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error",
					getErrorMessage(request, "SPRING_SECURITY_LAST_EXCEPTION"));
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("signin");

		return model;

	}

	// customize the error message
	private String getErrorMessage(HttpServletRequest request, String key) {

		Exception exception = (Exception) request.getSession()
				.getAttribute(key);

		String error = "";
		if (exception instanceof BadCredentialsException) {
			error = "Invalid username and password!";
		} else if (exception instanceof LockedException) {
			error = exception.getMessage();
		} else {
			error = "Invalid username and password!";
		}

		return error;
	}

	// for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();

		// check if user is login
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);

			model.addObject("username", userDetail.getUsername());

		}

		model.setViewName("403");
		return model;

	}

	@RequestMapping(value = "/adminAddBanks", method = RequestMethod.POST)
	public ModelAndView addBusStops(@ModelAttribute("bank") Bank b,
			HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		ModelAndView model = new ModelAndView();
		Admin admin = new Admin();
		admin.setUsername(((UserDetails) auth.getPrincipal()).getUsername());
		b.setAdmin(admin);

		service.addBank(b);
		model.addObject("banks", service.getAllBanks());
		model.setViewName("welcome");
		return model;
	}

	@RequestMapping(value = "/adminAddAtm", method = RequestMethod.POST)
	public ModelAndView addAtm(@ModelAttribute("atm") Atm b, HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		ModelAndView model = new ModelAndView();
		Admin admin = new Admin();
		admin.setUsername(((UserDetails) auth.getPrincipal()).getUsername());
		b.setAdmin(admin);

		service.addAtm(b);
		model.addObject("atms", service.getAllAtms());
		model.addObject("banks", service.getAllBanks());
		model.setViewName("ATMs");
		return model;
	}

	@RequestMapping(value = "/adminatm", method = RequestMethod.GET)
	public ModelAndView Atm(HttpSession session) {
		Authentication auth = SecurityContextHolder.getContext()
				.getAuthentication();

		ModelAndView model = new ModelAndView();

		model.addObject("atms", service.getAllAtms());
		model.addObject("banks", service.getAllBanks());
		model.setViewName("ATMs");
		return model;
	}

	@RequestMapping(value = "/nearest", method = RequestMethod.GET)
	public ModelAndView getNearestAtm(HttpSession session,
			HttpServletRequest request) {

		String lon = request.getParameter("lon");
		String lat = request.getParameter("lat");
		
		String number = request.getParameter("no");
		String email = request.getParameter("email");
		String device = request.getParameter("id");
		Loging loging = new Loging();
		loging.setDeviceEmail(email);
		loging.setDeviceId(device);
		loging.setDeviceNumber(number);
		loging.setDeviceLocation(lat+","+lon);
		
service.addlog(loging);
		List<Atm> atms = algo.getNearest(Double.parseDouble(lat),
				Double.parseDouble(lon));

		JsonArray array = new JsonArray();

		for (Atm atm : atms) {
			JsonObject jsonObject = new JsonObject();

			jsonObject.addProperty("id", atm.getIdAtm());
			jsonObject.addProperty("name", atm.getName());
			jsonObject.addProperty("location", atm.getGeolocation());
			jsonObject.addProperty("company", atm.getCompany());
			jsonObject.addProperty("address", atm.getAddress());

			array.add(jsonObject);

		}

		ModelAndView model = new ModelAndView();

		model.addObject("atms", array.toString());

		model.setViewName("near");
		return model;
	}
	@RequestMapping(value = "/banks", method = RequestMethod.GET)
	public ModelAndView getAllBank(HttpSession session,
			HttpServletRequest request) {

		
		List<Bank> banks = service.getAllBanks();

		JsonArray array = new JsonArray();

		for (Bank bank : banks) {
			JsonObject jsonObject = new JsonObject();

			jsonObject.addProperty("id", bank.getIdbank());
			jsonObject.addProperty("name", bank.getName());
			

			array.add(jsonObject);

		}

		ModelAndView model = new ModelAndView();

		model.addObject("atms", array.toString());

		model.setViewName("near");
		return model;
	}
	@RequestMapping(value = "/nearestbybank", method = RequestMethod.GET)
	public ModelAndView getNearestAtmbyBank(HttpSession session,
			HttpServletRequest request) {

		String lon = request.getParameter("lon");
		String lat = request.getParameter("lat");
		String bankid = request.getParameter("bank");

		List<Atm> atms = algo.getNearestByBank(Double.parseDouble(lat),
				Double.parseDouble(lon),Integer.parseInt(bankid));

		JsonArray array = new JsonArray();

		for (Atm atm : atms) {
			JsonObject jsonObject = new JsonObject();

			jsonObject.addProperty("id", atm.getIdAtm());
			jsonObject.addProperty("name", atm.getName());
			jsonObject.addProperty("location", atm.getGeolocation());
			jsonObject.addProperty("company", atm.getCompany());
			jsonObject.addProperty("address", atm.getAddress());

			array.add(jsonObject);

		}

		ModelAndView model = new ModelAndView();

		model.addObject("atms", array.toString());

		model.setViewName("near");
		return model;
	}
	
	@RequestMapping(value = "/adminmap", method = RequestMethod.GET)
	public ModelAndView setMap(HttpSession session,
			HttpServletRequest request) {

		

		List<Atm> atms = service.getAllAtms();


		

		ModelAndView model = new ModelAndView();

		model.addObject("atms", atms);

		model.setViewName("map");
		return model;
	}
	
	@RequestMapping(value = "/adminheatmap", method = RequestMethod.GET)
	public ModelAndView setHeatMap(HttpSession session,
			HttpServletRequest request) {

		

		ModelAndView model = new ModelAndView();

		model.addObject("logs", service.getlogs());

		model.setViewName("heatmap");
		return model;
	}

}
