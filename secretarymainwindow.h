#ifndef SECRETARYMAINWINDOW_H
#define SECRETARYMAINWINDOW_H

#include <QWidget>
#include <QSqlDatabase>

#include <memory>

namespace Ui {
  class SecretaryMainWindow;
}

class SecretaryMainWindow : public QWidget
{
  Q_OBJECT

public:
  explicit SecretaryMainWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~SecretaryMainWindow();

private slots:
  void on_btnLists_clicked();

private:
  Ui::SecretaryMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;
};

#endif // SECRETARYMAINWINDOW_H
