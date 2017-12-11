#include "listswindow.h"
#include "ui_listswindow.h"

#include <QSqlTableModel>
#include <QSqlQuery>

#include <QStringList>

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

  uploadGroups();
  QStringList groupsList;
  for(GroupPair group : groups) {
    groupsList.push_back(group.second);
  }
  ui->stComBoxGroup->addItems(groupsList);

}

ListsWindow::~ListsWindow()
{
  delete ui;
}

void ListsWindow::uploadGroups() {
  QSqlQuery query("SELECT [id], [number] FROM Groups", *db);

  while(query.next()) {
    int id = query.value(0).toInt();
    QString number = query.value(1).toString();

    groups.push_back(std::make_pair(id, number));
  }
}
