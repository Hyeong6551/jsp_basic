CREATE TABLE `goods` (
  `goods_no` integer AUTO_INCREMENT PRIMARY KEY,
  `goods_image` varchar(50),
  `goods_name` varchar(150),
  `goods_price` integer,
  `goods_content` varchar(2048)
);

CREATE TABLE `cart` (
  `cart_no` INT AUTO_INCREMENT PRIMARY KEY,
  `cart_user_no` varchar(30) NOT NULL,
  `cart_goods_no` varchar(150) NOT NULL,
  `cart_goods_quantity` integer NOT NULL,
  UNIQUE(cart_user_no, cart_goods_no)
);

CREATE TABLE `users` (
  `user_id` varchar(30) PRIMARY KEY,
  `user_name` varchar(20),
  `user_password` varchar(50),
  `user_address` varchar(200),
  `user_postcode` integer,
  `user_date`TIMESTAMP DEFAULT NOW()
);