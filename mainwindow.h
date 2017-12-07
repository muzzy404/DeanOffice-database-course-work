#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

#include <QtSql/QSqlDatabase>

#include <memory>

namespace Ui {
  class MainWindow;
}

class MainWindow : public QMainWindow
{
  Q_OBJECT

public:
  explicit MainWindow(QWidget *parent = 0);
  ~MainWindow();

private slots:
  void connectToDb();

private:
  Ui::MainWindow * ui;
  std::shared_ptr<QSqlDatabase> db = nullptr;
};

#endif // MAINWINDOW_H
