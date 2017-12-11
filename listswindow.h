#ifndef LISTSWINDOW_H
#define LISTSWINDOW_H

#include <QWidget>
#include <QSqlDatabase>
#include <QString>

#include <memory>
#include <utility>
#include <vector>

namespace Ui {
  class ListsWindow;
}

class ListsWindow : public QWidget
{
  Q_OBJECT

public:
  explicit ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~ListsWindow();

private slots:
  void on_stBtnGroupList_clicked();

  void on_btnRefresh_clicked();

private:
  Ui::ListsWindow * ui;
  std::shared_ptr<QSqlDatabase> db;
};

#endif // LISTSWINDOW_H
