

- Ako radi kako treba trebalo bi ispisati : 

```
da 
```

otvori se prozor > OK

```
DaWe are connected!
Row fetched: fid = 1
Row fetched: fid = 2
We are disconnected!
```


# U main.cpp kopirajte :


```

// C++ program for connecting to database (and error handling) 
#include<stdio.h>
#include <SQLAPI.h>
int main(int argc, char* argv[])
{
    printf("Da");
   // SAConnection con;
    // create connection object to connect to database
    SAConnection con;
    SACommand cmd;

    try
    {
        // connect to database
        // in this example, it is Oracle,
        // but can also be Sybase, Informix, DB2
        // SQLServer, InterBase, SQLBase and ODBC
        con.Connect ("XE",    // database name
                     "veterinar",  // user name
                     "1234",  // password
                     SA_Oracle_Client); //Oracle Client
        printf("We are connected!\n");

        cmd.setConnection(&con);
        cmd.setCommandText("SELECT tst FROM test");
        cmd.Execute();

        while(cmd.FetchNext()){
            printf("Row fetched: fid = %ld \n",
                   cmd.Field("tst").asLong());
        }

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
```
