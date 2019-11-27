/*
 * LTU
 *
 */

#include <SQLAPI.h>
#include <cstdio>
#include <string>

#include "uiIntro.h"

#include "dbUpiti.h"
#include "dbTablice.h"
#include "dbConnection.h"

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
    cout<<"2 - Izlaz"<<endl;
    cin>>odabir;


    if(odabir == 1) cout<<"prijava";
    else if(odabir == 2) return 0;


    //dbConnect(kor,con);
    //dbDisconnect(con);

    return 0;
}

