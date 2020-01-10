create table log_login_logout (Naziv varchar2(30), vijeme date, tip varchar2(10));

create or replace trigger TRIG_LOGIN
after logon on database
begin
insert into log_login_logout values (user, sysdate, 'LOGON');
commit;
end TRIG_LOGIN;

create or replace trigger TRIG_LOGOUT
before logoff on database
begin
insert into log_login_logout values (user, sysdate, 'LOGOFF');
commit;
end TRIG_LOGOUT;


select Naziv,MAX(vijeme) Vrijeme from log_login_logout WHERE tip = 'LOGON' GROUP BY Naziv;
select * from log_login_logout;

