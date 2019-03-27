#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QtSql/QSqlQueryModel>
#include <QtSql/QSqlQuery>

enum DBSuccess{success, failure};
DBSuccess setupDB(QSqlDatabase *db);

class TransactionModel : public QAbstractTableModel
{
public:
    explicit TransactionModel();

};

class RecurringModel : public QAbstractTableModel
{
public:
    explicit RecurringModel();
};

#endif // DATAMODEL_H
