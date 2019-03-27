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
    if (!query.exec("CREATE TABLE IF NOT EXISTS User ("
                    "uid VARCHAR," //user ID
                    "name VARCHAR," //user name
                    "PRIMARY KEY (uid, name)"
                    ");"
                    ))
    {
        std::cout << "Could not create table Transaction" << std::endl;
        return DBSuccess::failure;
    }
    if (!query.exec("CREATE TABLE IF NOT EXISTS Transaction ("
                    "time INTEGER," //unix time
                    "uid VARCHAR," //user ID
                    "amount REAL NOT NULL," //value of transaction
                    "description VARCHAR NOT NULL,"
                    "PRIMARY KEY (time, uid),"
                    "FOREIGN KEY (uid) REFERENCES User(uid)"
                    ");"
                    ))
    {
        std::cout << "Could not create table Transaction" << std::endl;
        return DBSuccess::failure;
    }

    if (!query.exec("CREATE TABLE IF NOT EXISTS Recurring ("
                    "start INTEGER," //unix time
                    "end INTEGER" //unix time
                    "uid VARCHAR," //user ID
                    "amount REAL NOT NULL," //amount paid/earned per period
                    "period REAL NOT NULL," //period in days
                    "description VARCHAR NOT NULL,"
                    "PRIMARY KEY (start, name, description),"
                    "FOREIGN KEY (uid) REFERENCES User(uid)"
                    ");"
                    ))
    {
        std::cout << "Could not create table Recurring" << std::endl;
        return DBSuccess::failure;
    }

    return DBSuccess::success;
}

//Model for fetching each transaction
//There should be two modes: one showing every day and one showing only transactions
TransactionModel::TransactionModel()
{

}

//Model for fetching the currently active transactions
RecurringModel::RecurringModel()
{

}
