#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "constants.h"

#include <QMessageBox>
#include <QString>
#include <QHostInfo>

#include <QString>
#include <QStringList>

MainWindow::MainWindow(QWidget *parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

  connect(ui->btnConnect, SIGNAL(released()), this,
          SLOT(connectToDb()));

  const QStringList list = { Constants::ADMIN_USER,
                             Constants::TEACHER_USER,
                             Constants::SECRETARY_USER };
  ui->comBoxUser->addItems(list);

  ui->fieldPsw->setEchoMode(QLineEdit::Password);
}

MainWindow::~MainWindow()
{
  delete ui;
}

void MainWindow::connectToDb()
{
  QString user;
  switch (ui->comBoxUser->currentIndex()) {
    case 0:
      user = Constants::ADMIN_LOGIN;
      break;
    case 1:
      user = Constants::TEACHER_LOGIN;
      break;
    case 2:
      user = Constants::SECRETARY_LOGIN;
      break;
    default:
      user = "Undefined user";
  }

  db = std::make_shared<QSqlDatabase>(QSqlDatabase::addDatabase("QODBC", user));
  QString connectString = QString("Driver={SQL Server};");

  connectString.append("Server="   + Constants::SERVER +   ";"); // IP,Port
  connectString.append("Database=" + Constants::DATABASE + ";"); // Schema
  connectString.append("Uid=" + user + ";");                     // User
  connectString.append("Pwd=" + ui->fieldPsw->text() + ";");     // Pass

  db->setDatabaseName(connectString);

  ui->fieldPsw->clear();

  QMessageBox msg;
  if (db->open()) {
    msg.setText("Успешно!");
  } else {
    msg.setText("Ошибка соединения!" );
  }
  msg.exec();

  //db->close();
}

