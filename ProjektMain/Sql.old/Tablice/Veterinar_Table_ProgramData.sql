-- tablica gdje program sprema svoje podatke, kao postavke za korisnike, varijable i sl.

CREATE TABLE program_data (
    id                      INTEGER             NOT NULL,
    sifra                   VARCHAR(40)         DEFAULT '()'    NOT NULL,
    korisnik_id             VARCHAR(40)         DEFAULT 'SW'    NOT NULL,
    gpr_a                   VARCHAR(40)         DEFAULT '@'     NOT NULL,
    gpr_b                   FLOAT               DEFAULT -1.1    NOT NULL,
    gpr_c                   INTEGER             DEFAULT -1      NOT NULL,
    flag                    INTEGER(1)          DEFAULT  1      NOT NULL,
    naziv                   VARCHAR(20)         DEFAULT 'UNK'   NOT NULL,
    CONSTRAINT PROGDATA_PK PRIMARY KEY (id) USING INDEX
)





