package com.sale.webshoppingbackend.dao;

import java.util.List;

import com.sale.webshoppingbackend.dto.Cart;
import com.sale.webshoppingbackend.dto.CartLine;

public interface CartLineDAO {

	// common business methods
	public CartLine get(int id);
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	
	// other business methods
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndProduct(int cartId, int productId);
	
	// update cart
	boolean updateCart(Cart cart);
}
