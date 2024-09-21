CREATE TABLE City (
    CityID INT PRIMARY KEY,
    Name VARCHAR(100) UNIQUE,
    Pincode INT NOT NULL,
    Remarks VARCHAR(255)
);

CREATE TABLE Village (
    VID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    CityID INT,
    FOREIGN KEY (CityID) REFERENCES City(CityID)
);

INSERT INTO City (CityID, Name, Pincode, Remarks) VALUES
(1, 'Rajkot', 360005, 'Good'),
(2, 'Surat', 335009, 'Very Good'),
(3, 'Baroda', 390001, 'Awesome'),
(4, 'Jamnagar', 361003, 'Smart'),
(5, 'Junagadh', 362229, 'Historic'),
(6, 'Morvi', 363641, 'Ceramic');

INSERT INTO Village (VID, Name, CityID) VALUES
(101, 'Raiya', 1),
(102, 'Madhapar', 1),
(103, 'Dodka', 3),
(104, 'Falla', 4),
(105, 'Bhesan', 5),
(106, 'Dhoraji', 5);

--Part – A: 
--1. Display all the villages of Rajkot city.
select Village.Name from City right join Village
on Village.CityID = City.CityID
where City.CityID = 1

--2. Display city along with their villages & pin code.
select City.Name,Village.Name,City.Pincode 
from City right join Village
on Village.CityID = City.CityID

--3. Display the city having more than one village.
select City.Name
from City left join Village
on Village.CityID = City.CityID
group by City.Name
having count(Village.CityID)>1


--4. Display the city having no village.
select C.Name
from City c left join Village v
on v.CityID = c.CityID
group by c.Name
having COUNT(v.CityID) = 0

--5. Count the total number of villages in each city.
select City.Name,COUNT(Village.CityID)
from City left join Village
on Village.CityID = City.CityID
group by City.Name

--6. Count the number of cities having more than one village.
select COUNT(Name) from City where CITYID in
(select CityID from Village 
WHERE Village.CityID = City.CityID  
group by village.CityID 
having COUNT(village.CityID)>1)

--Create below table with following constraints
--1. Do not allow SPI more than 10

--2. Do not allow Bklog less than 0.
--3. Enter the default value as ‘General’ in branch to all new records IF no other value is specified