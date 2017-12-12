#include "listswindow.h"
#include "ui_listswindow.h"

#include "projections.h"

#include <QSqlTableModel>
#include <QSqlQuery>

#include <QMessageBox>

ListsWindow::ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::ListsWindow),
  db(database)
{
  ui->setupUi(this);

//  QSqlTableModel * model = new QSqlTableModel(parent, *db);
//  model->setTable("Students");
//  model->select();

  loadComboBoxItems();
  on_stBtnGroupList_clicked();
}

ListsWindow::~ListsWindow()
{
  delete ui;
}


void ListsWindow::loadComboBoxItems()
{
  Projections::updateAll(*db);
  ui->stComBoxGroup->addItems(Projections::getGroupsList());
  ui->stComBoxDep->addItems(Projections::getDepartmentsList());

  ui->tchrComBoxStatus->addItems(Projections::getTeacherStatusesList());
  ui->tchrComBoxDep->addItems(Projections::getDepartmentsList());

  ui->ctrlComBoxDep->addItems(Projections::getDepartmentsList());
}

void ListsWindow::setFioHeaders()
{
  model->setHeaderData(0, Qt::Horizontal, tr("Фамилия"));
  model->setHeaderData(1, Qt::Horizontal, tr("Имя"));
  model->setHeaderData(2, Qt::Horizontal, tr("Отчество"));
}

void ListsWindow::showQueryResult()
{
  if (model->rowCount() != 0) {
    ui->tableViewDataSpace->setModel(model.get());
    ui->tableViewDataSpace->show();
    return;
  }

  QMessageBox::warning(this, "Совпадений не найдено", "По данному запросу записей не найдено");
}

void ListsWindow::on_stBtnGroupList_clicked()
{
  int id = Projections::getGroupId(ui->stComBoxGroup->currentIndex());

  model.release();
  model = std::make_unique<QSqlQueryModel>();

  QString query("SELECT lastName, firstName, patronymic, Groups.number");
  query.append(" FROM Students, Groups");
  query.append(" WHERE Students.groupNumber = Groups.id AND Groups.id = ");
  query.append(QString::number(id));

  model->setQuery(query, *db);

  setFioHeaders();
  model->setHeaderData(3, Qt::Horizontal, tr("Группа"));

  showQueryResult();
}

void ListsWindow::on_stBtnFlowList_clicked()
{
  int idDep = Projections::getGroupId(ui->stComBoxDep->currentIndex());
  int sem   = ui->stSpinSemFlow->value();

  model.release();
  model = std::make_unique<QSqlQueryModel>();

  QString query("SELECT DISTINCT lastName, firstName, patronymic");
  query.append(" FROM Students, Groups");
  query.append(" WHERE Students.groupNumber = Groups.id AND");
  query.append(" Groups.department = ");
  query.append(QString::number(idDep));
  query.append(" AND Groups.semNum = ");
  query.append(QString::number(sem));

  model->setQuery(query, *db);
  setFioHeaders();
  showQueryResult();
}

void ListsWindow::on_tchBtnList_clicked()
{
  int statusId = Projections::getTeacherStatusId(ui->tchrComBoxStatus->currentIndex());
  int depId    = Projections::getDepartmentsId(ui->tchrComBoxDep->currentIndex());

  model.release();
  model = std::make_unique<QSqlQueryModel>();

  QString query("SELECT DISTINCT lastName, firstName, patronymic");
  query.append(" FROM Teachers WHERE teacherStatus = ");
  query.append(QString::number(statusId));
  query.append(" AND department = ");
  query.append(QString::number(depId));

  model->setQuery(query, *db);
  setFioHeaders();
  showQueryResult();
}
