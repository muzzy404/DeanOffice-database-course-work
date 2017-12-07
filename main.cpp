#include "mainwindow.h"
#include "secretarymainwindow.h"

#include <QApplication>

int main(int argc, char *argv[])
{
  QApplication a(argc, argv);
  MainWindow w;
  w.show();


  SecretaryMainWindow secretaryWindow;
  secretaryWindow.show();

  return a.exec();
}
