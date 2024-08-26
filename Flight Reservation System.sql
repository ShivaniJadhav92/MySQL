-- create database for Flight reservation system
CREATE DATABASE frs;

-- use the created database
USE frs;
-- Table for Users
CREATE TABLE Users (
    U_ID INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- Table for Notifications
CREATE TABLE Notifications (
    N_ID INT PRIMARY KEY,
    U_ID INT,
    message TEXT,
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID)
);

-- Table for Bookings
CREATE TABLE Bookings (
    B_ID INT PRIMARY KEY,
    U_ID INT,
    S_ID INT,
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID),
    FOREIGN KEY (S_ID) REFERENCES Services(S_ID)
);

-- Table for Cancellations
CREATE TABLE Cancellations (
    C_ID INT PRIMARY KEY,
    B_ID INT,
    Refund_Amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (B_ID) REFERENCES Bookings(B_ID)
);

-- Table for Services
CREATE TABLE Services (
    S_ID INT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10, 2),
    description TEXT
);

-- Table for Locations
CREATE TABLE Locations (
    L_ID INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(100),
    address VARCHAR(255)
);

-- Table for Payments
CREATE TABLE Payments (
    P_ID INT PRIMARY KEY,
    B_ID INT,
    amount DECIMAL(10, 2),
    method VARCHAR(50),
    date DATE,
    FOREIGN KEY (B_ID) REFERENCES Bookings(B_ID)
);

-- Table for Reviews
CREATE TABLE Reviews (
    R_ID INT PRIMARY KEY,
    U_ID INT,
    S_ID INT,
    rating INT,
    comment TEXT,
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID),
    FOREIGN KEY (S_ID) REFERENCES Services(S_ID)
);

-- Table for Invoices
CREATE TABLE Invoices (
    I_ID INT PRIMARY KEY,
    U_ID INT,
    B_ID INT,
    amount DECIMAL(10, 2),
    date DATE,
    FOREIGN KEY (U_ID) REFERENCES Users(U_ID),
    FOREIGN KEY (B_ID) REFERENCES Bookings(B_ID)
);

-- Insert data into Users table
INSERT INTO Users (U_ID, name, email, phone) VALUES 
(1, 'Alice Smith', 'alice.smith@example.com', '123-456-7890'),
(2, 'Bob Johnson', 'bob.johnson@example.com', '234-567-8901'),
(3, 'Charlie Davis', 'charlie.davis@example.com', '345-678-9012'),
(4, 'Diana King', 'diana.king@example.com', '456-789-0123'),
(5, 'Ethan Green', 'ethan.green@example.com', '567-890-1234');

-- Insert data into Notifications table
INSERT INTO Notifications (N_ID, U_ID, message) VALUES 
(1, 1, 'Your flight has been booked successfully.'),
(2, 2, 'Your flight has been cancelled.'),
(3, 3, 'Your payment has been received.'),
(4, 4, 'Your flight details have been updated.'),
(5, 5, 'Your invoice has been generated.');

-- Insert data into Services table
INSERT INTO Services (S_ID, name, price, description) VALUES 
(1, 'Flight from NY to LA', 299.99, 'Direct flight from New York to Los Angeles'),
(2, 'Flight from LA to Chicago', 199.99, 'Direct flight from Los Angeles to Chicago'),
(3, 'Flight from Chicago to Miami', 149.99, 'Direct flight from Chicago to Miami'),
(4, 'Flight from Miami to Houston', 179.99, 'Direct flight from Miami to Houston'),
(5, 'Flight from Houston to NY', 249.99, 'Direct flight from Houston to New York');

-- Insert data into Bookings table
INSERT INTO Bookings (B_ID, U_ID, S_ID) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- Insert data into Cancellations table
INSERT INTO Cancellations (C_ID, B_ID, Refund_Amount, date) VALUES 
(1, 2, 199.99, '2024-08-15');

-- Insert data into Payments table
INSERT INTO Payments (P_ID, B_ID, amount, method, date) VALUES 
(1, 1, 299.99, 'Credit Card', '2024-08-10'),
(2, 3, 149.99, 'Debit Card', '2024-08-11'),
(3, 4, 179.99, 'PayPal', '2024-08-12'),
(4, 5, 249.99, 'Credit Card', '2024-08-13');

-- Insert data into Reviews table
INSERT INTO Reviews (R_ID, U_ID, S_ID, rating, comment) VALUES 
(1, 1, 1, 5, 'Excellent flight! Very comfortable.'),
(2, 3, 3, 4, 'Good experience, but the flight was delayed.'),
(3, 5, 5, 3, 'Average service, not too impressed.');

-- Insert data into Invoices table
INSERT INTO Invoices (I_ID, U_ID, B_ID, amount, date) VALUES 
(1, 1, 1, 299.99, '2024-08-10'),
(2, 3, 3, 149.99, '2024-08-11'),
(3, 4, 4, 179.99, '2024-08-12'),
(4, 5, 5, 249.99, '2024-08-13');
