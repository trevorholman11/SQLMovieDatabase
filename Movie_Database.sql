CREATE TABLE Distributor (
    DistributorID INT PRIMARY KEY,
    Name VARCHAR2(30),
    Catalog VARCHAR2(30)
);

CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR2(30),
    Address VARCHAR2(30),
    Telephone VARCHAR2(30)
);

CREATE TABLE Actor (
    ActorID INT PRIMARY KEY,
    Name VARCHAR2(30)
);

CREATE TABLE Director (
    DirectorID INT PRIMARY KEY,
    Name VARCHAR2(30)
);

CREATE TABLE Award (
    AwardID INT PRIMARY KEY,
    Name VARCHAR2(30)
);

CREATE TABLE Movie (
    MovieID INT PRIMARY KEY,
    Title VARCHAR2(30),
    ReleaseYear INT,
    RunningLength INTERVAL DAY TO SECOND,
    Type VARCHAR2(30),
    Rating VARCHAR2(30),
    Format VARCHAR2(30),
    DistributorID INT,
    CatalogID VARCHAR2(30),
    CONSTRAINT fk_distributor
        FOREIGN KEY (DistributorID) REFERENCES Distributor(DistributorID)
);

CREATE TABLE Copy (
    CopyID INT PRIMARY KEY,
    MovieID INT,
    Format VARCHAR2(30),
    CaseID VARCHAR2(30),
    CONSTRAINT fk_movie
        FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE Rental (
    TransactionID INT PRIMARY KEY,
    CopyID INT,
    CustomerID INT,
    RentalDate DATE,
    ReturnDate DATE,
    LateFee FLOAT,
    DamageFee FLOAT,
    RewindFee FLOAT,
    Tax FLOAT,
    CONSTRAINT fk_copy
        FOREIGN KEY (CopyID) REFERENCES Copy(CopyID),
    CONSTRAINT fk_customer
        FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE MovieActor (
    ActorID INT,
    MovieID INT,
    CONSTRAINT fk_actor
        FOREIGN KEY (ActorID) REFERENCES Actor(ActorID),
    CONSTRAINT fk_movie_actor
        FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE MovieDirector (
    DirectorID INT,
    MovieID INT,
    CONSTRAINT fk_director
        FOREIGN KEY (DirectorID) REFERENCES Director(DirectorID),
    CONSTRAINT fk_movie_director
        FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);

CREATE TABLE MovieAward (
    AwardID INT,
    MovieID INT,
    CONSTRAINT fk_award
        FOREIGN KEY (AwardID) REFERENCES Award(AwardID),
    CONSTRAINT fk_movie_award
        FOREIGN KEY (MovieID) REFERENCES Movie(MovieID)
);


-- Populate Distributor table
INSERT INTO Distributor (DistributorID, Name, Catalog) VALUES (1, 'Alex Ruso', 'Catalog1');
INSERT INTO Distributor (DistributorID, Name, Catalog) VALUES (2, 'Victor Black', 'Catalog2');

-- Populate Movie table
INSERT INTO Movie (MovieID, Title, ReleaseYear, RunningLength, Type, Rating, Format, DistributorID, CatalogID)
VALUES (1, 'The God Father', 1972, TO_DSINTERVAL('0 02:55:00'), 'Crime/Mystery', 'R', 'DVD', 1, 'ABC123');

INSERT INTO Movie (MovieID, Title, ReleaseYear, RunningLength, Type, Rating, Format, DistributorID, CatalogID) 
VALUES (2, 'Scarface', 1983, TO_DSINTERVAL('0 02:50:00'), 'Crime/Thriller', 'R', 'Video', 2, 'XYZ456');

-- Populate Copy table
INSERT INTO Copy (CopyID, MovieID, Format, CaseID)
VALUES (1, 1, 'DVD', 'Case1');

INSERT INTO Copy (CopyID, MovieID, Format, CaseID)
VALUES (2, 2, 'Video', 'Case2');

INSERT INTO Copy (CopyID, MovieID, Format, CaseID)
VALUES (3, 3, 'Video', 'Case3');

-- Populate Customer table
INSERT INTO Customer (CustomerID, Name, Address, Telephone) 
VALUES (1, 'Lina Trei', '1024 Ocean Avenue, CA 
760044', '123-456-7890');

INSERT INTO Customer (CustomerID, Name, Address, Telephone) 
VALUES (2, 'George Johnson', '123 State Street, CA 
760044', '987-654-3210');

-- Populate Rental table
INSERT INTO Rental (TransactionID, CopyID, CustomerID, RentalDate, ReturnDate, LateFee, DamageFee, RewindFee, Tax) 
VALUES (1, 1, 1, TO_DATE('2022-02-18', 'YYYY-MM-DD'), TO_DATE('2022-02-25', 'YYYY-MM-DD'), 2.50, 0, 1.25, 0.75);
INSERT INTO Rental (TransactionID, CopyID, CustomerID, RentalDate, ReturnDate, LateFee, DamageFee, RewindFee, Tax)
VALUES (2, 2, 2, TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 3.00, 0, 1.25, 0.75);
INSERT INTO Rental (TransactionID, CopyID, CustomerID, RentalDate, ReturnDate, LateFee, DamageFee, RewindFee, Tax)
VALUES (3, 1, 2, TO_DATE('2021-03-12', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 13.50, 0, 1.25, 0.75);


-- Populate Actor table
INSERT INTO Actor (ActorID, Name) VALUES (1, 'Brad Pit');
INSERT INTO Actor (ActorID, Name) VALUES (2, 'Christoph Waltz');

-- Populate Director table
INSERT INTO Director (DirectorID, Name) VALUES (1, 'Quentin Tarantino');
INSERT INTO Director (DirectorID, Name) VALUES (2, 'Francis Coppola');

-- Populate Award table
INSERT INTO Award (AwardID, Name) VALUES (1, 'Best Actor');
INSERT INTO Award (AwardID, Name) VALUES (2, 'Golden Globe');

-- Populate MovieActor table
INSERT INTO MovieActor (ActorID, MovieID) VALUES (1, 3);
INSERT INTO MovieActor (ActorID, MovieID) VALUES (2, 3);

-- Populate MovieDirector table
INSERT INTO MovieDirector (DirectorID, MovieID) VALUES (1, 3);
INSERT INTO MovieDirector (DirectorID, MovieID) VALUES (2, 1);

-- Populate MovieAward table
INSERT INTO MovieAward (AwardID, MovieID) VALUES (1, 1);
INSERT INTO MovieAward (AwardID, MovieID) VALUES (2, 1);
    
-- Populate Rental table
INSERT INTO Rental (TransactionID, CopyID, CustomerID, RentalDate, ReturnDate, LateFee, DamageFee, RewindFee, Tax) 
VALUES (1, 1, 1, TO_DATE('2022-02-18', 'YYYY-MM-DD'), TO_DATE('2022-02-25', 'YYYY-MM-DD'), 2.50, 0, 1.25, 0.75);
INSERT INTO Rental (TransactionID, CopyID, CustomerID, RentalDate, ReturnDate, LateFee, DamageFee, RewindFee, Tax)
VALUES (2, 2, 2, TO_DATE('2022-02-20', 'YYYY-MM-DD'), TO_DATE('2022-02-28', 'YYYY-MM-DD'), 3.00, 0, 1.25, 0.75);

INSERT INTO Movie (MovieID, Title, ReleaseYear, RunningLength, Type, Rating, Format, DistributorID, CatalogID) 
VALUES (3, 'Inglorius Bastards', 2009, TO_DSINTERVAL('0 02:33:00'), 'War/Adventure', 'R', 'Video', 2, 'BCD789');

SELECT *
FROM Rental
JOIN Copy ON Rental.CopyID = Copy.CopyID
JOIN Movie ON Copy.MovieID = Movie.MovieID
WHERE RentalDate >= SYSDATE - 30
ORDER BY RentalDate;

SELECT *
FROM Distributor
ORDER BY Name;

-- Add State and ZipCode columns to Customer table
ALTER TABLE Customer
ADD CustState VARCHAR2(30);

ALTER TABLE Customer
ADD ZipCode VARCHAR2(10);

--Update customer table to add zipcodes to the table
update customer
set zipcode = 760044
where customerid = 1;

update customer
set zipcode = 760030
where customerid = 2;

SELECT Name, customerid, address ||', '|| custstate || ' '|| zipcode AS FullAddress
FROM Customer
ORDER BY customerid;

-- Before update
SELECT * FROM Customer 
WHERE CustomerID = 1;

-- Update
UPDATE Customer
SET Name = 'Lina Quattro'
WHERE CustomerID = 1;

-- After update
SELECT * FROM Customer WHERE CustomerID = 1;

-- Before delete
SELECT * FROM Customer;

-- Delete a specific customer
DELETE FROM Customer
WHERE CustomerID = 2;

-- After delete
SELECT * FROM Customer;

-- If needed, to undo the deletion
ROLLBACK;




