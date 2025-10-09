-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql:3306
-- Creato il: Ott 09, 2025 alle 16:46
-- Versione del server: 8.3.0
-- Versione PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sql_edu`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Autori`
--

CREATE TABLE `Autori` (
  `ID_Autore` int NOT NULL,
  `Nome` varchar(255) DEFAULT NULL,
  `Nazionalita` varchar(100) DEFAULT NULL,
  `Movimento_Artistico` varchar(100) DEFAULT NULL,
  `Data_nascita` date DEFAULT NULL,
  `Data_morte` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Autori`
--

INSERT INTO `Autori` (`ID_Autore`, `Nome`, `Nazionalita`, `Movimento_Artistico`, `Data_nascita`, `Data_morte`) VALUES
(1, 'Leonardo da Vinci', 'Italiana', 'Rinascimento', '1452-04-15', NULL),
(2, 'Vincent van Gogh', 'Olandese', 'Post-Impressionismo', '1853-03-30', '1890-07-29'),
(3, 'Pablo Picasso', 'Spagnola', 'Cubismo', '1881-10-25', '1973-04-08'),
(4, 'Claude Monet', 'Francese', 'Impressionismo', '1840-11-14', NULL),
(5, 'Rembrandt', 'Olandese', 'Barocco', '1606-07-15', '1669-10-04'),
(6, 'Caravaggio', 'Italiana', 'Barocco', '1571-09-29', '1610-07-18'),
(7, 'Frida Kahlo', 'Messicana', 'Surrealismo', '1907-07-06', '1954-07-13'),
(8, 'Georgia O’Keeffe', 'Americana', 'Modernismo', '1887-11-15', NULL),
(9, 'Salvador Dalí', 'Spagnola', 'Surrealismo', '1904-05-11', '1989-01-23'),
(10, 'Michelangelo', 'Italiana', 'Rinascimento', '1475-03-06', '1564-02-18');

-- --------------------------------------------------------

--
-- Struttura della tabella `Custodi`
--

CREATE TABLE `Custodi` (
  `ID_Custode` int NOT NULL,
  `Nome_Custode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Custodi`
--

INSERT INTO `Custodi` (`ID_Custode`, `Nome_Custode`) VALUES
(1, 'Marco Rossi'),
(2, 'Giulia Bianchi'),
(3, 'Luca Verdi'),
(4, 'Elena Neri'),
(5, 'Antonio Marrone'),
(6, 'Sofia Rosso'),
(7, 'Giovanni Giallo'),
(8, 'Francesca Viola'),
(9, 'Roberto Azzurro'),
(10, 'Chiara Grigio');

-- --------------------------------------------------------

--
-- Struttura della tabella `Esposizioni`
--

CREATE TABLE `Esposizioni` (
  `ID_Esposizione` int NOT NULL,
  `ID_Opera` int DEFAULT NULL,
  `ID_Sala` int DEFAULT NULL,
  `Data_inizio` date DEFAULT NULL,
  `Data_fine` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Esposizioni`
--

INSERT INTO `Esposizioni` (`ID_Esposizione`, `ID_Opera`, `ID_Sala`, `Data_inizio`, `Data_fine`) VALUES
(1, 1, 1, '2024-01-01', '2024-03-01'),
(2, 2, 2, '2024-01-15', '2024-04-15'),
(3, 3, 3, '2024-02-01', '2024-05-01'),
(4, 4, 2, '2024-03-01', '2024-06-01'),
(6, 6, 3, '2024-05-01', '2024-08-01'),
(7, 7, 4, '2024-06-01', '2024-09-01'),
(8, 8, 4, '2024-07-01', '2024-10-01'),
(9, 9, 5, '2024-08-01', '2024-11-01'),
(10, 10, 2, '2024-09-01', NULL),
(11, 2, 6, '2024-10-01', '2025-01-01'),
(12, 3, 7, '2024-11-01', '2025-02-01'),
(13, 1, 1, '2024-04-01', '2024-04-01');

-- --------------------------------------------------------

--
-- Struttura della tabella `Opere`
--

CREATE TABLE `Opere` (
  `ID_Opera` int NOT NULL,
  `Titolo` varchar(255) DEFAULT NULL,
  `Tipo` varchar(50) DEFAULT NULL,
  `Periodo_Storico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Opere`
--

INSERT INTO `Opere` (`ID_Opera`, `Titolo`, `Tipo`, `Periodo_Storico`) VALUES
(1, 'Mona Lisa', 'Dipinto', 'Rinascimento'),
(2, 'Notte stellata', 'Dipinto', 'Post-Impressionismo'),
(3, 'Guernica', 'Dipinto', 'Guerra Civile Spagnola'),
(4, 'La notte stellata sul Rodano', 'Dipinto', 'Post-Impressionismo'),
(5, 'Le ninfee', 'Dipinto', 'Impressionismo'),
(6, 'La ronda di notte', 'Dipinto', 'Barocco'),
(7, 'La conversione di San Paolo', 'Dipinto', 'Barocco'),
(8, 'Autoritratto con collana di spine', 'Dipinto', 'Surrealismo'),
(9, 'Black Iris', 'Dipinto', 'Modernismo'),
(10, 'La persistenza della memoria', 'Dipinto', 'Surrealismo');

-- --------------------------------------------------------

--
-- Struttura della tabella `Realizza`
--

CREATE TABLE `Realizza` (
  `ID_Opera` int NOT NULL,
  `ID_Autore` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Realizza`
--

INSERT INTO `Realizza` (`ID_Opera`, `ID_Autore`) VALUES
(1, 1),
(2, 2),
(4, 2),
(10, 2),
(3, 3),
(3, 4),
(5, 4),
(6, 5),
(3, 6),
(7, 6),
(8, 7),
(9, 8),
(2, 9),
(10, 9),
(1, 10),
(2, 10);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sale`
--

CREATE TABLE `Sale` (
  `ID_Sala` int NOT NULL,
  `Nome_Sala` varchar(255) DEFAULT NULL,
  `ID_Sezione` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Sale`
--

INSERT INTO `Sale` (`ID_Sala`, `Nome_Sala`, `ID_Sezione`) VALUES
(1, 'Sala A', 1),
(2, 'Sala B', 2),
(3, 'Sala C', 3),
(4, 'Sala D', 4),
(5, 'Sala E', 5),
(6, 'Sala F', 1),
(7, 'Sala G', 2);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sezioni`
--

CREATE TABLE `Sezioni` (
  `ID_Sezione` int NOT NULL,
  `Nome_Sezione` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Sezioni`
--

INSERT INTO `Sezioni` (`ID_Sezione`, `Nome_Sezione`) VALUES
(1, 'Rinascimento'),
(2, 'Post-Impressionismo'),
(3, 'Barocco'),
(4, 'Surrealismo'),
(5, 'Modernismo');

-- --------------------------------------------------------

--
-- Struttura della tabella `Sorveglia`
--

CREATE TABLE `Sorveglia` (
  `ID_Custode` int NOT NULL,
  `ID_Sezione` int NOT NULL,
  `Giorno_della_settimana` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dump dei dati per la tabella `Sorveglia`
--

INSERT INTO `Sorveglia` (`ID_Custode`, `ID_Sezione`, `Giorno_della_settimana`) VALUES
(1, 1, 'Lunedì'),
(2, 1, 'Mercoledì'),
(5, 1, 'Mercoledì'),
(8, 1, 'Martedì'),
(1, 2, 'Martedì'),
(3, 2, 'Venerdì'),
(6, 2, 'Venerdì'),
(8, 2, 'Lunedì'),
(2, 3, 'Giovedì'),
(4, 3, 'Domenica'),
(7, 3, 'Sabato'),
(9, 3, 'Giovedì'),
(3, 4, 'Sabato'),
(5, 4, 'Martedì'),
(7, 4, 'Domenica'),
(10, 4, 'Venerdì'),
(4, 5, 'Lunedì'),
(6, 5, 'Giovedì'),
(9, 5, 'Mercoledì'),
(10, 5, 'Sabato');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Autori`
--
ALTER TABLE `Autori`
  ADD PRIMARY KEY (`ID_Autore`);

--
-- Indici per le tabelle `Custodi`
--
ALTER TABLE `Custodi`
  ADD PRIMARY KEY (`ID_Custode`);

--
-- Indici per le tabelle `Esposizioni`
--
ALTER TABLE `Esposizioni`
  ADD PRIMARY KEY (`ID_Esposizione`),
  ADD KEY `ID_Opera` (`ID_Opera`),
  ADD KEY `ID_Sala` (`ID_Sala`);

--
-- Indici per le tabelle `Opere`
--
ALTER TABLE `Opere`
  ADD PRIMARY KEY (`ID_Opera`);

--
-- Indici per le tabelle `Realizza`
--
ALTER TABLE `Realizza`
  ADD PRIMARY KEY (`ID_Opera`,`ID_Autore`),
  ADD KEY `ID_Autore` (`ID_Autore`);

--
-- Indici per le tabelle `Sale`
--
ALTER TABLE `Sale`
  ADD PRIMARY KEY (`ID_Sala`),
  ADD KEY `ID_Sezione` (`ID_Sezione`);

--
-- Indici per le tabelle `Sezioni`
--
ALTER TABLE `Sezioni`
  ADD PRIMARY KEY (`ID_Sezione`);

--
-- Indici per le tabelle `Sorveglia`
--
ALTER TABLE `Sorveglia`
  ADD PRIMARY KEY (`ID_Custode`,`ID_Sezione`,`Giorno_della_settimana`),
  ADD KEY `ID_Sezione` (`ID_Sezione`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Esposizioni`
--
ALTER TABLE `Esposizioni`
  ADD CONSTRAINT `Esposizioni_ibfk_1` FOREIGN KEY (`ID_Opera`) REFERENCES `Opere` (`ID_Opera`),
  ADD CONSTRAINT `Esposizioni_ibfk_2` FOREIGN KEY (`ID_Sala`) REFERENCES `Sale` (`ID_Sala`);

--
-- Limiti per la tabella `Realizza`
--
ALTER TABLE `Realizza`
  ADD CONSTRAINT `Realizza_ibfk_1` FOREIGN KEY (`ID_Opera`) REFERENCES `Opere` (`ID_Opera`),
  ADD CONSTRAINT `Realizza_ibfk_2` FOREIGN KEY (`ID_Autore`) REFERENCES `Autori` (`ID_Autore`);

--
-- Limiti per la tabella `Sale`
--
ALTER TABLE `Sale`
  ADD CONSTRAINT `Sale_ibfk_1` FOREIGN KEY (`ID_Sezione`) REFERENCES `Sezioni` (`ID_Sezione`);

--
-- Limiti per la tabella `Sorveglia`
--
ALTER TABLE `Sorveglia`
  ADD CONSTRAINT `Sorveglia_ibfk_1` FOREIGN KEY (`ID_Custode`) REFERENCES `Custodi` (`ID_Custode`),
  ADD CONSTRAINT `Sorveglia_ibfk_2` FOREIGN KEY (`ID_Sezione`) REFERENCES `Sezioni` (`ID_Sezione`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
