
## create clients table
CREATE TABLE clients (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
firstname VARCHAR(30) NOT NULL,
lastname VARCHAR(30) NOT NULL,
email VARCHAR(50),
reg_date TIMESTAMP
);

# rename 
ALTER TABLE clients CHANGE COLUMN firstname name VARCHAR(30) NOT NULL;



## create orders table
CREATE TABLE orders (
id INT(6) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
client_id INT(6) NOT NULL,
price FLOAT NOT NULL,
qty  INT(6),
date TIMESTAMP
);

# delete duplcates 
# If you want to keep the row with the lowest id value:
DELETE FROM clients WHERE id NOT IN ( SELECT * FROM (SELECT MIN(n.id) FROM clients n GROUP BY n.firstname) x )
# If you want the id value that is the highest:
DELETE FROM clients WHERE id NOT IN (SELECT * (SELECT MAX(n.id) FROM clients n GROUP BY n.name) x)

