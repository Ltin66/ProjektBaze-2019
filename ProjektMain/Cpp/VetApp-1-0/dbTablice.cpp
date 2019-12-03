//
// Created by tin on 11/27/19.
//

#include "dbTablice.h"
#include <string>
#include <vector>
#include <list>

using namespace std;

void dbTableClear(dbTable &Table){
    //TODO
}

void dbTableClearData(dbTable &Table){
    if(!Table.Data.empty()) for(int i = Table.Data.size() - 1; i >= 0; i--) Table.Data[i].clear();
    Table.Data.clear();
}



