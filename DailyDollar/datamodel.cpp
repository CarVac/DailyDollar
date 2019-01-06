#include "datamodel.h"
#include <QDir>
#include <QStandardPaths>
#include <iostream>

DBSuccess setupDB(QSqlDatabase *db)
{
    QDir dir = QDir::home();
    QString dirstr = QStandardPaths::writableLocation(QStandardPaths::GenericDataLocation);
    dirstr.append("/filmulator");
    if (!dir.cd(dirstr))
    {
        if (!dir.mkpath(dirstr))
        {
            std::cout << "Could not create database directory" << std::endl;
            return DBSuccess::failure;
        } else {
            dir.cd(dirstr);
        }
    }
    db->setDatabaseName(dir.absoluteFilePath("filmulatorDB"));

    if (db->open())
    {
        //success
    } else {
        std::cout << "Could not open database" << std::endl;
        return DBSuccess::failure;
    }

    QSqlQuery query;
    query.exec("CREATE TABLE IF NOT EXISTS Transaction ("
               "time INTEGER," //unix time
               "name VARCHAR," //user name
               "amount REAL NOT NULL," //value of transaction
               "description VARCHAR NOT NULL,"
               "PRIMARY KEY (time, name)"
               ");"
               );

    query.exec("CREATE TABLE IF NOT EXISTS Recurring ("
               "start INTEGER," //unix time
               "end INTEGER" //unix time
               "name VARCHAR," //user name
               "amount REAL NOT NULL," //amount paid/earned per period
               "period REAL NOT NULL," //period in days
               "description VARCHAR NOT NULL,"
               "PRIMARY KEY (start, name, description)"
               ");"
               );
}

DataModel::DataModel()
{

}
