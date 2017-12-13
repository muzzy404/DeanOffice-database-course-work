#ifndef LISTSWINDOW_H
#define LISTSWINDOW_H

#include <QWidget>
#include <QSqlDatabase>
#include <QString>

#include <memory>
#include <utility>
#include <vector>
#include <memory>

#include <QSqlQueryModel>

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

  void on_stBtnFlowList_clicked();

  void on_tchBtnList_clicked();

  void on_ctrlBtnPassList_clicked();

  void on_ctrlBtnExamsList_clicked();

  void on_stBtnScholarshipList_clicked();

private:
  Ui::ListsWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  std::unique_ptr<QSqlQueryModel> model = nullptr;

  void loadComboBoxItems();
  void setFioHeaders();
  void showQueryResult();
  void newModel();

  QString ctrlListSetUp();
};

#endif // LISTSWINDOW_H
