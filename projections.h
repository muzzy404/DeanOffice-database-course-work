#ifndef PROJECTIONS_H
#define PROJECTIONS_H

#include <utility>
#include <vector>

#include <QStringList>
#include <QSqlDatabase>

class Projections
{
public:
  typedef std::pair<int, QString> Pair;

  Projections();

  static void updateAll(const QSqlDatabase & db);
  static void updateGroups(const QSqlDatabase & db);
  static void updateStatuses(const QSqlDatabase & db);

  static QStringList getGroupsList();
  static int getGroupId(int index);

  static QStringList getStudentStatuses();
  static int getStudentStatusId(int index);

  static QStringList getTeacherStatuses();
  static int getTeacherStatusId(int index);

private:
  static std::vector<Pair> groups;
  static QStringList groupsList;

  static std::vector<Pair> studentStatuses;
  static QStringList studentStatusesList;

  static std::vector<Pair> teacherStatuses;
  static QStringList teacherStatusesList;
};

#endif // PROJECTIONS_H
