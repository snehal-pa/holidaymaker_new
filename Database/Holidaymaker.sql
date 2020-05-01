-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.11-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4984
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table holidaymaker.booking
CREATE TABLE IF NOT EXISTS `booking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `custId` int(11) NOT NULL DEFAULT 0,
  `roomId` int(11) NOT NULL DEFAULT 0,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `totalPrice` bigint(20) DEFAULT NULL,
  `addition` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `custId` (`custId`),
  KEY `roomId` (`roomId`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.booking: ~16 rows (approximately)
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` (`id`, `custId`, `roomId`, `check_in`, `check_out`, `totalPrice`, `addition`) VALUES
	(12, 31, 533, '2020-05-12', '2020-04-18', 2510, 'All Inclusive'),
	(18, 37, 749, '2020-04-29', '2020-04-29', 5080, 'Bed & Breakfast'),
	(22, 28, 508, '2020-04-30', '2020-05-03', 1687, 'Half Board'),
	(24, 28, 749, '2020-06-11', '2020-06-20', 4980, 'Self Catering'),
	(27, 27, 543, '2020-05-28', '2020-05-31', 1932, 'All Inclusive'),
	(30, 32, 511, '2020-06-12', '2020-06-21', 1398, 'Room only (extra charge = 0)'),
	(33, 34, 532, '2020-05-20', '2020-05-30', 1840, 'Half Board'),
	(35, 34, 522, '2020-05-26', '2020-05-29', 2701, 'Full Board'),
	(37, 27, 547, '2020-05-06', '2020-05-16', 1358, 'Half Board'),
	(41, 30, 507, '2020-05-02', '2020-05-03', 1237, 'Half Board'),
	(42, 41, 507, '2020-05-19', '2020-05-22', 1237, 'Half Board'),
	(43, 41, 524, '2020-05-03', '2020-05-06', 1703, 'Half Board'),
	(45, 29, 702, '2020-05-29', '2020-05-31', 9054, 'Half Board'),
	(46, 23, 609, '2020-05-03', '2020-05-07', 6062, 'Bed & Breakfast'),
	(48, 23, 606, '2020-05-05', '2020-05-09', 8554, 'Half Board'),
	(49, 41, 651, '2020-05-01', '2020-05-03', 6776, 'Bed & Breakfast');
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;


