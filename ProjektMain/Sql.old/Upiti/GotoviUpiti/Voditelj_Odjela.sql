--Voditelj_Odjela.sql
------------------------------------------------------------------------------------------------------------------------
--@@@ 5. Prikaži doktora za pregled ID - funkcija
------------------------------------------------------------------------------------------------------------------------
--6. Prikaži inspekcije - view

CREATE VIEW inspekcia_view AS
  SELECT * FROM INSPEKCIJA;
------------------------------------------------------------------------------------------------------------------------
--7. Dodaj inspekciju i doktora - procedura

CREATE OR REPLACE PROCEDURE insertINSPEKCIJA (
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
/

BEGIN
   INSERTINSPEKCIJA(5,3, TO_DATE('25.03.2009','DD.MM.YYYY'), 'Inspekcija mlijeka na farmi');
END;



CREATE OR REPLACE PROCEDURE insertDOKTOR (
       p_dok_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ZAPOSLENIK_ID%TYPE,
       p_inspekcija_id IN INSPEKCIJA_ZAPOSLENIK.INSPEKCIJA_ID%TYPE,
       p_zaposlenik_id IN INSPEKCIJA_ZAPOSLENIK.ZAPOSLENIK_ID%TYPE)

IS
BEGIN

  INSERT INTO INSPEKCIJA_ZAPOSLENIK (INSPEKCIJA_ZAPOSLENIK_ID, INSPEKCIJA_ID, ZAPOSLENIK_ID)
  values (p_dok_id, p_inspekcija_id, p_zaposlenik_id);

  COMMIT;


END;
/

BEGIN
   INSERTDOKTOR(5,5,5);
END;
------------------------------------------------------------------------------------------------------------------------
