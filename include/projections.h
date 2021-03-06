#ifndef PROJECTIONS_H
#define PROJECTIONS_H

#include <utility>
#include <vector>

#include <QStringList>
#include <QSqlDatabase>

class Projections
{
public:
  Projections();

  static void editWindowOpened();
  static void editWindowClosed();
  static bool editingAllowed();

  static void updateAll(const QSqlDatabase & db);
  static void updateGroups(const QSqlDatabase & db);
  static void updateStatuses(const QSqlDatabase & db);
  static void updateDepartments(const QSqlDatabase & db);
  static void updateDisciplines(const QSqlDatabase & db);

  static QStringList getGroupsList();
  static QStringList getStudentStatusesList();
  static QStringList getTeacherStatusesList();
  static QStringList getDepartmentsList();
  static QStringList getDisciplinesList();

  static int getGroupId(int index);
  static int getStudentStatusId(int index);
  static int getTeacherStatusId(int index);
  static int getDepartmentsId(int index);
  static int getDisciplinesId(int index);

  static void load(std::vector<int> & ids, QStringList & list,
                   QString queryStr,
                   const QSqlDatabase & db);

private:
  static std::vector<int> groupsIds;
  static std::vector<int> studentStatusesIds;
  static std::vector<int> teacherStatusesIds;
  static std::vector<int> departmentsIds;
  static std::vector<int> disciplinesIds;

  static QStringList groupsList;
  static QStringList studentStatusesList;
  static QStringList teacherStatusesList;
  static QStringList departmentsList;
  static QStringList disciplinesList;

  static int editWindows;
};

#endif // PROJECTIONS_H