-- Dumping structure for table holidaymaker.customer
CREATE TABLE IF NOT EXISTS `customer` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `firstName` varchar(50) DEFAULT '0',
  `lastName` varchar(50) DEFAULT '0',
  `email` varchar(200) NOT NULL DEFAULT '0',
  `password` varchar(200) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.customer: ~15 rows (approximately)
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` (`id`, `firstName`, `lastName`, `email`, `password`) VALUES
	(23, 'Sia', 'svensoon', 'se@gmail.com', '$2a$10$d8GFzq8Des69fnCVHcjImOfHbYn4PtzFSiFuDwmkqzAe7gk/uGlF.'),
	(26, 'Rushik', 'dhaduk', 'rushik@gmail.com', '$2a$10$x8pQBP7t.Y004pATVwajwuTObqGOoiZX7PPjoQIMWFYZfC9sgkLGq'),
	(27, 'snehal', 'Patel', 'snehal@gmail.com', '$2a$10$FapS3gY.ND94OLHnULAzp.McOXd9sO4Z2eLR5UG8dnF6jSepCe//G'),
	(28, 'Bhavik', 'Patel', 'bhavik@gmail.com', '$2a$10$JXQ8xh6Um/R27eTYLXQNtuynCMpbZNOViXkurxB8xzF2ozTLeNbYy'),
	(29, 'Esha', 'sheth', 'esha@gmail.com', '$2a$10$P8QAzVApq1VlFMNZZ2HuOuM42p8WGxNNlTJuVEVGrqWOxq.B/IRfS'),
	(30, 'Jassy', 'patel', 'jassy@gmail.com', '$2a$10$Ib3s.GQCLFeyECc/mgPKPuuf8IEkWjfxX7AuouWbf9jUlEBcNIm3m'),
	(31, 'Tanu', 'panda', 'tanu@hotmail.com', '$2a$10$LO7GWvMpNej.Mw4aQv3OIuzYL6bXmyAaP6Gp6Zu81sDDge/2gaUsy'),
	(32, 'Maria', 'petersson', 'maria@gmail.com', '$2a$10$OQ.y0K3AHEj4/vF4aczez.w3hU2YkORqJJZ.DXEiKv2ynrHV4m.qC'),
	(34, 'Neha', 'Jodhani', 'neha@gmail.com', '$2a$10$9QhMD5SrJPgMhvU.TbJS5e/h6G6.MjMyAIfPu7KrpJrZqYq93Xep2'),
	(35, 'Radhika', 'Srini', 'radhika@gmail.com', '$2a$10$UTW2f6yyNPzjrC4etQ8N1epRgO5KTtt7NnkEDKg3i/ECUQId.CU3G'),
	(36, 'Pinky', 'Dogra', 'pinky@gmail.com', '$2a$10$EXEIgIP6ASRUGmNMGTUrEOZWN2QKRren5dB1BOyEEjLZH/UhFhsHi'),
	(37, 'Chahna', 'Maheta', 'chahna@gmail.com', '$2a$10$k/f9v9nIwy3Kvj/Q8EOLDOCqAt/RIIAnPuAyBcDjLtuNugnnYUIDO'),
	(38, 'Bijal', 'Jodhani', 'bijal@gmail.com', '$2a$10$ksjCjMEG/Ft0j9O/Aa.c5O0oP9kPfVt0l66DLo/XvLRoRiv5wQVFy'),
	(39, 'Amisha', 'Patel', 'amisha@gmail.com', '$2a$10$pdt1vJA12Kf2Iwjwt6eXi.jTPiBkR0cEnClDLl4on7/tpgVNB5cUm'),
	(40, 'Jash', 'kathiriya', 'jash@gmail.com', '$2a$10$VZxGHjhONTvk5Zd9NuvdoOtxAnRZmI/wzHlTrJ94MM76ok3itVhvq'),
	(41, 'Harsh', 'Patel', 'harsh@gmail.com', '$2a$10$0WwZ8pt0.Jf0nRJZ3FnLruSiQa5rk00ZGpnNE1JDNfyWYL929trQC'),
	(43, 'dfhjsd', 'ueyrierewe', 'abc@mail.com', '$2a$10$0SJwkuXfSnoQ8VOq/ToWx.CY8CJO6YileFq/Dnq5wBaDfGfY3dWbu');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;


-- Dumping structure for table holidaymaker.facility
CREATE TABLE IF NOT EXISTS `facility` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.facility: ~6 rows (approximately)
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` (`id`, `name`) VALUES
	(1, 'Pool'),
	(2, 'Evening activities'),
	(3, 'Child-club'),
	(4, 'Restaurant'),
	(5, 'Kitchen'),
	(6, 'Parking');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;


