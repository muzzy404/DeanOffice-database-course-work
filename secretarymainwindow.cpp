#include "secretarymainwindow.h"
#include "ui_secretarymainwindow.h"

#include "listswindow.h"

SecretaryMainWindow::SecretaryMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent) :
  QWidget(parent),
  ui(new Ui::SecretaryMainWindow),
  db(database)
{
  ui->setupUi(this);
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
