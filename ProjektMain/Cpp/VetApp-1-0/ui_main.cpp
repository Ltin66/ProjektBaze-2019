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


//vraca duljinu stringa
int num_of_char_in_str(string str)
{
    int i = 0, j = 0;
    while (str[i])
    {
        if ((str[i] & 0xc0) != 0x80) j++;
        i++;
    }
    return j;
}


string ui_format_str_by_len(string data, int max_size){

    int str_ch_len = num_of_char_in_str(data);

    if(str_ch_len > max_size) return data.substr(0,max_size-3) + "...";
    string spc ((max_size - str_ch_len)  , ' ');
    data = data + spc;

    return data;
}

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
int ui_showTable(dbTable &Table,const int MaxCollumnSize = 20,  int MaxCollumnS = 5,const int PrintPauseLen = 10,const bool redni_broj = false){

    int l_scr_offset = 2;

    MaxCollumnS --;

    int l_limit = 0;
    int r_limit = MaxCollumnS;
    int TableRowS_limit = Table.ColCnt - 1;

    if(r_limit > TableRowS_limit) r_limit = TableRowS_limit;

    ui_clear();

    if(redni_broj) cout<<"Redni Broj ";

    //ISPIS IMENA STUPACA
    if(!Table.CollName.empty()) for(int i = l_limit;i<=r_limit;i++) cout<<ui_format_str_by_len(Table.CollName[i],MaxCollumnSize)<<"  ||  ";

    ui_separator(MaxCollumnSize * (r_limit - l_limit + 1) + 4 * (r_limit - l_limit + 1) );

    //ISPIS TABLICE
    for(int i = 0;i < Table.RowCnt;i++){

        if(redni_broj) cout<<i + 1<<" || ";
        cout<<endl;

        //ISPIS REDA
        for(int j = l_limit;j <= r_limit;j++) cout<<ui_format_str_by_len(Table.Data[j][i],MaxCollumnSize)<<"  ||  ";


        //KRETANJE PO TABLICI
        if((i % PrintPauseLen == 0 && i != 0) || i+1 == Table.RowCnt){

            ui_separator(MaxCollumnSize * (r_limit - l_limit + 1) + 4 * (r_limit - l_limit + 1) );

            cout<<endl<<"Stranica : "<<
            (i%PrintPauseLen ? i / PrintPauseLen + 1 : i / PrintPauseLen )
            <<"/"<<
            (Table.RowCnt%PrintPauseLen ? Table.RowCnt / PrintPauseLen + 1 : Table.RowCnt / PrintPauseLen) <<endl;

            //ISPIS OPCIJA
            cout<<"(I)zlaz";
            if(1 < i-PrintPauseLen) cout<<" || (G)ore";
            if(i+1 != Table.RowCnt) cout<<" || (D)olje  ";

            if(r_limit != TableRowS_limit) cout<<" || d(E)sno  ";
            if(l_limit !=   0) cout<<" || (L)ijevo  ";

            //UNOS OPCIJE
            cout<<'\n';
            char odabir = 0;
            cout<<endl<<i<<" "<<l_limit<<" "<<r_limit<<endl;
            ui_input();
            cin>>odabir;

            //IZLAZ
            if(odabir == 'I' || odabir == 'i') return 0; //da

            //GORE
            else if((1 < i-PrintPauseLen) && (odabir == 'G' || odabir == 'g')) {
                if(i+1 == Table.RowCnt) i = i -   PrintPauseLen - (i%10) ; //ako ih je manje od PrintPauseLen
                //else i == 1 ? i = i - PrintPauseLen*2 - 1 : i = i - PrintPauseLen*2 ; //Vrati natrag ()-1 jer +1 na kraju iter
                else i = i - PrintPauseLen - PrintPauseLen  ; //-2 = err
            }

            //DOLJE
            else if((i+1 != Table.RowCnt) && (odabir == 'D' || odabir == 'd')) i = i; //nastavi dolje

            //DESNO
            else if((r_limit != TableRowS_limit) && (odabir == 'E' || odabir == 'e')){
                l_limit = r_limit;
                if(r_limit + MaxCollumnS > TableRowS_limit) {
                    r_limit += TableRowS_limit - l_limit;
                    //l_limit--;
                }
                else r_limit += MaxCollumnS;


                if(i+1 == Table.RowCnt) i -= Table.RowCnt%PrintPauseLen - 1; //??
                else i -= PrintPauseLen ;
            }

            //LIJEVO
            else if((l_limit !=   0) && (odabir == 'L' || odabir == 'l')){
                if(r_limit  == TableRowS_limit) r_limit = l_limit;
                else r_limit -= MaxCollumnS;

                l_limit -= MaxCollumnS;

                if(l_limit == 0) r_limit = MaxCollumnS ;

                if(i+1 == Table.RowCnt) i -= Table.RowCnt%PrintPauseLen - 1;
                else i -= PrintPauseLen  ;
            }

            //VRATI
            else if(i+1 == Table.RowCnt) i -= Table.RowCnt%PrintPauseLen - 1;  //vrati ako nemože dolje, dali treba -1? neznam
            else i = i - PrintPauseLen ; //vrati

            if(i == 0) i = -1;
            ui_clear();

            //ISPIS IMENA STUPACA
            if(!Table.CollName.empty()) for(int i = l_limit;i<=r_limit;i++) cout<<ui_format_str_by_len(Table.CollName[i],MaxCollumnSize)<<"  ||  ";

            ui_separator(MaxCollumnSize * (r_limit - l_limit + 1) + 4 * (r_limit - l_limit + 1) );
        }

    }

    return 1;
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
    cout<<"\n Potvrdite odluku  (Y)es / (N)o ";
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


