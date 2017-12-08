#include "listswindow.h"
#include "ui_listswindow.h"

ListsWindow::ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::ListsWindow),
  db(database)
{
  ui->setupUi(this);
}

ListsWindow::~ListsWindow()
{
  delete ui;
}
