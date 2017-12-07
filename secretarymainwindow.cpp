#include "secretarymainwindow.h"
#include "ui_secretarymainwindow.h"

SecretaryMainWindow::SecretaryMainWindow(QWidget *parent) :
  QWidget(parent),
  ui(new Ui::SecretaryMainWindow)
{
  ui->setupUi(this);
}

SecretaryMainWindow::~SecretaryMainWindow()
{
  delete ui;
}
