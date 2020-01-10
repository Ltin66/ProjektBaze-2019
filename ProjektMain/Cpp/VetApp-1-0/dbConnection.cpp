//
// Created by tin on 11/27/19.
//
#include "dbConnection.h"

using namespace std;

string dbConnect(korisnik kor,SAConnection &con){
    //cout<<ko.db_string;

    try
    {
        con.Connect (kor.SA_db_string,
                     kor.SA_username,
                     kor.SA_passwd,
                     SA_Oracle_Client);
        printf("We are connected!\n");
        //con.Disconnect();
        //printf("We are disconnected!\n");
    }

    catch(SAException & x)
    {
        printf("%s\n", (const char*)x.ErrText());
    }

    return "dwa";
}


string dbDisconnect(SAConnection &con){

    try
    {
        con.Disconnect();
        //printf("We are disconnected!\n");
    }

    catch(SAException & x)
    {
        try
        {
            con.Rollback ();
        }
        catch(SAException &)
        {
        }
        printf("%s\n", (const char*)x.ErrText());
    }
}

