#ifndef LISTSWINDOW_H
#define LISTSWINDOW_H

#include <QWidget>
#include <QSqlDatabase>

#include <memory>

namespace Ui {
  class ListsWindow;
}

class ListsWindow : public QWidget
{
  Q_OBJECT

public:
  explicit ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~ListsWindow();

private:
  Ui::ListsWindow * ui;
  std::shared_ptr<QSqlDatabase> db;
};

#endif // LISTSWINDOW_H
