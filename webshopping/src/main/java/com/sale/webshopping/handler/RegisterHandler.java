package com.sale.webshopping.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.binding.message.MessageBuilder;
import org.springframework.binding.message.MessageContext;
import org.springframework.stereotype.Component;

import com.sale.webshopping.model.RegisterModel;
import com.sale.webshoppingbackend.dao.UserDAO;
import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.User;

@Component
public class RegisterHandler {
	
	@Autowired
	UserDAO userDAO;

	public RegisterModel init() {

		return new RegisterModel();
		
	}

	public void addUser(RegisterModel registerModel, User user) {
		
		registerModel.setUser(user);
	}
	
	public void addBilling(RegisterModel registerModel, Address billing) {
		
		registerModel.setBilling(billing);
	}
	
	
	public String validateUser(User user, MessageContext error) {
		String transitionValue= "success";
		
		// checking if passwords are matching
		if(!(user.getPassword().equals(user.getConfirmPassword()))){
			
			error.addMessage(new MessageBuilder()
					.error()
						.source("confirmPassword")
							.defaultText("Password does not match!")
								.build());
			
			transitionValue="failure";	
		}
	
		// check the uniqueness of the email id
		if(userDAO.getByEmail(user.getEmail())!=null) {
			
			error.addMessage(new MessageBuilder()
					.error()
						.source("email")
							.defaultText("Email address is taken!")
								.build());
			
			transitionValue="failure";
		}
		
		return transitionValue;
	}
	
	
	public String saveAll(RegisterModel model) {
		String transitionValue = "success";
		
		//fetch user
		User user = model.getUser();
		if(user.getRole().equals("USER")) {
			Cart cart= new Cart();
			cart.setUser(user);
			user.setCart(cart);
		}
		
		// save user
		userDAO.addUser(user);
		
		// get the address
		Address billing = model.getBilling();
		billing.setUserId(user.getId());
		billing.setBilling(true);
		
		// save the address
		userDAO.addAddress(billing);
		
		return transitionValue;
	}
}
