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

//  QSqlQueryModel * model = new QSqlQueryModel();
//  model->setQuery("SELECT Students.lastName, Groups.number FROM Students, Groups WHERE Students.groupNumber = Groups.id", *db);
//  model->setHeaderData(0, Qt::Horizontal, tr("Фамилия"));
//  model->setHeaderData(1, Qt::Horizontal, tr("Группа"));

//  ui->tableViewDataSpace->setModel(model);
//  ui->tableViewDataSpace->show();

  on_btnRefresh_clicked();
  on_stBtnGroupList_clicked();
}

ListsWindow::~ListsWindow()
{
  delete ui;
}

void ListsWindow::on_stBtnGroupList_clicked()
{
  int id = Projections::getGroupId(ui->stComBoxGroup->currentIndex());

  QSqlQueryModel * model = new QSqlQueryModel();

  QString query("SELECT Students.lastName, Students.firstName, Students.patronymic, Groups.number");
  query.append(" FROM Students, Groups");
  query.append(" WHERE Groups.id = ");
  query.append(QString::number(id));

  model->setQuery(query, *db);

  model->setHeaderData(0, Qt::Horizontal, tr("Фамилия"));
  model->setHeaderData(1, Qt::Horizontal, tr("Имя"));
  model->setHeaderData(2, Qt::Horizontal, tr("Отчество"));
  model->setHeaderData(3, Qt::Horizontal, tr("Группа"));

  ui->tableViewDataSpace->setModel(model);
  ui->tableViewDataSpace->show();
}

void ListsWindow::on_btnRefresh_clicked()
{
  Projections::updateAll(*db);
  ui->stComBoxGroup->addItems(Projections::getGroupsList());
}
