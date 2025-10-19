-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Creato il: Ott 09, 2025 alle 16:44
-- Versione del server: 8.3.0
-- Versione PHP: 8.2.8
USE `aziende`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CompanyDB`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Departments`
--

CREATE TABLE `Departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Departments`
--

INSERT INTO `Departments` (`department_id`, `department_name`) VALUES
(1, 'HR'),
(2, 'Engineering'),
(3, 'Marketing');

-- --------------------------------------------------------

--
-- Struttura della tabella `Employees`
--

CREATE TABLE `Employees` (
  `employee_id` int NOT NULL,
  `name` varchar(255) NOT NULL,
  `department_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Employees`
--

INSERT INTO `Employees` (`employee_id`, `name`, `department_id`) VALUES
(1, 'Alice', 1),
(2, 'Bob', 2),
(3, 'Charlie', 3),
(4, 'David', 2),
(5, 'Eva', NULL),
(6, 'Frank', 2),
(7, 'Grace', NULL);

-- --------------------------------------------------------

--
-- Struttura della tabella `Employee_Projects`
--

CREATE TABLE `Employee_Projects` (
  `employee_id` int NOT NULL,
  `project_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Employee_Projects`
--

INSERT INTO `Employee_Projects` (`employee_id`, `project_id`) VALUES
(1, 1),
(2, 1),
(1, 2),
(4, 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `Projects`
--

CREATE TABLE `Projects` (
  `project_id` int NOT NULL,
  `project_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Projects`
--

INSERT INTO `Projects` (`project_id`, `project_name`) VALUES
(1, 'Project Alpha'),
(2, 'Project Beta'),
(3, 'Project Gamma'),
(4, 'Project Delta');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Departments`
--
ALTER TABLE `Departments`
  ADD PRIMARY KEY (`department_id`);

--
-- Indici per le tabelle `Employees`
--
ALTER TABLE `Employees`
  ADD PRIMARY KEY (`employee_id`),
  ADD KEY `department_id` (`department_id`);

--
-- Indici per le tabelle `Employee_Projects`
--
ALTER TABLE `Employee_Projects`
  ADD PRIMARY KEY (`employee_id`,`project_id`),
  ADD KEY `project_id` (`project_id`);

--
-- Indici per le tabelle `Projects`
--
ALTER TABLE `Projects`
  ADD PRIMARY KEY (`project_id`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Departments`
--
ALTER TABLE `Departments`
  MODIFY `department_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT per la tabella `Employees`
--
ALTER TABLE `Employees`
  MODIFY `employee_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT per la tabella `Projects`
--
ALTER TABLE `Projects`
  MODIFY `project_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Employees`
--
ALTER TABLE `Employees`
  ADD CONSTRAINT `Employees_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `Departments` (`department_id`);

--
-- Limiti per la tabella `Employee_Projects`
--
ALTER TABLE `Employee_Projects`
  ADD CONSTRAINT `Employee_Projects_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `Employees` (`employee_id`),
  ADD CONSTRAINT `Employee_Projects_ibfk_2` FOREIGN KEY (`project_id`) REFERENCES `Projects` (`project_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
