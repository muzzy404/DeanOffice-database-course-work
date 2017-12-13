#include "secretarymainwindow.h"
#include "ui_secretarymainwindow.h"

#include "projections.h"
#include "listswindow.h"

#include <QMessageBox>
#include <QSqlQuery>

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

void SecretaryMainWindow::updateDisciplinesBox()
{
  Projections::updateDisciplines(*db);

  ui->subjComBoxDiscipline->clear();
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

void SecretaryMainWindow::on_stBtnAdd_clicked()
{
  // editing is allowed always for students
  QString lastname   = ui->stEditLastname->text();
  QString firstname  = ui->stEditFirstname->text();
  QString patronymic = ui->StEditPatronymic->text();

  if (lastname.length() == 0 || firstname.length() == 0 ||
      patronymic.length() == 0) {
    QMessageBox::critical(this, inputErrorHeader, inputErrorMessage);
    return;
  }

  QString dob = ui->stDateOfBirth->text();
  QString group  = QString::number(Projections::getGroupId(
                                     ui->stComBoxGroup->currentIndex()));
  QString status = QString::number(Projections::getStudentStatusId(
                                     ui->stComBoxStatus->currentIndex()));

  QSqlQuery query(*db);
  query.prepare("INSERT INTO Students (lastName, firstName, patronymic, dob, groupNumber, studentStatus) "
                "VALUES (?, ?, ?, ?, ?, ?)");
  query.addBindValue(lastname);
  query.addBindValue(firstname);
  query.addBindValue(patronymic);
  query.addBindValue(dob);
  query.addBindValue(group);
  query.addBindValue(status);

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
  ui->stEditLastname->clear();
  ui->stEditFirstname->clear();
  ui->StEditPatronymic->clear();
}
