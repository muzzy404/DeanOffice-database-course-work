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
  ui->tchComBoxDiscipline->addItems(Projections::getDisciplinesList());

  ui->subjComBoxDep->addItems(Projections::getDepartmentsList());
  ui->subjComBoxDiscipline->addItems(Projections::getDisciplinesList());
}

void SecretaryMainWindow::updateDisciplinesBox()
{
  Projections::updateDisciplines(*db);

  ui->tchComBoxDiscipline->clear();
  ui->tchComBoxDiscipline->addItems(Projections::getDisciplinesList());
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

  if (lastname.length() == 0 ||
      firstname.length() == 0 ||
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
  query.prepare("{CALL addStudent (?, ?, ?, ?, ?, ?)}");
  query.bindValue(0, lastname);
  query.bindValue(1, firstname);
  query.bindValue(2, patronymic);
  query.bindValue(3, dob);
  query.bindValue(4, group);
  query.bindValue(5, status);

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
  ui->stEditLastname->clear();
  ui->stEditFirstname->clear();
  ui->StEditPatronymic->clear();
}

void SecretaryMainWindow::on_tchBtnAdd_clicked()
{
  QString lastname   = ui->tchEditLastname->text();
  QString firstname  = ui->tchEditFirstname->text();
  QString patronymic = ui->tchEditPatronymic->text();

  if (lastname.length() == 0 ||
      firstname.length() == 0 ||
      patronymic.length() == 0) {
    QMessageBox::critical(this, inputErrorHeader, inputErrorMessage);
    return;
  }

  QString dep    = QString::number(Projections::getDepartmentsId(
                                     ui->tchComBoxDep->currentIndex()));
  QString disc   = QString::number(Projections::getDisciplinesId(
                                     ui->tchComBoxDiscipline->currentIndex()));
  QString status = QString::number(Projections::getTeacherStatusId(
                                     ui->tchComBoxStatus->currentIndex()));

  QSqlQuery query(*db);
  query.prepare("INSERT INTO Teachers (lastName, firstName, patronymic, department, discipline, teacherStatus) "
                "VALUES (?, ?, ?, ?, ?, ?)");

  query.addBindValue(lastname);
  query.addBindValue(firstname);
  query.addBindValue(patronymic);
  query.addBindValue(dep);
  query.addBindValue(disc);
  query.addBindValue(status);

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
  ui->tchEditLastname->clear();
  ui->tchEditFirstname->clear();
  ui->tchEditPatronymic->clear();
}

void SecretaryMainWindow::on_subjBtnAdd_clicked()
{
  if (!ui->subjCheckBoxPass->isChecked() && !ui->subjCheckBoxExam->isChecked()) {
    QMessageBox::critical(this, inputErrorHeader,
                          "Предмет должен иметь хотя бы одну зачетную единицу.");
    return;
  }

  QString disc = QString::number(Projections::getDisciplinesId(
                                   ui->subjComBoxDiscipline->currentIndex()));
  QString dep  = QString::number(Projections::getDepartmentsId(
                                   ui->subjComBoxDep->currentIndex()));
  QString sem = ui->subjSpinSem->text();

  QString pass = ui->subjCheckBoxPass->isChecked() ? "TRUE" : "FALSE";
  QString exam = ui->subjCheckBoxExam->isChecked() ? "TRUE" : "FALSE";

  QSqlQuery query(*db);
  query.prepare("INSERT INTO Subjects (discipline, department, sem, pass, exam, active)"
                "VALUES (?, ?, ?, ?, ?, ?)");
  query.addBindValue(disc);
  query.addBindValue(dep);
  query.addBindValue(sem);
  query.addBindValue(pass);
  query.addBindValue(exam);
  query.addBindValue("TRUE");

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
}

void SecretaryMainWindow::on_disciplineBtnAdd_clicked()
{
  QString name = ui->disciplineEditName->text();
  if (name.length() == 0) {
    QMessageBox::critical(this, inputErrorHeader, inputErrorMessage);
    return;
  }

  QString lectHours  = ui->disciplineSpinLectHours->text();
  QString practHours = ui->disciplineSpinPractHours->text();

  QSqlQuery query(*db);
  query.prepare("INSERT INTO Disciplines (name, lectureHours, practiceHours)"
                "VALUES (?, ?, ?)");
  query.addBindValue(name);
  query.addBindValue(lectHours);
  query.addBindValue(practHours);

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
  updateDisciplinesBox();
}

void SecretaryMainWindow::on_semBtnAdd_clicked()
{
  QString begin = ui->semDateBegin->text();
  QString end   = ui->semDateEnd->text();

  QSqlQuery query(*db);
  query.prepare("INSERT INTO Semesters (beginDate, endDate)"
                "VALUES (?, ?)");
  query.addBindValue(begin);
  query.addBindValue(end);

  if (!query.exec()) {
    QMessageBox::critical(this, additionHeader, additionErrorMessage);
    return;
  }

  QMessageBox::information(this, additionHeader, additionSuccessMessage);
}
