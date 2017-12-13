#ifndef SECRETARYMAINWINDOW_H
#define SECRETARYMAINWINDOW_H

#include "listswindow.h"

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

  void on_stBtnAdd_clicked();

  void on_tchBtnAdd_clicked();

  void on_subjBtnAdd_clicked();

  void on_disciplineBtnAdd_clicked();

  void on_semBtnAdd_clicked();

private:
  Ui::SecretaryMainWindow * ui;
  std::shared_ptr<QSqlDatabase> db;

  QString inputErrorHeader  = "Ошибка ввода";
  QString inputErrorMessage = "Для внесения новой записи все поля должны быть заполнены.";

  QString additionHeader = "Добавление";
  QString additionErrorMessage   = "Запись не добавлена. Проверьте поля ввода.";
  QString additionSuccessMessage = "Запись добавлена успешно.";

  void updateDisciplinesBox();
};

#endif // SECRETARYMAINWINDOW_H
