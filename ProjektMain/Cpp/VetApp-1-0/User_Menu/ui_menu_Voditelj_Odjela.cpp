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
    int offset = 0;
    int offset_pl = 2;

    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();

    vector <string> stavke_izbornik;

    //OK znaci da je napravljen, neznaci da radi kako treba
    //RADI znaci da radi


    stavke_izbornik.push_back("Izlaz U Glavni Meni");
    stavke_izbornik.push_back("Izlaz Iz Programa");

    stavke_izbornik.push_back(" ");

    stavke_izbornik.push_back("Prikaz Informacija Svih Doktora"); //VO_OD_DOK_INFO //OK
    stavke_izbornik.push_back("Brisanje Pregleda"); //fali
    stavke_izbornik.push_back("Dodavanje Doktora na Pregled"); //insertDOKTOR_AMBULANTA
    stavke_izbornik.push_back("Brisanje Doktora s Pregleda"); //select DOK_PREG_ID(1) from DUAL;
    stavke_izbornik.push_back("Prikaz svih Korisnika"); //KORISNIK_VIEW //OK
    stavke_izbornik.push_back("Brisanje korisnika"); //OK //deleteKORISNIK
    stavke_izbornik.push_back("Brisanje zivotinje"); //fali

    stavke_izbornik.push_back("Prikaz Svih Inspekcija"); //INSP_VIEW
    stavke_izbornik.push_back("Dodaj inspekciju"); //fali
    stavke_izbornik.push_back("Dodaj Doktora na Inspekciju"); //insertDOKTORInspekcija
    stavke_izbornik.push_back("Zakazane Inspekcije"); //fali
    stavke_izbornik.push_back("Izmjena opisa inspekcije"); //update_opis_insp

    stavke_izbornik.push_back("Dodaj Intervenciju"); //ja
    stavke_izbornik.push_back("Prikaz Intervencija"); //ja
    stavke_izbornik.push_back("Brisanje Intervencije"); //ja


    for(int i= 0;i<stavke_izbornik.size();i++) if(stavke_izbornik[i] == " ") offset++;


    while(true) {
        int odabir = 0;

        ui_print_menu(stavke_izbornik,"Voditelj Odjela Izbornik",8,3);


        ui_input();
        cin>>odabir;

        cout<<stavke_izbornik[odabir+offset]<<endl;
        cout<<"  offset : "<<offset;
        cout<<" Uneseni : "<<odabir;
        cout<<endl;

        if(stavke_izbornik[odabir] == "Izlaz U Glavni Meni") return -1;
        else if(stavke_izbornik[odabir] == "Izlaz Iz Programa") return 0;

        else if(stavke_izbornik[odabir+offset] == "Prikaz Informacija Svih Doktora"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM VO_OD_DOK_INFO ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);

        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz svih Korisnika"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM KORISNIK_VIEW ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);

        }
        else if(stavke_izbornik[odabir+offset] == "Brisanje Pregleda"){

        }
        else if(stavke_izbornik[odabir+offset] == "Dodavanje Doktora na Pregled"){

        }
        else if(stavke_izbornik[odabir+offset] == "Brisanje Doktora s Pregleda"){

        }
        else if(stavke_izbornik[odabir+offset] == "Brisanje korisnika"){
            ui_print("Unesite ID Korisnika");
            ui_input();
            int id;
            cin>>id;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("deleteKORISNIK");

                cmd.Param("p_korisnik_id").setAsNumeric() = id + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Brisanje zivotinje"){
            ui_print("Unesite ID Zivotinje");
            ui_input();
            int id;
            cin>>id;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("deleteZivotinja");

                cmd.Param("p_korisnik_id").setAsNumeric() = id + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Svih Inspekcija"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM INSP_VIEW ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Dodaj inspekciju i doktora"){

        }
        else if(stavke_izbornik[odabir+offset] == "Zakazane Inspekcije"){

        }
        else if(stavke_izbornik[odabir+offset] == "Izmjena opisa inspekcije"){

        }

       


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