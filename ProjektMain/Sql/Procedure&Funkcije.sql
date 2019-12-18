-- veterinar smije imati max n radnih sati tjedno

-- veterinar mora odraditi barem n pregleda a maximalno m pregleda





CREATE OR REPLACE
PROCEDURE ProcSelectEveryThing(cursor_ OUT SYS_REFCURSOR)
AS

BEGIN

OPEN cursor_ FOR
      SELECT * FROM ZAPOSLENIK;
END;



declare
  lcsr sys_refcursor;
begin
  ProcSelectEveryThing( lcsr);

end;

CREATE OR REPLACE FUNCTION get_film ()
   RETURNS TABLE (
      film_title VARCHAR,
      film_release_year INT
)
BEGIN
   RETURN QUERY SELECT
      *
   FROM zaposlenik;
END;





