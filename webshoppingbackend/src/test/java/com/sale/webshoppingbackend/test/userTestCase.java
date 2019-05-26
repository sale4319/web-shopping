package com.sale.webshoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sale.webshoppingbackend.dao.UserDAO;
import com.sale.webshoppingbackend.dto.Address;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.User;

public class userTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.sale.webshoppingbackend");
		context.refresh();

		userDAO = (UserDAO) context.getBean("userDAO");
	}

	/*
	 * @Test public void testAdd() {
	 * 
	 * user = new User(); user.setFirstName("ALST"); user.setLastName("STAL");
	 * user.setEmail("al@st.com"); user.setContactNumber("1234567");
	 * user.setRole("USER"); user.setPassword("654321");
	 * 
	 * // add user assertEquals("Failed to add user!", true, userDAO.addUser(user));
	 * 
	 * address = new Address(); address.setAddressLineOne("19/53 Cara Dusana");
	 * address.setAddressLineTwo("Cara Dusana 19/53"); address.setCity("Doboj");
	 * address.setState("RS"); address.setCity("BiH");
	 * address.setPostalCode("74000"); address.setBilling(true);
	 * 
	 * // link user with the address using user id address.setUserId(user.getId());
	 * // add address assertEquals("Failed to add billing address!", true,
	 * userDAO.addAddress(address));
	 * 
	 * if (user.getRole().equals("USER")) {
	 * 
	 * // create cart for this user cart = new Cart(); cart.setUser(user);
	 * 
	 * // add cart assertEquals("Failed to add cart!", true, userDAO.addCart(cart));
	 * 
	 * // add shipping address for this user address = new Address();
	 * address.setAddressLineOne("10/12 Starog Musana");
	 * address.setAddressLineTwo("Musana Starog 10/12"); address.setCity("Bojdo");
	 * address.setState("SR"); address.setCity("HiB");
	 * address.setPostalCode("00074"); address.setShipping(true);
	 * 
	 * // link it with the user address.setUserId(user.getId());
	 * 
	 * // add shipping address assertEquals("Failed to add shipping address!", true,
	 * userDAO.addAddress(address)); }
	 * 
	 * }
	 */

	/*@Test
	public void testAdd() {

		user = new User();
		user.setFirstName("ALST");
		user.setLastName("STAL");
		user.setEmail("al@st.com");
		user.setContactNumber("1234567");
		user.setRole("USER");
		user.setPassword("654321");

		if (user.getRole().equals("USER")) {

			// create cart for this user
			cart = new Cart();
			cart.setUser(user);
			
			// attach card to the user
			user.setCart(cart);

		}
		// add user
		assertEquals("Failed to add user!", true, userDAO.addUser(user));

	}*/
	
	@Test
	public void testUpdateCart() {
		
		// fetch the user by its email
		user = userDAO.getByEmail("al@st.com");
		
		// get the cart of the user
		cart = user.getCart();
		
		cart.setGrandTotal(5555);
		
		cart.setCartLines(2);
		
		assertEquals("Failed to update cart!", true, userDAO.updateCart(cart));
	}
	
	
}
