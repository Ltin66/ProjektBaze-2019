//
// Created by tin on 11/27/19.
//

#ifndef VETAPP_1_0_UI_MAIN_H
#define VETAPP_1_0_UI_MAIN_H


#include <string>
#include "dbConnection.h"
#include "dbTablice.h"

//void ui_error(std::string err_msg = "ERROR", int err_num = -1);


int num_of_char_in_str(std::string str);


void ui_print_menu(std::vector< std::string > stavke,const std::string& naslov,int naslov_space = 6,int stavke_space = 2,int size = 1,bool flg = false);

std::string ui_format_str_by_len(std::string data,int max_size);

bool ui_confirm();

void ui_print(const std::string& val,int size = 1);

void ui_clear(int n = 40);

void ui_separator(int n = 40);

void ui_input();

int ui_prijava(korisnik &kor);

void ui_postavke();

int ui_showTable(dbTable &Table,const int MaxCollumnSize = 20,const int MaxCollumnS = 3,const int PrintPauseLen = 10,const bool redni_broj = false);

void ui_error(const std::string& err_msg = "ERROR", int err_num = -1);

const std::string ui_intro_banner [5] = {
        (R"( __     __   _            _                    ____                 )"),
        (R"( \ \   / /__| |_ ___ _ __(_)_ __   __ _ _ __  | __ )  __ _ ______ _ )"),
        (R"(  \ \ / / _ \ __/ _ \ '__| | '_ \ / _` | '__| |  _ \ / _` |_  / _` |)"),
        (R"(   \ V /  __/ |_  __/ |  | | | | | (_| | |    | |_) | (_| |/ / (_| |)"),
        (R"(    \_/ \___|\__\___|_|  |_|_| |_|\__,_|_|    |____/ \__,_/___\__,_|)")
};



#endif //VETAPP_1_0_UI_MAIN_H




/*
 __     __   _            _                    ____
 \ \   / /__| |_ ___ _ __(_)_ __   __ _ _ __  | __ )  __ _ ______ _
  \ \ / / _ \ __/ _ \ '__| | '_ \ / _` | '__| |  _ \ / _` |_  / _` |
   \ V /  __/ |_  __/ |  | | | | | (_| | |    | |_) | (_| |/ / (_| |
    \_/ \___|\__\___|_|  |_|_| |_|\__,_|_|    |____/ \__,_/___\__,_|



 */

