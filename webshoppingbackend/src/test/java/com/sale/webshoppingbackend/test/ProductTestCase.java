package com.sale.webshoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sale.webshoppingbackend.dao.ProductDAO;
import com.sale.webshoppingbackend.dto.Product;

public class ProductTestCase {
	private static AnnotationConfigApplicationContext context;
	private static ProductDAO productDAO;
	private Product product;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.sale.webshoppingbackend");
		context.refresh();
		productDAO = (ProductDAO) context.getBean("productDAO");
	}

	/*@Test
	public void testCRUDProduct() {

		//Create
		product= new Product();
		
		product.setName("LG Nexus X5");
		product.setBrand("LG");
		product.setDescription("This is my mobile phone");
		product.setUnitPrice(450);
		product.setActive(true);
		product.setCategoryId(3);
		product.setSupplierId(3);
		
		assertEquals("Something went wrong while inserting a new product!", true, productDAO.add(product));
		
		//Read & Update
		product = productDAO.get(2);
		product.setName("Samsung Galaxy S7");
		assertEquals("Something went wrong while updating existing product!", true, productDAO.update(product));
		//Delete
		assertEquals("Something went wrong while deleting existing product!", true, productDAO.delete(product));
		
		//List
		assertEquals("Something went wrong while fetching the list of products!", 6, productDAO.list().size());
	}*/
	
	@Test
	public void testListActiveProducts() {
		assertEquals("Something went wrong while fetching the list of products!", 5, productDAO.listActiveProducts().size());
	}
	
	@Test
	public void testListActiveProductsByCategory() {
		assertEquals("Something went wrong while fetching the list of products!", 3, productDAO.listActiveProductsByCategory(3).size());
		assertEquals("Something went wrong while fetching the list of products!", 2, productDAO.listActiveProductsByCategory(1).size());
	}
	
	@Test
	public void testLatestActiveProducts() {
		assertEquals("Something went wrong while fetching the list of products!", 3, productDAO.getLatestActiveProducts(3).size());
	}

}
