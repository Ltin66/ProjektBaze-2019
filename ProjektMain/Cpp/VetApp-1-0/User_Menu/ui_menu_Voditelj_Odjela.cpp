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




int uiUserVoditeljOdjelaMainMenu(SAConnection &con,korisnik &kor) {
    int offset = 0;
    int offset_pl = 2;

    ui_clear();
    cout << "Dobrodošli " << kor.username;
    ui_separator();

    vector<string> stavke_izbornik;

    //OK znaci da je napravljen, neznaci da radi kako treba
    //RADI znaci da radi


    stavke_izbornik.push_back("Izlaz U Glavni Meni");
    stavke_izbornik.push_back("Izlaz Iz Programa");

    stavke_izbornik.push_back(" ");

    stavke_izbornik.push_back("Prikaz Informacija Svih Doktora"); //VO_OD_DOK_INFO //OK

    stavke_izbornik.push_back("Dodavanje Doktora na Pregled"); //insertDOKTOR_AMBULANTA //OK RADI
    stavke_izbornik.push_back("Brisanje Doktora s Pregleda"); //OK
    stavke_izbornik.push_back("Brisanje Pregleda"); //OK

    stavke_izbornik.push_back("Prikaz doktora za Ambulanta ID"); //select DOK_PREG_ID(1) from DUAL; //OK RADI
    stavke_izbornik.push_back("Prikaz svih Korisnika"); //KORISNIK_VIEW //OK RADI

    stavke_izbornik.push_back("Brisanje korisnika");  //deleteKORISNIK //OK RADI
    stavke_izbornik.push_back("Brisanje zivotinje"); //OK

    stavke_izbornik.push_back("Prikaz Svih Inspekcija"); //INSP_VIEW //OK
    stavke_izbornik.push_back("Prikaz Tipova Inspekcije"); // OK
    stavke_izbornik.push_back("Dodaj inspekciju"); //OK
    stavke_izbornik.push_back("Dodaj Doktora na Inspekciju"); //insertDOKTORInspekcija //OK
    stavke_izbornik.push_back("Zakazane Inspekcije"); //OK
    stavke_izbornik.push_back("Izmjena opisa inspekcije"); //update_opis_insp //OK

    stavke_izbornik.push_back("Dodaj Intervenciju"); //ja
    stavke_izbornik.push_back("Prikaz Intervencija"); //ja
    stavke_izbornik.push_back("Brisanje Intervencije"); //ja


    for (int i = 0; i < stavke_izbornik.size(); i++) if (stavke_izbornik[i] == " ") offset++;


    while (true) {
        int odabir = 0;

        ui_print_menu(stavke_izbornik, "Voditelj Odjela Izbornik", 8, 3);


        ui_input();
        cin >> odabir;

        cout << stavke_izbornik[odabir + offset] << endl;
        cout << "  offset : " << offset;
        cout << " Uneseni : " << odabir;
        cout << endl;

        if (stavke_izbornik[odabir] == "Izlaz U Glavni Meni") return -1;
        else if (stavke_izbornik[odabir] == "Izlaz Iz Programa") return 0;

        else if (stavke_izbornik[odabir + offset] == "Prikaz Informacija Svih Doktora") {
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM VO_OD_DOK_INFO ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);

        }

        else if (stavke_izbornik[odabir + offset] == "Dodavanje Doktora na Pregled") {
            ui_print("Unesite ID doktora");
            ui_input();
            int zapId;
            cin >> zapId;

            ui_print("Unesite ID Ambulante");
            ui_input();
            int ambId;
            cin >> ambId;


            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.insertDOKTOR_AMBULANTA");

                cmd.Param("p_amb_dok_id").setAsNumeric() = 0.0;
                cmd.Param("p_amb_id").setAsNumeric() = ambId + 0.0;
                cmd.Param("p_zap_id").setAsNumeric() = zapId + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }
        }
        else if (stavke_izbornik[odabir + offset] == "Brisanje Doktora s Pregleda") {
            ui_print("Unesite ID Pregleda");
            ui_input();
            int id;
            cin >> id;

            ui_print("Unesite ID Doktora");
            ui_input();
            int id_d;
            cin >> id_d;

            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.del_doktor");

                cmd.Param("p_amb_id").setAsNumeric() = id + 0.0;
                cmd.Param("p_zap_id").setAsNumeric() = id_d + 0.0;


                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }
            }
        } //
        else if (stavke_izbornik[odabir + offset] == "Brisanje Pregleda") {
            ui_print("Unesite ID Pregleda");
            ui_input();
            int id;
            cin >> id;

            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.del_pregled");

                cmd.Param("p_amb_id").setAsNumeric() = id + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }
        } //


        else if (stavke_izbornik[odabir + offset] == "Prikaz doktora za Ambulanta ID") {
            ui_print("Unesite ID ambulante :");
            ui_input();
            int id;
            cin >> id;

            dbTable tipovi_ziv;
            CommandToTable("select DOK_PREG_ID(" + to_string(id) + ") from DUAL ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);
        }
        else if (stavke_izbornik[odabir + offset] == "Prikaz svih Korisnika") {
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM KORISNIK_VIEW ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);

        }

        else if (stavke_izbornik[odabir + offset] == "Brisanje korisnika") {
            ui_print("Unesite ID Korisnika");
            ui_input();
            int id;
            cin >> id;

            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.DELETEKORISNIK");

                cmd.Param("p_korisnik_id").setAsNumeric() = id + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }
        }
        else if (stavke_izbornik[odabir + offset] == "Brisanje zivotinje") {
            ui_print("Unesite ID Zivotinje");
            ui_input();
            int id;
            cin >> id;

            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("deleteZivotinja");

                cmd.Param("p_korisnik_id").setAsNumeric() = id + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }
        }  //

        else if (stavke_izbornik[odabir + offset] == "Prikaz Tipova Inspekcije") {
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM vo_od_insp_tip ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);
        }
        else if (stavke_izbornik[odabir + offset] == "Prikaz Svih Inspekcija") {
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM INSP_VIEW ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);
        }
        else if (stavke_izbornik[odabir + offset] == "Dodaj inspekciju") {
            ui_print("Unesite tip Inspekcije : ");
            int tip_id = 0;
            ui_input();
            cin>>tip_id;

            ui_print("Unesite datum");
            ui_input();
            int dy,mnth,yr,sati,minute;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            ui_input();
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            ui_input();
            cin>>yr; //"1.1.2019"

            ui_print("Sati : ");
            ui_input();
            cin>>sati;

            ui_print("Minute : ");
            ui_input();
            cin>>minute;

            SADateTime datum(yr,mnth,dy,sati,minute,0);

            ui_print("Zelite li opis  Y/N ");
            ui_input();
            char tmp;
            cin>>tmp;
            string opis = "@";
            if(tmp == 'Y' || tmp == 'y'){
                ui_print("Opis : \n");
                ui_input();
                cin>>tmp;
                getline(cin,opis);
                opis = tmp + opis;
            }

            SACommand cmd(&con);

            cout<<endl<<"Tip : " << tip_id<< '\n'<< "Datum : " <<dy<<'.'<<mnth<<'.'<<yr<<'\n' << "Opis : " << opis<<endl;
            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                cmd.setCommandText("VODITELJ_ODJELA_PACK.insertINSPEKCIJA");


                cmd.Param("p_ins_id").setAsNumeric() = 0.0;
                cmd.Param("p_ins_tip_id").setAsNumeric() = tip_id + 0.0;
                cmd.Param("p_datum").setAsDateTime() = datum;
                cmd.Param("p_opis").setAsString() = opis.c_str();

                ui_clear();
                ui_separator();
                ui_print("OK");
                ui_separator();


                try {  cmd.Execute();
                    ui_separator();
                    ui_print("OK");
                    ui_separator();}
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        } //
        else if (stavke_izbornik[odabir + offset] == "Dodaj Doktora na Inspekciju") {

            ui_print("Unesite ID doktora");
            ui_input();
            int zapId;
            cin >> zapId;

            ui_print("Unesite ID Inspekcije");
            ui_input();
            int ambId;
            cin >> ambId;


            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.insertDOKTORInspekcija");

                cmd.Param("p_dok_id").setAsNumeric() = 0.0;
                cmd.Param("p_inspekcija_id").setAsNumeric() = ambId + 0.0;
                cmd.Param("p_zaposlenik_id").setAsNumeric() = zapId + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }


        } //
        else if (stavke_izbornik[odabir + offset] == "Zakazane Inspekcije") {
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM ZAK_INS ", tipovi_ziv, con);
            ui_showTable(tipovi_ziv);
        } //
        else if (stavke_izbornik[odabir + offset] == "Izmjena opisa inspekcije") {
            ui_print("Unesite ID inspekcije : ");
            ui_input();
            int ID;
            cin >> ID;


            ui_print("Unesite Novi Opis : ");
            string opis = "@";
            {
                ui_print("Opis : \n");
                ui_input();
                char tmp;
                cin >> tmp;
                getline(cin, opis);
                opis = tmp + opis;
            }


            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("VODITELJ_ODJELA_PACK.update_opis_insp");

                cmd.Param("p_insp_id").setAsNumeric() = ID + 0.0;
                cmd.Param("p_opis").setAsString() = opis.c_str();

                ui_clear();
                ui_separator();
                ui_print("OK");

                try { cmd.Execute(); }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }


        } //


        else if (stavke_izbornik[odabir + offset] == "Dodaj Intervenciju") {

        }
        else if (stavke_izbornik[odabir + offset] == "Prikaz Intervencija") {

        }
        else if (stavke_izbornik[odabir + offset] == "Brisanje Intervencije") {

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