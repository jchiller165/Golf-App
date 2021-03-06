package com.springframework.application.web;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.springframework.application.authentication.model.User;
import com.springframework.application.authentication.service.SecurityService;
import com.springframework.application.authentication.service.UserService;
import com.springframework.application.authentication.validator.UserValidator;

@Controller
public class MainController {

	 @Autowired
	    private UserService userService;

	    @Autowired
	    private SecurityService securityService;

	    @Autowired
	    private UserValidator userValidator;

	    @RequestMapping(value = "/registration", method = RequestMethod.GET)
	    public String registration(Model model) {
	        model.addAttribute("userForm", new User());
	        return "registration";
	    }

	    @RequestMapping(value = "/registration", method = RequestMethod.POST)
	    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
	        userValidator.validate(userForm, bindingResult);

	        if (bindingResult.hasErrors()) {
	            return "registration";
	        }

	        userService.save(userForm);
	        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

	        return "redirect:/home";
	    }

	    @RequestMapping(value = "/login", method = RequestMethod.GET)
	    public String login(Model model, String error, String logout) {
	        if (error != null)
	            model.addAttribute("error", "Your username and password is invalid.");

	        if (logout != null)
	            model.addAttribute("message", "You have been logged out successfully.");
	        return "login";
	    }

	    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
	    public String welcome(Model model) { 	    	
	    	String curUser = SecurityContextHolder.getContext().getAuthentication().getName();
	    	User user = userService.findByUsername(curUser);
	    	
	    	model.addAttribute("email", user.getEmail());
	    	model.addAttribute("fName", user.getfName());
	    	model.addAttribute("lName", user.getlName());
	    	model.addAttribute("userType", user.getUserType());	 
	    	
	        return "home";
	    }
	    
	    @RequestMapping(value = "/instruction", method = RequestMethod.GET)
	    public String instruction(Model model) {
	    	String curUser = SecurityContextHolder.getContext().getAuthentication().getName();
	    	User user = userService.findByUsername(curUser);
	    	ArrayList<User> instructors = userService.findInstructors();
	    	
	    	model.addAttribute("email", user.getEmail());
	    	model.addAttribute("fName", user.getfName());
	    	model.addAttribute("lName", user.getlName());	    	
	    	model.addAttribute("instructors", instructors);
	    	
	    	return "instruction";
	    }
	    
	    @RequestMapping(value = "/videos", method = RequestMethod.GET)
	    public String videos(Model model) {
	    	return "videos";
	    }
	    
	    @RequestMapping(value = "/postScore", method = RequestMethod.GET)
	    public String postScore(Model model) {
	    	String curUser = SecurityContextHolder.getContext().getAuthentication().getName();
	    	User user = userService.findByUsername(curUser);
	    	
	    	model.addAttribute("fName", user.getfName());
	    	model.addAttribute("userType", user.getUserType());
	    	
	    	return "postScore";
	    }
	    
	    @RequestMapping(value = "/newsFeed", method = RequestMethod.GET)
	    public String newsFeed(Model model) {
	    	return "newsFeed";
	    }
}
