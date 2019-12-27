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

    stavke_izbornik.push_back("Popis Zaposlenika"); //RAC_ZAP_INFO //OK
    stavke_izbornik.push_back("Izracun Place");  // fali
    stavke_izbornik.push_back("Unos Zaposlenika"); // fali
    stavke_izbornik.push_back("Unos Statusa Zaposlenika"); // fali
    stavke_izbornik.push_back("Status Zaposlenika"); //fali
    stavke_izbornik.push_back("Raspored"); // fali
    stavke_izbornik.push_back("Unos Rasporeda"); // fali
    stavke_izbornik.push_back("Unos Dolaska"); // updateZAPOSLENIK_dolazak //OK
    stavke_izbornik.push_back("Prikaz Cijene za Inspekciju ID"); // selectINSPEKCIJA_CIJENA //OK
    stavke_izbornik.push_back("Prikaz Cijene za Ambulantu"); // selectAMBULANTA_USLUGA_CIJENA //OK


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

        else if(stavke_izbornik[odabir+offset] == "Popis Zaposlenika"){ //RAC_ZAP_INFO
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM RAC_ZAP_INFO ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Izracun Place"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Zaposlenika"){

        }
        else if(stavke_izbornik[odabir+offset] == "Raspored"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Rasporeda"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Dolaska"){ //updateZAPOSLENIK_dolazak
            ui_print("Unesite ID Zaposlenika : ");
            int id;
            ui_input();
            cin>>id;


            ui_print("Unesite datum Rasporeda");
            ui_input();
            int dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum(yr,mnth,dy);

            ui_print("Unesite datum Dolaska");
            ui_input();
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum_dolaska(yr,mnth,dy);


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                string cijena = " ";

                cmd.setCommandText("RACUNOVODA_PACK.updateZAPOSLENIK_dolazak");

                cmd.Param("p_id").setAsNumeric() = id + 0.0;
                cmd.Param("p_datum").setAsDateTime() = datum ;
                cmd.Param("p_dat_dolaska").setAsDateTime() = datum_dolaska ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

                ui_print("Cijena "+to_string(id)+" Inspekcije : "+ cijena);
            }


        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Cijene za Inspekciju ID"){
            ui_print("Unesite ID Inspekcije : ");
            int id;
            ui_input();
            cin>>id;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                string cijena = " ";

                cmd.setCommandText("RACUNOVODA_PACK.selectINSPEKCIJA_CIJENA");

                cmd.Param("p_id").setAsNumeric() = id + 0.0; ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                    cijena = cmd.Param("o_cijena").asString();

                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

                ui_print("Cijena "+to_string(id)+" Inspekcije : "+ cijena);
            }

        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz Cijene za Ambulantu"){
            ui_print("Unesite ID Ambulante : ");
            int id;
            ui_input();
            cin>>id;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                string cijena = " ";

                cmd.setCommandText("RACUNOVODA_PACK.selectAMBULANTA_USLUGA_CIJENA");

                cmd.Param("p_id").setAsNumeric() = id + 0.0; ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                    cijena = cmd.Param("o_cijena").asString();

                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

                ui_print("Cijena "+to_string(id)+" Usluge : "+ cijena);
            }
        }



    }
}

