#include "teachermainwindow.h"
#include "ui_teachermainwindow.h"

#include "projections.h"

#include <QString>
#include <QStringList>
#include <QSqlQuery>
#include <QMessageBox>

TeacherMainWindow::TeacherMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::TeacherMainWindow),
  db(database)
{
  ui->setupUi(this);
  ui->tableViewDataSpace->horizontalHeader()->setSectionResizeMode(QHeaderView::Stretch);

  Projections::updateAll(*db);

  QStringList list = Projections::getDepartmentsList();
  list.push_front("не выбрана");
  ui->tchComBoxDep->addItems(list);

  ui->tchComBoxName->setEnabled(false);

  ui->examsComBoxGroup->setEnabled(false);
  ui->examsComBoxStudent->setEnabled(false);

  loadSemesters();
}

void TeacherMainWindow::loadSemesters()
{
  QString query("SELECT id, beginDate, endDate FROM Semesters");
  QStringList list;

  QSqlQuery querySelect(query, *db);
  while(querySelect.next()) {
    semIds.push_back(querySelect.value(0).toInt());

    QString sem(querySelect.value(1).toString());
    sem.append(" - ");
    sem.append(querySelect.value(2).toString());

    list.push_back(sem);
  }

  ui->commonComBoxSem->addItems(list);
}

void TeacherMainWindow::loadGroups()
{
  ui->examsComBoxGroup->setEnabled(true);

  QString query("SELECT id, number FROM Groups WHERE department = ");
  query.append(QString::number(selectedDep));
  QStringList list;

  Projections::load(groupsIds, list, query, *db);

  ui->examsComBoxGroup->addItems(list);
  ui->examsComBoxStudent->setEnabled(true);
}

QStringList TeacherMainWindow::loadStudentsList(int groupId, std::vector<int> ids)
{
  ids.clear();

  QString query("SELECT id, lastName, firstName, patronymic FROM Students WHERE groupNumber = ");
  query.append(QString::number(groupId));

  QStringList list;

  QSqlQuery querySelect(query, *db);
  while(querySelect.next()) {
    ids.push_back(querySelect.value(0).toInt());

    QString name(querySelect.value(1).toString());
    name.append(" ");
    name.append(querySelect.value(2).toString());
    name.append(" ");
    name.append(querySelect.value(3).toString());

    list.push_back(name);
  }

  return list;
}

void TeacherMainWindow::loadSubject()
{
  QString query("SELECT Groups.semNum FROM Groups WHERE Groups.id = ");
  query.append(QString::number(groupsIds.at(
                                 ui->examsComBoxGroup->currentIndex())));

  QSqlQuery querySemNum(query, *db);
  querySemNum.next();

  QString semNum = querySemNum.value(0).toString();

  query.clear();
  query.append("SELECT exam, pass FROM Subjects WHERE department = ");
  query.append(QString::number(selectedDep));
  query.append(" AND discipline = ");
  query.append(QString::number(selectedDiscipline));
  query.append(" AND sem = ");
  query.append(semNum);

  QSqlQuery queryDiscipline(query, *db);

  if (!queryDiscipline.next()) {
    QMessageBox::warning(this, "Группа недоступна", "Данный предмет не преподается у этой группы.");
    lockUnclockEdits(false);
    return;
  }

  lockUnclockEdits(true);
  // query about exam and pass
  if (queryDiscipline.value(0).toInt() != 1) {
    ui->examsSpinMark->setEnabled(false);
  }
  if (queryDiscipline.value(1).toInt() != 1) {
    ui->examsCheckBoxPass->setEnabled(false);
  }
}

void TeacherMainWindow::lockUnclockEdits(bool mode)
{
  ui->reportBtnReport->setEnabled(mode);
  ui->examsBtnAdd->setEnabled(mode);
  ui->attBtnAdd->setEnabled(mode);

  ui->examsSpinMark->setEnabled(mode);
  ui->examsCheckBoxPass->setEnabled(mode);

  ui->attSpinNumber->setEnabled(mode);
}

TeacherMainWindow::~TeacherMainWindow()
{
  delete ui;
}

void TeacherMainWindow::on_tchComBoxDep_currentIndexChanged(int index)
{
  if (firstSelection) {
    firstSelection = false;
    return;
  }

  selectedDep = Projections::getDepartmentsId(index - 1);

  QString query("SELECT id, lastName FROM Teachers WHERE department = ");
  query.append(QString::number(selectedDep));
  QStringList list;

  Projections::load(teachersIds, list, query, *db);

  ui->tchComBoxName->addItems(list);
  ui->tchComBoxDep->setEnabled(false);
  ui->tchComBoxName->setEnabled(true);

  loadGroups();
}

void TeacherMainWindow::on_tchComBoxName_currentIndexChanged(int index)
{
  QString query("SELECT Disciplines.name, Disciplines.id FROM Disciplines, Teachers");
  query.append(" WHERE Disciplines.id = Teachers.discipline AND Teachers.id = ");
  query.append(QString::number(teachersIds.at(index)));

  QSqlQuery querySelect(query, *db);
  querySelect.next();

  ui->tchLblSubject->setText(querySelect.value(0).toString());

  // used to indicate selections made after the first one
  int flag = selectedDiscipline;
  selectedDiscipline = querySelect.value(1).toInt();

  if (flag >= 0) {
    on_examsComBoxGroup_currentIndexChanged(ui->examsComBoxGroup->currentIndex());
  }
}

void TeacherMainWindow::on_examsComBoxGroup_currentIndexChanged(int index)
{
  ui->examsComBoxStudent->clear();

  int group = groupsIds.at(index);
  QStringList list = loadStudentsList(group, examsStudentsIds);

  ui->examsComBoxStudent->addItems(list);

  loadSubject();
}

