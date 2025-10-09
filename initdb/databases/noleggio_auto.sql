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
-- Database: `noleggio_auto`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Automobili`
--

CREATE TABLE `Automobili` (
  `Marca` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Modello` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Anno` int NOT NULL,
  `Targa` varchar(10) COLLATE utf8mb4_general_ci NOT NULL,
  `IdTipoAuto` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Automobili`
--

INSERT INTO `Automobili` (`Marca`, `Modello`, `Anno`, `Targa`, `IdTipoAuto`) VALUES
('Volkswagen', 'Golf', 2020, 'ED668CD', 'Media'),
('Renault', 'Clio', 2020, 'EZ012CD', 'Utilitaria'),
('Nissan', 'Sentra', 2021, 'EZ024CD', 'Media'),
('Fiat', 'Punto', 2020, 'EZ123CD', 'Utilitaria'),
('Toyota', 'Corolla', 2021, 'EZ135CD', 'Media'),
('Fiat', '500', 2020, 'EZ223CD', 'Utilitaria'),
('Fiat', '500', 2021, 'EZ224CD', 'Utilitaria'),
('Kia', 'Rio', 2020, 'EZ234CD', 'Utilitaria'),
('Ford', 'Explorer', 2021, 'EZ235SD', 'SUV'),
('Ford', 'Explorer', 2020, 'EZ236SD', 'SUV'),
('Honda', 'Civic', 2022, 'EZ246CD', 'Media'),
('Fiat', 'Punto', 2019, 'EZ333CD', 'Utilitaria'),
('Fiat', 'Punto', 2018, 'EZ334CD', 'Utilitaria'),
('Fiat', 'Punto', 2021, 'EZ335CD', 'Utilitaria'),
('Volkswagen', 'Polo', 2021, 'EZ345CD', 'Utilitaria'),
('Ford', 'Focus', 2020, 'EZ357CD', 'Media'),
('Honda', 'Civic', 2022, 'EZ446CD', 'Media'),
('Honda', 'Civic', 2021, 'EZ447CD', 'Media'),
('Toyota', 'Yaris', 2021, 'EZ456CD', 'Utilitaria'),
('Toyota', 'RAV4', 2021, 'EZ457SD', 'SUV'),
('Toyota', 'RAV4', 2022, 'EZ458SD', 'SUV'),
('Volkswagen', 'Golf', 2021, 'EZ468CD', 'Media'),
('Volkswagen', 'Polo', 2021, 'EZ553CD', 'Utilitaria'),
('Volkswagen', 'Polo', 2018, 'EZ554CD', 'Utilitaria'),
('Volkswagen', 'Polo', 2019, 'EZ555CD', 'Utilitaria'),
('Toyota', 'Yaris', 2022, 'EZ556CD', 'Utilitaria'),
('Toyota', 'Yaris', 2020, 'EZ557CD', 'Utilitaria'),
('Opel', 'Corsa', 2021, 'EZ567CD', 'Utilitaria'),
('Hyundai', 'Elantra', 2022, 'EZ579CD', 'Media'),
('Toyota', 'Yaris', 2019, 'EZ666CD', 'Utilitaria'),
('Toyota', 'Yaris', 2018, 'EZ667CD', 'Utilitaria'),
('Toyota', 'Yaris', 2021, 'EZ668CD', 'Utilitaria'),
('Volkswagen', 'Golf', 2021, 'EZ669CD', 'Media'),
('Hyundai', 'i20', 2022, 'EZ678CD', 'Utilitaria'),
('Mazda', 'Mazda3', 2021, 'EZ680CD', 'Media'),
('Ford', 'Fiesta', 2022, 'EZ789CD', 'Utilitaria'),
('Subaru', 'Impreza', 2020, 'EZ791CD', 'Media'),
('Chevrolet', 'Malibu', 2021, 'EZ802CD', 'Media'),
('Mini', 'Cooper', 2022, 'EZ890CD', 'Utilitaria'),
('Peugeot', '208', 2021, 'EZ901CD', 'Utilitaria'),
('Kia', 'Forte', 2022, 'EZ913CD', 'Media'),
('Ford', 'Fiesta', 2021, 'EZ997CD', 'Utilitaria'),
('Ford', 'Fiesta', 2018, 'EZ998CD', 'Utilitaria'),
('Ford', 'Fiesta', 2019, 'EZ999CD', 'Utilitaria'),
('Mercedes-Benz', 'S-Class', 2021, 'LX335CD', 'Lusso'),
('Mercedes-Benz', 'S-Class', 2020, 'LX336CD', 'Lusso'),
('BMW', '7 Series', 2022, 'LX546CD', 'Lusso'),
('BMW', '7 Series', 2020, 'LX547CD', 'Lusso');

