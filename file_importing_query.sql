LOAD DATA LOCAL INFILE 'C:/Users/Sam/Downloads/DAProjects/Ecommerce_Sales_Analytics/data/processed/customers.csv'
INTO TABLE customers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(customer_id, name, email, gender, signup_date, country);