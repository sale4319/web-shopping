package com.sale.webshoppingbackend.daoimpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.sale.webshoppingbackend.dao.CategoryDAO;
import com.sale.webshoppingbackend.dto.Category;

@Repository("categoryDAO")
public class CategoryDAOimpl implements CategoryDAO {

	private static List<Category> categories = new ArrayList<>();

	static {
		Category category = new Category();

		// adding first category
		category.setId(1);
		category.setName("Television");
		category.setDescription("This is TV description!");
		category.setImageURL("CAT_1.png");

		categories.add(category);

		// adding second category
		category = new Category();
		category.setId(2);
		category.setName("Mobile");
		category.setDescription("This is Mobile description!");
		category.setImageURL("CAT_2.png");

		categories.add(category);

		// adding third category
		category = new Category();
		category.setId(3);
		category.setName("Laptop");
		category.setDescription("This is Laptop description!");
		category.setImageURL("CAT_3.png");

		categories.add(category);
	}

	@Override
	public List<Category> list() {
		// Will return the array list
		return categories;
	}

	@Override
	public Category get(int id) {
		// enhanced for loop
		for (Category category : categories) {
			if (category.getId() == id) return category;

		}
		return null;
	}

}