-- --------------------------------------------------------

--
-- Struttura della tabella `Clienti`
--

CREATE TABLE `Clienti` (
  `IdCliente` int NOT NULL,
  `Nome` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `Cognome` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `Email` varchar(120) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Patente` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `DataNascita` date NOT NULL,
  `Nazione` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Clienti`
--

INSERT INTO `Clienti` (`IdCliente`, `Nome`, `Cognome`, `Email`, `Telefono`, `Patente`, `DataNascita`, `Nazione`) VALUES
(1, 'Mario', 'Rossi', 'mario.rossi@email.com', '3201234567', 'XYZ1234567', '1980-06-01', 'Italiana'),
(2, 'Luca', 'Bianchi', 'luca.bianchi@email.com', '3201234568', 'XYZ1234568', '1985-07-15', 'Italiana'),
(3, 'Giulia', 'Verdi', 'giulia.verdi@email.com', '3201234569', 'XYZ1234569', '1990-08-20', 'Italiana'),
(4, 'Anna', 'Neri', 'anna.neri@email.com', '3201234570', 'XYZ1234570', '1992-09-25', 'Italiana'),
(5, 'Marco', 'Gialli', 'marco.gialli@email.com', '3201234571', 'XYZ1234571', '1984-10-30', 'Italiana'),
(6, 'Alessandro', 'Viola', 'alessandro.viola@email.com', '3201234572', 'XYZ1234572', '1993-12-05', 'Italiana'),
(7, 'Francesca', 'Marrone', 'francesca.marrone@email.com', '3201234573', 'XYZ1234573', '1991-11-10', 'Italiana'),
(8, 'Laura', 'Grigio', 'laura.grigio@email.com', '3201234574', 'XYZ1234574', '1988-01-15', 'Italiana'),
(9, 'Stefano', 'Blu', 'stefano.blu@email.com', '3201234575', 'XYZ1234575', '1986-02-20', 'Italiana'),
(10, 'Silvia', 'Rosa', 'silvia.rosa@email.com', '3201234576', 'XYZ1234576', '1997-03-25', 'Italiana'),
(11, 'Riccardo', 'Arancio', 'riccardo.arancio@email.com', '3201234577', 'XYZ1234577', '1995-04-30', 'Italiana'),
(12, 'Chiara', 'Celeste', 'chiara.celeste@email.com', '3201234578', 'XYZ1234578', '1989-05-05', 'Italiana'),
(13, 'Matteo', 'Oro', 'matteo.oro@email.com', '3201234579', 'XYZ1234579', '1987-06-10', 'Italiana'),
(14, 'Sara', 'Argento', 'sara.argento@email.com', '3201234580', 'XYZ1234580', '1982-07-15', 'Italiana'),
(15, 'Davide', 'Fucsia', 'davide.fucsia@email.com', '3201234581', 'XYZ1234581', '1991-08-20', 'Italiana'),
(16, 'Elena', 'Corallo', 'elena.corallo@email.com', '3201234582', 'XYZ1234582', '1993-09-25', 'Italiana'),
(17, 'Federico', 'Turchese', 'federico.turchese@email.com', '3201234583', 'XYZ1234583', '1992-10-30', 'Italiana'),
(18, 'Valentina', 'Magenta', 'valentina.magenta@email.com', '3201234584', 'XYZ1234584', '1995-11-10', 'Italiana'),
(19, 'Simone', 'Crema', 'simone.crema@email.com', '3201234585', 'XYZ1234585', '1994-12-05', 'Italiana'),
(20, 'Elisa', 'Avorio', 'elisa.avorio@email.com', '3201234586', 'XYZ1234586', '1986-01-15', 'Italiana'),
(21, 'Giovanni', 'Perla', 'giovanni.perla@email.com', '3201234587', 'XYZ1234587', '1989-02-20', 'Italiana'),
(22, 'Aurora', 'Zaffiro', 'aurora.zaffiro@email.com', '3201234588', 'XYZ1234588', '1996-03-25', 'Italiana'),
(23, 'Daniele', 'Rubino', 'daniele.rubino@email.com', '3201234589', 'XYZ1234589', '1985-04-30', 'Italiana'),
(24, 'Roberta', 'Ambra', 'roberta.ambra@email.com', '3201234590', 'XYZ1234590', '1990-05-05', 'Italiana'),
(25, 'Alberto', 'Smeraldo', 'alberto.smeraldo@email.com', '3201234591', 'XYZ1234591', '1983-06-10', 'Italiana'),
(26, 'Giorgia', 'Opale', 'giorgia.opale@email.com', '3201234592', 'XYZ1234592', '1987-07-15', 'Italiana'),
(27, 'Luigi', 'Topazio', 'luigi.topazio@email.com', '3201234593', 'XYZ1234593', '1991-08-20', 'Italiana'),
(28, 'Cristina', 'Perla', 'cristina.perla@email.com', '3201234594', 'XYZ1234594', '1988-09-25', 'Italiana'),
(29, 'Pietro', 'Onice', 'pietro.onice@email.com', '3201234595', 'XYZ1234595', '1984-10-30', 'Italiana'),
(30, 'Simona', 'Agata', 'simona.agata@email.com', '3201234596', 'XYZ1234596', '1990-11-10', 'Italiana');

-- --------------------------------------------------------

--
-- Struttura della tabella `Incidenti`
--

CREATE TABLE `Incidenti` (
  `IdIncidente` int NOT NULL,
  `IdNoleggio` int NOT NULL,
  `TipoProblema` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Descrizione` text COLLATE utf8mb4_general_ci,
  `Data` date NOT NULL,
  `CostoDanni` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Incidenti`
--

INSERT INTO `Incidenti` (`IdIncidente`, `IdNoleggio`, `TipoProblema`, `Descrizione`, `Data`, `CostoDanni`) VALUES
(1, 1, 'Incidente', 'Collisione minore con un altro veicolo al parcheggio', '2024-05-10', 300.00),
(2, 2, 'Guasto meccanico', 'Guasto al motore richiede riparazione urgente', '2024-05-12', 1500.00),
(3, 3, 'Ritardo nella consegna', 'Ritardo nella consegna dell\'auto a causa di guasti meccanici imprevisti', '2024-05-15', 0.00),
(4, 4, 'Danno da maltempo', 'Danni alla carrozzeria a causa di grandine intensa', '2024-05-20', 600.00),
(5, 5, 'Incidente grave', 'Collisione frontale richiede sostituzione del veicolo', '2024-05-22', 20000.00),
(6, 6, 'Furto', 'Veicolo rubato durante il periodo di noleggio', '2024-05-25', 10000.00),
(7, 7, 'Perdita di chiavi', 'Il cliente ha perso le chiavi del veicolo', '2024-05-28', 200.00),
(8, 8, 'Guasto agli pneumatici', 'Pneumatico scoppiato durante l\'uso normale', '2024-05-30', 100.00),
(9, 9, 'Problema elettronico', 'Malfunzionamento del sistema di navigazione GPS', '2024-06-02', 250.00),
(10, 10, 'Danno interno', 'Danni agli interni causati da spillaggi di liquidi', '2024-06-05', 400.00),
(23, 11, 'Incidente', 'Graffio laterale in parcheggio affollato', '2024-06-10', 150.00),
(24, 11, 'Incidente', 'Tamponamento leggero in coda traffico', '2024-06-18', 300.00),
(25, 12, 'Furto', 'Veicolo rubato e recuperato con danni minori', '2024-06-15', 500.00),
(26, 12, 'Furto', 'Secondo furto del veicolo, non recuperato', '2024-06-25', 15000.00),
(27, 13, 'Guasto meccanico', 'Guasto al sistema di frenatura', '2024-06-12', 700.00),
(28, 14, 'Guasto meccanico', 'Sostituzione della pompa dell\'acqua difettosa', '2024-06-20', 450.00),
(29, 15, 'Problema elettronico', 'Guasto al sistema di start-stop automatico', '2024-07-01', 250.00),
(30, 16, 'Problema elettronico', 'Malfunzionamento del sistema infotainment', '2024-07-08', 300.00),
(31, 17, 'Danno da maltempo', 'Danni significativi da alluvione', '2024-07-10', 2000.00),
(32, 17, 'Incidente grave', 'Auto capovolta in un incidente stradale', '2024-07-20', 5000.00),
(33, 18, 'Incidente', 'Piccoli graffi e ammaccature varie durante il parcheggio', '2024-07-05', 100.00),
(34, 18, 'Incidente', 'Altri graffi sul paraurti posteriore', '2024-07-15', 120.00);

-- --------------------------------------------------------

--
-- Struttura della tabella `Noleggi`
--

CREATE TABLE `Noleggi` (
  `IdNoleggio` int NOT NULL,
  `IdCliente` int NOT NULL,
  `Targa` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `IdSedePrelevamento` int NOT NULL,
  `IdSedeConsegna` int DEFAULT NULL,
  `DataInizio` date NOT NULL,
  `DataFine` date DEFAULT NULL,
  `Costo` decimal(10,2) NOT NULL,
  `KmPercorsi` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Noleggi`
--

INSERT INTO `Noleggi` (`IdNoleggio`, `IdCliente`, `Targa`, `IdSedePrelevamento`, `IdSedeConsegna`, `DataInizio`, `DataFine`, `Costo`, `KmPercorsi`) VALUES
(1, 1, 'EZ012CD', 1, 1, '2024-05-01', '2024-05-05', 150.00, 320),
(2, 2, 'EZ456CD', 2, 3, '2024-05-02', '2024-05-06', 200.00, 450),
(3, 3, 'EZ789CD', 4, 4, '2024-05-03', '2024-05-07', 180.00, 220),
(4, 4, 'EZ012CD', 5, NULL, '2023-05-08', NULL, 100.00, NULL),
(5, 5, 'EZ234CD', 6, 6, '2024-04-15', '2024-04-20', 250.00, 180),
(6, 5, 'EZ345CD', 6, 7, '2024-04-21', '2024-04-25', 300.00, 360),
(7, 6, 'EZ567CD', 8, 8, '2024-04-10', '2024-04-15', 220.00, 200),
(8, 6, 'EZ678CD', 8, NULL, '2024-04-16', NULL, 120.00, NULL),
(9, 7, 'EZ901CD', 1, 21, '2023-05-10', '2023-05-20', 400.00, 1000),
(10, 8, 'EZ890CD', 2, 22, '2023-05-12', '2023-05-25', 500.00, 1200),
(11, 9, 'EZ802CD', 3, 3, '2023-06-01', '2023-07-01', 1500.00, 2000),
(12, 10, 'EZ913CD', 4, NULL, '2024-05-01', NULL, 1600.00, NULL),
(13, 17, 'EZ235SD', 2, 3, '2023-06-07', '2023-06-14', 400.00, 550),
(14, 17, 'EZ123CD', 1, 2, '2023-06-01', '2023-06-07', 350.00, 500),
(15, 17, 'EZ335CD', 5, 6, '2023-06-02', '2023-06-03', 150.00, 100),
(16, 1, 'EZ012CD', 1, 21, '2023-05-10', '2023-05-20', 450.00, 800),
(17, 2, 'EZ789CD', 2, NULL, '2024-05-01', NULL, 1200.00, NULL),
(18, 3, 'EZ357CD', 3, 3, '2024-04-15', '2024-04-18', 210.00, 150),
(19, 3, 'EZ446CD', 3, 4, '2024-04-19', NULL, 240.00, NULL),
(20, 4, 'EZ123CD', 4, 4, '2024-05-02', '2024-05-06', 300.00, 400),
(21, 5, 'LX335CD', 5, 5, '2024-05-07', '2024-05-09', 200.00, 100),
(22, 6, 'EZ223CD', 6, NULL, '2023-05-10', NULL, 500.00, NULL),
(23, 7, 'EZ234CD', 7, 10, '2023-05-11', '2023-05-15', 350.00, 500),
(24, 8, 'EZ024CD', 8, 9, '2024-04-20', '2024-04-25', 180.00, 220),
(25, 8, 'EZ246CD', 9, 10, '2024-04-26', '2024-04-30', 190.00, 230),
(26, 9, 'EZ024CD', 1, 22, '2023-06-01', '2023-08-01', 2000.00, 5000),
(27, 10, 'EZ235SD', 2, 2, '2023-07-20', '2023-07-21', 300.00, 100),
(28, 11, 'LX547CD', 5, 5, '2023-07-03', '2023-07-06', 450.00, 300),
(29, 12, 'EZ789CD', 3, 21, '2023-07-10', '2023-07-24', 800.00, 1200),
(30, 13, 'EZ555CD', 4, 7, '2023-05-15', '2023-05-20', 600.00, 800),
(31, 13, 'EZ666CD', 7, 9, '2023-05-21', '2023-05-25', 500.00, 600),
(32, 14, 'EZ012CD', 6, 6, '2023-08-01', '2023-08-15', 450.00, 400),
(33, 15, 'EZ468CD', 8, 8, '2023-09-05', '2023-09-07', 250.00, 150),
(34, 16, 'EZ357CD', 10, 12, '2023-10-01', '2023-10-03', 350.00, 450),
(35, 17, 'EZ223CD', 3, 5, '2023-06-01', '2023-06-02', 100.00, 50);

-- --------------------------------------------------------

--
-- Struttura della tabella `Sedi`
--

CREATE TABLE `Sedi` (
  `IdSede` int NOT NULL,
  `NomeSede` varchar(120) COLLATE utf8mb4_general_ci NOT NULL,
  `Indirizzo` varchar(200) COLLATE utf8mb4_general_ci NOT NULL,
  `Città` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `Stato` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Cap` varchar(10) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `Sedi`
--

INSERT INTO `Sedi` (`IdSede`, `NomeSede`, `Indirizzo`, `Città`, `Stato`, `Cap`) VALUES
(1, 'Sede Roma Centro', 'Via Roma 100', 'Roma', 'Italia', '00100'),
(2, 'Sede Milano Duomo', 'Piazza Duomo 1', 'Milano', 'Italia', '20121'),
(3, 'Sede Napoli Porta', 'Via Toledo 200', 'Napoli', 'Italia', '80100'),
(4, 'Sede Torino Reale', 'Corso Regina 10', 'Torino', 'Italia', '10122'),
(5, 'Sede Palermo Sicilia', 'Via Maqueda 300', 'Palermo', 'Italia', '90100'),
(6, 'Sede Genova Ponte', 'Piazza De Ferrari 5', 'Genova', 'Italia', '16121'),
(7, 'Sede Bologna Rettori', 'Via Zamboni 33', 'Bologna', 'Italia', '40126'),
(8, 'Sede Firenze Arte', 'Via Cavour 50', 'Firenze', 'Italia', '50129'),
(9, 'Sede Catania Etna', 'Via Etnea 400', 'Catania', 'Italia', '95100'),
(10, 'Sede Venezia Laguna', 'Piazza San Marco 1', 'Venezia', 'Italia', '30124'),
(11, 'Sede Verona Arena', 'Via Mazzini 50', 'Verona', 'Italia', '37121'),
(12, 'Sede Padova Giotto', 'Via Altinate 100', 'Padova', 'Italia', '35121'),
(13, 'Sede Brescia Castello', 'Via Musei 55', 'Brescia', 'Italia', '25121'),
(14, 'Sede Modena Enzo', 'Via Emilia 150', 'Modena', 'Italia', '41121'),
(15, 'Sede Perugia Umbra', 'Piazza Italia 1', 'Perugia', 'Italia', '06121'),
(16, 'Sede Rimini Adriatica', 'Viale Vespucci 10', 'Rimini', 'Italia', '47921'),
(17, 'Sede Lecce Barocco', 'Via Vittorio Emanuele 100', 'Lecce', 'Italia', '73100'),
(18, 'Sede Pisa Torre', 'Piazza dei Miracoli 1', 'Pisa', 'Italia', '56126'),
(19, 'Sede Ancona Dorica', 'Via Thaon de Revel 5', 'Ancona', 'Italia', '60121'),
(20, 'Sede Trieste Bora', 'Piazza Unità d\'Italia 1', 'Trieste', 'Italia', '34121'),
(21, 'Sede Nizza Costa', 'Avenue Jean Médecin 10', 'Nizza', 'Francia', '06000'),
(22, 'Sede Lugano Lago', 'Via Cantonale 5', 'Lugano', 'Svizzera', '6900'),
(23, 'Sede Lubiana Centro', 'Miklošičeva cesta 20', 'Lubiana', 'Slovenia', '1000'),
(24, 'Sede Monaco Marina', 'Le Portier 22', 'Monaco', 'Monaco', '98000'),
(25, 'Sede Innsbruck Alpi', 'Maria-Theresien-Straße 15', 'Innsbruck', 'Austria', '6020'),
(26, 'Sede Como Lago', 'Via Milano 40', 'Como', 'Italia', '22100'),
(27, 'Sede Gorizia Castello', 'Corso Italia 50', 'Gorizia', 'Italia', '34170'),
(28, 'Sede Trento Mela', 'Via Belenzani 12', 'Trento', 'Italia', '38122'),
(29, 'Sede Bolzano Dolomiti', 'Piazza Walther 20', 'Bolzano', 'Italia', '39100'),
(30, 'Sede Udine Liberty', 'Piazza Libertà 5', 'Udine', 'Italia', '33100'),
(31, 'Sede Venezia Mestre', 'Piazza Mestre Paradiso Terrestre', 'Venezia', 'Italia', '30124');

-- --------------------------------------------------------

--
-- Struttura della tabella `TipiAuto`
--

CREATE TABLE `TipiAuto` (
  `IdTipoAuto` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `CostoGiornaliero` decimal(10,2) NOT NULL,
  `CostoKm` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dump dei dati per la tabella `TipiAuto`
--

INSERT INTO `TipiAuto` (`IdTipoAuto`, `CostoGiornaliero`, `CostoKm`) VALUES
('Lusso', 120.00, 0.50),
('Media', 50.00, 0.20),
('SUV', 80.00, 0.35),
('Utilitaria', 30.00, 0.10);

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Automobili`
--
ALTER TABLE `Automobili`
  ADD PRIMARY KEY (`Targa`),
  ADD UNIQUE KEY `Targa` (`Targa`),
  ADD KEY `TipoAuto` (`IdTipoAuto`);

--
-- Indici per le tabelle `Clienti`
--
ALTER TABLE `Clienti`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indici per le tabelle `Incidenti`
--
ALTER TABLE `Incidenti`
  ADD PRIMARY KEY (`IdIncidente`),
  ADD KEY `IdNoleggio` (`IdNoleggio`);

--
-- Indici per le tabelle `Noleggi`
--
ALTER TABLE `Noleggi`
  ADD PRIMARY KEY (`IdNoleggio`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `IdSedePrelevamento` (`IdSedePrelevamento`),
  ADD KEY `IdSedeConsegna` (`IdSedeConsegna`),
  ADD KEY `FK_Noleggi_Auto` (`Targa`);

--
-- Indici per le tabelle `Sedi`
--
ALTER TABLE `Sedi`
  ADD PRIMARY KEY (`IdSede`);

--
-- Indici per le tabelle `TipiAuto`
--
ALTER TABLE `TipiAuto`
  ADD PRIMARY KEY (`IdTipoAuto`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Clienti`
--
ALTER TABLE `Clienti`
  MODIFY `IdCliente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT per la tabella `Incidenti`
--
ALTER TABLE `Incidenti`
  MODIFY `IdIncidente` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT per la tabella `Noleggi`
--
ALTER TABLE `Noleggi`
  MODIFY `IdNoleggio` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT per la tabella `Sedi`
--
ALTER TABLE `Sedi`
  MODIFY `IdSede` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Automobili`
--
ALTER TABLE `Automobili`
  ADD CONSTRAINT `Automobili_ibfk_1` FOREIGN KEY (`IdTipoAuto`) REFERENCES `TipiAuto` (`IdTipoAuto`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `Incidenti`
--
ALTER TABLE `Incidenti`
  ADD CONSTRAINT `Incidenti_ibfk_1` FOREIGN KEY (`IdNoleggio`) REFERENCES `Noleggi` (`IdNoleggio`);

--
-- Limiti per la tabella `Noleggi`
--
ALTER TABLE `Noleggi`
  ADD CONSTRAINT `FK_Noleggi_Auto` FOREIGN KEY (`Targa`) REFERENCES `Automobili` (`Targa`),
  ADD CONSTRAINT `Noleggi_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `Clienti` (`IdCliente`),
  ADD CONSTRAINT `Noleggi_ibfk_3` FOREIGN KEY (`IdSedePrelevamento`) REFERENCES `Sedi` (`IdSede`),
  ADD CONSTRAINT `Noleggi_ibfk_4` FOREIGN KEY (`IdSedeConsegna`) REFERENCES `Sedi` (`IdSede`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
