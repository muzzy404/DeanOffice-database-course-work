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

private:
  Ui::TeacherMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  std::vector<int> teachersIds;

  bool firstSelection = true;

  void loadIds(std::vector<int> & ids,
               QString queryStr,
               const QSqlDatabase & db);
};

#endif // TEACHERMAINWINDOW_H
