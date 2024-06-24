﻿CREATE DATABASE CodeAcademyAppDB
USE CodeAcademyAppDB
CREATE TABLE GroupTypes(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL
)
INSERT INTO GroupTypes
VALUES ('Programming')
INSERT INTO GroupTypes
VALUES ('Design')
SELECT * FROM GroupTypes
CREATE TABLE Groups(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
	BeginDate DATE DEFAULT GETDATE(), CHECK (BeginDate <= GETDATE()),
	EndDate DATE DEFAULT GETDATE(), CHECK (BeginDate <= EndDate),
	LessonHours INT NOT NULL,
	GroupTypeId INT FOREIGN KEY REFERENCES GroupTypes(Id)
)
INSERT INTO Groups
VALUES('Pb-401', '2024-03-30', '2025-02-01', 400, 1)
INSERT INTO Groups
VALUES('Pf-101', '2024-03-30', '2025-02-01', 400, 2)
SELECT * FROM Groups
SELECT * FROM GroupTypes

CREATE TABLE Topics(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
	LessonHours INT NOT NULL,
	GroupTypeId INT FOREIGN KEY REFERENCES GroupTypes(Id)
)
INSERT INTO Topics
VALUES ('C#', 40, 1)
INSERT INTO Topics
VALUES ('SQL', 40, 1)
INSERT INTO Topics
VALUES ('Photoshop', 50, 2)
INSERT INTO Topics
VALUES ('3D', 50, 2)
SELECT *FROM Topics
SELECT * FROM Groups
SELECT * FROM GroupTypes
CREATE TABLE Students(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Surname NVARCHAR(50) NOT NULL,
	Name NVARCHAR(50) NOT NULL,
	BirthDate DATE NOT NULL,
	PhoneNumber NVARCHAR(20) DEFAULT '+994000000000',
	Email NVARCHAR(70) UNIQUE,
	RegistrationDate DATE NOT NULL,
	GroupsId INT FOREIGN KEY REFERENCES Groups(Id)
)
INSERT INTO Students
VALUES('Quluzade', 'Cavid', '2006-06-10', '+994502890371', 'cavidquluzade@gmail.com', '2024-01-15', 1)
INSERT INTO Students
VALUES('test1', 'test1', '2006-06-10', default, 'test1@gmail.com', '2024-01-15', 1)
INSERT INTO Students
VALUES('test2', 'test2', '2006-06-10', default, 'test2@gmail.com', '2024-01-15', 2)
INSERT INTO	Students
VALUES('test3', 'test3', '2006-06-10', default, 'test3@gmail.com', '2024-01-15', 2)
SELECT * FROM Students
SELECT *FROM Topics
SELECT * FROM Groups
SELECT * FROM GroupTypes
CREATE TABLE ExerciseTypes(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
)
INSERT INTO ExerciseTypes
VALUES('QUIZ')
INSERT INTO ExerciseTypes
VALUES('HOMETASK')
INSERT INTO ExerciseTypes
VALUES('FİNALPROJECT')
SELECT * FROM ExerciseTypes
SELECT * FROM Students
SELECT * FROM Topics
SELECT * FROM Groups
SELECT * FROM GroupTypes
CREATE TABLE Exercises(
	Id INT PRIMARY KEY IDENTITY(1,1),
	Name NVARCHAR(50) NOT NULL,
	Grade DECIMAL(10, 2),
	StudentId INT FOREIGN KEY REFERENCES Students(Id),
	TopicsId INT FOREIGN KEY REFERENCES Topics(Id),
	ExerciseTypeId INT FOREIGN KEY REFERENCES ExerciseTypes(Id)	
)

INSERT INTO Exercises
VALUES('OOP', 94.32, 1, 1, 2)
INSERT INTO Exercises
VALUES('SQL basics', 90.24, 1, 3, 2)
INSERT INTO Exercises
VALUES('Photoshop basics', 78.5, 3, 2, 1)
INSERT INTO Exercises
VALUES('FINAL - 3D', 98.4, 4, 4, 3)
SELECT * FROM Exercises
SELECT * FROM ExerciseTypes
SELECT * FROM Students
SELECT * FROM Topics
SELECT * FROM Groups
SELECT * FROM GroupTypes