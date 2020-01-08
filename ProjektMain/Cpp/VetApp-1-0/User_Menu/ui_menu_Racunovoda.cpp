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

    stavke_izbornik.push_back("Popis Zaposlenika"); //RAC_ZAP_INFO //OK RADI +
    stavke_izbornik.push_back("Izracun Place");  // OK +
    stavke_izbornik.push_back("Unos Zaposlenika"); // OK  +

    stavke_izbornik.push_back("Unos Radnog statusa zaposlenika"); // OK +
    stavke_izbornik.push_back("Popis Radnih Mjesta"); // OK +
    stavke_izbornik.push_back("Status Zaposlenika"); //OK +

    stavke_izbornik.push_back("Prikaz Rasporeda"); //OK +
    stavke_izbornik.push_back("Unos Rasporeda"); //OK +
    stavke_izbornik.push_back("Unos Dolaska"); // updateZAPOSLENIK_dolazak //OK +
    stavke_izbornik.push_back("Unos Odlaska"); // updateZAPOSLENIK_odlazak //OK +

    stavke_izbornik.push_back("Prikaz Cijene za Inspekciju ID"); // selectINSPEKCIJA_CIJENA //OK  +
    stavke_izbornik.push_back("Prikaz Cijene za Ambulantu"); // selectAMBULANTA_USLUGA_CIJENA //OK  RADI +
    stavke_izbornik.push_back("Prikaz ukupne cijene Posjeta Ambulanti za razdoblje"); //OK RADI +


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
        else if(stavke_izbornik[odabir+offset] == "Izracun Place") {
            ui_print("Unesite ID Zaposlenika :");
            ui_input();
            int id;
            cin >> id;

            ui_print("Unesite Mjesec : ");
            ui_input();
            int mj;
            cin >> mj;

            ui_print("Unesite Godinu : ");
            ui_input();
            int god;
            cin >> god;

            SACommand cmd(&con);

            cout << "Jeste lis zadovoljni sa unosom ?";
            if (ui_confirm()) {

                cmd.setCommandText("RACUNOVODA_PACK.zap_placa");

                cmd.Param("p_zap_id").setAsNumeric() = id + 0.0;
                cmd.Param("p_DD").setAsNumeric() = mj + 0.0;
                cmd.Param("p_YYYY").setAsNumeric() = god + 0.0;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                    string plc = string(cmd.Param("o_placa").asString());
                    ui_print("Ukupna placa : " + plc);
                    ui_print("(I)zlaz");
                    cin >> plc;
                }
                catch (SAException &x) { printf("%s\n", (const char *) x.ErrText()); }

            }
        }
        else if(stavke_izbornik[odabir+offset] == "Unos Zaposlenika"){
            ui_print("Unesite ime Zaposlenika :");
            ui_input();
            string ime;
            cin>>ime;

            ui_print("Unesite Srednje Ime ili '@' ako nema : ");
            ui_input();
            string sred_ime;
            cin>>sred_ime;

            ui_print("Unesite Prezime Zaposlenika : ");
            ui_input();
            string prez_ime;
            cin>>prez_ime;

            ui_print("Unesite Sifru Zaposlenika : ");
            ui_input();
            string sifra;
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
            int jmbg;
            cin>>jmbg;

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("RACUNOVODA_PACK.ADD_ZAP");

                cmd.Param("p_zap_id").setAsNumeric() =  0.0;
                cmd.Param("p_ime").setAsString() = ime.c_str() ;
                cmd.Param("p_sr_ime").setAsString() = sred_ime.c_str() ;
                cmd.Param("p_prez").setAsString() = prez_ime.c_str() ;
                cmd.Param("p_sifra").setAsString() = sifra.c_str() ;
                cmd.Param("p_dat_zap").setAsDateTime() = datum ;
                cmd.Param("p_jmbg").setAsNumeric() = jmbg + 0.0 ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }


            }
        }

        else if(stavke_izbornik[odabir+offset] == "Unos Radnog statusa zaposlenika"){

            ui_print("Unesite ID Zaposlenika : ");
            int id;
            ui_input();
            cin>>id;

            ui_print("Unesite Satnicu Zaposlenika : ");
            double satnc;
            ui_input();
            cin>>satnc;

            ui_print("Unesite ID Radnog Mjesta : ");
            ui_input();
            int rad_mj;
            cin>>rad_mj;



            ui_print("Unesite datum pocetka : ");
            ui_input();
            int dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum(yr,mnth,dy);


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("RACUNOVODA_PACK.add_rad_stat");

                cmd.Param("p_stat_id").setAsNumeric() =  0.0;
                cmd.Param("p_zap_id").setAsNumeric() =  id + 0.0;
                cmd.Param("p_dat_poc").setAsDateTime() =  datum;
                cmd.Param("p_bilj").setAsString() =  " ";
                cmd.Param("p_satnica").setAsNumeric() =  satnc;
                cmd.Param("p_tj_sati").setAsNumeric() =  48 + 0.0;
                cmd.Param("p_rad_stat_tip_id").setAsNumeric() =  rad_mj + 0.0;


                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }

        }
        else if(stavke_izbornik[odabir+offset] == "Popis Radnih Mjesta"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM RAC_RADNA_MJESTA_TIP ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Status Zaposlenika"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM rac_zap_rad_stat ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }


        else if(stavke_izbornik[odabir+offset] == "Prikaz Rasporeda"){
            dbTable tipovi_ziv;
            CommandToTable("Select * FROM RASPOREDI_7_DANA ",tipovi_ziv,con);
            ui_showTable(tipovi_ziv);
        }
        else if(stavke_izbornik[odabir+offset] == "Unos Rasporeda"){
            ui_print("Unesite ID Zaposlenika : ");
            int id;
            ui_input();
            cin>>id;

            ui_print("Unesite datum : ");
            ui_input();
            int dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"

            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"

            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"

            SADateTime datum(yr,mnth,dy);


            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){

                cmd.setCommandText("RACUNOVODA_PACK.add_raspored");

                cmd.Param("p_zap_id").setAsNumeric() = id +  0.0;
                cmd.Param("p_dat").setAsDateTime() =  datum;
                cmd.Param("p_sat_dol").setAsNumeric() =   0.0;
                cmd.Param("p_sat_odl").setAsNumeric() =  0.0;
                cmd.Param("p_odr_sat").setAsNumeric() =  0.0;


                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }

            }
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

            ui_print("Unesite Sate Dolaska");
            ui_input();
            int hh;
            cin>>hh; //"1.1.2019"

            ui_print("Unesite Minute Dolaska");
            int mm;
            ui_input();

            cin>>mm; //"1.1.2019"

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                string cijena = " ";

                cmd.setCommandText("RACUNOVODA_PACK.updateZAPOSLENIK_sati_dolazak");

                cmd.Param("p_id").setAsNumeric() = id + 0.0;
                cmd.Param("p_datum").setAsDateTime() = datum ;
                cmd.Param("p_sati_dolazak").setAsNumeric() = float(float(hh) + float(float(mm)/100)) ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }


            }


        }
        else if(stavke_izbornik[odabir+offset] == "Unos Odlaska"){ //updateZAPOSLENIK_dolazak
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

            ui_print("Unesite Sate Odlaska");
            ui_input();
            int hh;
            cin>>hh; //"1.1.2019"

            ui_print("Unesite Minute Odlaska");
            int mm;
            ui_input();

            cin>>mm; //"1.1.2019"

            SACommand cmd(&con);

            cout<<"Jeste lis zadovoljni sa unosom ?";
            if(ui_confirm()){
                string cijena = " ";

                cmd.setCommandText("RACUNOVODA_PACK.updateZAPOSLENIK_sati_odlazak");

                cmd.Param("p_id").setAsNumeric() = id + 0.0;
                cmd.Param("p_datum").setAsDateTime() = datum ;
                cmd.Param("p_sati_odlazak").setAsNumeric() = float(float(hh) + float(float(mm)/100))  ;

                ui_clear();
                ui_separator();
                ui_print("OK");

                try {
                    cmd.Execute();
                }
                catch(SAException & x) {printf("%s\n", (const char*)x.ErrText()); }


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
                cout<<"(I)zlaz";
                char c = 0;//IZLAZ
                ui_input();
                cin>>c;
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
                cout<<"(I)zlaz";
                char c = 0;//IZLAZ
                ui_input();
                cin>>c;
            }
        }
        else if(stavke_izbornik[odabir+offset] == "Prikaz ukupne cijene Posjeta Ambulanti za razdoblje"){
            ui_print("Unesite datum pocetka : ");
            ui_input();
            string dy,mnth,yr;
            ui_print("Dan : ");
            cin>>dy; //"1.1.2019"
            if(dy.length() == 1) dy = "0" + dy;


            ui_print("Mjesec : ");
            cin>>mnth; //"1.1.2019"
            if(mnth.length() == 1) mnth = "0" + mnth;


            ui_print("Godina : ");
            cin>>yr; //"1.1.2019"


            ui_print("Unesite datum kraja : ");
            ui_input();
            string dyd,mnthd,yrd;
            ui_print("Dan : ");
            cin>>dyd; //"1.1.2019"
            if(dy.length() == 1) dyd = "0" + dyd;


            ui_print("Mjesec : ");
            cin>>mnthd; //"1.1.2019"
            if(mnthd.length() == 1) mnthd = "0" + mnthd;

            ui_print("Godina : ");
            cin>>yrd; //"1.1.2019"

            dbTable tipovi_ziv;
            CommandToTable("\r\nselect * from table(amb_cijena_par_view_pack.vrati_tablicu(   "
                           "to_date(\'" + dyd + "." +mnthd +"."+ yrd + " 00:00:00\',\'dd.mm.yyyy  hh24:mi:ss\'),   "
                           "to_date(\'" + dy + "." +mnth +"."+ yr + " 00:00:00\',\'dd.mm.yyyy  hh24:mi:ss\')))"
                           ,tipovi_ziv,con);
            ui_showTable(tipovi_ziv);

    }
    }
}
