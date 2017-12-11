#include "mainwindow.h"
#include "ui_mainwindow.h"

#include "constants.h"
#include "secretarymainwindow.h"

#include <QMessageBox>
#include <QString>
#include <QHostInfo>

#include <QString>
#include <QStringList>

MainWindow::MainWindow(QWidget * parent) :
  QMainWindow(parent),
  ui(new Ui::MainWindow)
{
  ui->setupUi(this);

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

void MainWindow::on_btnConnect_clicked()
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

    switch (ui->comBoxUser->currentIndex()) {
      case 0: // Admin

        break;
      case 1: // Teacher
        break;
      case 2: { // Secretary
        SecretaryMainWindow * secretaryWindow = new SecretaryMainWindow(db);
        secretaryWindow->show();
        break;
      }
    }
  } else {
    QMessageBox msg;

    msg.setStyleSheet("QLabel{min-width: 150px;}");
    msg.setWindowFlags(Qt::CustomizeWindowHint | Qt::WindowTitleHint); // hide 'X'

    msg.setWindowTitle("Ошибка входа");
    msg.setText("Неверный пароль" );
    msg.exec();
  }

  db = nullptr;
  //db->close();
}
