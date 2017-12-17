#ifndef TEACHERMAINWINDOW_H
#define TEACHERMAINWINDOW_H

#include <QWidget>
#include <QSqlDatabase>

#include <memory>
#include <vector>

namespace Ui {
  class TeacherMainWindow;
}

class TeacherMainWindow : public QWidget
{
  Q_OBJECT

public:
  explicit TeacherMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~TeacherMainWindow();

private slots:
  void on_tchComBoxDep_currentIndexChanged(int index);

  void on_tchComBoxName_currentIndexChanged(int index);

  void on_examsComBoxGroup_currentIndexChanged(int index);

private:
  Ui::TeacherMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  std::vector<int> teachersIds;
  std::vector<int> groupsIds;

  std::vector<int> examsStudentsIds;
  std::vector<int> attStudentsIds;

  int selectedDep = -1;
  int selectedDiscipline = -1;

  bool firstSelection = true;

  void loadGroups();
  QStringList loadStudentsList(int groupId, std::vector<int> ids);
  void loadSubject();
};

#endif // TEACHERMAINWINDOW_H
