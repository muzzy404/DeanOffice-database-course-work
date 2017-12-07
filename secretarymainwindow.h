#ifndef SECRETARYMAINWINDOW_H
#define SECRETARYMAINWINDOW_H

#include <QWidget>

namespace Ui {
  class SecretaryMainWindow;
}

class SecretaryMainWindow : public QWidget
{
  Q_OBJECT

public:
  explicit SecretaryMainWindow(QWidget *parent = 0);
  ~SecretaryMainWindow();

private:
  Ui::SecretaryMainWindow *ui;
};

#endif // SECRETARYMAINWINDOW_H
