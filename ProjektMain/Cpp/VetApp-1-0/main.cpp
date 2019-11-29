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

        ui_clear(15);
        cout<<"Dobrodošli "<<kor.username;

        //TODO mijenjanje funkcija ovisno o role type

        string tmp;
        cout<<endl<<"Unesite ime tablice : ";
        ui_input();
        cin>>tmp;

        SelectAllFromTable(tmp,con);

    }


    //dbConnect(kor,con);
    //dbDisconnect(con);

    return 0;
}

