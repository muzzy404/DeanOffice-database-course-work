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

  Projections::updateAll(*db);

  QStringList list = Projections::getDepartmentsList();
  list.push_front("не выбрана");
  ui->tchComBoxDep->addItems(list);
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

  QString query("SELECT id, lastName FROM Teachers WHERE department = ");
  query.append(QString::number(Projections::getDepartmentsId(index)));
  QStringList list;

  Projections::load(teachersIds, list, query, *db);

  ui->tchComBoxName->addItems(list);
  ui->tchComBoxDep->setEnabled(false);
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
