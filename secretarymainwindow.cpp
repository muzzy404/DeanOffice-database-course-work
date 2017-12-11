#include "secretarymainwindow.h"
#include "ui_secretarymainwindow.h"

#include "projections.h"
#include "listswindow.h"

#include <QMessageBox>

SecretaryMainWindow::SecretaryMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::SecretaryMainWindow),
  db(database)
{
  ui->setupUi(this);

  Projections::updateAll(*db);

  ui->stComBoxGroup->addItems(Projections::getGroupsList());
  ui->stComBoxStatus->addItems(Projections::getStudentStatuses());

  ui->tchComBoxStatus->addItems(Projections::getTeacherStatuses());
}

SecretaryMainWindow::~SecretaryMainWindow()
{
  delete ui;
}

void SecretaryMainWindow::on_btnLists_clicked()
{
  // open lists window
  ListsWindow * listsWindow = new ListsWindow(db);
  listsWindow->show();
}
