USE DeanOffice
GO

CREATE PROCEDURE deanOfficeTestProc
AS
	SELECT lastName, firstName, patronymic, Groups.number
	FROM Students, Groups
	WHERE Students.groupNumber = Groups.id
GO

CREATE PROCEDURE getGroupList
	@GroupId int
AS
	SELECT lastName, firstName, patronymic, Groups.number
	FROM Students, Groups
	WHERE Students.groupNumber = Groups.id AND Groups.id = @GroupId
GO

EXEC getGroupList @GroupId = 1
EXEC deanOfficeTestProc

CREATE PROCEDURE addStudent
	@lastname   varchar(20),
	@firstname  varchar(20),
	@patronymic varchar(20),
	@dob date,
	@group  int,
	@status int
AS
	INSERT INTO Students VALUES
		(@lastname, @firstname, @patronymic, @dob, @group, @status)
GO

CREATE PROCEDURE addTeacher
	@lastname   varchar(20),
	@firstname  varchar(20),
	@patronymic varchar(20),
	@discipline int,
	@department int,
	@status int
AS
	INSERT INTO Teachers VALUES
		(@lastname, @firstname, @patronymic, @discipline, @department, @status)
GO

CREATE PROCEDURE addDiscipline
	@name varchar(50),
	@lectureHours  tinyint,
	@practiceHours tinyint
AS
	INSERT INTO Disciplines VALUES
		(@name, @lectureHours, @practiceHours)
GO