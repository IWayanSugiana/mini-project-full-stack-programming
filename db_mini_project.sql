-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 31, 2022 at 09:18 AM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_mini_project`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_courier`
--

CREATE TABLE `tb_courier` (
  `id_courier` int(11) NOT NULL,
  `courier_company` varchar(64) NOT NULL,
  `courier_name` varchar(64) NOT NULL,
  `status` enum('Pending','Sedang dikirim','Selesai') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_courier`
--

INSERT INTO `tb_courier` (`id_courier`, `courier_company`, `courier_name`, `status`) VALUES
(1, 'JNE', 'Iwan', 'Pending'),
(2, 'JNT', 'Beli', 'Pending'),
(3, 'SiCepat', 'Cupang', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `tb_customer`
--

CREATE TABLE `tb_customer` (
  `id_customer` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(255) NOT NULL,
  `point` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_customer`
--

INSERT INTO `tb_customer` (`id_customer`, `name`, `address`, `phone_number`, `email`, `password`, `point`) VALUES
(1, 'Ananta Wijaya', 'Jl Melati No. 2 Semarapura', '0895410965326', 'ananta', '1234', 100),
(2, 'Wayan Sugiana', 'Denpasar', '8299712', 'sugi', '1234', 100),
(3, 'Joji', 'Head In The Cloud', '911', 'joji@headin.cloud', '1234', 100),
(4, 'Niki', 'Lowkey', '911', 'niki@lowkey.fine', '1234', 100),
(5, 'Justin Bieber', 'Baby ', '911', 'justin@baby.song', '1234', 100),
(7, 'Hearts Beats', 'Bali', '098237', 'hello@docs.com', '', 0),
(8, 'Hearts', 'Bali', '098237', 'hello@docs.com', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tb_employee`
--

CREATE TABLE `tb_employee` (
  `id_employee` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `role` enum('Front-end programmer','Customer Service','Back-end programmer','Devops Engineer','Mobile programmer','Marketing') DEFAULT NULL,
  `age` int(11) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_employee`
--

INSERT INTO `tb_employee` (`id_employee`, `name`, `role`, `age`, `address`, `phone_number`, `email`) VALUES
(1, 'Millie', 'Marketing', 90, 'Bobby Brown', '911', 'millie@boby.brown'),
(2, 'Alex', 'Mobile programmer', 18, 'USA', '911', 'alex@live.com'),
(3, 'Lalala', NULL, 20, 'in front of your house', '911', 'house@house.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_payment`
--

CREATE TABLE `tb_payment` (
  `id_payment` int(11) NOT NULL,
  `payment_name` varchar(64) DEFAULT NULL,
  `payment_method_category` enum('Cash','Debit','E-Wallet') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_payment`
--

INSERT INTO `tb_payment` (`id_payment`, `payment_name`, `payment_method_category`) VALUES
(1, 'OVO', 'E-Wallet'),
(2, 'DANA', 'E-Wallet'),
(3, 'Gopay', 'E-Wallet'),
(4, 'BNI', 'Debit');

-- --------------------------------------------------------

--
-- Table structure for table `tb_product`
--

CREATE TABLE `tb_product` (
  `id_product` int(11) NOT NULL,
  `id_supplier` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `price` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `rate` int(11) DEFAULT NULL,
  `category` enum('RAM','Keyboard','Mouse','Monitor','SSD','HDD','Tas Laptop','VGA','Motherboard','CPU','Casing PC') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_product`
--

INSERT INTO `tb_product` (`id_product`, `id_supplier`, `name`, `price`, `description`, `stock`, `rate`, `category`) VALUES
(1, 4, 'Display Monitor', 25000000, '32-inch Retina 6K. Astonishing colour accuracy. Super-wide viewing angle. And Extreme Dynamic Range.', 100, 5, 'Monitor'),
(2, 2, '34 inch Monitor', 7000000, 'With the next-gen Google Tensor processor, Pixel 7 and Pixel 7 Pro will bring even more helpful, personalized features to photos, videos, security, and speech', 100, 5, 'Monitor'),
(3, 1, 'SSD 1TB', 2000000, 'Give speed', 100, 5, 'SSD'),
(4, 1, 'RAM 16GB', 4000000, 'Upgrade your ram', 100, 5, 'RAM'),
(5, 3, 'Monitor Gaming 240Hz', 5000000, 'Give gaming experience', 10, 5, 'Monitor'),
(7, 4, 'Display Monitor', 200000, '32-inch Retina 6K. Astonishing colour accuracy. Super-wide viewing angle. And Extreme Dynamic Range.', 2, 5, 'Monitor');

-- --------------------------------------------------------

--
-- Table structure for table `tb_review`
--

CREATE TABLE `tb_review` (
  `id_review` int(11) NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `rating` int(11) NOT NULL,
  `review` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_review`
--

INSERT INTO `tb_review` (`id_review`, `id_customer`, `id_product`, `rating`, `review`) VALUES
(1, 1, 5, 10, 'Nice gaming monitor');

-- --------------------------------------------------------

--
-- Table structure for table `tb_reward`
--

CREATE TABLE `tb_reward` (
  `id_reward` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(255) NOT NULL,
  `stock` int(11) NOT NULL,
  `price` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_reward`
--

INSERT INTO `tb_reward` (`id_reward`, `name`, `description`, `stock`, `price`) VALUES
(1, 'Diskon hingga 5000', '- Syarat dan ketentuan berlaku', 100, 5000),
(2, 'Diskon 10 ribu', 'Syarat & ketentuan berlaku', 100, 10000),
(3, 'Diskon 100.000', 'Syarat & ketentuan berlaku', 1000, 100000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_reward_transaction`
--

CREATE TABLE `tb_reward_transaction` (
  `id_reward_trasaction` int(11) NOT NULL,
  `id_reward` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `time_stamp` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_reward_transaction`
--

INSERT INTO `tb_reward_transaction` (`id_reward_trasaction`, `id_reward`, `id_customer`, `time_stamp`) VALUES
(1, 2, 1, '2022-05-30 17:38:09');

-- --------------------------------------------------------

--
-- Table structure for table `tb_supplier`
--

CREATE TABLE `tb_supplier` (
  `id_supplier` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `address` varchar(255) NOT NULL,
  `phone_number` varchar(16) NOT NULL,
  `email` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_supplier`
--

INSERT INTO `tb_supplier` (`id_supplier`, `name`, `address`, `phone_number`, `email`) VALUES
(1, 'Samsung Elektronik', 'Jakarta', '111', 'samsung@electronic.ltd'),
(2, 'Xioami', 'China', '111', 'xioami@cooperation.inc'),
(3, 'DELL', 'Jakarta', '111', 'dell@cooperation.com'),
(4, 'Apple', 'Silicon Valley', '111', 'apple@retina.display'),
(5, 'OPPO', 'Jakarta', '111', 'oppo@sales.beauty'),
(6, 'Google', 'Indonesia', '111', 'google@pixels.com');

-- --------------------------------------------------------

--
-- Table structure for table `tb_transaction`
--

CREATE TABLE `tb_transaction` (
  `id_transaction` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `id_courier` int(11) DEFAULT NULL,
  `id_payment` int(11) DEFAULT NULL,
  `date_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_transaction`
--

INSERT INTO `tb_transaction` (`id_transaction`, `id_product`, `id_customer`, `id_courier`, `id_payment`, `date_time`) VALUES
(1, 3, 1, 1, 1, '2022-05-31 01:44:58'),
(2, 4, 3, 1, 1, '2022-05-31 01:45:09'),
(3, 3, 1, 2, 2, '2022-05-31 01:45:51'),
(4, 5, 1, 3, 2, '2022-05-31 01:46:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_courier`
--
ALTER TABLE `tb_courier`
  ADD PRIMARY KEY (`id_courier`);

--
-- Indexes for table `tb_customer`
--
ALTER TABLE `tb_customer`
  ADD PRIMARY KEY (`id_customer`);

--
-- Indexes for table `tb_employee`
--
ALTER TABLE `tb_employee`
  ADD PRIMARY KEY (`id_employee`);

--
-- Indexes for table `tb_payment`
--
ALTER TABLE `tb_payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD PRIMARY KEY (`id_product`),
  ADD KEY `id_supplier` (`id_supplier`);

--
-- Indexes for table `tb_review`
--
ALTER TABLE `tb_review`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `tb_reward`
--
ALTER TABLE `tb_reward`
  ADD PRIMARY KEY (`id_reward`);

--
-- Indexes for table `tb_reward_transaction`
--
ALTER TABLE `tb_reward_transaction`
  ADD PRIMARY KEY (`id_reward_trasaction`),
  ADD KEY `id_reward` (`id_reward`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Indexes for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  ADD PRIMARY KEY (`id_supplier`);

--
-- Indexes for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_product` (`id_product`),
  ADD KEY `id_customer` (`id_customer`),
  ADD KEY `id_courier` (`id_courier`),
  ADD KEY `id_payment` (`id_payment`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_courier`
--
ALTER TABLE `tb_courier`
  MODIFY `id_courier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_customer`
--
ALTER TABLE `tb_customer`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tb_employee`
--
ALTER TABLE `tb_employee`
  MODIFY `id_employee` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_payment`
--
ALTER TABLE `tb_payment`
  MODIFY `id_payment` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tb_product`
--
ALTER TABLE `tb_product`
  MODIFY `id_product` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tb_review`
--
ALTER TABLE `tb_review`
  MODIFY `id_review` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_reward`
--
ALTER TABLE `tb_reward`
  MODIFY `id_reward` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_reward_transaction`
--
ALTER TABLE `tb_reward_transaction`
  MODIFY `id_reward_trasaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tb_supplier`
--
ALTER TABLE `tb_supplier`
  MODIFY `id_supplier` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_product`
--
ALTER TABLE `tb_product`
  ADD CONSTRAINT `tb_product_ibfk_1` FOREIGN KEY (`id_supplier`) REFERENCES `tb_supplier` (`id_supplier`);

--
-- Constraints for table `tb_review`
--
ALTER TABLE `tb_review`
  ADD CONSTRAINT `tb_review_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`),
  ADD CONSTRAINT `tb_review_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `tb_product` (`id_product`);

--
-- Constraints for table `tb_reward_transaction`
--
ALTER TABLE `tb_reward_transaction`
  ADD CONSTRAINT `tb_reward_transaction_ibfk_1` FOREIGN KEY (`id_reward`) REFERENCES `tb_reward` (`id_reward`),
  ADD CONSTRAINT `tb_reward_transaction_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`);

--
-- Constraints for table `tb_transaction`
--
ALTER TABLE `tb_transaction`
  ADD CONSTRAINT `tb_transaction_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `tb_product` (`id_product`),
  ADD CONSTRAINT `tb_transaction_ibfk_2` FOREIGN KEY (`id_customer`) REFERENCES `tb_customer` (`id_customer`),
  ADD CONSTRAINT `tb_transaction_ibfk_3` FOREIGN KEY (`id_courier`) REFERENCES `tb_courier` (`id_courier`),
  ADD CONSTRAINT `tb_transaction_ibfk_4` FOREIGN KEY (`id_payment`) REFERENCES `tb_payment` (`id_payment`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
