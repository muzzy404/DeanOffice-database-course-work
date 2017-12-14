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

  ui->reportComBoxGroup->setEnabled(false);
  ui->examsComBoxGroup->setEnabled(false);
  ui->attComBoxGroup->setEnabled(false);

  ui->examsComBoxStudent->setEnabled(false);
  ui->attComBoxStudent->setEnabled(false);
}

void TeacherMainWindow::loadGroups()
{
  ui->reportComBoxGroup->setEnabled(true);
  ui->examsComBoxGroup->setEnabled(true);
  ui->attComBoxGroup->setEnabled(true);

  QString query("SELECT id, number FROM Groups WHERE department = ");
  query.append(QString::number(selectedDep));
  QStringList list;

  Projections::load(groupsIds, list, query, *db);

  ui->reportComBoxGroup->addItems(list);
  ui->examsComBoxGroup->addItems(list);
  ui->attComBoxGroup->addItems(list);

  ui->examsComBoxStudent->setEnabled(true);
  ui->attComBoxStudent->setEnabled(true);
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
  QString query("SELECT Disciplines.name FROM Disciplines, Teachers");
  query.append(" WHERE Disciplines.id = Teachers.discipline AND Teachers.id = ");
  query.append(QString::number(teachersIds.at(index)));

  QSqlQuery querySelect(query, *db);
  querySelect.next();

  ui->tchLblSubject->setText(querySelect.value(0).toString());
}

void TeacherMainWindow::on_examsComBoxGroup_currentIndexChanged(int index)
{
  ui->examsComBoxStudent->clear();

  int group = groupsIds.at(index);
  QStringList list = loadStudentsList(group, examsStudentsIds);

  ui->examsComBoxStudent->addItems(list);
}

void TeacherMainWindow::on_attComBoxGroup_currentIndexChanged(int index)
{
  ui->attComBoxStudent->clear();

  int group = groupsIds.at(index);
  QStringList list = loadStudentsList(group, attStudentsIds);

  ui->attComBoxStudent->addItems(list);
}
