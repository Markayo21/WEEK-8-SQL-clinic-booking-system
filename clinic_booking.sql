-- Create the database
CREATE DATABASE ClinicBookingSystem;

-- Select the database to use
USE ClinicBookingSystem;

-- Table: Departments
CREATE TABLE Departments (
    DepartmentID INT AUTO_INCREMENT PRIMARY KEY,
    DepartmentName VARCHAR(100) NOT NULL UNIQUE
);

-- Table: Doctors
CREATE TABLE Doctors (
    DoctorID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Phone VARCHAR(15),
    Specialty VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

-- Table: Patients
CREATE TABLE Patients (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Gender ENUM('Male', 'Female', 'Other')
);

-- Table: Appointments
CREATE TABLE Appointments (
    AppointmentID INT AUTO_INCREMENT PRIMARY KEY,
    PatientID INT NOT NULL,
    DoctorID INT NOT NULL,
    AppointmentDate DATETIME NOT NULL,
    Reason TEXT,
    Status ENUM('Scheduled', 'Completed', 'Cancelled') DEFAULT 'Scheduled',
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

-- Insert into Departments
INSERT INTO Departments (DepartmentName) VALUES 
('Cardiology'),
('Dermatology'),
('Pediatrics'),
('Orthopedics');

-- Insert into Doctors
INSERT INTO Doctors (FullName, Email, Phone, Specialty, DepartmentID) VALUES 
('Dr. Alice Mwangi', 'alice.mwangi@example.com', '0712345678', 'Cardiologist', 1),
('Dr. John Otieno', 'john.otieno@example.com', '0723456789', 'Dermatologist', 2),
('Dr. Mercy Wambui', 'mercy.wambui@example.com', '0734567890', 'Pediatrician', 3),
('Dr. Kevin Kimani', 'kevin.kimani@example.com', '0745678901', 'Orthopedic Surgeon', 4);

-- Insert into Patients
INSERT INTO Patients (FullName, Email, Phone, DateOfBirth, Gender) VALUES 
('Mark Iraya', 'mark.iraya@example.com', '0798765432', '1998-06-10', 'Male'),
('Jane Akinyi', 'jane.akinyi@example.com', '0787654321', '2002-09-20', 'Female'),
('Peter Mutua', 'peter.mutua@example.com', '0776543210', '1985-01-15', 'Male'),
('Lilian Njeri', 'lilian.njeri@example.com', '0765432109', '1993-12-05', 'Female');

-- Insert into Appointments
INSERT INTO Appointments (PatientID, DoctorID, AppointmentDate, Reason, Status) VALUES 
(1, 1, '2025-05-20 09:00:00', 'Routine heart check-up', 'Scheduled'),
(2, 2, '2025-05-21 10:30:00', 'Skin rash consultation', 'Scheduled'),
(3, 3, '2025-05-22 14:00:00', 'Child fever follow-up', 'Scheduled'),
(4, 4, '2025-05-23 08:00:00', 'Knee pain and mobility issues', 'Scheduled');






