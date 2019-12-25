//
// Created by tin on 12/22/19.
//
//Fale : Zakazani pregledi i ispis svih pregleda za korisnikID

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

    stavke_izbornik.push_back("Informacije o Ambulanti");   //SelectAmbulanta   //todo
    stavke_izbornik.push_back("Zakazani pregledi");         //fali
    stavke_izbornik.push_back("Dodavanje pregleda");        //InsertAmbulanta    //OK  RADI
    stavke_izbornik.push_back("Izmjena opisa pregleda");    //UpdateAmbulanta_opis    //OK
    stavke_izbornik.push_back("Dodavanje Korisnika");       //InsertKorisnik     //OK
    stavke_izbornik.push_back("Dodavanje Zivotinje");       //InsertZivotinja      //OK
    stavke_izbornik.push_back("Spajanje Zivotinje i Korisnika");    //InsertKorisnikZivotinja   //OK
    stavke_izbornik.push_back("Svi Pregledi Podjedinog Korisnika"); //fali
    stavke_izbornik.push_back("Prikaz Zaposlenika");                //Zaposlenik, ne svi attr      MOŽDA ->  //onaj mat_view gjde se manje vidi, TODO refresh view MOŽDA
    stavke_izbornik.push_back("Prikaz Tipova Zivotinja");// doktor_tipovi_zivotinja   //view OK RADI
    stavke_izbornik.push_back("Prikaz Usluga Ambulante");  //doktor_tipovi_usluga       //view OK RADI
    stavke_izbornik.push_back("Dodavanje Doktora na Pregled");//InsertDoktor_Ambulanta  //OK
    stavke_izbornik.push_back("Prikaz svih ID-a Korisnika i njihovih Zivotinja");//KorisnikView //OK RADI
    stavke_izbornik.push_back("Prikaz opisa AmbulanteID"); //TODO

    for(int i= 0;i<stavke_izbornik.size();i++) if(stavke_izbornik[i] == " ") offset++;

    //offset += offset_pl;

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

        else if(stavke_izbornik[odabir+offset] == "Informacije o Ambulanti"){

        }
        else if(stavke_izbornik[odabir+offset] == "Zakazani pregledi"){

        }
        else if(stavke_izbornik[odabir+offset] == "Dodavanje pregleda"){
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

            cout<<endl<<"ID : " << ID << '\n'<< "Datum : " <<dy<<'.'<<mnth<<'.'<<yr<<'\n' << "Opis : " << opis<<endl;
            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                cmd.setCommandText("DOKTOR_PACK.INSERTAMBULANTA");


            cmd.Param("p_amb_id").setAsNumeric() = 0.0;
            cmd.Param("p_amb_usl_id").setAsNumeric() = ID + 0.0;
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
        }
        else if(stavke_izbornik[odabir+offset] == "Izmjena opisa pregleda"){
            ui_print("Unesite ID pregleda : ");
            ui_input();
            int ID;
            cin>>ID;


            ui_print("Unesite Novi Opis : ");
            string opis = "@";
            {
                ui_print("Opis : \n");
                ui_input();
                char tmp;
                cin>>tmp;
                getline(cin,opis);
                opis = tmp + opis;
            }


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

            cmd.setCommandText("DOKTOR_PACK.updateAMBULANTA_opis");

            cmd.Param("p_id").setAsNumeric() = ID + 0.0;
            cmd.Param("p_opis").setAsString() = opis.c_str();

            ui_clear();
            ui_separator();
            ui_print("OK");

                try {  cmd.Execute(); }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        }
        else if(stavke_izbornik[odabir+offset] == "Dodavanje Korisnika"){
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

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("DOKTOR_PACK.insertKORISNIK");

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
        else if(stavke_izbornik[odabir+offset] == "Dodavanje Zivotinje"){
            ui_print("Unesite Tip Zivotinje");
            ui_input();
            int tip;
            cin>>tip;

            ui_print("Unesite Ime Zivotinje");
            ui_input();
            string ime;


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

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("DOKTOR_PACK.INSERTZIVOTINJA");

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
        else if(stavke_izbornik[odabir+offset] == "Spajanje Zivotinje i Korisnika"){
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

                cmd.setCommandText("DOKTOR_PACK.INSERTKORISNIK_ZIVOTINJA");

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
        else if(stavke_izbornik[odabir+offset] == "Svi Pregledi Podjedinog Korisnika"){

        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Zaposlenika"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM veterinar_sys.zaposlenik ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Tipova Zivotinja"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM doktor_tipovi_zivotinja ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Usluga Ambulante"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM doktor_tipovi_usluga ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Dodavanje Doktora na Pregled"){

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

                cmd.setCommandText("DOKTOR_PACK.insertDOKTOR_AMBULANTA");

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
        else if(stavke_izbornik[odabir+offset] == "Prikaz svih ID-a Korisnika i njihovih Zivotinja"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM korisnik_view ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz opisa AmbulanteID"){

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
 *//*
        //OK znaci da je napravljen, neznaci da radi kako treba
        //RADI znaci da radi

        ui_print("Izbornik");

        ui_print("1 - Informacije o Ambulanti ID");

        ui_print("2 - Zakazani pregledi");
        ui_print("3 - Dodavanje pregleda");
        ui_print("4 - Izmjena opisa pregleda");
        ui_print("5 -  Dodavanje korisnika");

        ui_print("7 -  Dodavanje zivotinje");

        ui_print("9 -  Spajanje Zivotinje i korisnika");

        ui_print("11 - Ispis pregleda za pojedinog Korisnika");
        ui_print("12 - Prikaz zaposlenika");

        ui_print("13 -  Prikaz Tipova Zivotinja");
        ui_print("14 -  Prikaz Usluga");

        ui_print("15 -  Dodavanje Doktora na Pregled");

        ui_print("16 -  Prikaz svih ID-a Korisnika i njihovih Zivotinja");

        ui_print("17 -   Prikaz opisa AmbulanteID"); //TODO

        ui_print("0 -  Izlaz iz Programa");
        ui_print("10 - Izlaz u Glavni Izbornik");

*/