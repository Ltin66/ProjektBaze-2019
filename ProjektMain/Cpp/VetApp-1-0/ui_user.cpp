//
// Created by tin on 12/8/19.
//

#include "ui_user.h"
#include "ui_main.h"

#include "dbUpiti.h"
#include "dbTablice.h"
#include "dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

//using namespace std;
/*
int uiUserRacunovodaMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        ui_print("Izbornik");

        ui_print("1 -  Popis Zaposlenika");
        ui_print("2 -  Izracun Place"); // stvara novu zivotinju preko prcedure
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
        else if(odabir == 0) return 0;
        else if(odabir == 10) return -1;
    }
}


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


int uiUserDoktorMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        ui_print("Izbornik");

        ui_print("1 - Informacije o Ambulanti");

        ui_print("2 - Zakazani pregledi");
        ui_print("3 - Dodavanje pregleda");
        ui_print("4 - Izmjena opisa pregleda");

        ui_print("5 -  Dodavanje korisnika");
        ui_print("6 -  Brisanje korisnika");

        ui_print("7 -  Dodavanje zivotinje");
        ui_print("8 -  Brisanje zivotinje");

        ui_print("9 -  Spajanje Zivotinje i korisnika");

        ui_print("11 - Ispis pregleda za pojedinog Korinsika");
        ui_print("12 - Prikaz zaposlenika"); //onaj mat_view gjde se manje vidi


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


int uiUserVeterinarSysMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        ui_print("Izbornik");

        ui_print("1 - Doadaj Doktora");
        ui_print("2 - Doadaj Racunovodu");
        ui_print("3 - Doadaj Voditelja Odjela");

        ui_print("4 - Log");


        ui_print("0 - Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");

        ui_input();
        cin>>odabir;




        if(odabir == 0) return 0;
        else if(odabir == 10) return -1;
    }

}


*/

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