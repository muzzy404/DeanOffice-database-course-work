#include "teachermainwindow.h"
#include "ui_teachermainwindow.h"

TeacherMainWindow::TeacherMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::TeacherMainWindow),
  db(database)
{
  ui->setupUi(this);
}

TeacherMainWindow::~TeacherMainWindow()
{
  delete ui;
}
