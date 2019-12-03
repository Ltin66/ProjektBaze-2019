/*
 * LTU
 *
 */

#include <SQLAPI.h>
#include <cstdio>
#include <string>

#include "ui_main.h"

#include "dbUpiti.h"
#include "dbTablice.h"
#include "dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

#define dbTableType std::vector < std::vector <std::string> >

using namespace std;






int main(int argc, char* argv[])
{

    korisnik  kor;
    SAConnection con;


    for(int i =0; i<5;i++) cout<<ui_intro_banner[i]<<endl; //intro vet baza
    for(int i =0; i<2;i++) cout<<endl;


    int odabir = 0;
    cout<<"Glavni Izbornik :"<<endl;
    cout<<"1 - Prijava"<<endl;
    cout<<"0 - Izlaz"<<endl;
    ui_input();
    cin>>odabir;


    if(odabir == 0) return 0;
    else if(odabir == 1){

        ui_prijava(kor);
        dbConnect(kor,con);
        kor.UserRole = dbUserType(con);

        ui_clear();
        cout<<"Dobrodošli "<<kor.username;
        ui_separator();

        if(kor.UserRole == "RACUNOVODA") return 0;
        else if(kor.UserRole == "VODITELJ_ODJELA") return 0;
        else if(kor.UserRole == "VODITELJ_ODJELA") return 0;
        else ui_error("USER ROLE NOT DEFINED");

    }


    //dbConnect(kor,con);
    //dbDisconnect(con);

    return 0;
}




/*
    vector< list < string > > TableArray;

    for (int i  = 0; i  < 10 ; ++i ) {
        TableArray.push_back( list<string> {"ds"} );
    }

    list<string> l = TableArray[0];

    for(int i=0;i<10;i++ ) TableArray[0].push_back(" dwa ");

    for(auto & it : TableArray[0]){
        cout<<it;
    }

    // Iterate and print values of the list
    for (string j : l) {
        std::cout << j << '\n';
    }
*/