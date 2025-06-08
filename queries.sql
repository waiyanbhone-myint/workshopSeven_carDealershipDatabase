-- 1. Get all dealerships
SELECT * FROM dealerships;

-- 2. Find all vehicles for a specific dealership (e.g., dealership_id = 1)
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.VIN = i.VIN
WHERE i.dealership_id = 1;

-- 3. Find a car by VIN
SELECT * FROM vehicles
WHERE VIN = '1HGCM82633A123456';

-- 4. Find the dealership where a car is located by VIN
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
WHERE i.VIN = '1HGCM82633A123456';

-- 5. Find all dealerships that have a specific car type (e.g., Red Ford Mustang)
SELECT DISTINCT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealership_id
JOIN vehicles v ON i.VIN = v.VIN
WHERE v.make = 'Ford' AND v.model = 'Mustang' AND v.color = 'Red';

-- 6. Get all sales info for a specific dealership and date range
SELECT * FROM sales_contracts
WHERE dealership_id = 1
AND sale_date BETWEEN '2024-01-01' AND '2024-12-31';

-- 7. (Bonus) Top 3 most expensive unsold cars
SELECT * FROM vehicles
WHERE sold = FALSE
ORDER BY price DESC
LIMIT 3;
