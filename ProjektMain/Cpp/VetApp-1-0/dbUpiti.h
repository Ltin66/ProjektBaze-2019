//
// Created by tin on 11/27/19.
//Ne treba staviti  / ; na kraju upita

#ifndef VETAPP_1_0_DBUPITI_H
#define VETAPP_1_0_DBUPITI_H

#include <string>
#include <SQLAPI.h>
#include <list>
#include <vector>
#include "dbTablice.h"


struct dbQuery{
    std::string dbQueryString;
    std::vector < std::string > dbQueryArgs;
    std::vector < int > dbQueryArgsPoz;
    bool dbQueryType[3] = {false,false,false};
};

//void ExecProcedure(std::string ComTxT, std::vector < )

int SelectAllFromTable(std::string table,SAConnection &con);

//2D lista, prvi elem u podlisti je naziv stupca
void CommandToTable(std::string CommandString,dbTable &Table,SAConnection &con);

std::string dbUserType(SAConnection &con);

#endif //VETAPP_1_0_DBUPITI_H
