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
	        ArrayList<Integer> handicap = new ArrayList<>();
	        for (int i = -5; i < 50; i++){
	        	handicap.add(i);
	        }
	        
	        model.addAttribute("handicap", handicap);

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
	    	model.addAttribute("email", userService.findByUsername(curUser).getEmail());
	    	model.addAttribute("fName", userService.findByUsername(curUser).getfName());
	    	model.addAttribute("lName", userService.findByUsername(curUser).getlName());
	    	model.addAttribute("userType", userService.findByUsername(curUser).getUserType());	    
	    	//model.addAttribute("skillLevel", userService.findByUsername(curUser).getSkillLevel());
	        return "home";
	    }
}
