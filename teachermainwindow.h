#ifndef TEACHERMAINWINDOW_H
#define TEACHERMAINWINDOW_H

#include <QWidget>
#include <QSqlDatabase>
#include <QSqlQueryModel>

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

  void on_examsBtnAdd_clicked();

  void on_reportBtnReport_clicked();

  void on_reportBtnGroupList_clicked();

  void on_attBntAttestations_clicked();

private:
  Ui::TeacherMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  std::vector<int> teachersIds;
  std::vector<int> groupsIds;

  std::vector<int> studentsIds;
  std::vector<int> semIds;

  int selectedDep        = -1;
  int selectedDiscipline = -1;
  int selectedSubject    = -1;

  bool firstSelection = true;

  std::unique_ptr<QSqlQueryModel> model = nullptr;

  void loadGroups();
  void loadSubject();
  void loadSemesters();
  QStringList loadStudentsList(int groupId, std::vector<int> & ids);

  void unlockEdits(bool mode);

  void setFioHeaders();

  void setDataForInsert(QString & student,
                        QString & subject,
                        QString & sem);
};

#endif // TEACHERMAINWINDOW_H
