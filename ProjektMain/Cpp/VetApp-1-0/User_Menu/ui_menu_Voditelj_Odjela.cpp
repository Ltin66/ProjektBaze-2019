//
// Created by tin on 12/22/19.
//

#include "ui_menu_Voditelj_Odjela.h"
#include "../ui_user.h"
#include "../ui_main.h"

#include "../dbUpiti.h"
#include "../dbTablice.h"
#include "../dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

using namespace std;




int uiUserVoditeljOdjelaMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        ui_clear();

        int odabir = 0;

        ui_print("Izbornik");
        ui_separator();

        ui_print("1 -  Prikaz Informacija Svih Zaposlenika");


        ui_print("2 -  Brisanje Pregleda");
        ui_print("3 -  Dodavanje Doktora na Pregled");
        ui_print("4 -  Brisanje Doktora s Pregleda");


        ui_print("5 -  Prikaz Svih Inspekcija");
        ui_print("6 -  Dodaj inspekciju i doktora");

        ui_print("11 - Prikaz Doktora");

        ui_print("12 - Zakazane Inspekcije");
        ui_print("14 - Izmjena opisa inspekcije");

        ui_print("15 - AVG broj doktora na inspekcijama");

        ui_print("0 -  Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");

        ui_input();
        cin>>odabir;

        if(odabir == 1){


        }
        else if(odabir == 2){
            //unesite ID zaposlenika ->
            //pozpvi funkicju i ispisi
        }
        else if(odabir == 3){
            //unesite ime zapo
            //unesite prezime zap
            //...
            //jeste lis zadovoljni?
            //pozpvi proceduru
        }
        else if(odabir == 4){
            //unesite id zaposlenika
            // unesite datum dolaska
            //unesite radne sate
            //pozovi proceduru
        }
        else if(odabir == 5){
            //unesi id rasporeda
            //jeli zap dosao (Y N)?
            //pozovi proceduru
        }
        else if(odabir == 6){

        }
        else if(odabir == 7){

        }
        else if(odabir == 8){

        }
        else if(odabir == 9){

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