-- Dumping structure for table holidaymaker.hotel
CREATE TABLE IF NOT EXISTS `hotel` (
  `hotelId` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `location` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.hotel: ~50 rows (approximately)
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` (`hotelId`, `name`, `location`) VALUES
	(1, 'abc', 'Alhambra'),
	(2, 'asd', 'Barcelona'),
	(3, 'hij', 'Alhambra'),
	(4, 'pqr', 'Barcelona'),
	(5, 'efg', 'Barcelona'),
	(6, 'klm', 'Granada'),
	(7, 'ghdss', 'Madrid'),
	(8, 'dfns', 'Alhambra'),
	(9, 'dfsd', 'Madrid'),
	(10, 'dfss0', 'Madrid'),
	(11, 'fgff', 'Madrid'),
	(12, 'dfhs', 'Granada'),
	(13, 'dfds', 'Granada'),
	(14, 'utrr', 'Seville'),
	(15, 'erw', 'Seville'),
	(16, 'fsdf', 'Seville'),
	(17, 'ewerw', 'Seville'),
	(18, 'adad', 'Valencia'),
	(19, 'etew', 'Valencia'),
	(20, 'ere', 'Valencia'),
	(21, 'desui', 'Valencia'),
	(22, 'sevai', 'Seville'),
	(23, 'duis', 'Alhambra'),
	(24, 'sed', 'Alhambra'),
	(25, 'ultrices', 'Alhambra'),
	(26, 'velit', 'Alhambra'),
	(27, 'justo', 'Alhambra'),
	(28, 'ante', 'Barcelona'),
	(29, 'lectus', 'Barcelona'),
	(30, 'pretium', 'Barcelona'),
	(31, 'turpis', 'Barcelona'),
	(32, 'lobortis', 'Barcelona'),
	(33, 'luctus', 'Granada'),
	(34, 'ut', 'Granada'),
	(35, 'vivamus', 'Granada'),
	(36, 'nibh', 'Granada'),
	(37, 'justo', 'Granada'),
	(38, 'turpis', 'Madrid'),
	(39, 'faucibus', 'Madrid'),
	(40, 'suscipit', 'Madrid'),
	(41, 'congue', 'Madrid'),
	(42, 'at', 'Madrid'),
	(43, 'elit', 'Seville'),
	(44, 'mi', 'Seville'),
	(45, 'luctus', 'Seville'),
	(46, 'ultrices', 'Seville'),
	(47, 'amet', 'Seville'),
	(48, 'pellentesque', 'Valencia'),
	(49, 'sapien', 'Valencia'),
	(50, 'integer', 'Valencia'),
	(51, 'non', 'Valencia'),
	(52, 'quisque', 'Valencia');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;


-- Dumping structure for table holidaymaker.hotel_facility
CREATE TABLE IF NOT EXISTS `hotel_facility` (
  `hotelId` int(11) unsigned NOT NULL,
  `f_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`hotelId`,`f_id`),
  KEY `FK_hotel_facility_facility` (`f_id`),
  CONSTRAINT `FK_Hotel_facility_hotel` FOREIGN KEY (`hotelId`) REFERENCES `hotel` (`hotelId`),
  CONSTRAINT `FK_hotel_facility_facility` FOREIGN KEY (`f_id`) REFERENCES `facility` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.hotel_facility: ~174 rows (approximately)
