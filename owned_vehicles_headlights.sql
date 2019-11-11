-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Czas generowania: 11 Lis 2019, 12:36
-- Wersja serwera: 10.1.38-MariaDB-0+deb9u1
-- Wersja PHP: 5.6.40-10+0~20190807.18+debian9~1.gbp5642bf

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `essentialmode`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `owned_vehicles_headlights`
--

INSERT INTO `items` (`id`, `name`, `label`, `limit`, `rare`, `can_remove`) VALUES (NULL, 'zarowki', 'Kolorowe Żarówki', '1', '0', '1');

CREATE TABLE `owned_vehicles_headlights` (
  `id` int(11) NOT NULL,
  `plate` text NOT NULL,
  `color` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `owned_vehicles_headlights`
--
ALTER TABLE `owned_vehicles_headlights`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `owned_vehicles_headlights`
--
ALTER TABLE `owned_vehicles_headlights`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
