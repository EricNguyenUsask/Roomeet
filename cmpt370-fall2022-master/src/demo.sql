-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 22, 2022 at 09:52 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `name_room` varchar(255) DEFAULT NULL,
  `avatar_room` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `name_room`, `avatar_room`) VALUES
(1, 'gaming', NULL),
(2, 'flirtatious banter', NULL),
(3, 'fishing', NULL),
(4, 'swimming', NULL),
(5, 'dinhkhoi', NULL),
(6, 'sadsad', NULL),
(7, 'test room', NULL),
(8, 'test room 1', NULL),
(9, 'abc', NULL),
(11, 'new room', NULL),
(12, 'bate', NULL),
(13, 'cat', NULL),
(14, 'cat1', NULL),
(15, 'coffe in the rain', NULL),
(16, 'OneTwo', NULL),
(17, 'World Cup 2022', NULL),
(18, 'World Cup 2024', NULL),
(19, 'dinhkhoi', NULL),
(20, 'TheWorld', NULL),
(21, 'We are one', NULL),
(22, 'OneLife', NULL),
(23, 'TheOne', NULL),
(24, 'OneStudio', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `room_chats`
--

CREATE TABLE `room_chats` (
  `id` int(11) NOT NULL,
  `room_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `date` date DEFAULT current_timestamp(),
  `user_name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `room_chats`
--

INSERT INTO `room_chats` (`id`, `room_id`, `user_id`, `message`, `date`, `user_name`) VALUES
(6, 14, 6, 'hi', '2022-11-18', 'admin555'),
(7, 14, 6, 'hello', '2022-11-18', 'admin555'),
(8, 14, 6, 'bien', '2022-11-18', 'admin555'),
(9, 14, 6, 'hola', '2022-11-18', 'admin555'),
(10, 14, 6, 'xin chao', '2022-11-18', 'admin555'),
(11, 14, 6, 'kamusta', '2022-11-18', 'admin555'),
(12, 14, 6, 'ohio', '2022-11-18', 'admin555'),
(13, 14, 7, 'hi iamg', '2022-11-18', 'admin777'),
(14, 14, 6, 'have a great day', '2022-11-18', 'admin555'),
(24, 10, 3, 'hi I got something to say', '2022-11-20', 'dinhkhoi1907'),
(25, 13, 24, 'Hi, Iam new to the group', '2022-11-20', 'EDa'),
(26, 21, 42, 'hi everyone', '2022-11-20', 'Led'),
(27, 21, 43, 'hello Led', '2022-11-20', 'Lulu'),
(28, 21, 42, 'nice to meet you', '2022-11-20', 'Led'),
(29, 24, 48, 'Hi Toni, welcome to the group', '2022-11-20', 'Chris'),
(30, 24, 49, 'Hi, nice to meet you Chris', '2022-11-20', 'Toni'),
(31, 24, 48, 'How are you today?', '2022-11-20', 'Chris');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `img_avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pronoun` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `personality` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `zodiac` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smoking` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `room_id` int(11) NOT NULL DEFAULT 0,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `dob` date DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `budget` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `firstname`, `lastname`, `email`, `name`, `password`, `img_avatar`, `location`, `gender`, `pronoun`, `personality`, `zodiac`, `smoking`, `pet`, `comment`, `room_id`, `status`, `dob`, `age`, `budget`) VALUES
(2, 'Nguyen', 'Racquel', 'vuhuytruong199@yahoo.com', 'Van', '1234321', './img/shawn.png', 'saskatoon', 'male', 'He/ Him', NULL, NULL, NULL, NULL, NULL, 2, 0, '1999-05-21', 23, 500),
(3, 'Pham', 'long', 'vuhu1ytruong199@yahoo.com', 'Deca', '12321312312', './img/shawn.png', 'saskatoon', 'male', 'He/ Him', NULL, NULL, NULL, NULL, 'I like smoking', 10, 0, '2001-02-15', 21, 600),
(5, 'Lin', 'jeff', 'admin@gmail.com', 'Mata', 'admin', './img/shawn.png', 'saskatoon', 'not-pre', 'He/ Him', 'ISTJ', 'Pisces', 'Smoker when drinking', 'Cat', 'Hi, I love fish', 14, 0, '2005-07-05', 17, 300),
(6, 'Kase', 'Kosi', 'adm2in@gmail.com', 'admin1', 'admin', './img/anie.png', 'vancouver', 'female', 'He/ Him', 'INTJ', 'Aquarius', 'Smoker', 'All the pets', 'hi, I love pet', 19, 0, '1999-09-19', 23, 988),
(7, 'Trinh', 'Onepiece', 'admin@gmail.com', 'Opee', '1234', './img/anie.png', 'saskatoon', 'male', 'He/ Him', NULL, NULL, NULL, NULL, 'I hate smoking', 14, 0, '2004-03-15', 18, 1100),
(8, 'dinhkhoi123', 'Omg', 'mkgketb@gmail.com', 'Kuio', 'admin', './img/anie.png', 'hanoi', 'non-bin', 'He/ Him', NULL, NULL, NULL, NULL, 'I hate smoking', 2, 0, '1998-10-10', 24, 2000),
(9, 'dinhkhoi1907', 'pham', 'mkgketban123@gmail.com', 'Loiud', '123123', './img/jieun.png', 'saskatoon', 'male', 'He/ Him', NULL, NULL, NULL, NULL, 'I hate smoking', 2, 0, '1995-01-01', 27, 999),
(10, 'tam', 'tam', '123@gmal.com', 'USer', '123', './img/jieun.png', 'saskatoon', 'male', NULL, NULL, NULL, NULL, NULL, 'I like smoking', 14, 0, '1997-04-21', 25, 1111),
(11, 'Duin', 'Adim', 'admi88n@gmail.com', 'User1', '1234', './img/jieun.png', 'saskatoon', 'non-bin', 'They/ Them', NULL, NULL, NULL, NULL, NULL, 13, 0, '1997-12-31', 24, 1000),
(12, 'Yuo', 'Das', 'id@gmail.com', 'Tuye', '1234', './img/shawn.png', 'toronto', 'female', 'She/Her', 'ISTJ', 'Pisces', 'Smoker when drinking', 'Reptile', 'hi iam g', 7, 0, '1992-01-01', 30, 333),
(13, 'Sarang', 'Sade', 'sad@gmail.com', 'Baad', '1234', './img/shawn.png', 'toronto', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, '1993-12-02', 28, 445),
(14, 'Okae', 'Thanos', 'ddd@gmail.com', 'Daad', 'asdf', './img/shawn.png', 'saskatoon', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 9, 0, '1993-12-02', 28, 0),
(15, 'Thap', 'Thapo', 'admin66@gmail.com', 'Saad', 'asff', './img/shawn.png', 'vancouver', 'not-pre', 'He/ Him', 'ENFJ', NULL, 'Smoker when drinking', NULL, NULL, 9, 0, '1990-12-02', 31, 0),
(16, 'Supper', 'Man', 'mkgk@gmail.com', 'Sir', '1234', './img/shawn.png', 'saskatoon', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, '1990-12-02', 31, 900),
(17, 'Dinh', 'Dhoi', 'admin@gmail.com', 'Mem', '1234', './img/shawn.png', 'toronto', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 11, 0, '1900-01-09', 122, 567),
(18, 'Ole', 'Kiea', 'admin@gmail.com', 'Siue', 'sdsd', './img/shawn.png', 'toronto', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 15, 0, '1988-01-09', NULL, 1999),
(19, 'Noiu', 'Hiii', 'admin1@gmail.com', 'Bacl', 'saffsf', './img/shawn.png', 'saskatoon', 'none', NULL, NULL, NULL, NULL, NULL, NULL, 22, 0, '2005-09-09', NULL, 100),
(20, 'Ave', 'Avaa', 'admin2@gmail.com', 'Admi', '1234', './img/shawn.png', 'vancouver', 'male', 'Just my name please', 'ISFP', 'Capricorn', 'Smoker', 'Fish', '', 1, 0, '2002-11-05', 20, 459),
(21, 'Vanc', 'Mess', 'admin3@gmail.com', 'Admin1', 'admin', './img/shawn.png', 'vancouver', 'male', 'He/ Him', 'ISFP', 'Capricorn', 'Smoker when drinking', 'Fish', 'hi Iam not funny', 1, 0, '2003-01-12', 19, 100),
(22, 'Truong', 'Dyal', 'admin4@gmail.com', 'Koco', '1234', './img/shawn.png', 'vancouver', 'female', 'She/Her', 'INTJ', NULL, NULL, NULL, '', 2, 0, '1888-04-12', 134, 1990),
(23, 'Dun', 'Ham', 'admin5@gmail.com', 'Adam', '1234', './img/shawn.png', 'saskatoon', 'male', NULL, NULL, NULL, NULL, NULL, NULL, 10, 0, '1999-01-19', 23, 1000),
(24, 'Muss', 'Elon', 'admin6@gmail.com', 'EDa', '1234', './img/shawn.png', 'saskatoon', 'female', NULL, NULL, NULL, NULL, NULL, NULL, 13, 0, '1998-09-09', 24, 981),
(25, 'IamSad', 'Uyte', 'admin7@gmail.com', 'Admin1', '1234', './img/shawn.png', 'saskatoon', 'male', NULL, NULL, NULL, NULL, NULL, NULL, 13, 0, '2002-09-08', NULL, 200),
(26, 'Awasom', 'Mybe', 'admin8@gmail.com', 'Admin5', '1234', './img/shawn.png', 'toronto', 'male', NULL, NULL, NULL, NULL, NULL, NULL, 14, 0, '2002-07-05', NULL, 578),
(27, 'What', 'Is', 'admin9@gmail.com', 'Kiuy', '1234', './img/shawn.png', 'saskatoon', 'male', NULL, NULL, NULL, NULL, NULL, NULL, 14, 0, '2001-05-14', NULL, 400),
(28, 'Tamk', 'Cao', 'admin15@gmail.com', 'Alok', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 0, NULL, NULL, 0),
(29, 'Ban', 'Tae', 'admin12@gmail.com', 'How', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 11, 0, NULL, NULL, 0),
(30, 'Nam', 'Mem', 'mo@gmail.com', 'Alo', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, NULL, NULL, 0),
(31, 'Weee', 'Arrr', 'jjjj@gmail.com', 'Wrea', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, 0, NULL, NULL, 0),
(32, 'Wheet', 'Iam', 'iuy@gmail.com', 'Mie', '2134', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3, 0, NULL, NULL, 0),
(33, 'Sher', 'Her', 'fik@gmail.com', 'Huhu', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 7, 0, NULL, NULL, 0),
(34, 'Loz', 'Hyy', 'heyly@gmail.com', 'Maku', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 8, 0, NULL, NULL, 0),
(35, 'Adem', 'Andew', 'wwww@gmail.com', 'wwwwAMiku', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 6, 0, NULL, NULL, 0),
(36, 'Backk', 'Riung', 'vvv@gmail.com', 'Vui', '12234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, 5, 0, NULL, NULL, 0),
(37, 'Haizz', 'Zaui', 'zzas@gmail.com', 'Zxew', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, NULL, NULL, 0),
(38, 'Zues', 'Tea', 'hhhs@gmail.com', 'Jasmin', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, 0, NULL, NULL, 0),
(39, 'Yellow', 'Green', 'hq@gmail.com', 'Red', '1234', './img/shawn.png', 'saskatoon', 'male', 'She/Her', 'INTJ', 'Capricorn', 'Smoker', 'Fish', '', 16, 0, NULL, NULL, 0),
(40, 'Bein', 'Bernin', 'admin1234@gmail.com', 'Uni', '1234', './img/shawn.png', 'toronto', 'male', 'They/ Them', 'INTJ', 'Capricorn', 'Smoker', 'Fish', 'hi iam ..', 15, 0, NULL, NULL, 0),
(41, 'Well', 'Poi', 'adminqq@gmail.com', 'Dawn', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 20, 0, NULL, NULL, 0),
(42, 'Antoni', 'Welo', 'admind@gmail.com', 'Led', 'admin', NULL, 'saskatoon', 'male', 'He/ Him', 'ISTJ', 'Capricorn', 'Smoker when drinking', 'Fish', 'HI, I love singing', 21, 0, '1995-09-12', NULL, 467),
(43, 'Luka', 'Luluk', 'lulu1@gmail.com', 'Lulu', '1234', NULL, 'saskatoon', 'female', 'She/Her', 'ESTP', 'Pisces', 'Smoker', 'All the pets', 'Nice to meet you all', 21, 0, '2003-05-12', NULL, 888),
(44, 'Moch', 'Coco', 'Antoni@gmail.com', 'Leo', '1234', NULL, 'vancouver', 'male', 'He/ Him', 'ISFP', 'Virgo', 'Social Smoker', 'Cat', 'Hi, nice to meet you all', 23, 0, '1995-09-12', NULL, 787),
(48, 'Christiano', 'Kaka', 'chris12@gmail.com', 'Chris', '1234', NULL, 'vancouver', 'male', 'He/ Him', 'ISTJ', 'Leo', 'Non-Smoker', 'Reptile', 'Hi , nice to meet you all', 24, 0, '1996-09-18', NULL, 500),
(49, 'Matthew', NULL, 'Toni2@gmail.com', 'Toni', '1234', NULL, 'saskatoon', 'not-pre', 'He/ Him', 'ISFP', 'Aquarius', 'Non-Smoker', 'Amphibian', 'Hi, nice to meet you guys', 24, 0, '1996-12-12', NULL, 600),
(50, 'Khoi12', 'FI', 'Dung@gmail.com', 'DinhDinh', '1234', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, NULL, NULL, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `room_chats`
--
ALTER TABLE `room_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `room_chats`
--
ALTER TABLE `room_chats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
