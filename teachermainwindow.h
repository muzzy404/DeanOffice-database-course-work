#ifndef TEACHERMAINWINDOW_H
#define TEACHERMAINWINDOW_H

#include <QWidget>
#include <QSqlDatabase>

#include <memory>

namespace Ui {
  class TeacherMainWindow;
}

class TeacherMainWindow : public QWidget
{
  Q_OBJECT

public:
  explicit TeacherMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~TeacherMainWindow();

private:
  Ui::TeacherMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;
};

#endif // TEACHERMAINWINDOW_H
