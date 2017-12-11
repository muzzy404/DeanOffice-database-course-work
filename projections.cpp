#include "projections.h"

#include <QSqlQuery>
#include <QVariant>

std::vector<Projections::Pair> Projections::groups;
std::vector<Projections::Pair> Projections::studentStatuses;
std::vector<Projections::Pair> Projections::teacherStatuses;

QStringList Projections::groupsList;
QStringList Projections::studentStatusesList;
QStringList Projections::teacherStatusesList;

void Projections::updateAll(const QSqlDatabase & db)
{
  updateGroups(db);
  updateStatuses(db);
}

//----------------------------------------------------------
void Projections::updateGroups(const QSqlDatabase & db)
{
  groups.clear();
  groupsList.clear();

  QSqlQuery query("SELECT [id], [number] FROM Groups", db);

  while(query.next()) {
    int id = query.value(0).toInt();
    QString number = query.value(1).toString();

    groups.push_back(std::make_pair(id, number));
  }
  for(Pair & group : groups) {
    groupsList.push_back(group.second);
  }
}

void Projections::updateStatuses(const QSqlDatabase & db) {
  studentStatuses.clear();
  teacherStatuses.clear();
  studentStatusesList.clear();
  teacherStatusesList.clear();

  {
    QSqlQuery query("SELECT [id], [statusStr] FROM Statuses WHERE entity = 'student'", db);
    while(query.next()) {
      int id = query.value(0).toInt();
      QString status = query.value(1).toString();

      studentStatuses.push_back(std::make_pair(id, status));
    }
    for(Pair & status : studentStatuses) {
      studentStatusesList.push_back(status.second);
    }
  }

  {
    QSqlQuery query("SELECT [id], [statusStr] FROM Statuses WHERE entity = 'teacher'", db);
    while(query.next()) {
      int id = query.value(0).toInt();
      QString status = query.value(1).toString();

      teacherStatuses.push_back(std::make_pair(id, status));
    }
    for(Pair & status : teacherStatuses) {
      teacherStatusesList.push_back(status.second);
    }
  }
}
//----------------------------------------------------------

QStringList Projections::getGroupsList()
{
  return groupsList;
}

QStringList Projections::getStudentStatuses()
{
  return studentStatusesList;
}

QStringList Projections::getTeacherStatuses()
{
  return teacherStatusesList;
}
//----------------------------------------------------------

int Projections::getGroupId(int index)
{
  return groups.at(index).first;
}
