package com.sale.webshoppingbackend.dao;

import java.util.List;

import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.User;

public interface UserDAO {

	// add user
	boolean addUser(User user);
	User getByEmail(String email);
	
	// add an address
	boolean addAddress(Address address);
	//alternative to avoid a lot of queries
	Address getBillingAddress(int userId);
	List<Address> listShippingAddresses(int userId);
	
	// Address getBillingAddress(User user);
	// List<Address> listShippingAddresses(User user);
	
	// update cart
	boolean updateCart(Cart cart);
}
