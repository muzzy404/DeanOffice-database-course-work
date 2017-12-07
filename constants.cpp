#include <QString>

class Constants {
public:
  static const QString ADMIN_LOGIN;
  static const QString TEACHER_LOGIN;
  static const QString SECRETARY_LOGIN;

  static const QString ADMIN_USER;
  static const QString TEACHER_USER;
  static const QString SECRETARY_USER;

  static const QString SERVER;
  static const QString DATABASE;
  static const QString DRIVER;
};

const QString Constants::ADMIN_LOGIN     = "DeanOfficeAdmin";
const QString Constants::TEACHER_LOGIN   = "DeanOfficeTeacher";
const QString Constants::SECRETARY_LOGIN = "DeanOfficeSecretary";

const QString Constants::ADMIN_USER     = "Администратор";
const QString Constants::TEACHER_USER   = "Преподаватель";
const QString Constants::SECRETARY_USER = "Секретарь";

const QString Constants::SERVER   = "localhost,1433";
const QString Constants::DATABASE = "DeanOffice";
