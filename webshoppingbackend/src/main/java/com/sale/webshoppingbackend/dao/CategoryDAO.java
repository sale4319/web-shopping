package com.sale.webshoppingbackend.dao;

import java.util.List;

import com.sale.webshoppingbackend.dto.Category;

public interface CategoryDAO {

	List<Category> list();
	Category get(int id);
	
	
	
}
