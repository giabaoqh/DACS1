-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 03, 2024 lúc 04:05 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `bookshop`
--
CREATE DATABASE IF NOT EXISTS `bookshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `bookshop`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `email` varchar(200) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`id`, `email`, `password`) VALUES
(1, 'admin@gmail.com', 'admin123');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `cid` int(11) NOT NULL,
  `cname` varchar(200) NOT NULL,
  `cdesc` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`cid`, `cname`, `cdesc`) VALUES
(12, 'Cổ tích', 'Tốt'),
(1, 'Drama', 'Tốt'),
(14, 'Hồi ký', 'Tốt'),
(8, 'Kinh dị', 'Hay'),
(9, 'Kỹ năng sống', 'Tốt'),
(2, 'Lãng mạn', 'Khá'),
(3, 'Lịch sử', 'Tuyệt vời'),
(5, 'Sách thiếu nhi', 'Tốt'),
(4, 'Tâm lí', 'Tốt'),
(13, 'Tâm linh', 'Hay'),
(10, 'Tiểu thuyết', 'Tốt'),
(6, 'Trinh thám', 'Hay'),
(11, 'Văn học', 'Tốt');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `pid` int(11) NOT NULL,
  `pname` varchar(200) DEFAULT NULL,
  `cname` varchar(200) DEFAULT NULL,
  `pqty` int(11) DEFAULT NULL,
  `pprice` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`pid`, `pname`, `cname`, `pqty`, `pprice`) VALUES
(1, 'Cuộc chiến thượng lưu ', 'Drama', 69, 70000),
(2, 'Harry Potter', 'Drama', 0, 50000),
(3, 'Tết ở làng Địa Ngục', 'Kinh dị', 392, 108000),
(4, 'Sọ Dừa', 'Cổ tích', 233, 65000),
(5, 'Thám tử lừng danh Conan', 'Trinh thám', 493, 110000),
(6, 'Thạch Sanh', 'Cổ tích', 198, 15000),
(7, 'Vì con gái, tôi có thể đánh bại Ma Vương', 'Cổ tích', 300, 150000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `purchase`
--

CREATE TABLE `purchase` (
  `id` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `p_date` varchar(20) DEFAULT NULL,
  `uaddress` text DEFAULT NULL,
  `receive_date` varchar(20) DEFAULT NULL,
  `supplier` varchar(200) DEFAULT NULL,
  `STATUS` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `purchase`
--

INSERT INTO `purchase` (`id`, `uid`, `uname`, `uphone`, `pid`, `product_name`, `qty`, `price`, `total`, `p_date`, `uaddress`, `receive_date`, `supplier`, `STATUS`) VALUES
(1, 3, 'quangminh', '0159687432', 3, 'Tết ở làng Địa Ngục', 1, 108000, 108000, '2024-05-27', 'Huế, Đà Nẵng', '2024-05-27', 'VKU', 'Đã nhận'),
(2, 3, 'quangminh', '0159687432', 6, 'Thạch Sanh', 2, 15000, 30000, '2024-05-27', 'Huế, Đà Nẵng', '2024-05-27', 'VKU', 'Đã nhận');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `supplier`
--

CREATE TABLE `supplier` (
  `sid` int(11) NOT NULL,
  `sname` varchar(100) NOT NULL,
  `semail` varchar(100) DEFAULT NULL,
  `spassword` varchar(100) DEFAULT NULL,
  `sphone` varchar(15) DEFAULT NULL,
  `saddress1` text DEFAULT NULL,
  `saddress2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `supplier`
--

INSERT INTO `supplier` (`sid`, `sname`, `semail`, `spassword`, `sphone`, `saddress1`, `saddress2`) VALUES
(3, 'Bao', 'bao@gmail.com', 'bao123', '0231564879', 'Quảng Bình', 'Đà Nẵng'),
(2, 'Bookks', 'book@gmail.com', 'book12345', '0159874122', 'Huế', 'Đà Nẵng'),
(5, 'dương', 'duong@gmail.com', 'duong123', '0124798555555', 'QB', 'Đà Nẵng'),
(4, 'huy', 'huy@gmail.com', 'huy123', '0159874532', 'Hà Nội', 'Đà Nẵng'),
(1, 'VKU', 'VKU@gmail.com', 'vku12345', '0258741963', 'Đà Nẵng', '440 Trần Đại Nghĩa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `uid` int(11) NOT NULL,
  `uname` varchar(200) DEFAULT NULL,
  `uemail` varchar(100) DEFAULT NULL,
  `upassword` varchar(100) DEFAULT NULL,
  `uphone` varchar(15) DEFAULT NULL,
  `usecqus` text DEFAULT NULL,
  `uans` text DEFAULT NULL,
  `uaddress1` text DEFAULT NULL,
  `uaddress2` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`uid`, `uname`, `uemail`, `upassword`, `uphone`, `usecqus`, `uans`, `uaddress1`, `uaddress2`) VALUES
(1, 'giabao', 'giabaoqh@gmail.com', 'giabaoqh0', '0123456789', 'Màu sắc ưa thích của bạn là gì?', 'Xanh lá', 'Đà nẵng', 'Ngũ hành sơn'),
(2, 'huy', 'huyvo@gmail.com', 'huy123', '02258741369', 'Màu sắc ưa thích của bạn là gì?', 'Đỏ', 'Đà Nẵng', 'Đà Nẵng'),
(3, 'quangminh', 'minh@gmail.com', 'minh123', '0159687432', 'Chiếc xe đầu tiên của bạn là gì?', 'Xe đạp', 'Huế', 'Đà Nẵng');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`cname`),
  ADD UNIQUE KEY `cid_UNIQUE` (`cid`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD KEY `fk_category_name` (`cname`);

--
-- Chỉ mục cho bảng `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_user_uid` (`uid`),
  ADD KEY `fk_supplier_name` (`supplier`);

--
-- Chỉ mục cho bảng `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`sname`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `purchase`
--
ALTER TABLE `purchase`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_category_name` FOREIGN KEY (`cname`) REFERENCES `category` (`cname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `fk_supplier_name` FOREIGN KEY (`supplier`) REFERENCES `supplier` (`sname`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user_uid` FOREIGN KEY (`uid`) REFERENCES `user` (`uid`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