/*!40000 ALTER TABLE `hotel_facility` DISABLE KEYS */;
INSERT INTO `hotel_facility` (`hotelId`, `f_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 3),
	(1, 4),
	(2, 2),
	(2, 3),
	(2, 4),
	(2, 5),
	(2, 6),
	(3, 1),
	(3, 3),
	(3, 6),
	(4, 4),
	(4, 5),
	(5, 2),
	(5, 3),
	(5, 5),
	(6, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(7, 2),
	(7, 6),
	(8, 3),
	(8, 4),
	(9, 3),
	(9, 5),
	(9, 6),
	(10, 2),
	(10, 5),
	(10, 6),
	(11, 1),
	(11, 3),
	(11, 4),
	(11, 5),
	(12, 1),
	(12, 4),
	(12, 5),
	(13, 1),
	(13, 6),
	(14, 2),
	(14, 3),
	(14, 4),
	(14, 5),
	(14, 6),
	(15, 1),
	(15, 2),
	(15, 3),
	(15, 4),
	(16, 4),
	(16, 5),
	(17, 2),
	(17, 3),
	(17, 5),
	(17, 6),
	(18, 1),
	(18, 3),
	(18, 4),
	(18, 5),
	(18, 6),
	(19, 1),
	(19, 2),
	(19, 3),
	(19, 4),
	(19, 5),
	(19, 6),
	(20, 1),
	(20, 2),
	(20, 3),
	(20, 6),
	(21, 1),
	(21, 2),
	(21, 3),
	(21, 4),
	(21, 6),
	(22, 1),
	(22, 3),
	(22, 4),
	(22, 5),
	(22, 6),
	(23, 1),
	(23, 2),
	(23, 3),
	(23, 4),
	(23, 5),
	(24, 2),
	(24, 3),
	(24, 4),
	(24, 5),
	(24, 6),
	(25, 1),
	(25, 2),
	(25, 5),
	(25, 6),
	(26, 1),
	(26, 4),
	(26, 5),
	(26, 6),
	(27, 1),
	(27, 3),
	(27, 4),
	(27, 6),
	(28, 1),
	(28, 2),
	(28, 3),
	(28, 4),
	(28, 5),
	(29, 1),
	(29, 2),
	(29, 3),
	(29, 5),
	(29, 6),
	(30, 2),
	(30, 3),
	(30, 4),
	(31, 1),
	(31, 2),
	(31, 3),
	(31, 4),
	(31, 5),
	(31, 6),
	(32, 1),
	(32, 2),
	(32, 3),
	(32, 6),
	(33, 1),
	(33, 3),
	(33, 4),
	(33, 5),
	(33, 6),
	(34, 1),
	(34, 2),
	(34, 3),
	(34, 4),
	(34, 5),
	(34, 6),
	(35, 1),
	(35, 2),
	(35, 3),
	(35, 4),
	(35, 5),
	(36, 1),
	(36, 2),
	(36, 3),
	(36, 4),
	(36, 6),
	(37, 2),
	(37, 3),
	(37, 4),
	(37, 5),
	(37, 6),
	(38, 1),
	(38, 2),
	(38, 4),
	(38, 5),
	(38, 6),
	(39, 1),
	(39, 2),
	(39, 3),
	(39, 4),
	(39, 5),
	(39, 6),
	(40, 1),
	(40, 2),
	(40, 3),
	(40, 4),
	(40, 5),
	(40, 6),
	(41, 1),
	(41, 3),
	(43, 1),
	(43, 2),
	(43, 4),
	(45, 3),
	(46, 4),
	(49, 5),
	(50, 4),
	(52, 1),
	(52, 3);
/*!40000 ALTER TABLE `hotel_facility` ENABLE KEYS */;


-- Dumping structure for table holidaymaker.room
CREATE TABLE IF NOT EXISTS `room` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(50) DEFAULT NULL,
  `hotelId` int(11) NOT NULL DEFAULT 0,
  `price` double NOT NULL DEFAULT 0,
  `rating` int(11) NOT NULL DEFAULT 0,
  `maxPeople` int(11) NOT NULL DEFAULT 0,
  `isBooked` enum('Y','N') DEFAULT 'N',
  `image` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hotelId` (`hotelId`)
) ENGINE=InnoDB AUTO_INCREMENT=755 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table holidaymaker.room: ~249 rows (approximately)
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` (`id`, `type`, `hotelId`, `price`, `rating`, `maxPeople`, `isBooked`, `image`) VALUES
	(506, 'Delux', 4, 1305, 3, 5, 'N', '2'),
	(507, 'Delux', 14, 1037, 2, 5, 'N', '3'),
	(508, 'Twin', 7, 1487, 4, 4, 'N', '4'),
	(509, 'Double', 16, 1599, 3, 2, 'N', '5'),
	(510, 'Delux', 6, 1263, 2, 6, 'N', '6'),
	(511, 'Twin', 18, 1398, 4, 4, 'N', '7'),
	(512, 'Double', 20, 1012, 5, 2, 'N', '8'),
	(513, 'Single', 15, 2611, 3, 1, 'N', '9'),
	(514, 'Double', 9, 1105, 3, 2, 'N', '10'),
	(515, 'Delux', 16, 2536, 3, 6, 'N', '11'),
	(516, 'Double', 9, 2837, 4, 3, 'N', '12'),
	(517, 'Twin', 13, 2107, 3, 4, 'N', '13'),
	(518, 'Double', 9, 1813, 5, 3, 'N', '14'),
	(519, 'Twin', 11, 2703, 3, 4, 'N', '15'),
	(520, 'Delux', 18, 2303, 5, 6, 'N', '16'),
	(521, 'Single', 2, 2952, 4, 1, 'N', '17'),
	(522, 'Double', 10, 2401, 3, 3, 'N', '18'),
	(523, 'Double', 18, 2948, 4, 3, 'N', '19'),
	(524, 'Single', 1, 1503, 3, 1, 'N', '20'),
	(525, 'Double', 4, 2847, 2, 2, 'N', '21'),
	(526, 'Double', 4, 1363, 5, 3, 'N', '22'),
	(527, 'Twin', 20, 2325, 4, 4, 'N', '23'),
	(528, 'Double', 5, 2393, 2, 2, 'N', '24'),
	(529, 'Delux', 15, 2556, 4, 5, 'N', '25'),
	(530, 'Twin', 17, 2645, 3, 4, 'N', '26'),
	(531, 'Double', 13, 2818, 5, 3, 'N', '27'),
	(532, 'Delux', 1, 1640, 5, 5, 'N', '28'),
	(533, 'Twin', 11, 2110, 3, 4, 'N', '29'),
	(534, 'Double', 5, 2130, 2, 3, 'N', '30'),
	(535, 'Twin', 19, 1065, 3, 4, 'N', '31'),
	(536, 'Double', 4, 2715, 5, 2, 'N', '32'),
	(537, 'Double', 4, 1461, 2, 2, 'N', '33'),
	(538, 'Double', 1, 2204, 2, 3, 'N', '34'),
	(539, 'Twin', 12, 1415, 4, 4, 'N', '35'),
	(540, 'Double', 18, 2022, 3, 3, 'N', '36'),
	(541, 'Double', 1, 2903, 5, 3, 'N', '37'),
	(542, 'Double', 3, 2130, 4, 2, 'N', '38'),
	(543, 'Delux', 5, 1532, 3, 5, 'N', '39'),
	(544, 'Single', 8, 1111, 2, 1, 'N', '40'),
	(545, 'Delux', 15, 2961, 4, 5, 'N', '41'),
	(546, 'Delux', 19, 2038, 4, 5, 'N', '42'),
	(547, 'Delux', 11, 1158, 4, 6, 'N', '43'),
	(548, 'Twin', 20, 2021, 2, 4, 'N', '44'),
	(549, 'Delux', 17, 1727, 3, 6, 'N', '45'),
	(550, 'Twin', 8, 2587, 2, 4, 'N', '46'),
	(551, 'Double', 4, 1100, 5, 3, 'N', '47'),
	(552, 'Double', 17, 1587, 3, 3, 'N', '48'),
	(553, 'Single', 16, 2485, 5, 1, 'N', '49'),
	(554, 'Delux', 8, 1501, 2, 6, 'N', '50'),
	(555, 'Double', 15, 2019, 4, 3, 'N', '51'),
	(556, 'Single', 2, 1972, 5, 1, 'N', '52'),
	(557, 'Double', 3, 1573, 2, 3, 'N', '53'),
	(558, 'Twin', 18, 2910, 2, 4, 'N', '54'),
	(559, 'Double', 19, 1986, 5, 3, 'N', '55'),
	(560, 'Twin', 13, 2305, 5, 4, 'N', '56'),
	(561, 'Delux', 8, 1131, 3, 5, 'N', '57'),
	(562, 'Delux', 11, 1236, 5, 6, 'N', '58'),
	(563, 'Double', 9, 1493, 5, 3, 'N', '59'),
	(564, 'Twin', 5, 2352, 2, 4, 'N', '60'),
	(565, 'Double', 20, 1680, 3, 3, 'N', '61'),
	(566, 'Twin', 18, 2691, 4, 4, 'N', '62'),
	(567, 'Twin', 20, 1518, 2, 4, 'N', '63'),
	(568, 'Delux', 19, 1230, 2, 5, 'N', '64'),
	(569, 'Double', 1, 2057, 2, 2, 'N', '65'),
	(570, 'Twin', 6, 2472, 4, 4, 'N', '66'),
	(571, 'Twin', 20, 2284, 3, 4, 'N', '67'),
	(572, 'Twin', 15, 1167, 5, 4, 'N', '68'),
	(573, 'Twin', 7, 2144, 2, 4, 'N', '69'),
	(574, 'Delux', 4, 1891, 3, 6, 'N', '70'),
	(575, 'Twin', 10, 2203, 2, 4, 'N', '71'),
	(576, 'Double', 16, 1450, 3, 3, 'N', '72'),
	(577, 'Double', 16, 1219, 4, 2, 'N', '73'),
	(578, 'Delux', 15, 1156, 4, 5, 'N', '74'),
	(579, 'Twin', 19, 2866, 4, 4, 'N', '75'),
	(580, 'Twin', 1, 2341, 5, 4, 'N', '76'),
	(581, 'Delux', 14, 1942, 2, 6, 'N', '77'),
	(582, 'Single', 17, 2434, 2, 1, 'N', '78'),
	(583, 'Twin', 2, 1466, 2, 4, 'N', '79'),
	(584, 'Double', 3, 1316, 5, 2, 'N', '80'),
	(585, 'Delux', 13, 1240, 4, 5, 'N', '81'),
	(586, 'Twin', 1, 2415, 4, 4, 'N', '82'),
	(587, 'Twin', 9, 2535, 2, 4, 'N', '83'),
	(588, 'Double', 15, 2079, 5, 3, 'N', '84'),
	(589, 'Twin', 20, 1425, 2, 4, 'N', '85'),
	(590, 'Twin', 7, 2852, 3, 4, 'N', '86'),
	(591, 'Delux', 4, 2124, 4, 6, 'N', '87'),
	(592, 'Delux', 5, 2971, 2, 6, 'N', '88'),
	(593, 'Double', 14, 2162, 2, 2, 'N', '89'),
	(594, 'Twin', 9, 2750, 2, 4, 'N', '90'),
	(595, 'Twin', 15, 2440, 5, 4, 'N', '91'),
	(596, 'Double', 15, 2215, 5, 2, 'N', '92'),
	(597, 'Double', 14, 2428, 3, 3, 'N', '93'),
	(598, 'Twin', 20, 2098, 5, 4, 'N', '94'),
	(599, 'Double', 8, 1892, 2, 3, 'N', '95'),
	(600, 'Double', 9, 2995, 3, 2, 'N', '96'),
	(601, 'Double', 6, 2848, 5, 2, 'N', '97'),
	(602, 'Delux', 1, 2805, 2, 5, 'N', '98'),
	(603, 'Twin', 4, 1023, 2, 4, 'N', '99'),
	(604, 'Twin', 12, 2637, 4, 4, 'N', '100'),
	(605, 'Double', 44, 4007, 2, 3, 'N', '2'),
	(606, 'Delux', 34, 8354, 2, 5, 'N', '3'),
	(607, 'Double', 32, 9857, 5, 2, 'N', '4'),
	(608, 'Single', 39, 6596, 5, 1, 'N', '5'),
	(609, 'Double', 33, 5912, 5, 2, 'N', '6'),
	(610, 'Double', 29, 4794, 4, 2, 'N', '7'),
	(611, 'Delux', 25, 6481, 3, 6, 'N', '8'),
	(612, 'Delux', 42, 5922, 2, 5, 'N', '9'),
	(613, 'Delux', 21, 3189, 5, 5, 'N', '10'),
	(614, 'Delux', 46, 6071, 3, 5, 'N', '11'),
	(615, 'Single', 26, 6132, 5, 1, 'N', '12'),
	(616, 'Single', 29, 5036, 2, 1, 'N', '13'),
	(617, 'Twin', 22, 7012, 5, 4, 'N', '14'),
	(618, 'Delux', 51, 8459, 4, 6, 'N', '15'),
	(619, 'Twin', 45, 7945, 3, 4, 'N', '16'),
	(620, 'Double', 39, 3275, 4, 2, 'N', '17'),
	(621, 'Delux', 31, 5845, 5, 6, 'N', '18'),
	(622, 'Double', 46, 7528, 2, 2, 'N', '19'),
	(623, 'Twin', 43, 3416, 5, 4, 'N', '20'),
	(624, 'Delux', 36, 6565, 2, 5, 'N', '21'),
	(625, 'Double', 37, 3821, 5, 2, 'N', '22'),
	(626, 'Twin', 28, 7164, 3, 4, 'N', '23'),
	(627, 'Twin', 50, 5205, 4, 4, 'N', '24'),
	(628, 'Single', 37, 6694, 5, 1, 'N', '25'),
	(629, 'Double', 23, 8578, 4, 2, 'N', '26'),
	(630, 'Single', 37, 8762, 4, 1, 'N', '27'),
	(631, 'Twin', 32, 5743, 5, 4, 'N', '28'),
	(632, 'Delux', 46, 8517, 3, 6, 'N', '29'),
	(633, 'Delux', 22, 3523, 4, 5, 'N', '30'),
	(634, 'Double', 40, 4027, 2, 2, 'N', '31'),
	(635, 'Twin', 31, 4684, 5, 4, 'N', '32'),
	(636, 'Double', 28, 5559, 5, 2, 'N', '33'),
	(637, 'Twin', 47, 9427, 4, 4, 'N', '34'),
	(638, 'Single', 40, 8449, 5, 1, 'N', '35'),
	(639, 'Twin', 39, 4732, 5, 4, 'N', '36'),
	(640, 'Delux', 28, 9616, 5, 6, 'N', '37'),
	(641, 'Single', 34, 6674, 4, 1, 'N', '38'),
	(642, 'Double', 21, 5515, 2, 2, 'N', '39'),
	(643, 'Delux', 34, 9131, 2, 6, 'N', '40'),
	(644, 'Double', 46, 5891, 5, 2, 'N', '41'),
	(645, 'Double', 29, 9365, 2, 3, 'N', '42'),
	(646, 'Delux', 25, 5732, 2, 6, 'N', '43'),
	(647, 'Delux', 34, 5988, 4, 5, 'N', '44'),
	(648, 'Twin', 21, 3026, 2, 4, 'N', '45'),
	(649, 'Delux', 29, 7177, 2, 5, 'N', '46'),
	(650, 'Delux', 31, 8720, 4, 6, 'N', '47'),
	(651, 'Delux', 35, 6626, 5, 6, 'N', '48'),
	(652, 'Double', 33, 6799, 5, 2, 'N', '49'),
	(653, 'Double', 41, 8712, 4, 3, 'N', '50'),
	(654, 'Double', 25, 4264, 4, 3, 'N', '51'),
	(655, 'Delux', 25, 9476, 5, 5, 'N', '52'),
	(656, 'Double', 30, 3338, 2, 2, 'N', '53'),
	(657, 'Twin', 44, 6939, 5, 4, 'N', '54'),
	(658, 'Delux', 21, 3884, 5, 5, 'N', '55'),
	(659, 'Single', 29, 8693, 4, 1, 'N', '56'),
	(660, 'Single', 35, 9003, 4, 1, 'N', '57'),
	(661, 'Double', 29, 8737, 4, 3, 'N', '58'),
	(662, 'Delux', 48, 5412, 5, 6, 'N', '59'),
	(663, 'Delux', 41, 5039, 2, 5, 'N', '60'),
	(664, 'Delux', 30, 3264, 4, 5, 'N', '61'),
	(665, 'Delux', 30, 7890, 3, 6, 'N', '62'),
	(666, 'Twin', 35, 7321, 2, 4, 'N', '63'),
	(667, 'Double', 35, 4815, 2, 3, 'N', '64'),
	(668, 'Single', 45, 3304, 4, 1, 'N', '65'),
	(669, 'Double', 26, 9075, 2, 2, 'N', '66'),
	(670, 'Twin', 51, 6025, 5, 4, 'N', '67'),
	(671, 'Double', 37, 7497, 4, 2, 'N', '68'),
	(672, 'Delux', 21, 6185, 2, 6, 'N', '69'),
	(673, 'Delux', 26, 8203, 3, 6, 'N', '70'),
	(674, 'Twin', 45, 4570, 2, 4, 'N', '71'),
	(675, 'Double', 36, 5298, 2, 3, 'N', '72'),
	(676, 'Double', 23, 9766, 5, 2, 'N', '73'),
	(677, 'Delux', 32, 7171, 4, 6, 'N', '74'),
	(678, 'Delux', 48, 9141, 3, 6, 'N', '75'),
	(679, 'Single', 22, 9802, 3, 1, 'N', '76'),
	(680, 'Double', 47, 7835, 2, 2, 'N', '77'),
	(681, 'Double', 31, 3779, 3, 2, 'N', '78'),
	(682, 'Single', 31, 6714, 2, 1, 'N', '79'),
	(683, 'Single', 25, 9466, 2, 1, 'N', '80'),
	(684, 'Double', 36, 8750, 2, 2, 'N', '81'),
	(685, 'Double', 29, 6114, 4, 3, 'N', '82'),
	(686, 'Double', 48, 4751, 2, 3, 'N', '83'),
	(687, 'Twin', 51, 6888, 2, 4, 'N', '84'),
	(688, 'Single', 40, 9925, 2, 1, 'N', '85'),
	(689, 'Double', 26, 4130, 4, 3, 'N', '86'),
	(690, 'Double', 24, 9844, 4, 3, 'N', '87'),
	(691, 'Double', 51, 7402, 2, 2, 'N', '88'),
	(692, 'Delux', 23, 9685, 4, 5, 'N', '89'),
	(693, 'Double', 25, 4908, 4, 3, 'N', '90'),
	(694, 'Delux', 46, 4478, 4, 6, 'N', '91'),
	(695, 'Twin', 35, 3873, 3, 4, 'N', '92'),
	(696, 'Delux', 28, 4279, 2, 6, 'N', '93'),
	(697, 'Delux', 26, 9061, 3, 6, 'N', '94'),
	(698, 'Delux', 32, 6507, 2, 6, 'N', '95'),
	(699, 'Twin', 39, 7624, 5, 4, 'N', '96'),
	(700, 'Single', 39, 9142, 3, 1, 'N', '97'),
	(701, 'Delux', 41, 3576, 2, 5, 'N', '98'),
	(702, 'Delux', 39, 8854, 4, 5, 'N', '99'),
	(703, 'Double', 38, 9020, 3, 2, 'N', '100'),
	(704, 'Delux', 30, 4972, 5, 5, 'N', '2'),
	(705, 'Double', 37, 4585, 3, 3, 'N', '3'),
	(706, 'Delux', 22, 3466, 4, 6, 'N', '4'),
	(707, 'Delux', 32, 6610, 5, 6, 'N', '5'),
	(708, 'Delux', 31, 7966, 3, 5, 'N', '6'),
	(709, 'Twin', 29, 6400, 3, 4, 'N', '7'),
	(710, 'Twin', 45, 8804, 3, 4, 'N', '8'),
	(711, 'Delux', 38, 6608, 5, 5, 'N', '9'),
	(712, 'Double', 39, 8596, 2, 3, 'N', '10'),
	(713, 'Single', 22, 3790, 4, 1, 'N', '11'),
	(714, 'Double', 28, 7285, 4, 3, 'N', '12'),
	(715, 'Single', 48, 6921, 5, 1, 'N', '13'),
	(716, 'Single', 25, 9131, 2, 1, 'N', '14'),
	(717, 'Single', 52, 5741, 5, 1, 'N', '15'),
	(718, 'Delux', 38, 4590, 5, 6, 'N', '16'),
	(719, 'Double', 46, 8772, 4, 3, 'N', '17'),
	(720, 'Twin', 46, 9560, 3, 4, 'N', '18'),
	(721, 'Delux', 44, 6025, 2, 6, 'N', '19'),
	(722, 'Delux', 26, 9989, 2, 5, 'N', '20'),
	(723, 'Single', 22, 3402, 2, 1, 'N', '21'),
	(724, 'Delux', 28, 8692, 3, 5, 'N', '22'),
	(725, 'Delux', 45, 7717, 4, 6, 'N', '23'),
	(726, 'Double', 23, 7426, 5, 3, 'N', '24'),
	(727, 'Delux', 37, 4410, 4, 6, 'N', '25'),
	(728, 'Single', 31, 7330, 5, 1, 'N', '26'),
	(729, 'Delux', 35, 8648, 4, 5, 'N', '27'),
	(730, 'Double', 46, 7400, 5, 2, 'N', '28'),
	(731, 'Double', 38, 8911, 2, 3, 'N', '29'),
	(732, 'Double', 33, 8702, 3, 2, 'N', '30'),
	(733, 'Twin', 40, 4711, 5, 4, 'N', '31'),
	(734, 'Delux', 32, 6790, 5, 5, 'N', '32'),
	(735, 'Single', 31, 3027, 5, 1, 'N', '33'),
	(736, 'Single', 39, 9225, 2, 1, 'N', '34'),
	(737, 'Double', 39, 8270, 2, 3, 'N', '35'),
	(738, 'Delux', 36, 7720, 4, 6, 'N', '36'),
	(739, 'Double', 45, 6556, 4, 2, 'N', '37'),
	(740, 'Twin', 45, 3081, 5, 4, 'N', '38'),
	(741, 'Twin', 42, 3515, 3, 4, 'N', '39'),
	(742, 'Double', 38, 6613, 2, 3, 'N', '40'),
	(743, 'Single', 35, 5116, 4, 1, 'N', '41'),
	(744, 'Twin', 28, 5914, 3, 4, 'N', '42'),
	(745, 'Double', 36, 4124, 2, 3, 'N', '43'),
	(746, 'Delux', 47, 7207, 3, 5, 'N', '44'),
	(747, 'Single', 41, 8618, 5, 1, 'N', '45'),
	(748, 'Single', 45, 3056, 5, 1, 'N', '46'),
	(749, 'Delux', 33, 4930, 4, 5, 'N', '47'),
	(750, 'Single', 39, 3985, 3, 1, 'N', '48'),
	(751, 'Double', 39, 8857, 5, 2, 'N', '49'),
	(752, 'Delux', 27, 7708, 2, 6, 'N', '50'),
	(753, 'Delux', 35, 5520, 4, 5, 'N', '51'),
	(754, 'Twin', 32, 4217, 5, 4, 'N', '52');
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
