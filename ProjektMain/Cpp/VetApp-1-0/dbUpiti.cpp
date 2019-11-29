//
// Created by tin on 11/27/19.
//

#include "dbUpiti.h"
#include <SQLAPI.h>
#include <string>
#include <iostream>
#include <cstdio>

using namespace std;

int SelectAllFromTable(string table,SAConnection &con){
    string command = "Select * from " + table;
    SAString SAScomm = command.c_str();

    //cout<<endl<<command<<endl;

    SACommand com;
    com.setConnection(&con);
    com.setCommandText(SAScomm);

    com.Execute();

    while(com.FetchNext()){
        SAString test = com[2];
        printf("Test : %s, %d \n", (const char*)test,1);
    }

    return 1;

}
















