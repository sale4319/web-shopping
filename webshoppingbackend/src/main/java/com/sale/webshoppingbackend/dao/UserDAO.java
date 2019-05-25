package com.sale.webshoppingbackend.dao;

import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.User;

public interface UserDAO {

	// add user
	boolean addUser(User user);
	
	// add an address
	boolean addAddress(Address address);
	
	// add cart
	boolean addCart(Cart cart);
}
