package com.sale.webshoppingbackend.dao;

import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.User;

public interface UserDAO {

	// add user
	boolean addUser(User user);
	User getByEmail(String email);
	
	// add an address
	boolean addAddress(Address address);
	
	// update cart
	boolean updateCart(Cart cart);
}
