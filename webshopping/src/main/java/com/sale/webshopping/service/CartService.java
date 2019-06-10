package com.sale.webshopping.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sale.webshopping.model.UserModel;
import com.sale.webshoppingbackend.dao.CartLineDAO;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.CartLine;

@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private HttpSession session;
	
	// returns the cart of the user who is logged in
	private Cart getCart() {
		return ((UserModel)session.getAttribute("userModel")).getCart();
	}
	
	// returns the entire cart lines
	public List<CartLine> getCartLines(){		
		return cartLineDAO.list(this.getCart().getId());
	}
	
}
