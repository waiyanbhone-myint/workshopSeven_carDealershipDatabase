-- Drop database if it exit
DROP DATABASE IF EXISTS car_dealership;

-- Create the database
CREATE DATABASE car_dealership;
USE car_dealership;

-- Table 1: dealerships
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(12)
);

-- Table 2: vehicles
CREATE TABLE vehicles (
    VIN VARCHAR(17) PRIMARY KEY,
    make VARCHAR(30),
    model VARCHAR(30),
    year INT,
    color VARCHAR(20),
    price DECIMAL(10, 2),
    sold BOOLEAN DEFAULT FALSE
);

-- Table 3: inventory
CREATE TABLE inventory (
    dealership_id INT,
    VIN VARCHAR(17),
    PRIMARY KEY (dealership_id, VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN)
);

-- Table 4: sales_contracts
CREATE TABLE sales_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    dealership_id INT,
    customer_name VARCHAR(50),
    sale_price DECIMAL(10, 2),
    sale_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

-- Table 5: lease_contracts
CREATE TABLE lease_contracts (
    contract_id INT AUTO_INCREMENT PRIMARY KEY,
    VIN VARCHAR(17),
    dealership_id INT,
    customer_name VARCHAR(50),
    lease_term_months INT,
    monthly_payment DECIMAL(10,2),
    lease_start_date DATE,
    FOREIGN KEY (VIN) REFERENCES vehicles(VIN),
    FOREIGN KEY (dealership_id) REFERENCES dealerships(dealership_id)
);

-- Dealerships data insert
INSERT INTO dealerships (name, address, phone) VALUES
('Auto World', '123 Main St', '123-456-7890'),
('City Motors', '456 Elm St', '987-654-3210');

-- Vehicles
INSERT INTO vehicles (VIN, make, model, year, color, price, sold) VALUES
('1HGCM82633A123456', 'Honda', 'Accord', 2022, 'Blue', 23000.00, FALSE),
('1HGCM82633A654321', 'Ford', 'Mustang', 2021, 'Red', 28000.00, TRUE),
('1HGCM82633A111111', 'Toyota', 'Corolla', 2023, 'White', 20000.00, FALSE);

-- Inventory
INSERT INTO inventory (dealership_id, VIN) VALUES
(1, '1HGCM82633A123456'),
(1, '1HGCM82633A654321'),
(2, '1HGCM82633A111111');

-- Sales Contracts
INSERT INTO sales_contracts (VIN, dealership_id, customer_name, sale_price, sale_date) VALUES
('1HGCM82633A654321', 1, 'John Doe', 27500.00, '2024-12-15');
