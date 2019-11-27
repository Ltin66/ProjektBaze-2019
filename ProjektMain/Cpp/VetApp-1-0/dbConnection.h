//
// Created by tin on 11/27/19.
//

#ifndef VETAPP_1_0_DBCONNECTION_H
#define VETAPP_1_0_DBCONNECTION_H

#include <string>
#include <SQLAPI.h>
#include <iostream>
#include <cstdio>

struct korisnik{
    std::string db_string;
    std::string username;
    std::string password;

    //const char* password;

    SAString    SA_db_string;
    SAString    SA_username;
    SAString    SA_passwd;
};

std::string dbConnect(korisnik kor,SAConnection &con);

std::string dbDisconnect(SAConnection &con);

#endif //VETAPP_1_0_DBCONNECTION_H