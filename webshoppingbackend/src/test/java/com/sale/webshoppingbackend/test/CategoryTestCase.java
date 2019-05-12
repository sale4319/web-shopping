package com.sale.webshoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.sale.webshoppingbackend.dao.CategoryDAO;
import com.sale.webshoppingbackend.dto.Category;

public class CategoryTestCase {

	private static AnnotationConfigApplicationContext context;
	private static CategoryDAO categoryDAO;
	private Category category;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("com.sale.webshoppingbackend");
		context.refresh();
		categoryDAO = (CategoryDAO) context.getBean("categoryDAO");
	}

	/*
	 * @Test public void testAddCategory() { 
	 * 
	 * category = new Category();
	 * 
	 * category.setName("Laptop");
	 * category.setDescription("This is laptop description!");
	 * category.setImageURL("CAT_105.png");
	 * 
	 * assertEquals("Successfully added a category inside a table.", true,
	 * categoryDAO.add(category)); }
	 */

	/*
	 * @Test public void testGetCategory() { 
	 * 
	 * category = categoryDAO.get(2);
	 * assertEquals("Successfully fetched a singe categorty from table.",
	 * "Television", category.getName()); }
	 */

	/*
	 * @Test public void testUpdateCategory() { 
	 * category = categoryDAO.get(2);
	 * category.setName("TV");
	 * assertEquals("Successfully updated a singe categorty in table.", true,
	 * categoryDAO.update(category)); }
	 */

	/*
	  @Test public void testDeleteCategory() {
	  
	  category = categoryDAO.get(2);
	  
	  assertEquals("Successfully deleted a singe categorty in table.", true, categoryDAO.delete(category)); 
	  }
	 */

	/*
	  @Test public void testListCategory() {
	  
	  assertEquals("Successfully fetched list of categorties from table.", 2, categoryDAO.list().size()); 
	  }
	 */

	@Test
	public void testCRUDCategory() {
		
		//adding category
		category = new Category();

		category.setName("Laptop");
		category.setDescription("This is laptop description!");
		category.setImageURL("CAT_1.png");

		assertEquals("Successfully added a category inside a table.", true, categoryDAO.add(category));
		
		category = new Category();
		
		category.setName("Television");
		category.setDescription("This is TV description!");
		category.setImageURL("CAT_2.png");

		assertEquals("Successfully added a category inside a table.", true, categoryDAO.add(category));
		
		//fetching and updating the category
		category = categoryDAO.get(2);
		category.setName("TV");
		assertEquals("Successfully updated a singe categorty in table.", true, categoryDAO.update(category)); 
		
		//deleting category
		assertEquals("Successfully deleted a singe categorty in table.", true, categoryDAO.delete(category));

		//fetching the list
		assertEquals("Successfully fetched list of categorties from table.", 1, categoryDAO.list().size());
	}
}
