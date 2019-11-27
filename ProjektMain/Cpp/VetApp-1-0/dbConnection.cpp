//
// Created by tin on 11/27/19.
//
#include "dbConnection.h"

using namespace std;

string dbConnect(korisnik ko,SAConnection &con){
    cout<<ko.db_name;

    try
    {
        con.Connect ("XE",
                     "tin",
                     "4382",
                     SA_Oracle_Client);
        printf("We are connected!\n");
        //con.Disconnect();
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

    return "dwa";
}

string dbDisconnect(SAConnection &con){

    try
    {
        con.Disconnect();
        printf("We are disconnected!\n");
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