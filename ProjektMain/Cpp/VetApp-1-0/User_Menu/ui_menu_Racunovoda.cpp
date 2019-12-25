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

    stavke_izbornik.push_back("Popis Zaposlenika");
    stavke_izbornik.push_back("Izracun Place");
    stavke_izbornik.push_back("Unos Zaposlenika");
    stavke_izbornik.push_back("Raspored");
    stavke_izbornik.push_back("Unos Rasporeda");
    stavke_izbornik.push_back("Unos Dolaska");

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

        else if(stavke_izbornik[odabir+offset] == "Popis Zaposlenika"){

        }
        else if(stavke_izbornik[odabir+offset] == "Izracun Place"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Zaposlenika"){

        }
        else if(stavke_izbornik[odabir+offset] == "Raspored"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Rasporeda"){

        }
        else if(stavke_izbornik[odabir+offset] == "Unos Dolaska"){

        }



    }
}

