-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 25, 2018 at 11:28 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ecom_store`
--

-- --------------------------------------------------------

--
-- Table structure for table `about_us`
--

CREATE TABLE `about_us` (
  `about_id` int(10) NOT NULL,
  `about_heading` text NOT NULL,
  `about_short_desc` text NOT NULL,
  `about_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `about_us`
--

INSERT INTO `about_us` (`about_id`, `about_heading`, `about_short_desc`, `about_desc`) VALUES
(1, 'About Us', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English.', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. </p><p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.\r\n\r\nThe standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(10) NOT NULL,
  `admin_name` varchar(255) NOT NULL,
  `admin_email` varchar(255) NOT NULL,
  `admin_pass` varchar(255) NOT NULL,
  `admin_image` text NOT NULL,
  `admin_contact` varchar(255) NOT NULL,
  `admin_country` text NOT NULL,
  `admin_job` varchar(255) NOT NULL,
  `admin_about` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`admin_id`, `admin_name`, `admin_email`, `admin_pass`, `admin_image`, `admin_contact`, `admin_country`, `admin_job`, `admin_about`) VALUES
(1, 'Shishir Sarder', 'admin.ecom@gmail.com', 'admin123', 'mee.jpg', '1723795078', 'Bangladesh', 'Web Developer', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.');

-- --------------------------------------------------------

--
-- Table structure for table `boxes_section`
--

CREATE TABLE `boxes_section` (
  `box_id` int(10) NOT NULL,
  `box_title` varchar(100) NOT NULL,
  `box_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `boxes_section`
--

INSERT INTO `boxes_section` (`box_id`, `box_title`, `box_desc`) VALUES
(1, 'WE LOVE OUR CUSTOMERS', 'Some quick example text to build on the card title and make up the bulk of the card\'s content.'),
(2, 'BEST PRICES', 'Some quick example text to build on the card title and make up the bulk of the card\'s content.'),
(3, '100% SATISFICTION & GUARENTED', 'Some quick example text to build on the card title and make up the bulk of the card\'s content.');

-- --------------------------------------------------------

--
-- Table structure for table `bundle_product_relation`
--

CREATE TABLE `bundle_product_relation` (
  `rel_id` int(10) NOT NULL,
  `rel_title` varchar(255) NOT NULL,
  `product_id` int(10) NOT NULL,
  `bundle_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bundle_product_relation`
--

INSERT INTO `bundle_product_relation` (`rel_id`, `rel_title`, `product_id`, `bundle_id`) VALUES
(1, 'Relation 1', 1, 15),
(2, 'Relation 2', 2, 15),
(3, 'Relation 3', 4, 15),
(4, 'Relation 4', 10, 15),
(5, 'Test Relation', 2, 1),
(6, 'Test Relation 2', 14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `p_id` int(10) NOT NULL,
  `ip_add` varchar(255) NOT NULL,
  `qty` int(10) NOT NULL,
  `product_price` varchar(255) NOT NULL,
  `size` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cat_id` int(10) NOT NULL,
  `cat_title` varchar(100) NOT NULL,
  `cat_top` varchar(100) NOT NULL,
  `cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cat_id`, `cat_title`, `cat_top`, `cat_image`) VALUES
(1, 'Men', 'Yes', 'image1.jpg'),
(2, 'Women', 'No', 'image2.jpg'),
(3, 'Kids', 'No', 'image3.jpg'),
(4, 'Others', 'No', 'image4.jpg'),
(5, 'Female', 'No', 'image5.jpg'),
(6, '3rd Gender', 'No', 'may.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `contact_id` int(10) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_heading` text NOT NULL,
  `contact_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`contact_id`, `contact_email`, `contact_heading`, `contact_desc`) VALUES
(1, 'devzani.roy11@gmail.com', 'Contact Us ', 'If you have any questions, please feel free to <a href=\"http://localhost/ecommerce/contact.php\" target=\"_blank\">contact us</a>. Our customer service is working for you 24/7');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL,
  `coupon_title` varchar(255) NOT NULL,
  `coupon_price` varchar(255) NOT NULL,
  `coupon_code` varchar(255) NOT NULL,
  `coupon_limit` int(10) NOT NULL,
  `coupon_used` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `product_id`, `coupon_title`, `coupon_price`, `coupon_code`, `coupon_limit`, `coupon_used`) VALUES
(1, 1, 'New T-Shirt Coupon Code', '20', 'NEWCOUPON1', 5, 0),
(2, 15, 'Test Coupon', '55', 'NEW55', 6, 2),
(3, 13, 'Dynamic Test Coupon', '70', 'LARAVEL70', 10, 1),
(4, 12, 'Test 1', '65', 'NEW65', 20, 2);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(10) NOT NULL,
  `customer_name` varchar(255) NOT NULL,
  `customer_email` varchar(255) NOT NULL,
  `customer_pass` varchar(255) NOT NULL,
  `customer_country` varchar(100) NOT NULL,
  `customer_city` varchar(100) NOT NULL,
  `customer_contact` varchar(255) NOT NULL,
  `customer_address` text NOT NULL,
  `customer_image` text NOT NULL,
  `customer_ip` varchar(255) NOT NULL,
  `customer_confirm_code` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`customer_id`, `customer_name`, `customer_email`, `customer_pass`, `customer_country`, `customer_city`, `customer_contact`, `customer_address`, `customer_image`, `customer_ip`, `customer_confirm_code`) VALUES
(4, 'Shishir Sarder', 'shishir.srdr16@gmail.com', '123456', 'Bangladesh', 'Savar', '01723795078', 'RTH', 'mee.jpg', '::1', ''),
(5, 'Jarin Ritu', 'jarin.ritu@gmail.com', 'jarin123', 'Bangladesh', 'Dhaka', '01841795079', 'Fajilatunnessa Hall', 'ritu.jpg', '2', '54345367867'),
(7, 'Maruf Hossain', 'maruf@gmail.com', '12345', 'Bangladesh', 'Savar', '01723795045', 'RTH', 'sam.jpg', '::1', '24234365678'),
(8, 'Rimon Rana', 'rimon.rana@gmail.com', '123456', 'Bangladesh', 'Savar', '01723795078', 'RTH, 503', '61YDYbR5w2L._UX385_.jpg', '::1', '45787524575'),
(9, 'Manun Sarder', 'mamun.srdr@gmail.com', '1234567890', 'India', 'Kolkata', '10258225741', 'Koklata -2345', '119566765lblackgymlegoriginalimaeryjghpnfqeym1495278822.jpg', '::1', '24532453434'),
(12, 'Demo User', 'rimonmon10@gmail.com', '123456', 'Bangladesh', 'Savar', '01723795078', 'RTH, 503', '6420282559364.jpg', '::1', '');

-- --------------------------------------------------------

--
-- Table structure for table `customer_orders`
--

CREATE TABLE `customer_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `due_amount` int(100) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` varchar(100) NOT NULL,
  `order_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer_orders`
--

INSERT INTO `customer_orders` (`order_id`, `customer_id`, `due_amount`, `invoice_no`, `qty`, `size`, `order_date`, `order_status`) VALUES
(1, 5, 68, 679423457, 2, 'medium', '2018-10-07 18:25:38', 'Complete'),
(2, 5, 12, 679423457, 1, 'large', '2018-10-07 14:24:28', 'pending'),
(3, 4, 24, 72826274, 2, 'medium', '2018-10-23 07:00:46', 'pending'),
(4, 4, 240, 72826274, 2, 'small', '2018-10-23 07:00:47', 'pending'),
(5, 4, 100, 72826274, 1, 'medium', '2018-10-23 07:00:47', 'pending'),
(6, 4, 50, 72826274, 1, 'medium', '2018-10-23 07:00:47', 'pending'),
(7, 4, 75, 72826274, 1, 'small', '2018-10-23 07:00:48', 'pending'),
(8, 4, 70, 1039424096, 1, 'large', '2018-10-23 14:23:36', 'pending'),
(9, 4, 90, 1178884563, 1, 'small', '2018-10-25 17:09:31', 'Complete'),
(10, 4, 10, 795767235, 1, 'medium', '2018-10-25 17:16:08', 'Complete'),
(11, 4, 34, 795767235, 1, 'large', '2018-10-25 17:16:08', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `enquiry_type`
--

CREATE TABLE `enquiry_type` (
  `enquiry_id` int(10) NOT NULL,
  `enquiry_title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `enquiry_type`
--

INSERT INTO `enquiry_type` (`enquiry_id`, `enquiry_title`) VALUES
(1, 'Order Support'),
(2, 'Technical Supports'),
(3, 'Price Concern'),
(4, 'Delivery Problems');

-- --------------------------------------------------------

--
-- Table structure for table `icons`
--

CREATE TABLE `icons` (
  `icon_id` int(10) NOT NULL,
  `icon_product` int(10) NOT NULL,
  `icon_title` varchar(255) NOT NULL,
  `icon_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `icons`
--

INSERT INTO `icons` (`icon_id`, `icon_product`, `icon_title`, `icon_image`) VALUES
(1, 15, 'Icon 1', 'icon1.png'),
(2, 14, 'Icon 2', 'icon2.png'),
(3, 13, 'Icon 3', 'icon3.png'),
(4, 12, 'Icon 4', 'icon4.png'),
(5, 1, 'New Icon', '-_SEO_-_Webmarketing_-_Code_-_Developer_-_Web_-_Development-512.png'),
(7, 13, 'New Icon', '-_SEO_-_Webmarketing_-_Code_-_Developer_-_Web_-_Development-512.png');

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

CREATE TABLE `manufacturers` (
  `manufacturer_id` int(10) NOT NULL,
  `manufacturer_title` varchar(100) NOT NULL,
  `manufacturer_top` varchar(100) NOT NULL,
  `manufacturer_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`manufacturer_id`, `manufacturer_title`, `manufacturer_top`, `manufacturer_image`) VALUES
(1, 'Jon Sena', 'Yes', 'image1.jpg'),
(2, 'Undertaker', 'Yes', '119566765lblackgymlegoriginalimaeryjghpnfqeym1495278822.jpg'),
(3, 'Omri Liba', 'No', 'image3.jpg'),
(4, 'Joy Peg', 'Yes', 'image4.jpg'),
(5, 'Kane Blende', 'No', 'image5.jpg'),
(6, 'S.M Group', 'Yes', '-_SEO_-_Webmarketing_-_Code_-_Developer_-_Web_-_Development-512.png');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(10) NOT NULL,
  `invoice_no` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  `payment_mode` varchar(100) NOT NULL,
  `ref_no` int(10) NOT NULL,
  `code` int(10) NOT NULL,
  `payment_date` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `invoice_no`, `amount`, `payment_mode`, `ref_no`, `code`, `payment_date`) VALUES
(3, 358702546, 120, 'UBL/Omni Paisa', 32423423, 3432535, '2018-10-02'),
(4, 358702546, 248, 'Bank Code', 12345, 32145656, '2018-10-03'),
(6, 1998298965, 98, 'Bank Code', 4345654, 4564567, '2018-10-08'),
(7, 624563821, 100, 'Uestern Union', 4235325, 43534646, '2018-10-05'),
(8, 1862962682, 300, 'Bank Code', 2147483647, 3423424, '2018-10-07'),
(9, 1650288053, 360, 'Bank Code', 646554, 0, '2018-10-11'),
(10, 696263413, 100, 'Uestern Union', 21234325, 0, '2018-10-16'),
(11, 679423457, 68, 'Bank Code', 324235435, 2535345, '2018-10-01');

-- --------------------------------------------------------

--
-- Table structure for table `pending_orders`
--

CREATE TABLE `pending_orders` (
  `order_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `invoice_no` int(100) NOT NULL,
  `product_id` int(10) NOT NULL,
  `qty` int(10) NOT NULL,
  `size` varchar(100) NOT NULL,
  `order_status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pending_orders`
--

INSERT INTO `pending_orders` (`order_id`, `customer_id`, `invoice_no`, `product_id`, `qty`, `size`, `order_status`) VALUES
(1, 5, 679423457, 4, 2, 'medium', 'Complete'),
(2, 5, 679423457, 10, 1, 'large', 'pending'),
(3, 4, 72826274, 10, 2, 'medium', 'pending'),
(4, 4, 72826274, 13, 2, 'small', 'pending'),
(5, 4, 72826274, 12, 1, 'medium', 'pending'),
(6, 4, 72826274, 14, 1, 'medium', 'pending'),
(7, 4, 72826274, 15, 1, 'small', 'pending'),
(8, 4, 1039424096, 11, 1, 'large', 'pending'),
(9, 4, 1178884563, 13, 1, 'small', 'Complete'),
(10, 4, 795767235, 10, 1, 'medium', 'Complete'),
(11, 4, 795767235, 4, 1, 'large', 'Complete');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(10) NOT NULL,
  `p_cat_id` int(10) NOT NULL,
  `cat_id` int(10) NOT NULL,
  `manufacturer_id` int(10) NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `product_title` varchar(255) NOT NULL,
  `product_url` text NOT NULL,
  `product_img1` text NOT NULL,
  `product_img2` text NOT NULL,
  `product_img3` text NOT NULL,
  `product_price` int(10) NOT NULL,
  `product_psp_price` int(100) NOT NULL,
  `product_desc` text NOT NULL,
  `product_features` text NOT NULL,
  `product_video` text NOT NULL,
  `product_keywords` varchar(100) NOT NULL,
  `product_label` text NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `p_cat_id`, `cat_id`, `manufacturer_id`, `add_date`, `product_title`, `product_url`, `product_img1`, `product_img2`, `product_img3`, `product_price`, `product_psp_price`, `product_desc`, `product_features`, `product_video`, `product_keywords`, `product_label`, `status`) VALUES
(1, 5, 1, 1, '2018-10-23 02:49:07', 'MARVEL Black Kids POLO T-Shirt', 'product_url1', '4001_102_5_3.jpg', 'a1_112a8959-d4ec-4ced-8ef6-020190515406_1024x1024.png', 'kaos-polos-katun-pria-o-neck-size-m-81402b-or-t-shirt-black-24.jpg', 56, 45, '<p><span style=\"color: #333333; font-family: Roboto, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">With supporting text below as a natural lead-in to additional content. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus neque nisi cupiditate, eligendi molestias corporis nihil ipsa distinctio in repellendus!</span></p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'T-Shirts', 'Sale', 'bundle'),
(2, 5, 1, 5, '2018-10-22 20:30:55', 'Fanideaz Men\'s Cotton Full Sleeve Classic', 'product_url2', '119566765lblackgymlegoriginalimaeryjghpnfqeym1495278822.jpg', '1189524207_863.jpg', '61YDYbR5w2L._UX385_.jpg', 100, 50, '<p><span class=\"irc_su\" dir=\"ltr\" style=\"text-align: left;\">An iconic tee with clean lines and a classic crew neck. The fabric is a lightweight yet durable cotton that gets softer over time. The simplest t-shirt that will compete every outfit. Designed</span></p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'T-Shirts', 'Gift', 'product'),
(4, 1, 2, 2, '2018-10-22 20:30:55', 'Ruby Black Cropped Puffer Jacket', 'product_url3', '666823-01-2.jpg', 'a1_112a8959-d4ec-4ced-8ef6-020190515406_1024x1024.png', 'cgdf.jpg', 34, 0, '<p><strong style=\"margin: 0px; padding: 0px; color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">Lorem Ipsum</strong><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></p><p><strong style=\"margin: 0px; padding: 0px; color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial;\">Lorem Ipsum</strong><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">&nbsp;is\r\n simply dummy text of the printing and typesetting industry. Lorem Ipsum\r\n has been the industry\'s standard dummy text ever since the 1500s, when \r\nan unknown printer took a galley of type and scrambled it to make a type\r\n specimen book.</span></p><p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"><b>Quality :</b></span></p><ul><li><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Best Kapor</span></li><li><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Low Price</span></li><li><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Easy to Wash<br><b></b><br></span></li></ul><p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\"></span></p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. </p><p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. </p><p><br></p><ul><li>LIst 1</li><li>List 2</li><li>List 3</li><li>List 4<br></li></ul>', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/IQBHvifde6A\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'Jackets', 'New', 'product'),
(10, 2, 4, 4, '2018-10-22 20:30:55', 'Electric Fan', 'product_url4', '516402-636548112099786748-16x9.jpg', '666823-01-2.jpg', 'a1_112a8959-d4ec-4ced-8ef6-020190515406_1024x1024.png', 12, 10, '<p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; font-weight: bolder; margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Lorem Ipsum</strong><span style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></p><p style=\"box-sizing: border-box; margin-top: 0px; margin-bottom: 1rem; color: rgb(0, 0, 0); font-family: Roboto, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><strong style=\"box-sizing: border-box; font-weight: bolder; margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial;\">Lorem Ipsum</strong><span style=\"box-sizing: border-box; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); text-decoration-style: initial; text-decoration-color: initial; float: none; display: inline !important;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</span></p>', '<p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. </p><p>Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. </p>', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'Jackets', 'Sale', 'product'),
(11, 2, 4, 2, '2018-10-22 20:30:55', 'PHP Laravel Framwork', 'product_url5', 'career.png', '714A6EA5-DBFE-4AF7-8822-39B2A6F37C30.png', '17.png', 98, 70, '<p>PHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel FramworkPHP Laravel Framwork</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PHP', 'Gift', 'product'),
(12, 2, 1, 3, '2018-10-23 05:52:35', 'PHP Laravel Framwork 2', 'product_url6', 'Accelerating-Economy.png', '714A6EA5-DBFE-4AF7-8822-39B2A6F37C30.png', '17.png', 100, 0, '<p>PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2PHP Laravel Framwork 2</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PHP', 'New', 'product'),
(13, 2, 1, 1, '2018-10-22 20:30:55', 'PHP Laravel Framwork 3', 'product_url7', 'librar.jpg', '714A6EA5-DBFE-4AF7-8822-39B2A6F37C30.png', '714A6EA5-DBFE-4AF7-8822-39B2A6F37C30.png', 120, 90, '<p>The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'PHP', 'Sale', 'product'),
(14, 5, 1, 2, '2018-10-22 20:30:55', 'Printed T-Shirts', 'product_url8', 'sam.jpg', 'js.jpg', 'may.jpg', 50, 0, '<p>Lorem Ipsum<span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. </span></p>\r\n<p><span style=\"font-family: \'Open Sans\', Arial, sans-serif; text-align: justify;\">It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</span></p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'T-Shirts', 'New', 'product'),
(15, 2, 1, 6, '2018-10-22 20:44:00', 'The New One', 'product_url9', 'product3.jpg', 'image.jpg', 'cgdf.jpg', 75, 60, '<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. </span></p>\r\n<p><span style=\"color: #000000; font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: justify; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: #ffffff; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;\">Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like</span></p>', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. ', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube-nocookie.com/embed/xWi8nDUjHGA\" frameborder=\"0\" allow=\"autoplay; encrypted-media\" allowfullscreen></iframe>', 'S.M Group', 'Bundle', 'bundle');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `p_cat_id` int(10) NOT NULL,
  `p_cat_title` varchar(100) NOT NULL,
  `p_cat_top` varchar(100) NOT NULL,
  `p_cat_image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`p_cat_id`, `p_cat_title`, `p_cat_top`, `p_cat_image`) VALUES
(1, 'Jackets', 'Yes', '666823-01-2.jpg'),
(2, 'Accessories', 'No', 'image2.jpg'),
(3, 'Shoes', 'No', 'image3.jpg'),
(4, 'Coats', 'No', 'image4.jpg'),
(5, 'T-Shirts', 'Yes', 'image5.jpg'),
(6, 'Cold Cloths', 'Yes', 'download.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `service_id` int(10) NOT NULL,
  `service_title` varchar(255) NOT NULL,
  `service_image` varchar(255) NOT NULL,
  `service_desc` text NOT NULL,
  `service_button` varchar(255) NOT NULL,
  `service_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`service_id`, `service_title`, `service_image`, `service_desc`, `service_button`, `service_url`) VALUES
(1, 'Gift Package', 'service1.jpg', '<p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.</p><p> All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</p>', 'Contact for Details', 'http://www.obydullahshishir.com'),
(2, 'Love Serprices', 'service2.jpg', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p><p>It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum</p>', 'Contact for Details &amp; Rates', 'http://www.obydullahshishir.com'),
(7, 'New Service 2', 'product3.png', '<p>Contrary to popular belief, Lorem Ipsum is not simply random text. It \r\nhas roots in a piece of classical Latin literature from 45 BC, making it\r\n over 2000 years old. Richard McClintock, a Latin professor at \r\nHampden-Sydney College in Virginia, looked up one of the more obscure \r\nLatin words, consectetur, from a Lorem Ipsum passage, and going through \r\nthe cites of the word in classical literature, discovered the \r\nundoubtable source. </p><p>Lorem Ipsum comes from sections 1.10.32 and 1.10.33 \r\nof \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by \r\nCicero, written in 45 BC. This book is a treatise on the theory of \r\nethics, very popular during the Renaissance. The first line of Lorem \r\nIpsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section \r\n1.10.32.</p>', 'Contact for More', 'http://localhost/ecommerce/services.php');

-- --------------------------------------------------------

--
-- Table structure for table `slider`
--

CREATE TABLE `slider` (
  `slide_id` int(10) NOT NULL,
  `slide_name` varchar(255) NOT NULL,
  `slide_image` text NOT NULL,
  `slide_title` varchar(255) NOT NULL,
  `slide_text` varchar(255) NOT NULL,
  `slide_url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slider`
--

INSERT INTO `slider` (`slide_id`, `slide_name`, `slide_image`, `slide_title`, `slide_text`, `slide_url`) VALUES
(1, 'Slide Number 1', 'slide1.jpg', 'Slider 1 Title', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'http://www.obydullahshishir.com'),
(3, 'Slide Name 3', '516402-636548112099786748-16x9.jpg', 'Slide Titles 3', '  There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, ', 'http://www.bdlabit.com'),
(15, 'Slide 2', 'slide2.jpg', 'Slider Title 2', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, co', 'https://www.facebook.com'),
(16, 'Slide 4', 'slide3.jpg', 'Slider Title 4', 'This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.', 'https://www.youtube.com'),
(17, 'Slide Number 5', 'Accelera.png', 'Slide Number 5', '   This is some dammi text for Slide Number 5', 'http://www.bdlabit.com');

-- --------------------------------------------------------

--
-- Table structure for table `terms`
--

CREATE TABLE `terms` (
  `term_id` int(10) NOT NULL,
  `term_title` varchar(150) NOT NULL,
  `term_link` varchar(255) NOT NULL,
  `term_desc` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `terms`
--

INSERT INTO `terms` (`term_id`, `term_title`, `term_link`, `term_desc`) VALUES
(1, 'Terms & Conditions', 'Link1', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro qui ad veniam, commodi. Numquam, id inventore odio ipsum, dolore natus. Voluptatem, explicabo architecto quis reiciendis libero! Error, hic excepturi, maiores voluptate quod officiis quam, asperiores earum ipsam ipsum totam modi deserunt incidunt aliquam eligendi quia harum recusandae illo rem.</p>\r\n<p>Velit, ratione nostrum consequuntur commodi maxime? Dolorem consequatur nihil eligendi culpa autem necessitatibus, provident quidem minima quod quibusdam maxime a molestiae fugit. Iure exercitationem facilis totam incidunt eveniet enim alias accusamus cum sapiente. Veritatis fuga non, porro aperiam neque. Nisi, ipsa dolore, necessitatibus sit atque deserunt culpa sapiente reiciendis voluptate nemo aliquid tenetur perferendis. Quibusdam, qui quisquam soluta eos quidem officia eligendi, aut quae voluptatibus laborum facilis ab necessitatibus. Deleniti quis ab repudiandae dolores qui reprehenderit odio sint neque rem sit, autem necessitatibus sequi possimus expedita praesentium tempora sed in. Pariatur a, voluptatem ratione magni possimus aliquam atque ab porro ipsum mollitia odio maxime, exercitationem, sed quasi eligendi laboriosam voluptatibus blanditiis unde nemo optio tempore.</p>\r\n<p>Eius exercitationem quos magnam quisquam harum possimus temporibus officia maiores, veniam voluptates eum, ex optio aspernatur sit necessitatibus omnis repellat doloremque aut unde, ab sunt architecto. Quod animi necessitatibus atque id nostrum quos, ipsam error repellendus! Lorem ipsum dolor sit amet, consectetur adipisicing elit. Porro qui ad veniam, commodi. Numquam, id inventore odio ipsum, dolore natus. Voluptatem, explicabo architecto quis reiciendis libero! Error, hic excepturi, maiores voluptate quod officiis quam, asperiores earum ipsam ipsum totam modi deserunt incidunt aliquam eligendi quia harum recusandae illo rem. Velit, ratione nostrum consequuntur commodi maxime? Dolorem consequatur nihil eligendi culpa autem necessitatibus, provident quidem minima quod quibusdam maxime a molestiae fugit. Iure exercitationem facilis totam incidunt eveniet enim alias accusamus cum sapiente. Veritatis fuga non, porro aperiam neque.</p>\r\n<p>Nisi, ipsa dolore, necessitatibus sit atque deserunt culpa sapiente reiciendis voluptate nemo aliquid tenetur perferendis. Quibusdam, qui quisquam soluta eos quidem officia eligendi, aut quae voluptatibus laborum facilis ab necessitatibus. Deleniti quis ab repudiandae dolores qui reprehenderit odio sint neque rem sit, autem necessitatibus sequi possimus expedita praesentium tempora sed in. Pariatur a, voluptatem ratione magni possimus aliquam atque ab porro ipsum mollitia odio maxime, exercitationem, sed quasi eligendi laboriosam voluptatibus blanditiis unde nemo optio tempore.</p>\r\n<p>Eius exercitationem quos magnam quisquam harum possimus temporibus officia maiores, veniam voluptates eum, ex optio aspernatur sit necessitatibus omnis repellat doloremque aut unde, ab sunt architecto. Quod animi necessitatibus atque id nostrum quos, ipsam error repellendus!</p>'),
(2, 'Refund Policy', 'Link2', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, corporis ad inventore ullam amet. Hic, nobis enim quaerat perspiciatis temporibus quia commodi, doloremque neque corrupti dolore facilis quo veritatis, laboriosam in voluptatibus illo! Sapiente, sit, minima? Debitis odio nisi at optio incidunt ex, esse nam, dignissimos non modi temporibus beatae, velit libero aliquam totam nemo est tempore quod. Ab saepe, molestiae mollitia non quisquam.</p>\r\n<p>Ut saepe facilis sunt tenetur rerum nihil exercitationem deleniti dignissimos est odit, neque iste unde aliquam minima minus maiores quam alias pariatur id mollitia quas quisquam. Laudantium animi praesentium repellendus officia a repudiandae et quaerat libero. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, corporis ad inventore ullam amet. Hic, nobis enim quaerat perspiciatis temporibus quia commodi, doloremque neque corrupti dolore facilis quo veritatis, laboriosam in voluptatibus illo! Sapiente, sit, minima? Debitis odio nisi at optio incidunt ex, esse nam, dignissimos non modi temporibus beatae, velit libero aliquam totam nemo est tempore quod.</p>\r\n<p>Ab saepe, molestiae mollitia non quisquam. Ut saepe facilis sunt tenetur rerum nihil exercitationem deleniti dignissimos est odit, neque iste unde aliquam minima minus maiores quam alias pariatur id mollitia quas quisquam. Laudantium animi praesentium repellendus officia a repudiandae et quaerat libero. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, corporis ad inventore ullam amet. Hic, nobis enim quaerat perspiciatis temporibus quia commodi, doloremque neque corrupti dolore facilis quo veritatis, laboriosam in voluptatibus illo! Sapiente, sit, minima?</p>\r\n<p>Debitis odio nisi at optio incidunt ex, esse nam, dignissimos non modi temporibus beatae, velit libero aliquam totam nemo est tempore quod. Ab saepe, molestiae mollitia non quisquam. Ut saepe facilis sunt tenetur rerum nihil exercitationem deleniti dignissimos est odit, neque iste unde aliquam minima minus maiores quam alias pariatur id mollitia quas quisquam. Laudantium animi praesentium repellendus officia a repudiandae et quaerat libero. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellendus, corporis ad inventore ullam amet.</p>\r\n<p>Hic, nobis enim quaerat perspiciatis temporibus quia commodi, doloremque neque corrupti dolore facilis quo veritatis, laboriosam in voluptatibus illo! Sapiente, sit, minima? Debitis odio nisi at optio incidunt ex, esse nam, dignissimos non modi temporibus beatae, velit libero aliquam totam nemo est tempore quod. Ab saepe, molestiae mollitia non quisquam. Ut saepe facilis sunt tenetur rerum nihil exercitationem deleniti dignissimos est odit, neque iste unde aliquam minima minus maiores quam alias pariatur id mollitia quas quisquam. Laudantium animi praesentium repellendus officia a repudiandae et quaerat libero.</p>'),
(3, 'Pricing & Promotions Policy', 'Link3', '<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati! Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\r\n<p>Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati! Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati!</p>\r\n<p>Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati!</p>\r\n<p>Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati! Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>\r\n<p>Quae nulla nostrum consequatur exercitationem eaque nam quibusdam laborum officiis quis laboriosam, hic libero dolor fugiat facere porro architecto impedit debitis possimus dicta aperiam obcaecati! Fuga odio vel quia molestias, officia? Iste explicabo adipisci maiores ex quae quidem ullam repellendus repellat quis.</p>');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `product_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`wishlist_id`, `customer_id`, `product_id`) VALUES
(3, 4, 13);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about_us`
--
ALTER TABLE `about_us`
  ADD PRIMARY KEY (`about_id`);

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `boxes_section`
--
ALTER TABLE `boxes_section`
  ADD PRIMARY KEY (`box_id`);

--
-- Indexes for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  ADD PRIMARY KEY (`rel_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`contact_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `customer_orders`
--
ALTER TABLE `customer_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  ADD PRIMARY KEY (`enquiry_id`);

--
-- Indexes for table `icons`
--
ALTER TABLE `icons`
  ADD PRIMARY KEY (`icon_id`);

--
-- Indexes for table `manufacturers`
--
ALTER TABLE `manufacturers`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `pending_orders`
--
ALTER TABLE `pending_orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`p_cat_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indexes for table `slider`
--
ALTER TABLE `slider`
  ADD PRIMARY KEY (`slide_id`);

--
-- Indexes for table `terms`
--
ALTER TABLE `terms`
  ADD PRIMARY KEY (`term_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about_us`
--
ALTER TABLE `about_us`
  MODIFY `about_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `boxes_section`
--
ALTER TABLE `boxes_section`
  MODIFY `box_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bundle_product_relation`
--
ALTER TABLE `bundle_product_relation`
  MODIFY `rel_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `contact_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `customer_orders`
--
ALTER TABLE `customer_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `enquiry_type`
--
ALTER TABLE `enquiry_type`
  MODIFY `enquiry_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `icons`
--
ALTER TABLE `icons`
  MODIFY `icon_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `manufacturers`
--
ALTER TABLE `manufacturers`
  MODIFY `manufacturer_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `pending_orders`
--
ALTER TABLE `pending_orders`
  MODIFY `order_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `p_cat_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `slider`
--
ALTER TABLE `slider`
  MODIFY `slide_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `terms`
--
ALTER TABLE `terms`
  MODIFY `term_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
