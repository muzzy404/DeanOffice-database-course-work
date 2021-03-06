#-------------------------------------------------
#
# Project created by QtCreator 2017-12-07T00:28:58
#
#-------------------------------------------------

QT += core gui
QT += network
QT += sql

CONFIG += c++14

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = DeanOfficeDatabase
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which has been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
    src\main.cpp \
    src\mainwindow.cpp \
    src\constants.cpp \
    src\secretarymainwindow.cpp \
    src\listswindow.cpp \
    src\projections.cpp \
    src\teachermainwindow.cpp

HEADERS += \
    include\mainwindow.h \
    include\secretarymainwindow.h \
    include\constants.h \
    include\listswindow.h \
    include\projections.h \
    include\teachermainwindow.h

FORMS += \
    gui\mainwindow.ui \
    gui\secretarymainwindow.ui \
    gui\listswindow.ui \
    gui\teachermainwindow.ui
