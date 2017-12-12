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
  ui->stComBoxStatus->addItems(Projections::getStudentStatusesList());

  ui->tchComBoxStatus->addItems(Projections::getTeacherStatusesList());
  ui->tchComBoxDep->addItems(Projections::getDepartmentsList());

  ui->subjComBoxDep->addItems(Projections::getDepartmentsList());
  ui->subjComBoxDiscipline->addItems(Projections::getDisciplinesList());
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
