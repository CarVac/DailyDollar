#ifndef DATAMODEL_H
#define DATAMODEL_H

#include <QtSql/QSqlQueryModel>
#include <QtSql/QSqlQuery>

enum DBSuccess{success, failure};
DBSuccess setupDB(QSqlDatabase *db);

class DataModel : public QAbstractTableModel
{
public:
    explicit DataModel();

};

#endif // DATAMODEL_H
