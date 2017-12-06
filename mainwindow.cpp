#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QMessageBox>
#include <QString>
#include <QHostInfo>
#include <QtSql/QSqlDatabase>

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  connect(ui->btnConnect, SIGNAL(released()), this,
          SLOT(connectToDb()));
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::connectToDb()
{
  QMessageBox msg;

  QSqlDatabase db = QSqlDatabase::addDatabase("QODBC", "mydb");;

  QString connectString = "DRIVER={SQL Server};";

  connectString.append("Server=localhost,1433;"); // IP,Port
  connectString.append("Database=DeanOffice;");   // Schema
  connectString.append("Uid=DeanOfficeAdmin;");   // User
  connectString.append("Pwd=admin;");             // Pass

  db.setDatabaseName(connectString);

  if (db.open()) {
    msg.setText("Succes!");
  } else {
    msg.setText("Fail!" );
  }

  msg.exec();
}

