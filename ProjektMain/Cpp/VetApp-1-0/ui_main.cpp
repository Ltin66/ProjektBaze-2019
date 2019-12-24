//
// Created by tin on 11/27/19.
//
//ispis raznih simbola i teksta se radi iz par funkcja kako bi se lakše mogao promijeniti
//stil ispisa cijelog programam


#include "dbConnection.h"
#include <vector>
#include <list>
#include "dbTablice.h"


using namespace std;


//ispisuje string -> val, trebao se zvati ui_println
void ui_print(const string& val,int size = 1){
    cout<<val<<endl;
}

//ispisuje  \n
void ui_clear(int n = 40){
    for(int i=0;i<n;i++) cout<<endl;
}

//ispisuje '-' (crtice) , služi kako bi se grafički,horizontalno odvojili  dijelovi teksta
void ui_separator(int n = 40){
    cout<<endl;
    for(int i=0;i<n;i++) cout<<"-";
    cout<<endl;
}

//ispisuje da se traži unos podataka (kao simbol za to je stavljeno ">> " )
void ui_input(){
    cout<<endl<<">> ";
}

//dodaje n razmaka
void ui_add_space(int len = 1){
    for(len;len >0;len--) cout<<" ";
}

//prijava korisnika u bazu
int ui_prijava(korisnik &kor){


    bool flg = true;
    char tmp;
    string tmp_name,tmp_passwd;

while(flg){

    ui_clear(15);

    cout<<"Prijava"<<endl;
    cout<<"Unesite username :  ";
    ui_input();
    cin>>tmp_name;
    cout<<endl<<"Unesite password :  ";
    ui_input();
    cin>>tmp_passwd;

    ui_clear(2);

    cout<<"Jeste li zadovoljni sa unosom ( (Y)es / (N)o / (E)xit ) : ";
    ui_input();
    cin>>tmp;
    if(tmp == 'Y' || tmp == 'y') flg = false;
    else if(tmp == 'E' || tmp == 'e') return -1;
}

    kor.db_string = "XE";
    kor.username =  tmp_name;
    kor.password =  tmp_passwd;

    kor.SA_db_string = kor.db_string.c_str();
    kor.SA_passwd    = kor.password.c_str();
    kor.SA_username  = kor.username.c_str();
    //cout<<kor.username;



    return 501;
}

//TODO
void ui_postavke(){
    cout<<"Bravo";
}

//funkcija za ispis tablica
int ui_showTable(dbTable &Table,int MaxRowSize = 20, int MaxCollumnSize = 20,int PrintPauseLen = 10,bool redni_broj = false){

    //cout<<"INFO : "<<endl

    cout<<"Redni Broj ";
    if(!Table.CollName.empty()) for(int i = 0;i<Table.ColCnt;i++) cout<<Table.CollName[i]<<" || ";

    //cout<<endl<<Table.ColCnt;
    //cout<<endl<<Table.Data[0][0]<<" | "<<endl<<endl;

    for(int i = 0;i < Table.RowCnt;i++){
        if(redni_broj) cout<<i + 1<<" || ";
        cout<<endl;
        for(int j = 0;j < Table.ColCnt;j++) cout<<Table.Data[j][i]<<" | ";
    }


}

//funkcija za ispis errora
void ui_error(const string& err_msg = "ERROR", int err_num = -1){
    ui_separator();
    if(err_num != -1) cout<<endl<<err_msg<<" : "<<err_num;
    else cout<<"\n"<<err_msg<<"\n";
    ui_separator();
}

//fun za potvrdivanje
bool ui_confirm(){
    cout<<"\n Jeste li Sigurni? \n (Y)es / (N)o ";
    char tmp = 0;
    ui_input();
    cin>>tmp;
    return tmp == 'y' || tmp == 'Y';
}



//ispisuje meni , stavke se unose u vektor string "stavke"
void ui_print_menu(vector< string > stavke,const string& naslov,int naslov_space = 6,int stavke_space = 2,int size = 1,bool flg = false){
    ui_clear(40);
    ui_clear(40);

    ui_separator();
    cout<<endl;
    ui_add_space(naslov_space);
    cout<<naslov<<endl;
    ui_separator();

    int stv_len = stavke.size();

    int offset = 0; //za stavit razmak izmedu stavki

    for(int i = 0; i < stv_len; i++){

        ui_add_space(stavke_space);

        if(i<10) ui_add_space(3);
        else ui_add_space(2);

        if(stavke[i] != " ")   cout<<i  - offset<<" -- "<<stavke[i];
        else offset++;
        cout<<endl;
    }

    ui_separator();
    cout<<'\n';
}


