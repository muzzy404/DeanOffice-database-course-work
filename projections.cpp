#include "projections.h"

#include <QSqlQuery>
#include <QVariant>

std::vector<int> Projections::groupsIds;
std::vector<int> Projections::studentStatusesIds;
std::vector<int> Projections::teacherStatusesIds;
std::vector<int> Projections::departmentsIds;
std::vector<int> Projections::disciplinesIds;

QStringList Projections::groupsList;
QStringList Projections::studentStatusesList;
QStringList Projections::teacherStatusesList;
QStringList Projections::departmentsList;
QStringList Projections::disciplinesList;

int Projections::editWindows = 0;

void Projections::editWindowOpened() { ++editWindows; }
void Projections::editWindowClosed() { --editWindows; }
bool Projections::editingAllowed() { return ((editWindows == 0) ? true : false); }

void Projections::updateAll(const QSqlDatabase & db)
{
  updateGroups(db);
  updateStatuses(db);
  updateDepartments(db);
  updateDisciplines(db);
}

//----------------------------------------------------------
void Projections::updateGroups(const QSqlDatabase & db)
{
  QString query("SELECT [id], [number] FROM Groups");
  load(groupsIds, groupsList, query, db);
}

void Projections::updateStatuses(const QSqlDatabase & db) {
  QString queryStudents("SELECT [id], [statusStr] FROM Statuses WHERE entity = 'student'");
  QString queryTeachers("SELECT [id], [statusStr] FROM Statuses WHERE entity = 'teacher'");

  load(studentStatusesIds, studentStatusesList, queryStudents, db);
  load(teacherStatusesIds, teacherStatusesList, queryTeachers, db);
}

void Projections::updateDepartments(const QSqlDatabase & db)
{
  QString query("SELECT id, name FROM Departments WHERE active = 'TRUE'");
  load(departmentsIds, departmentsList, query, db);
}

void Projections::updateDisciplines(const QSqlDatabase &db)
{
  QString query("SELECT id, name FROM Disciplines");
  load(disciplinesIds, disciplinesList, query, db);
}

void Projections::load(std::vector<int> & ids, QStringList & list,
                       QString queryStr,
                       const QSqlDatabase & db)
{
  ids.clear();
  list.clear();

  QSqlQuery query(queryStr, db);
  while(query.next()) {
    int id = query.value(0).toInt();
    QString string = query.value(1).toString();

    ids.push_back(id);
    list.push_back(string);
  }
}
//----------------------------------------------------------

QStringList Projections::getGroupsList()
{
  return groupsList;
}

QStringList Projections::getStudentStatusesList()
{
  return studentStatusesList;
}

QStringList Projections::getTeacherStatusesList()
{
  return teacherStatusesList;
}

QStringList Projections::getDepartmentsList()
{
  return departmentsList;
}

QStringList Projections::getDisciplinesList()
{
  return disciplinesList;
}
//----------------------------------------------------------

int Projections::getGroupId(int index)
{
  return groupsIds.at(index);
}
