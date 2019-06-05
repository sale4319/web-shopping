CREATE TABLE category(

	id IDENTITY,
	name VARCHAR(50),
	description VARCHAR(255),
	image_url VARCHAR(50),
	is_active BOOLEAN,

	CONSTRAINT pk_category_id PRIMARY KEY (id)

);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Laptop', 'This is description for Laptop.', 'CAT_1.png', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Television', 'This is description for TV.', 'CAT_2.png', true);
INSERT INTO category (name,description,image_url,is_active) VALUES ('Mobile', 'This is description for mobile.', 'CAT_3.png', true);

CREATE TABLE user_detail (
	id IDENTITY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	role VARCHAR(50),
	enabled BOOLEAN,
	password VARCHAR(60),
	email VARCHAR(100),
	contact_number VARCHAR(15),
	CONSTRAINT pk_user_id PRIMARY KEY(id),

);

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Sale', 'Saki', 'ADMIN', true, '$2b$10$Pjl7U/DmWW.f1OUKMvrTKeRM.w6k6Ybi4dcKtgcpZ5c3GBGYnrnOy', 's@gmail.com', '0000000000');

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Ica', 'Dandarica', 'SUPPLIER', true, '$2b$10$05pi8bqK2uPIaDgi7G.Y0ugufr60DMDv/q6tIcXi8K26A4WjV2Wca', 'i@gmail.com', '1111111111');

INSERT INTO user_detail
(first_name, last_name, role, enabled, password, email, contact_number)
VALUES('Maca', 'Katosav', 'SUPPLIER', true, '$2b$10$ar.tKo/We9BRgpCO5YIynegM00ZTYL5HQ65Deh8eQKWY1EIMOoeDy', 'k@gmail.com', '1111111111');

CREATE TABLE product (
	id IDENTITY,
	code VARCHAR(20),
	name VARCHAR(50),
	brand VARCHAR(50),
	description VARCHAR(255),
	unit_price DECIMAL(10,2),
	quantity INT,
	is_active BOOLEAN,
	category_id INT,
	supplier_id INT,
	purchases INT DEFAULT 0,
	views INT DEFAULT 0,
	CONSTRAINT pk_product_id PRIMARY KEY (id),
 	CONSTRAINT fk_product_category_id FOREIGN KEY (category_id) REFERENCES category (id),
	CONSTRAINT fk_product_supplier_id FOREIGN KEY (supplier_id) REFERENCES user_detail(id),	

);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDABC123DEFX', 'iPhone X', 'apple', 'This phone is expensive.', '5000', '5', 'true', 3,2,0,0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDACC123DEFX', 'Samsung s11', 'samsung', 'This phone is old by now.', '4000', '2', 'true', 3,3,0,0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDADC123DEFX', 'Google Nexus', 'google', 'This was good stuff.', '3000', '5', 'true', 3,2,0,0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDAEC123DEFX', 'Macbook Pro', 'apple', 'This is expensive stuff.', '6000', '3', 'true', 1,2,0,0);

INSERT INTO product (code, name, brand, description, unit_price, quantity, is_active, category_id, supplier_id, purchases, views)
VALUES ('PRDAFC123DEFX', 'Asus X550', 'asus', 'This phone is my laptop.', '1000', '5', 'true', 1,3,0,0);


