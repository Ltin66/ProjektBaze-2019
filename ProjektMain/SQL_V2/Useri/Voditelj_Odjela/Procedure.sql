CREATE OR REPLACE PACKAGE VODITELJ_ODJELA_PACK AS

    PROCEDURE insertDOKTOR_AMBULANTA (
       p_amb_dok_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ZAPOSLENIK_ID%TYPE,
       p_amb_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ID%TYPE,
       p_zap_id IN AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE);


    PROCEDURE insertINSPEKCIJA (
       p_ins_id IN INSPEKCIJA.INSPEKCIJA_ID%TYPE,
       p_ins_tip_id IN INSPEKCIJA.INSPEKCIJA_TIP_ID%TYPE,
       p_datum IN INSPEKCIJA.DATUM%TYPE,
       p_opis IN INSPEKCIJA.OPIS%TYPE);

    procedure update_opis_insp (p_insp_id number, p_opis clob);


    PROCEDURE insertDOKTORInspekcija (
       p_dok_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ZAPOSLENIK_ID%TYPE,
       p_inspekcija_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ID%TYPE,
       p_zaposlenik_id IN INSPEKCIJA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE);

     PROCEDURE deleteKORISNIK(p_korisnik_id IN KORISNIK.KORISNIK_ID%TYPE);


    END;

--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------

CREATE OR REPLACE PACKAGE BODY VODITELJ_ODJELA_PACK AS



   --     9. promijeni opis inspekcije procedura

 procedure update_opis_insp (p_insp_id number, p_opis clob)
is
begin
    update inspekcija
        set opis = p_opis
    where inspekcija_id = p_insp_id;
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
PROCEDURE insertDOKTOR_AMBULANTA (
       p_amb_dok_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ZAPOSLENIK_ID%TYPE,
       p_amb_id IN AMBULANTA_ZAPOSLENIK.AMBULANTA_ID%TYPE,
       p_zap_id IN AMBULANTA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE)

IS
BEGIN

  INSERT INTO AMBULANTA_ZAPOSLENIK (AMBULANTA_ZAPOSLENIK_ID, AMBULANTA_ID, ZAPOSLENIK_ID)
  values (p_amb_dok_id, p_amb_id, p_zap_id);

  COMMIT;

END;


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

