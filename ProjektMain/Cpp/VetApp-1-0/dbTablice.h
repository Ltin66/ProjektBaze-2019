//
// Created by tin on 11/27/19.
//

#ifndef VETAPP_1_0_DBTABLICE_H
#define VETAPP_1_0_DBTABLICE_H

#include <list>
#include <vector>
#include <string>

struct dbTable{
    std::vector < std::vector <std::string> > Data;
    std::vector < std::string > CollName;
    std::vector < std::string > CollDataType;
    int ColCnt;
    int RowCnt;
};

void dbTableClear(dbTable &Table);

void dbTableClearData(dbTable &Table);

#endif //VETAPP_1_0_DBTABLICE_H
