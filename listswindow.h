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
  typedef std::pair<int, QString> GroupPair;

  explicit ListsWindow(std::shared_ptr<QSqlDatabase> database, QWidget * parent = 0);
  ~ListsWindow();

private:
  Ui::ListsWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  std::vector<GroupPair> groups;

  void uploadGroups();
};

#endif // LISTSWINDOW_H
