
#inner join
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
INNER JOIN clients ON orders.client_id=clients.id;

SELECT client_id, price  FROM orders INNER JOIN clients WHERE orders.client_id = clients.id AND orders.price > 24;

#inner join
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders CROSS JOIN clients 


#left outer
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
LEFT OUTER JOIN clients ON orders.client_id=clients.id;

#right outer join
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
RIGHT OUTER JOIN clients ON orders.client_id=clients.id;

#full MySql have not FULL outer join
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
FULL OUTER JOIN clients ON orders.client_id=clients.id;
# we can emulate 
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
LEFT OUTER JOIN clients ON orders.client_id=clients.id
UNION
SELECT orders.id, orders.client_id, orders.price, orders.date, clients.id, clients.name 
FROM orders
RIGHT OUTER JOIN clients ON orders.client_id=clients.id;

#having 
SELECT clients.name, clients.lastname COUNT(orders.id) AS NumberOfOrders
FROM (orders INNER JOIN clients ON orders.client_id = clients.id)
GROUP BY name
HAVING COUNT(orders.id) > 1;

#exists
SELECT id, lastname FROM clients WHERE EXISTS (SELECT client_id FROM orders WHERE orders.client_id = clients.id AND orders.price > 24);

SELECT id as ids FROM clients WHERE EXISTS (SELECT client_id FROM orders WHERE orders.client_id = clients.id AND orders.price > 24);
