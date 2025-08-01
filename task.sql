CREATE DATABASE ShopDB; 
USE ShopDB; 

-- Create a table to store countries 
CREATE TABLE Countries (
    ID INT,
    Name VARCHAR(50),
    PRIMARY KEY (ID)
) ENGINE=InnoDB;

-- Create a table for caching GeoIP data (Columns: ID, IP Range, CountryID)
CREATE TABLE GeoIPCache (
	ID INT,
	IPRange VARCHAR(50), 
	CountryID INT,
	FOREIGN KEY (CountryID) REFERENCES Countries(ID),
	PRIMARY KEY (ID)
) ENGINE=MEMORY;

-- Create a table for storing product descriptions for different countries (Columns: ID, CountryID, ProductID, Description )
CREATE TABLE ProductDescription (
	ID INT,
    CountryID INT, 
    FOREIGN KEY (CountryID) REFERENCES Countries(ID),
    ProductID INT, 
    Description VARCHAR(100), 
	PRIMARY KEY (ID)
) ENGINE=MyISAM;

-- Create a table for storing logs. For now we don't need to save them, but we need to implement functionality (Columns: ID, Time, LogRecord)
CREATE TABLE Logs (
	ID INT,
	Timestamp TIMESTAMP, 
	Message VARCHAR(100),
	PRIMARY KEY (ID)
) ENGINE=BLACKHOLE;

-- Create a table for storing reporting data, which will be send to a separate application in the CSV format for analytics purposes (Columns:  Date, ProductName, Orders)
CREATE TABLE ProductReporting (
    Date DATE NOT NULL, 
	ProductName VARCHAR(50) NOT NULL, 
	Orders VARCHAR(50) NOT NULL
) ENGINE=CSV;
