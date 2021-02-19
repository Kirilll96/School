USE master;

IF DB_ID ('SCHOOL') IS NULL
	CREATE DATABASE SCHOOL
ELSE
	PRINT 'БД SCHOOL существует';
GO

USE SCHOOL;
GO

CREATE TABLE Class
(ClassID INT NOT NULL,
ClassNumber NVARCHAR(5) NOT NULL,
PRIMARY KEY (ClassID))

SELECT * FROM Class

CREATE TABLE Discipline
(DisciplineID INT NOT NULL,
Discipline NVARCHAR(20) NOT NULL,
PRIMARY KEY (DisciplineID),
UNIQUE (Discipline))

SELECT * FROM Discipline

CREATE TABLE Students
(StudentID INT NOT NULL,
LastName NVARCHAR(20) NOT NULL,
FirstName NVARCHAR(10) NOT NULL,
MiddleName NVARCHAR(20) NOT NULL,
ClassID INT NOT NULL,
PRIMARY KEY (StudentID),
FOREIGN KEY(ClassID) REFERENCES Class(ClassID))

SELECT * FROM Students

CREATE TABLE Teachers
(TeacherID INT NOT NULL,
LastName NVARCHAR(20) NOT NULL,
FirstName NVARCHAR(10) NOT NULL,
MiddleName NVARCHAR(20) NOT NULL,
ClassID INT NOT NULL,
PRIMARY KEY (TeacherID),
FOREIGN KEY(ClassID) REFERENCES Class(ClassID))

SELECT * FROM Teachers

CREATE TABLE AcademicPlan
(PlanID INT NOT NULL,
DisciplineID INT NOT NULL,
TeacherID INT NOT NULL,
PRIMARY KEY (PlanID),
FOREIGN KEY(DisciplineID) REFERENCES Discipline(DisciplineID),
FOREIGN KEY(TeacherID) REFERENCES Teachers(TeacherID))

SELECT * FROM AcademicPlan

CREATE TABLE AcademicPerfomance
(AcademicPerfomanceID INT NOT NULL,
StudentID INT NOT NULL,
DisciplineID INT NOT NULL,
Evaluation INT NOT NULL,
PRIMARY KEY (AcademicPerfomanceID),
FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
FOREIGN KEY(DisciplineID) REFERENCES Discipline(DisciplineID))

SELECT * FROM AcademicPerfomance

INSERT INTO Class(ClassID, ClassNumber)
VALUES(1, N'10-А');
INSERT INTO Class(ClassID, ClassNumber)
VALUES(2, N'11-Б');
INSERT INTO Class(ClassID, ClassNumber)
VALUES(3, N'9-А');
INSERT INTO Class(ClassID, ClassNumber)
VALUES(4, N'9-Б');

INSERT INTO Discipline(DisciplineID, Discipline)
VALUES(1, N'Математика');
INSERT INTO Discipline(DisciplineID, Discipline)
VALUES(2, N'Русский язык');
INSERT INTO Discipline(DisciplineID, Discipline)
VALUES(3, N'Физика');
INSERT INTO Discipline(DisciplineID, Discipline)
VALUES(4, N'Литература');
INSERT INTO Discipline(DisciplineID, Discipline)
VALUES(5, N'Химия');

SELECT * FROM Discipline

INSERT INTO Students(StudentID, LastName, FirstName, MiddleName, ClassID)
VALUES(1, N'Башкатова', N'Анна', N'Николаевна', 4);
INSERT INTO Students(StudentID, LastName, FirstName, MiddleName, ClassID)
VALUES(2, N'Дворников', N'Кирилл', N'Генадьевич', 2);
INSERT INTO Students(StudentID, LastName, FirstName, MiddleName, ClassID)
VALUES(3, N'Холод', N'Мария', N'Вячеславовна', 1);
INSERT INTO Students(StudentID, LastName, FirstName, MiddleName, ClassID)
VALUES(4, N'Чижова', N'Полина', N'Сергеевна', 3);

INSERT INTO Teachers(TeacherID, LastName, FirstName, MiddleName, ClassID)
VALUES(1, N'Зайцева', N'Мария', N'Алексеевна', 4);
INSERT INTO Teachers(TeacherID, LastName, FirstName, MiddleName, ClassID)
VALUES(2, N'Котов', N'Виктор', N'Владимирович', 3);
INSERT INTO Teachers(TeacherID, LastName, FirstName, MiddleName, ClassID)
VALUES(3, N'Рыбкина', N'Татьяна', N'Павловна', 2);
INSERT INTO Teachers(TeacherID, LastName, FirstName, MiddleName, ClassID)
VALUES(4, N'Щукина', N'Марина', N'Александровна', 1);

INSERT INTO AcademicPlan(PlanID, DisciplineID, TeacherID)
VALUES(1, 1, 4);
INSERT INTO AcademicPlan(PlanID, DisciplineID, TeacherID)
VALUES(2, 2,1);
INSERT INTO AcademicPlan(PlanID, DisciplineID, TeacherID)
VALUES(3, 3, 2);
INSERT INTO AcademicPlan(PlanID, DisciplineID, TeacherID)
VALUES(4, 4, 3);

INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(1, 1, 1, 5);
INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(2, 1, 2, 4);
INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(3, 2, 3, 5);
INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(4, 2, 4, 5);
INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(5, 3, 2, 4);
INSERT INTO AcademicPerfomance(AcademicPerfomanceID, StudentID, DisciplineID, Evaluation)
VALUES(6, 4, 4, 3);

