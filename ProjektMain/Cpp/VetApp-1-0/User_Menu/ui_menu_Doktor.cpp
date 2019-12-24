//
// Created by tin on 12/22/19.
//

#include "ui_menu_Doktor.h"
#include "../ui_user.h"
#include "../ui_main.h"

#include "../dbUpiti.h"
#include "../dbTablice.h"
#include "../dbConnection.h"

#include <list>
#include <vector>
#include <algorithm>

using namespace std;




int uiUserDoktorMainMenu(SAConnection &con,korisnik &kor){
    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();
    while(true) {
        int odabir = 0;

        //OK znaci da je napravljen, neznaci da radi kako treba
        //RADI znaci da radi

        ui_print("Izbornik");

        ui_print("1 - Informacije o Ambulanti");    //todo

        ui_print("2 - Zakazani pregledi");          //fali procedura
        ui_print("3 - Dodavanje pregleda");         //OK  RADI
        ui_print("4 - Izmjena opisa pregleda");     //OK

        ui_print("5 -  Dodavanje korisnika");       //OK

        ui_print("7 -  Dodavanje zivotinje");       //OK

        ui_print("9 -  Spajanje Zivotinje i korisnika");    //OK

        ui_print("11 - Ispis pregleda za pojedinog Korisnika");     //todo
        ui_print("12 - Prikaz zaposlenika");                        //onaj mat_view gjde se manje vidi

        ui_print("13 -  Prikaz Tipova Zivotinja");      //view
        ui_print("14 -  Prikaz Usluga");                //view

        ui_print("15 -  Dodavanje Doktora na Pregled"); //OK

        ui_print("16 -  Prikaz svih ID-a Korisnika i Zivotinja za  Korisnik ID"); //funkcija

        ui_print("0 -  Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");



        ui_input();
        cin>>odabir;

        if(odabir == 1){

        }
        else if(odabir == 2){

        }
        else if(odabir == 3){
            ui_print("Unesite ID usluge ");
            ui_input();
            int ID;
            cin>>ID;

            ui_print("Unesite datum");
            ui_input();
            int dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum(yr,mnth,dy);

            ui_print("Zelite li opis ");
            string opis = "";
            if(ui_confirm()){
                ui_input();
                cin>>opis;
            }

            SACommand cmd(&con);

            cout<<"ID : " << ID << '\n'<< "Datum : " <<dy<<'.'<<mnth<<'.'<<yr<<'\n' << "Opis : " << opis;
            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                cmd.setCommandText("VETERINAR_SYS.INSERTAMBULANTA");


            cmd.Param("p_amb_id").setAsNumeric() = 0.0;
            cmd.Param("p_amb_usl_id").setAsNumeric() = ID + 0.0;
            cmd.Param("p_datum").setAsDateTime() = datum;
            cmd.Param("p_opis").setAsString() = opis.c_str();

            ui_clear();
            ui_separator();
            ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(odabir == 4){
            ui_print("Unesite ID pregleda : ");
            ui_input();
            int ID;
            cin>>ID;
            ui_print("Unesite Novi Opis :");
            ui_input();
            string opis;
            cin>> opis;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

            cmd.setCommandText("updateAMBULANTA_opis");

            cmd.Param("p_id").setAsNumeric() = ID + 0.0;
            cmd.Param("p_opis").setAsString() = opis.c_str();

            ui_clear();
            ui_separator();
            ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        }
        else if(odabir == 5){
            ui_print("Unesite Ime korisnika");
            ui_input();
            string ime;
            cin>> ime;

            ui_print("Unesite srednje ime korisnika ili @ ako nema");
            ui_input();
            string sred_ime;
            cin>>sred_ime;

            ui_print("Unesite prezime korisnika :");
            ui_input();
            string prezime;
            cin>>prezime;

            ui_print("Unesite Sifru Korinsika");
            ui_input();
            int sifra;
            cin>>sifra;

            ui_print("Unesite datum");
            ui_input();
            int dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum(yr,mnth,dy);

            ui_print("Unesite jmbg ");
            ui_input();
            string jmbg;
            cin>>jmbg;

            ui_print("Zelite li opis ");
            string opis = "";
            if(ui_confirm()){
                ui_input();
                cin>>opis;
            }

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("insertKORISNIK");

                cmd.Param("p_korisnik_id").setAsNumeric() =  0.0;
                cmd.Param("p_ime").setAsString() = ime.c_str();
                cmd.Param("p_srednje_ime").setAsString() = sred_ime.c_str();
                cmd.Param("p_prezime").setAsString() = prezime.c_str();
                cmd.Param("p_jmbg").setAsString() = jmbg.c_str();

                cmd.Param("p_sifra").setAsNumeric() =  sifra + 0.0;
                cmd.Param("p_datum_poc").setAsDateTime() =  datum;

                cmd.Param("p_opis").setAsString() = opis.c_str();
                cmd.Param("p_aktivan").setAsNumeric() =  1.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }


        }

        else if(odabir == 7){
            ui_print("Unesite Tip Zivotinje");
            ui_input();
            int tip;
            cin>>tip;

            ui_print("Unesite Ime Zivotinje");
            ui_input();
            string ime;


            ui_print("Zelite li opis ");
            string opis = "";
            if(ui_confirm()){
                ui_input();
                cin>>opis;
            }

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("INSERTZIVOTINJA");

                cmd.Param("p_ziv_id").setAsNumeric() =  0.0;
                //cmd.Param("p_opis").setAsString() = opis.c_str();
                cmd.Param("p_ziv_tip_id").setAsNumeric() = tip + 0.0;
                cmd.Param("p_ime").setAsString() = ime.c_str();
                cmd.Param("p_opis").setAsString() = opis.c_str();


                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        }

        else if(odabir == 9){
            ui_print("Unesite ID korisnika : ");
            ui_input();
            int korId;
            cin>>korId;

            ui_print("Unesite ID zivotinje : ");
            ui_input();
            int zivId;
            cin>>zivId;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("INSERTKORISNIK_ZIVOTINJA");

                cmd.Param("p_korziv").setAsNumeric() =  0.0;
                cmd.Param("p_ziv_id").setAsNumeric() =  zivId + 0.0;
                cmd.Param("p_korisnik_id").setAsNumeric() =  korId +0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        }
        else if(odabir == 11){

        }
        else if(odabir == 12){

        }
        else if(odabir == 13){
            dbTable tipovi_ziv;
            CommandToTable("Select * FRom tipovi_zivotinja ")
        }
        else if(odabir == 14){

        }
        else if(odabir == 15){

            ui_print("Unesite ID doktora");
            ui_input();
            int zapId;
            cin>>zapId;

            ui_print("Unesite ID Ambulante");
            ui_input();
            int ambId;
            cin>>ambId;


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("insertDOKTOR_AMBULANTA");

                cmd.Param("p_amb_dok_id").setAsNumeric() =  0.0;
                cmd.Param("p_amb_id").setAsNumeric() =  ambId + 0.0;
                cmd.Param("p_zap_id").setAsNumeric() =  zapId +0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
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