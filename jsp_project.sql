CREATE TABLE `cart` (
  `cart_no` integer auto_increment PRIMARY KEY,
  `cart_user_no` varchar(30),
  `cart_goods_no` varchar(150),
  `cart_goods_quantity` integer
);

CREATE TABLE `users` (
  `user_id` varchar(30) PRIMARY KEY,
  `user_name` varchar(20),
  `user_password` varchar(50),
  `user_address` varchar(200),
  `user_postcode` integer,
  `user_date`TIMESTAMP DEFAULT NOW()
);

CREATE TABLE `goods` (
  `goods_no` integer auto_increment PRIMARY KEY,
  `goods_image` varchar(50),
  `goods_name` varchar(150),
  `goods_price` integer,
  `goods_content` varchar(2048)
);

CREATE TABLE `order` (
  `order_no` integer auto_increment PRIMARY KEY,
  `order_user_id` integer,
  `order_goods_no` integer,
  `order_date` TIMESTAMP DEFAULT NOW()
);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `cart` (`cart_user_no`);

ALTER TABLE `goods` ADD FOREIGN KEY (`goods_no`) REFERENCES `cart` (`cart_goods_no`);

ALTER TABLE `users` ADD FOREIGN KEY (`user_id`) REFERENCES `order` (`order_user_id`);

ALTER TABLE `order` ADD FOREIGN KEY (`order_goods_no`) REFERENCES `goods` (`goods_no`);
