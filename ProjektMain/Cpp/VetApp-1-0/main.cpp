
// C++ pgroram for connecting to database (and error handling)
#include<SQLAPI.h>         // main SQLAPI++ header
#include<cstdio>

int main(int argc, char* argv[])
{

    // create connection object to connect to database
    SAConnection con;
    try
    {
        // connect to database
        // in this example, it is Oracle,
        // but can also be Sybase, Informix, DB2
        // SQLServer, InterBase, SQLBase and ODBC
        con.Connect ("XE",    // database name
                     "tin",  // user name
                     "4382",  // password
                     SA_Oracle_Client); //Oracle Client
        printf("We are connected!\n");

        // Disconnect is optional
        // autodisconnect will occur in destructor if needed
        con.Disconnect();
        printf("We are disconnected!\n");
    }

    catch(SAException & x)
    {
        // SAConnection::Rollback()
        // can also throw an exception
        // (if a network error for example),
        // we will be ready
        try
        {
            // on error rollback changes
            con.Rollback ();
        }
        catch(SAException &)
        {
        }
        // print error message
        printf("%s\n", (const char*)x.ErrText());
    }

    return 0;
}
