-- loadmovies.sql

DROP TABLE IF EXISTS ridedata;
DROP TABLE IF EXISTS stationlines;

CREATE TABLE ridedata (
	FromDate DATE,
	ToDate	DATE,
	RemoteStationID	CHAR(4),
	Station	VARCHAR(50),
	FullFare INTEGER,
	SeniorCitizen_Disabled INTEGER,
	7DayADAFarecardAccessSystemUnlimited INTEGER,
	30DayADAFarecardAccessSystemUnlimited INTEGER,
	JointRailRoadTicket INTEGER,
	7DayUnlimited INTEGER,
	30DayUnlimited INTEGER,
	14DayReducedFareMediaUnlimited INTEGER,
	1DayUnlimited INTEGER,
	14DayUnlimited INTEGER,
	7DayExpressBusPass INTEGER,
	TransitCheckMetrocard INTEGER,
	LIBSpecialSenior INTEGER,
	RailRoadUnlimitedNoTrade INTEGER,
	TransitCheckMetrocardAnnualMetrocard INTEGER,
	MailandRideEZPassExpress INTEGER,
	MailandRideUnlimited INTEGER,
	Path2Trip INTEGER,
	AirtranFullFare INTEGER,
	Airtran30Day INTEGER,
	Airtran10Trip INTEGER,
	AirtranMonthly INTEGER,
    CONSTRAINT PK_ridedata PRIMARY KEY (FromDate, ToDate, RemoteStationID)
	);
  
LOAD DATA LOCAL INFILE 'C:/Users/Steve Tipton/Documents/CUNY/DATA 607/proj2/ridedata.csv' 
INTO TABLE ridedata 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

CREATE TABLE stationlines (
	Remote CHAR(4),
    Station	VARCHAR(50),
    LineName VARCHAR(20),
    Division CHAR(3),
    CONSTRAINT PK_stationlines PRIMARY KEY (Remote, Station, Division)
	);
  
LOAD DATA LOCAL INFILE 'C:/Users/Steve Tipton/Documents/CUNY/DATA 607/proj2/stationlines.csv' 
INTO TABLE stationlines 
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select * from stationlines;

