//
// Created by tin on 12/22/19.
//

#include "ui_menu_Racunovoda.h"
#include "../ui_user.h"
#include "../ui_main.h"

#include "../dbUpiti.h"
#include "../dbTablice.h"
#include "../dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

using namespace std;




int uiUserRacunovodaMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        ui_print("Izbornik");

        ui_print("1 -  Popis Zaposlenika");
        ui_print("2 -  Izracun Place");
        ui_print("3 -  Unos Zaposlenika");

        ui_print("4 -  Raspored");
        ui_print("5 -  Unos Rasporeda");
        ui_print("6 -  Unos Dolaska");

        ui_print("0 -  Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");

        ui_input();
        cin>>odabir;

        if(odabir == 1) {//temp dbTable
            //cout<<"tu sam 1111111111111111111111";
            dbTable T;
            CommandToTable("SELECT * FROM ZAPOSLENIK",T,con);
            ui_showTable(T);
        }
        else if(odabir == 2){
        }
        else if(odabir == 3){
        }
        else if(odabir == 4){
        }
        else if(odabir == 5){
        }
        else if(odabir == 6){

        }
        else if(odabir == 0) return 0;
        else if(odabir == 10) return -1;
    }
}

