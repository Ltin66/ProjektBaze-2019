//
// Created by tin on 12/22/19.
//

#include "ui_menu_Vet_Sys.h"
#include "../ui_user.h"
#include "../ui_main.h"

#include "../dbUpiti.h"
#include "../dbTablice.h"
#include "../dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

using namespace std;





int uiUserVeterinarSysMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        ui_print("Izbornik");

        ui_print("1 - Dodaj Doktora");
        ui_print("2 - Dodaj Racunovodu");
        ui_print("3 - Dodaj Voditelja Odjela");

        ui_print("4 - Log");


        ui_print("0 - Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");

        ui_input();
        cin>>odabir;

        if(odabir == 1){

        }
        else if(odabir == 2){

        }
        else if(odabir == 3){

        }

        else if(odabir == 4){

        }




        if(odabir == 0) return 0;
        else if(odabir == 10) return -1;
    }

}




/*
 *              SACommand cmd(&con);
                cmd.setCommandText("INSERTZIVOTINJA");
                //SAParam a1 = 0.0;

                cmd.Param("p_ziv_id").setAsNumeric() = 0.0;
                cmd.Param("p_ziv_tip_id").setAsNumeric() = 1.0;
                cmd.Param("p_ime").setAsString() = "Pas";
                cmd.Param("p_opis").setAsString() = "Tin je ovo preko programam ubacio";

                try {cmd.Execute();}
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

 *
 */