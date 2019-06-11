package com.sale.webshoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sale.webshoppingbackend.dao.CartLineDAO;
import com.sale.webshoppingbackend.dao.ProductDAO;
import com.sale.webshoppingbackend.dao.UserDAO;
import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.CartLine;
import com.sale.webshoppingbackend.dto.Product;
import com.sale.webshoppingbackend.dto.User;

public class CartLineTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CartLineDAO cartLineDAO = null;
	private static ProductDAO productDAO = null;
	private static UserDAO userDAO = null;

	private Product product;
	private User user;
	private Cart cart;
	private CartLine cartLine;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.sale.webshoppingbackend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
		userDAO = (UserDAO) context.getBean("userDAO");
		cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
	}

	@Test
	public void testAddNewCartLine() {

		// get the user
		user = userDAO.getByEmail("i@gmail.com");

		// fetch the cart
		cart = user.getCart();

		// get the product
		product = productDAO.get(1);

		// create a new cartLine
		cartLine = new CartLine();

		cartLine.setBuyingPrice(product.getUnitPrice());

		cartLine.setProductCount(cartLine.getProductCount() + 1);

		cartLine.setTotal(cartLine.getProductCount() * product.getUnitPrice());

		cartLine.setAvailable(true);

		cartLine.setCartId(cart.getId());

		cartLine.setProduct(product);

		assertEquals("Failed to add a cartLine", true, cartLineDAO.add(cartLine));

		// update the cart
		cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
		cart.setCartLines(cart.getCartLines() + 1);
		assertEquals("Failed to update the cart", true, cartLineDAO.updateCart(cart));

	}
}
