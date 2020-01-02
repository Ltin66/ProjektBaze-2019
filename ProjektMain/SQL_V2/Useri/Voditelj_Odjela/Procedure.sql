
CREATE OR REPLACE PACKAGE VODITELJ_ODJELA_PACK AS

    procedure del_insp (p_insp_id number);

    procedure add_doktor (p_amb_zap_id number, p_amb_id number, p_dok_id number);

    PROCEDURE insertINSPEKCIJA (
       p_ins_id IN INSPEKCIJA.INSPEKCIJA_ID%TYPE,
       p_ins_tip_id IN INSPEKCIJA.INSPEKCIJA_TIP_ID%TYPE,
       p_datum IN INSPEKCIJA.DATUM%TYPE,
       p_opis IN INSPEKCIJA.OPIS%TYPE);

    procedure update_opis_insp (p_insp_id number, p_opis clob);

    PROCEDURE deleteZIVOTINJA(p_zivotinja_id IN ZIVOTINJA.ZIVOTINJA_ID%TYPE);


    PROCEDURE insertDOKTORInspekcija (
       p_dok_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ZAPOSLENIK_ID%TYPE,
       p_inspekcija_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ID%TYPE,
       p_zaposlenik_id IN INSPEKCIJA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE);

     PROCEDURE deleteKORISNIK(p_korisnik_id IN KORISNIK.KORISNIK_ID%TYPE);

     procedure del_pregled (p_amb_id number);

    procedure del_doktor (p_amb_id number, p_zap_id number);


    END;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY VODITELJ_ODJELA_PACK AS


procedure del_insp (p_insp_id number)
is
begin
    delete from INSPEKCIJA where INSPEKCIJA_ID=p_insp_id;
      COMMIT;

end;

    --------------------------------------------------------------------------

procedure del_doktor (p_amb_id number, p_zap_id number)
is
begin
    delete from AMBULANTA_ZAPOSLENIK where AMBULANTA_ID=p_amb_id AND ZAPOSLENIK_ID=p_zap_id;
      COMMIT;

end del_doktor;



    --------------------------------------------------------------------------

 procedure del_pregled (p_amb_id number)
is
begin
    delete from AMBULANTA_KORISNIK_ZIVOTINJA where AMBULANTA_ID=p_amb_id;

    delete from AMBULANTA_ZAPOSLENIK where AMBULANTA_ID=p_amb_id;

    delete from AMBULANTA where AMBULANTA_ID=p_amb_id;
      COMMIT;

end del_pregled;

   --     9. promijeni opis inspekcije procedura

 procedure update_opis_insp (p_insp_id number, p_opis clob)
is
begin
    update inspekcija
        set opis = p_opis
    where inspekcija_id = p_insp_id;
      COMMIT;

end update_opis_insp;


--7. Dodaj inspekciju i doktora - procedura

 PROCEDURE insertINSPEKCIJA (
       p_ins_id IN INSPEKCIJA.INSPEKCIJA_ID%TYPE,
       p_ins_tip_id IN INSPEKCIJA.INSPEKCIJA_TIP_ID%TYPE,
       p_datum IN INSPEKCIJA.DATUM%TYPE,
       p_opis IN INSPEKCIJA.OPIS%TYPE)

IS
BEGIN

  INSERT INTO INSPEKCIJA (INSPEKCIJA_ID, INSPEKCIJA_TIP_ID, DATUM, OPIS)
  values (p_ins_id, p_ins_tip_id, p_datum, p_opis);

  COMMIT;

END;



--Doktor:
procedure add_doktor (p_amb_zap_id number, p_amb_id number, p_dok_id number)
is
begin
    insert into AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
    values (p_amb_zap_id, p_amb_id, p_dok_id);
      COMMIT;

end add_doktor;



 PROCEDURE insertDOKTORInspekcija (
       p_dok_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ZAPOSLENIK_ID%TYPE,
       p_inspekcija_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ID%TYPE,
       p_zaposlenik_id IN INSPEKCIJA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE)

IS
BEGIN

  INSERT INTO INSPEKCIJA_ZAPOSLENIK (INSPEKCIJA_ZAPOSLENIK_ID, INSPEKCIJA_ID, ZAPOSLENIK_ID)
  values (p_dok_id, p_inspekcija_id, p_zaposlenik_id);

  COMMIT;


END;


------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------
--7. Izbriši korisnika - procedura
 PROCEDURE deleteKORISNIK(p_korisnik_id IN KORISNIK.KORISNIK_ID%TYPE)
IS
BEGIN

  DELETE KORISNIK WHERE KORISNIK_ID = p_korisnik_id;

  COMMIT;

END;

PROCEDURE deleteZIVOTINJA(p_zivotinja_id IN ZIVOTINJA.ZIVOTINJA_ID%TYPE)
IS
BEGIN

  DELETE ZIVOTINJA WHERE ZIVOTINJA_ID = p_zivotinja_id;

  COMMIT;

END;
------------------------------------------------------------------------------------------------------------------------
END; --PROCEDURE BODY






--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------







BEGIN
   INSERTDOKTOR(5,5,5);
END;


BEGIN
   deleteKORISNIK(10);
END;


BEGIN
   INSERTINSPEKCIJA(5,3, TO_DATE('25.03.2009','DD.MM.YYYY'), 'Inspekcija mlijeka na farmi');
END;

