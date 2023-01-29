
-- Fill values in country table

INSERT INTO country (country_id,country_name) 
VALUES ('1','España'),
('2','Alemania'),
('3','Belgica'),
('4','Holanda'),
('5','Italia');

-- Fill values in city table

INSERT INTO city (city_id,city_name,country_id) 
VALUES ('1','Sevilla','1'),
('2','Hamburgo','2'),
('3','Bruselas','3'),
('4','Amsterdam','4'),
('5','Bolonia','5');

-- Fill values in product table

INSERT INTO product (product_id,name)
VALUES 
('1','Nokia_3310'),
('2','Nokia_N70'),
('3','Nokia_3410'),
('4','Nokia_1600'),
('5','Nokia_6150');

-- Fill values in users table

INSERT INTO users (user_id,name) 
VALUES ('1','Edgar'),
('2','John'),
('3','Pablo'),
('4','Tom'),
('5','Roland'),
('6','Marco'),
('7','Toni'),
('8','Luke'),
('9','Alvaro'),
('10','Robert'),
('11','Tim'),
('12','Rose'),
('13','Jill'),
('14','Alberto'),
('15','Sonia'),
('16','Marco'),
('17','Laura'),
('18','Elena'),
('19','Sofia'),
('20','Luca');

-- Fill values in store table

INSERT INTO store (store_id,name,city_id) 
VALUES ('1','Phonestore','2'),
('2','AppPhone','2'),
('3','O2','1'),
('4','PhabletStore','2'),
('5','Alphanum','1'),
('6','Goblic','1'),
('7','RaffleStore','3'),
('8','Nk','3'),
('9','Nerfet','4'),
('10','RandyTel','1'),
('11','Telferic','1'),
('12','Latecall','3'),
('13','Roylist','4'),
('14','Alcomovil','4'),
('15','Telecall','1'),
('16','VintagePhone','5'),
('17','Quiammatta','5'),
('18','SonnoTel','5'),
('19','Andiamo','5'),
('20','Ficci','5');

-- Fill values in status_name table

INSERT INTO status_name (status_name_id,status_name) 
VALUES ('1','Not prepared'),
('2','Prepared'),
('3','Sent'),
('4','Received');

-- Fill values in sale table

INSERT INTO sale (sale_id,amount,date_sale,product_id,user_id,store_id) 
VALUES (generate_series(1,1000),(random()*100)+20,
	timestamp '2021-01-01 12:15:00' +
    random() * (timestamp '2021-01-01 12:15:00' -
    timestamp '2022-12-31 12:15:00'),floor(random()*4+1),floor(random()*19+1),floor(random()*19+1));

-- Fill values in order_status table

INSERT INTO order_status (order_status_id,sale_id,status_name_id)
VALUES (generate_series(1,1000),generate_series(1,1000),floor(random()*3+1));

-- Set a random update time between 7h 45 min in order_status table

UPDATE order_status
SET update_at = sale.date_sale + random()*(timestamp '2021-01-01 08:00:00'- timestamp '2021-01-01 00:15:00')
FROM sale
WHERE order_status.sale_id = sale.sale_id;





