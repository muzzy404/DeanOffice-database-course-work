USE master
GO

-- Delete the DeanOffice database if it exists
IF EXISTS(SELECT * from sys.databases WHERE name='DeanOffice')  
BEGIN  
    DROP DATABASE DeanOffice;  
END

-- Create a new database called DeanOffice.  
CREATE DATABASE DeanOffice;

USE DeanOffice
GO

CREATE TABLE Statuses
	(id int PRIMARY KEY IDENTITY(1,1), -- IDENTITY [ (seed , increment) ]  
	 entity    varchar(15) NOT NULL,
	 statusStr varchar(20) NOT NULL,
	 UNIQUE(entity, statusStr))
GO

CREATE TABLE Semesters
	(id int PRIMARY KEY IDENTITY(1,1),
	 beginDate date NOT NULL,
	 endDate   date NOT NULL,
	 UNIQUE(beginDate, endDate))
GO

CREATE TABLE Departments
	(id int PRIMARY KEY IDENTITY(1,1),
	 name varchar(50) NOT NULL,
	 active bit NOT NULL,
	 UNIQUE (name, active))
GO

CREATE TABLE Groups
	(id int PRIMARY KEY IDENTITY(1,1),
	 number char(10) NOT NULL,
	 semNum tinyint  NOT NULL CHECK (semNum >= 1 AND semNum <= 6),
	 sem        int FOREIGN KEY REFERENCES Semesters(id)   NOT NULL,
	 department int FOREIGN KEY REFERENCES Departments(id) NOT NULL,
	 UNIQUE (number, sem))
GO

CREATE TABLE Students
	(id int PRIMARY KEY IDENTITY(1,1),
	 lastName   varchar(20) NOT NULL,
	 firstName  varchar(20) NOT NULL,
	 patronymic varchar(20) NOT NULL,
	 dob date NOT NULL, -- date of birth
	 groupNumber   int FOREIGN KEY REFERENCES Groups(id),
	 studentStatus int FOREIGN KEY REFERENCES Statuses(id) NOT NULL)
GO

CREATE TABLE Disciplines
	(id int PRIMARY KEY IDENTITY(1,1),
	 name varchar(50) NOT NULL,
	 lectureHours  tinyint NOT NULL,
	 practiceHours tinyint NOT NULL,
	 UNIQUE(name))

CREATE TABLE Teachers
	(id int PRIMARY KEY IDENTITY(1,1),
	 lastName   varchar(20) NOT NULL,
	 firstName  varchar(20) NOT NULL,
	 patronymic varchar(20) NOT NULL,
	 discipline    int FOREIGN KEY REFERENCES Disciplines(id),
	 department    int FOREIGN KEY REFERENCES Departments(id),
	 teacherStatus int FOREIGN KEY REFERENCES Statuses(id) NOT NULL)
GO

CREATE TABLE Subjects
	(id int PRIMARY KEY IDENTITY(1,1),
	 discipline int FOREIGN KEY REFERENCES Disciplines(id) NOT NULL,
	 department int FOREIGN KEY REFERENCES Departments(id) NOT NULL,
	 sem    tinyint  NOT NULL CHECK (sem >= 1 AND sem <= 6),
	 exam   bit NOT NULL, -- use like a bool type
	 pass   bit NOT NULL,
	 active bit NOT NULL,
	 UNIQUE(discipline, department, sem))
GO

CREATE TABLE ExamsCredits
	(student int FOREIGN KEY REFERENCES Students(id)  NOT NULL,
	 subj    int FOREIGN KEY REFERENCES Subjects(id)  NOT NULL,
	 sem     int FOREIGN KEY REFERENCES Semesters(id) NOT NULL,
	 examMark tinyint CHECK (examMark >= 2 AND examMark <= 5), -- can be NULL!
	 passMark bit,                                             -- can be NULL!
	 teacher int FOREIGN KEY REFERENCES Teachers(id) NOT NULL,
	 PRIMARY KEY (student, subj, sem))
GO

CREATE TABLE Attestation
	(student int FOREIGN KEY REFERENCES Students(id),
	 subj    int FOREIGN KEY REFERENCES Subjects(id),
	 sem     int FOREIGN KEY REFERENCES Semesters(id),
	 num tinyint NOT NULL,
	 tests      tinyint,
	 attendance tinyint,
	 PRIMARY KEY(student, subj, sem, num))