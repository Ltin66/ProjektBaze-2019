//
// Created by tin on 11/27/19.
//

#include "dbUpiti.h"
#include <SQLAPI.h>
#include <string>
#include <iostream>
#include <cstdio>
#include <list>
#include <vector>
#include "dbTablice.h"


using namespace std;

string dbUserType(SAConnection &con){

    string command = "select * from USER_ROLE_PRIVS where USERNAME = USER";
    SAString SAScomm = command.c_str();

    //cout<<endl<<command<<endl;

    SACommand com;
    com.setConnection(&con);
    com.setCommandText(SAScomm);

    try {com.Execute();}
    catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

    //com.FetchNext();

    while(com.FetchNext()){
        SAString test = com[2];
        return (string)(const char*)test;
    }
   // SAString test = com[2];

    //return  (string)(const char*)test;

}

int SelectAllFromTable(string table,SAConnection &con){
    string command = "Select * from veterinar_sys." + table;

    SAString SAScomm = command.c_str();

    //cout<<endl<<command<<endl;

    SACommand com;
    com.setConnection(&con);
    com.setCommandText(SAScomm);

    try {com.Execute();}
    catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

    while(com.FetchNext()){
        SAString test = com[2];
        printf("Test : %s, %d \n", (const char*)test,1);
    }

    return 1;

}




void CommandToTable(string CommandString,dbTable &Table,SAConnection &con){


    SAString SAScomm = CommandString.c_str();
    SACommand com;
    com.setConnection(&con);
    com.setCommandText(SAScomm);

    try {com.Execute();}
    catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

    Table.Length = com.FieldCount();

    com.FetchNext();

    for(int i = 0; i < Table.Length; i++) {
        SAString tmp = com[i];
        Table.CollName.push_back( (string)(const char*)tmp );
    }


    while(com.FetchNext()){
        //for(int i = 0; i < COLLUMN_CNT; i++)  TableArray[i].push_back( com[i] );
    }


   // return TableArray;
}












