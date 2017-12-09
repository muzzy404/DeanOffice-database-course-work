#include "listswindow.h"
#include "ui_listswindow.h"

#include <QSqlTableModel>

ListsWindow::ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::ListsWindow),
  db(database)
{
  ui->setupUi(this);

  QSqlTableModel * model = new QSqlTableModel(parent, *db);

  model->setTable("Students");
  model->select();

  ui->tableViewDataSpace->setModel(model);
  ui->tableViewDataSpace->show();
}

ListsWindow::~ListsWindow()
{
  delete ui;
}
