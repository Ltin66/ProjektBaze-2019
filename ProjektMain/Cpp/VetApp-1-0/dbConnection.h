//
// Created by tin on 11/27/19.
//

#ifndef VETAPP_1_0_DBCONNECTION_H
#define VETAPP_1_0_DBCONNECTION_H

#include <string>
#include<SQLAPI.h>
#include <iostream>
#include<cstdio>

struct korisnik{
    std::string db_name;
    std::string username;
    std::string password;
    std::string eSAClient;
};

std::string dbConnect(korisnik ko,SAConnection &con);

std::string dbDisconnect(SAConnection &con);

#endif //VETAPP_1_0_DBCONNECTION_H