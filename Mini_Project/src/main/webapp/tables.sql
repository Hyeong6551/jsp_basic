CREATE TABLE `goods` (
  `goods_no` integer AUTO_INCREMENT PRIMARY KEY,
  `goods_image` varchar(50),
  `goods_name` varchar(150),
  `goods_price` integer,
  `goods_content` varchar(2048)
);

CREATE TABLE `cart` (
  `cart_no` INT AUTO_INCREMENT PRIMARY KEY,
  `cart_user_id` varchar(30) NOT NULL,
  `cart_goods_no` varchar(150) NOT NULL,
  `cart_goods_quantity` integer NOT NULL,
  UNIQUE(cart_user_id, cart_goods_no)
);

CREATE TABLE `users` (
  `user_id` varchar(30) PRIMARY KEY,
  `user_name` varchar(50),
  `user_password` varchar(50),
  `user_address` varchar(200),
  `user_postcode` varchar(5),
  `user_date`TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `orderlist` (
  `order_no` integer auto_increment PRIMARY KEY,
  `order_user_id` varchar(30),
  `order_goods_no` integer,
  `order_date` TIMESTAMP DEFAULT NOW()
);