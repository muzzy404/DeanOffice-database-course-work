USE DeanOffice
GO

SELECT Disciplines.name
FROM Subjects, Disciplines
WHERE discipline = Disciplines.id AND
	department = 1 AND sem = 1 AND
	exam = 'TRUE'

SELECT Departments.name
FROM Departments
WHERE id = 1

-- кол-во хорошо сданных экзаменов
SELECT COUNT(examMark)
FROM ExamsCredits
	WHERE student = 1 AND examMark > 3
	GROUP BY student

-- кол-во полученных запросов
SELECT COUNT(passMark)
FROM ExamsCredits
	WHERE student = 2 AND passMark = 'TRUE'
	GROUP BY student

-- кол-во экзов, кторые надо сдать
SELECT COUNT(exam)
FROM Subjects
	WHERE department = 1 AND sem = 1 AND exam = 'TRUE'
	GROUP BY (department)

-- кол-во зачетов, которые надо сдать
SELECT COUNT(pass)
FROM Subjects
	WHERE department = 1 AND sem = 1 AND pass = 'TRUE'
	GROUP BY (department)

SELECT DISTINCT lastName, firstName, patronymic
	FROM Students, Groups, ExamsCredits
	WHERE Students.id = ExamsCredits.student AND
		Students.groupNumber = Groups.id AND
		Groups.department = 1 AND -- подставить из spin box
		Groups.semNum = 1         -- подставить из spin box
	AND
	(SELECT COUNT(examMark)
		FROM ExamsCredits
		WHERE student = Students.id AND
			examMark > 3
			GROUP BY student) =
	(SELECT COUNT(exam)
		FROM Subjects
		WHERE Subjects.department = Groups.department AND
			Subjects.sem = Groups.semNum
			AND exam = 'TRUE' GROUP BY (department))
	AND
	(SELECT COUNT(passMark)
		FROM ExamsCredits
		WHERE student = Students.id AND
			passMark = 'TRUE'
			GROUP BY student) =
	(SELECT COUNT(pass)
		FROM Subjects
		WHERE Subjects.department = Groups.department AND
		Subjects.sem = Groups.semNum
		AND pass = 'TRUE' GROUP BY (department))

--INSERT INTO Students (lastName, firstName, patronymic, dob, groupNumber, studentStatus)
--INSERT INTO Teachers (lastName, firstName, patronymic, department, discipline, teacherStatus)
--INSERT INTO Subjects (discipline, department, sem, pass, exam, active)
--INSERT INTO Disciplines (name, lectureHours, practiceHours)
--INSERT INTO Semesters (beginDate, endDate)

SELECT id, lastName, firstName, patronymic
FROM Teachers WHERE department = 1

SELECT Disciplines.name FROM Disciplines, Teachers
WHERE Disciplines.id = Teachers.discipline AND Teachers.id = 5

SELECT id, number FROM Groups WHERE department = 1

SELECT id, lastName, firstName, patronymic FROM Students WHERE groupNumber = 1

SELECT exam, pass, id FROM Subjects WHERE department = 1 AND discipline = 1 AND sem = 1

SELECT Disciplines.name
FROM Disciplines
WHERE Disciplines.id = 1

SELECT semNum
FROM Groups WHERE id = 1

SELECT Groups.semNum FROM Groups WHERE Groups.id = 1

SELECT Groups.number
FROM Groups
WHERE Groups.department = 1

SELECT id, beginDate, endDate FROM Semesters

SELECT Students.lastName, Students.firstName, Students.patronymic,
	Groups.semNum, passMark, examMark, Teachers.lastName
FROM Students, Teachers, ExamsCredits, Groups
WHERE ExamsCredits.student = Students.id AND
	Students.groupNumber = Groups.id AND
	ExamsCredits.teacher = Teachers.id AND
	Groups.id = 1 AND        -- из combo box
	ExamsCredits.sem = 1 AND -- из spin box
	ExamsCredits.subj = 1    -- выбранный предмет

SELECT lastName, firstName, patronymic, Groups.semNum, num, tests, attendance
FROM Students, Attestation, Groups
WHERE Attestation.student = Students.id AND Students.groupNumber = Groups.id AND
	Students.id = 1 AND
	Attestation.sem = 1

INSERT INTO ExamsCredits (student, subj, sem, examMark, passMark, teacher)
	VALUES (4, 1, 1, 5, 'TRUE', 1)
GO

--INSERT INTO Attestation (student, subj, sem, num, tests, attendance)
