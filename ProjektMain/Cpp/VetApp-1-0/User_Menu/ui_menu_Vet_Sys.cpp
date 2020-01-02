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
    int offset = 0;
    int offset_pl = 2;

    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();

    vector <string> stavke_izbornik;

    //OK znaci da je gotov, neznaci da radi kako treba
    //RADI znaci da radi


    stavke_izbornik.push_back("Izlaz U Glavni Meni");
    stavke_izbornik.push_back("Izlaz Iz Programa");

    stavke_izbornik.push_back(" ");

    stavke_izbornik.push_back("Dodaj Doktora"); //OK RADI +
    stavke_izbornik.push_back("Dodaj Racunovodu"); //OK RADI +
    stavke_izbornik.push_back("Dodaj Voditelja Odjela"); //OK RADI +
    stavke_izbornik.push_back("Log prijave i odjave"); //OK RADI +
    stavke_izbornik.push_back("Log zadnje prijave korisnika"); //OK RADI +

    for(int i= 0;i<stavke_izbornik.size();i++) if(stavke_izbornik[i] == " ") offset++;


    while(true) {
        int odabir = 0;

        ui_print_menu(stavke_izbornik,"Doktor Izbornik",8,3);


        ui_input();
        cin>>odabir;

        cout<<stavke_izbornik[odabir+offset]<<endl;
        cout<<"  offset : "<<offset;
        cout<<" Uneseni : "<<odabir;
        cout<<endl;

        if(stavke_izbornik[odabir] == "Izlaz U Glavni Meni") return -1;
        else if(stavke_izbornik[odabir] == "Izlaz Iz Programa") return 0;

        else if(stavke_izbornik[odabir+offset] == "Dodaj Doktora"){
            string ime,sifra;

            ui_print("Unesite ime korisnika :");
            ui_input();
            cin>>ime;

            ui_print("Unesite šifru korisnika :");
            ui_input();
            cin>>sifra;


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("create_user_doktor");

                cmd.Param("user_name").setAsString() = ime.c_str();
                cmd.Param("passwd").setAsString() = sifra.c_str();

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Dodaj Racunovodu"){
            string ime,sifra;

            ui_print("Unesite ime korisnika :");
            ui_input();
            cin>>ime;

            ui_print("Unesite šifru korisnika :");
            ui_input();
            cin>>sifra;


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("create_user_racunovoda");

                cmd.Param("user_name").setAsString() = ime.c_str();
                cmd.Param("passwd").setAsString() = sifra.c_str();

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Dodaj Voditelja Odjela"){
            string ime,sifra;

            ui_print("Unesite ime korisnika :");
            ui_input();
            cin>>ime;

            ui_print("Unesite šifru korisnika :");
            ui_input();
            cin>>sifra;


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("CREATE_USER_VODITELJ_ODJELA");

                cmd.Param("user_name").setAsString() = ime.c_str();
                cmd.Param("passwd").setAsString() = sifra.c_str();

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Log prijave i odjave"){
            //select * from log_login_logout;
            dbTable tipovi_ziv;
            CommandToTable("select * from log_login_logout",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Log zadnje prijave korisnika"){
            //select Naziv,MAX(vijeme) Vrijeme from log_login_logout WHERE tip = 'LOGON' GROUP BY Naziv;
            dbTable tipovi_ziv;
            CommandToTable("select Naziv,MAX(vijeme) Vrijeme from log_login_logout WHERE tip = 'LOGON' GROUP BY Naziv",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
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