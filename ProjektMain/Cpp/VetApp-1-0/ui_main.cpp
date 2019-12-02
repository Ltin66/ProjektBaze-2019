//
// Created by tin on 11/27/19.
//

#include "dbConnection.h"
#include <vector>
#include <list>

#define TypeTable std::vector < std::list <std::string> >


using namespace std;

void ui_clear(int n = 20){
    for(int i=0;i<n;i++) cout<<endl;
}

void ui_separator(int n = 20){
    cout<<endl;
    for(int i=0;i<n;i++) cout<<"-";
    cout<<endl;
}

void ui_input(){
    cout<<endl<<">> ";
}

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

    cout<<"Jeste li zadovoljni sa unosom (Y/N) : ";
    ui_input();
    cin>>tmp;
    if(tmp == 'Y' || tmp == 'y') flg = false;
}

    kor.db_string = "XE";
    kor.username =  tmp_name;
    kor.password =  tmp_passwd;

    kor.SA_db_string = kor.db_string.c_str();
    kor.SA_passwd    = kor.password.c_str();
    kor.SA_username  = kor.username.c_str();
    //cout<<kor.username;



    return 0;
}

int ui_showTable(TypeTable &table){

}

