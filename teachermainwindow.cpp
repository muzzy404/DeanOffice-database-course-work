#include "teachermainwindow.h"
#include "ui_teachermainwindow.h"

#include "projections.h"

TeacherMainWindow::TeacherMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::TeacherMainWindow),
  db(database)
{
  ui->setupUi(this);

  Projections::updateAll(*db);

  ui->tchComBoxDep->addItems(Projections::getDepartmentsList());
}

TeacherMainWindow::~TeacherMainWindow()
{
  delete ui;
}
