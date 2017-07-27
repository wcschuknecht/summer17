#1 HNL

SELECT 
dest AS Destination,
distance
FROM flights
ORDER BY distance DESC
LIMIT 10;

#2 a) There are 1, 2, 3, 4 different engine counts
#  b) 4 engine with max seats is 747-451, 3 engine with max seats is A330-223, 
#     2 engine with max seats is 777-222, 1 engine with max seats is Otter DHC-3

SELECT * FROM planes;

SELECT
DISTINCT(engines)
FROM planes
ORDER BY engines DESC;

SELECT 
engines,
seats,
model
FROM planes
GROUP BY engines, model
ORDER BY engines DESC, seats DESC;

SELECT engines,
model,
MAX(seats) AS 'Max Seats'
FROM planes
GROUP BY engines;

SELECT
DISTINCT
engines AS 'Engine Type',
model AS 'Airplane Model',
seats AS 'Max Number of Seats'
FROM planes
WHERE engines = '2'
ORDER BY seats DESC;

#3 336,776 flights

SELECT 
COUNT(*) AS 'Total Number of Flights'
FROM flights;

#4 

SELECT
carrier,
COUNT(flight)
FROM flights
GROUP BY carrier;

#5 Same as above plus ORDER BY clause

SELECT
carrier,
COUNT(flight)
FROM flights
GROUP BY carrier
ORDER BY COUNT(flight) DESC;

#6 Same as above plus LIMIT clause

SELECT
carrier,
COUNT(flight)
FROM flights
GROUP BY carrier
ORDER BY COUNT(flight) DESC
LIMIT 5;

#7 Same as above plus WHERE clause

SELECT
carrier,
COUNT(flight),
FROM flights
WHERE distance >= 1000
GROUP BY carrier
ORDER BY COUNT(flight) DESC
LIMIT 5;

#8 What are the top 5 airline by flights originating from LGA?

SELECT
carrier AS Airline,
origin AS Departure,
COUNT(origin) AS '# of flights'
FROM flights
WHERE origin IN ('LGA')
GROUP BY carrier
ORDER BY COUNT(origin) DESC
LIMIT 5;