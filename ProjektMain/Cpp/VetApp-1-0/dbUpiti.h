//
// Created by tin on 11/27/19.
//

#ifndef VETAPP_1_0_DBUPITI_H
#define VETAPP_1_0_DBUPITI_H

#include <string>
#include <SQLAPI.h>
#include <list>
#include <vector>


int SelectAllFromTable(std::string table,SAConnection &con);


//2D lista, prvi elem u podlisti je naziv stupca
std::vector < std::list <std::string> >  CommandToList(std::string CommandString,SAConnection &con);

std::string dbUserType(SAConnection &con);

#endif //VETAPP_1_0_DBUPITI_H
