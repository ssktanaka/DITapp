
-- phpMyAdmin SQL Dump
-- version 3.3.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 13, 2013 at 04:40 PM
-- Server version: 5.5.9
-- PHP Version: 5.3.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: `collegeData`
--

-- --------------------------------------------------------

--
-- Table structure for table `lecturerTable`
--

CREATE TABLE `lecturertable` (
  `staffNumber` int(6) NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `moduleNo1` int(6) NOT NULL,
  `moduleNo2` int(6) NOT NULL,
  `email` varchar(30) NOT NULL,
  PRIMARY KEY (`staffNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains all lecturer records for the example database.';

--
-- Dumping data for table `lecturerTable`
--

INSERT INTO `lecturertable` VALUES(123001, 'Charlie', 'Cullen', 999001, 999003, 'charlie@here.com');
INSERT INTO `lecturertable` VALUES(123002, 'Hugh', 'McAtamney', 999002, 999009, 'hugh@there.com');
INSERT INTO `lecturertable` VALUES(123003, 'Keith', 'Gardiner', 999006, 999008, 'keith@there.com');
INSERT INTO `lecturertable` VALUES(123004, 'Paula', 'McGloin', 999004, 999005, 'paula@there.com');
INSERT INTO `lecturertable` VALUES(123005, 'James', 'Wogan', 999007, 999010, 'james@there.com');

-- --------------------------------------------------------

--
-- Table structure for table `moduleTable`
--

CREATE TABLE `moduletable` (
  `moduleNo` int(6) NOT NULL,
  `moduleName` varchar(30) NOT NULL,
  `meetingDay` varchar(30) NOT NULL,
  `credits` int(2) NOT NULL,
  `website` varchar(30) NOT NULL,
  `dueDate` date NOT NULL,
  `location` varchar(25) NOT NULL,
  `room` varchar(10) NOT NULL,
  `lat` varchar(20) NOT NULL,
  `long` varchar(20) NOT NULL,
  PRIMARY KEY (`moduleNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains all module records for the example database.';

--
-- Dumping data for table `moduleTable`
--

INSERT INTO `moduletable` VALUES(999001, 'Dynamic Web Development', 'Tuesday', 15, 'www.dynWeb.ie', '2013-05-14', 'Aungier Street', '4037', '53.338545', '-6.26607');
INSERT INTO `moduletable` VALUES(999002, 'Human Computer Interaction','Thursday', 10, 'www.hci.ie', '2013-04-09', 'Aungier Street', '2005', '53.338545', '-6.26607');
INSERT INTO `moduletable` VALUES(999003, 'Introduction to Programming', 'Friday', 15, 'www.jscriptIntro.ie', '2013-01-11', 'Kevin Street', '1045', '53.337015', '-6.267933');
INSERT INTO `moduletable` VALUES(999004, 'Design Principles', 'Monday', 15, 'www.designIntro.ie', '2013-04-25', 'Bolton Street', '0130', '53.351406', '-6.268724');
INSERT INTO `moduletable` VALUES(999005, 'Design Practice', 'Tuesday', 10, 'www.designPract.ie', '2013-01-11', 'Cathal Brugha Street', '0123', '53.352044', '-6.259514');
INSERT INTO `moduletable` VALUES(999006, 'Digital Audio', 'Wednesday', 10, 'www.dspAudio.com', '2013-05-10', 'Aungier Street', '3025', '53.338545', '-6.26607');
INSERT INTO `moduletable` VALUES(999007, 'Digital Signal Processing', 'Friday', 10, 'www.dspGeneral.ie', '2013-04-04', 'Kevin Street', '2103', '53.337015', '-6.267933');
INSERT INTO `moduletable` VALUES(999008, 'History of Digital Media', 'Monday', 5, 'www.itsbeendone.ie', '2013-03-28', 'Aungier Street', '0120', '53.338545', '-6.26607');
INSERT INTO `moduletable` VALUES(999009, 'Digital Asset Management', 'Wednesday', 5, 'www.contentStore.ie', '2013-05-30', 'Bolton Street', '1004', '53.351406', '-6.268724');
INSERT INTO `moduletable` VALUES(999010, 'Production Skills', 'Thursday', 10, 'www.webDevPro.ie', '2013-04-02', 'Aungier Street', '1089', '53.338545', '-6.26607');

-- --------------------------------------------------------

--
-- Table structure for table `studentTable`
--

CREATE TABLE `studenttable` (
  `studentID` int(6) NOT NULL,
  `firstName` varchar(10) NOT NULL,
  `lastName` varchar(15) NOT NULL,
  `moduleNo1` int(6) NOT NULL,
  `moduleNo2` int(6) NOT NULL,
  `courseID` int(6) NOT NULL,
  PRIMARY KEY (`studentID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='This table contains all student records for the example database.';

--
-- Dumping data for table `studentTable`
--

INSERT INTO `studenttable` VALUES(123, 'Kermit', 'Frog', 999003, 999008, 888001);
INSERT INTO `studenttable` VALUES(124, 'Gonzo', 'Great', 999001, 999009, 888001);
INSERT INTO `studenttable` VALUES(125, 'Cookie', 'Monster', 999004, 999005, 888002);
INSERT INTO `studenttable` VALUES(126, 'Fozzie', 'Bear', 999006, 999010, 888001);
INSERT INTO `studenttable` VALUES(127, 'Bunsen', 'Honeydew', 999007, 999009, 888003);
INSERT INTO `studenttable` VALUES(128, 'Miss', 'Piggy', 999002, 999003, 888003);
INSERT INTO `studenttable` VALUES(129, 'Gobo', 'Fraggle', 999008, 999010, 888002);
INSERT INTO `studenttable` VALUES(130, 'Mokey', 'Fraggle', 999002, 999005, 888001);
INSERT INTO `studenttable` VALUES(131, 'Red', 'Fraggle', 999006, 999008, 888003);
INSERT INTO `studenttable` VALUES(132, 'Wembley', 'Fraggle', 999004, 999007, 888003);
INSERT INTO `studenttable` VALUES(133, 'Travelling', 'Matt', 999002, 999003, 888002);
INSERT INTO `studenttable` VALUES(134, 'Convincing', 'John', 999004, 999008, 888001);
INSERT INTO `studenttable` VALUES(135, 'Cotterpin', 'Doozer', 999008, 999009, 888002);
INSERT INTO `studenttable` VALUES(136, 'Judge', 'Dog', 999003, 999007, 888003);
INSERT INTO `studenttable` VALUES(137, 'Doctor', 'Astro', 999005, 999001, 888001);
INSERT INTO `studenttable` VALUES(138, 'Sneaky', 'Snake', 999006, 999008, 888002);
INSERT INTO `studenttable` VALUES(139, 'Sunni', 'Gummi', 999009, 999010, 888002);
INSERT INTO `studenttable` VALUES(140, 'Cubbi', 'Gummi', 999004, 999008, 888001);
INSERT INTO `studenttable` VALUES(141, 'Papa', 'Smurf', 999008, 999009, 888003);
INSERT INTO `studenttable` VALUES(142, 'Lazy', 'Smurf', 999001, 999002, 888001);
INSERT INTO `studenttable` VALUES(143, 'Vanity', 'Smurf', 999008, 999010, 888002);
INSERT INTO `studenttable` VALUES(144, 'Joe', 'Frasier', 999004, 999006, 888003);
INSERT INTO `studenttable` VALUES(145, 'Muhammad', 'Ali', 999003, 999005, 888002);
INSERT INTO `studenttable` VALUES(146, 'George', 'Foreman', 999002, 999003, 888001);
INSERT INTO `studenttable` VALUES(147, 'Larry', 'Holmes', 999001, 999002, 888001);
INSERT INTO `studenttable` VALUES(148, 'Marvin', 'Hagler', 999004, 999005, 888003);
INSERT INTO `studenttable` VALUES(149, 'John', 'Coltrane', 999002, 999006, 888002);
INSERT INTO `studenttable` VALUES(150, 'Sonny', 'Rawlins', 999009, 999010, 888002);
INSERT INTO `studenttable` VALUES(151, 'Coleman', 'Hawkins', 999006, 999007, 888003);
INSERT INTO `studenttable` VALUES(152, 'Wes', 'Montgomery', 999002, 999004, 888001);
INSERT INTO `studenttable` VALUES(153, 'Joe', 'Pass', 999006, 999009, 888001);
INSERT INTO `studenttable` VALUES(154, 'Charlie', 'Christian', 999008, 999010, 888002);
INSERT INTO `studenttable` VALUES(155, 'Stanley', 'Jordan', 999004, 999007, 888003);
INSERT INTO `studenttable` VALUES(156, 'Rory', 'Gallagher', 999006, 999009, 888003);
INSERT INTO `studenttable` VALUES(157, 'Gary', 'Moore', 999001, 999008, 888002);
INSERT INTO `studenttable` VALUES(158, 'Jimi', 'Hendrix', 999004, 999008, 888001);
INSERT INTO `studenttable` VALUES(159, 'Paco', 'Pena', 999005, 999009, 888003);
INSERT INTO `studenttable` VALUES(160, 'Andres', 'Segovia', 999003, 999007, 888003);
INSERT INTO `studenttable` VALUES(161, 'Bootsy', 'Collins', 999004, 999005, 888002);
INSERT INTO `studenttable` VALUES(162, 'George', 'Clinton', 999003, 999010, 888002);
