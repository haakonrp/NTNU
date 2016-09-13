-- Utgave tilpasset MySQL

-- Sletter tabeller

DROP TABLE IF EXISTS bok_forfatter;
DROP TABLE IF EXISTS forfatter;
DROP TABLE IF EXISTS bok;
DROP TABLE IF EXISTS forlag;
DROP TABLE IF EXISTS konsulent;

-- Oppretter tabeller med entitetsintegritet (primærnøkkel)

CREATE TABLE forlag(
 forlag_id INTEGER NOT NULL AUTO_INCREMENT,
 forlag_navn VARCHAR(30),
 adresse VARCHAR(30),
 telefon CHAR(15),
CONSTRAINT forlag_pk PRIMARY KEY(forlag_id));

CREATE TABLE bok(
 bok_id INTEGER NOT NULL AUTO_INCREMENT,
 tittel VARCHAR(30),
 utgitt_aar INTEGER,
 forlag_id INTEGER,
CONSTRAINT bok_pk PRIMARY KEY(bok_id));

CREATE TABLE forfatter(
 forfatter_id INTEGER NOT NULL AUTO_INCREMENT,
 fornavn VARCHAR(20),
 etternavn VARCHAR (30),
 fode_aar INTEGER,
 dod_aar INTEGER,
 nasjonalitet VARCHAR(20),
CONSTRAINT forfatter_pk PRIMARY KEY(forfatter_id));

CREATE TABLE bok_forfatter(
 bok_id INTEGER NOT NULL,
 forfatter_id INTEGER NOT NULL,
CONSTRAINT bok_forfatter_pk PRIMARY KEY(bok_id, forfatter_id));

CREATE TABLE konsulent(
  kons_id INTEGER NOT NULL AUTO_INCREMENT,
  fornavn VARCHAR(20),
  etternavn VARCHAR (30),
  epost VARCHAR(30),
CONSTRAINT konsulent_pk PRIMARY KEY(kons_id));      

-- Legger på referanseintegritet (fremmednøkler)

ALTER TABLE bok
 ADD CONSTRAINT bok_fk FOREIGN KEY(forlag_id)REFERENCES forlag(forlag_id);

ALTER TABLE bok_forfatter
 ADD CONSTRAINT bok_forfatter_fk1 FOREIGN KEY(bok_id)REFERENCES bok(bok_id);
 
ALTER TABLE bok_forfatter
 ADD CONSTRAINT bok_forfatter_fk2 FOREIGN KEY(forfatter_id)REFERENCES forfatter(forfatter_id);
 
-- Legger inn data i tabellene

INSERT INTO forlag VALUES(DEFAULT,'Tapir','Trondheim', '73590000');
INSERT INTO forlag VALUES(DEFAULT,'Gyldendal','Oslo', '22220000');
INSERT INTO forlag VALUES(DEFAULT,'Cappelen','Oslo', '22200000');
INSERT INTO forlag VALUES(DEFAULT,'Universitetsforlaget','Oslo', '23230000');
INSERT INTO forlag VALUES(DEFAULT,'Achehaug','Oslo', '22000000');
INSERT INTO forlag VALUES(DEFAULT,'Oktober','Oslo', '22002200');
INSERT INTO forlag VALUES(DEFAULT,'Tiden','Oslo', '22232223');
INSERT INTO forlag VALUES(DEFAULT,'Harper Collins','USA',NULL);

INSERT INTO bok VALUES(DEFAULT,'Tåpenes',1995,7);
INSERT INTO bok VALUES(DEFAULT,'Rebecca',1981,3);
INSERT INTO bok VALUES(DEFAULT,'Gutter er gutter',1995,5);
INSERT INTO bok VALUES(DEFAULT,'Microserfs',1991,8);
INSERT INTO bok VALUES(DEFAULT,'Generation X',1995,8);
INSERT INTO bok VALUES(DEFAULT,'Klosterkrønike',1982,3);
INSERT INTO bok VALUES(DEFAULT,'Universet',1988,3);
INSERT INTO bok VALUES(DEFAULT,'Nålen',1978,3);
INSERT INTO bok VALUES(DEFAULT,'Markens grøde',1917,2);
INSERT INTO bok VALUES(DEFAULT,'Victoria',1898,2);
INSERT INTO bok VALUES(DEFAULT,'Sult',1890,2);
INSERT INTO bok VALUES(DEFAULT,'Benoni',1908,2);
INSERT INTO bok VALUES(DEFAULT,'Rosa',1908,2);
INSERT INTO bok VALUES(DEFAULT,'Et skritt',1997,2);
INSERT INTO bok VALUES(DEFAULT,'Den femte',1996,2);
INSERT INTO bok VALUES(DEFAULT,'Villspor',1995,2);
INSERT INTO bok VALUES(DEFAULT,'Silkeridderen',1994,2);
INSERT INTO bok VALUES(DEFAULT,'Den hvite hingsten',1992,2);
INSERT INTO bok VALUES(DEFAULT,'Hunder',1992,2);
INSERT INTO bok VALUES(DEFAULT,'Bridget Jones',1995,5);
INSERT INTO bok VALUES(DEFAULT,'Se terapeuten',1998,3);
INSERT INTO bok VALUES(DEFAULT,'Sa mor',1996,3);
INSERT INTO bok VALUES(DEFAULT,'Jubel',1995,3);
INSERT INTO bok VALUES(DEFAULT,'Tatt av kvinnen',1993,3);
INSERT INTO bok VALUES(DEFAULT,'Supernaiv',1996,3);

INSERT INTO forfatter VALUES(DEFAULT,'John','Tool',1937, 1969, 'USA');
INSERT INTO forfatter VALUES(DEFAULT,'Ken','Follet',NULL, NULL, 'Britisk');
INSERT INTO forfatter VALUES(DEFAULT,'Stephen','Hawking',NULL, NULL, 'Britisk');
INSERT INTO forfatter VALUES(DEFAULT,'Jose','Saramago',1942, NULL, 'Portugisisk');
INSERT INTO forfatter VALUES(DEFAULT,'Douglas','Coupland',1961, NULL, 'Canadisk');
INSERT INTO forfatter VALUES(DEFAULT,'Nick','Hornby',1857, NULL, 'Britisk');
INSERT INTO forfatter VALUES(DEFAULT,'Knut','Hamsun',1859, 1952, 'Norsk');
INSERT INTO forfatter VALUES(DEFAULT,'Henning','Mankell',1948, NULL, 'Svensk');
INSERT INTO forfatter VALUES(DEFAULT,'Helen','Fielding',NULL, NULL, 'Britisk');
INSERT INTO forfatter VALUES(DEFAULT,'Hal','Sirowitz',NULL, NULL, 'USA');
INSERT INTO forfatter VALUES(DEFAULT,'Lars S.','Christensen',NULL, NULL, 'Norsk');
INSERT INTO forfatter VALUES(DEFAULT,'Erlend','Loe',NULL, NULL, 'Norsk');

INSERT INTO bok_forfatter VALUES(1, 1);
INSERT INTO bok_forfatter VALUES(2, 2);
INSERT INTO bok_forfatter VALUES(3, 6);
INSERT INTO bok_forfatter VALUES(4, 5);
INSERT INTO bok_forfatter VALUES(5, 5);
INSERT INTO bok_forfatter VALUES(6, 4);
INSERT INTO bok_forfatter VALUES(7, 3);
INSERT INTO bok_forfatter VALUES(8, 2);
INSERT INTO bok_forfatter VALUES(9, 7);
INSERT INTO bok_forfatter VALUES(10, 7);
INSERT INTO bok_forfatter VALUES(11, 7);
INSERT INTO bok_forfatter VALUES(12, 1);
INSERT INTO bok_forfatter VALUES(13, 1);
INSERT INTO bok_forfatter VALUES(14, 8);
INSERT INTO bok_forfatter VALUES(15, 8);
INSERT INTO bok_forfatter VALUES(16, 8);
INSERT INTO bok_forfatter VALUES(17, 8);
INSERT INTO bok_forfatter VALUES(18, 8);
INSERT INTO bok_forfatter VALUES(19, 8);
INSERT INTO bok_forfatter VALUES(20, 9);
INSERT INTO bok_forfatter VALUES(21, 10);
INSERT INTO bok_forfatter VALUES(22, 10);
INSERT INTO bok_forfatter VALUES(23, 11);
INSERT INTO bok_forfatter VALUES(24, 12);
INSERT INTO bok_forfatter VALUES(25, 12);

INSERT INTO konsulent VALUES(DEFAULT, 'Anne', 'Hansen', 'anne.hansen@xxx.com');
INSERT INTO konsulent VALUES(DEFAULT, 'Bjørn', 'Jensen', 'bjornj@yyy.com');
INSERT INTO konsulent VALUES(DEFAULT, 'Anne', 'Ås', 'anne.as@zzz.com');


-- Oppg. 1a)
SELECT * FROM bok WHERE bok_id=2;
SELECT DISTINCT bok_id FROM bok;

-- Oppg. 1b)
SELECT * FROM forlag, bok;
	-- Vi får alle mulige forlag på bok_id (bok).

-- Oppg. 1c)
	-- Natural join
	SELECT * FROM forlag NATURAL JOIN bok;
	
	-- Likhetsforening
	SELECT * FROM forlag, bok WHERE forlag.forlag_id = bok.bok_id;
	
-- Oppg. 1d)
SELECT forlag_navn FROM forlag 
UNION 
SELECT tittel FROM bok;
	-- Vi får se alle forlag navn og titlene i en liste der de er union.
	
-- Oppg. 2a)
SELECT DISTINCT forlag_navn FROM forlag;
	-- PROJECT(forlag::forlag_navn, R::);
	
-- Oppg. 2b)
SELECT DISTINCT forlag_id FROM forlag
WHERE forlag_id NOT IN (
SELECT forlag_id FROM bok);
	-- INTERSECT(forlag:::forlag_id, bok:::forlag_id, R::);

-- Oppg. 2c)
SELECT * FROM forfatter WHERE fode_aar = 1948;
	-- SELECT(forfatter:(fode_aar = 1948):,R::);
	
-- Oppg. 2d)
SELECT forlag_navn, adresse FROM forlag
WHERE forlag_id IN (
SELECT forlag_id FROM bok WHERE tittel = 'Generation X');
	-- INTERSECT(forlag:::forlag_navn adresse, bok:(tittel = 'Generation X')::forlag_id, R::);

-- Oppg. 2e)
SELECT tittel FROM bok
WHERE bok_id IN (
	SELECT bok_id FROM bok_forfatter WHERE forfatter_id = (
		SELECT forfatter_id FROM forfatter WHERE etternavn = 'Hamsun'
		)
);
	-- INTERSECT(bok:::tittel, bok_forfatter:(forfatter_id = SELECT(forfatter:(etternavn = 'Hamsun'):forfatter_id), R::)::bok_id, R::);

-- Oppg. 2f)
SELECT tittel, utgitt_aar, forlag_navn, adresse, telefon FROM bok, forlag
WHERE bok.forlag_id = forlag.forlag_id
UNION 
SELECT NULL, NULL, forlag_navn, adresse, telefon FROM forlag
WHERE forlag_id NOT IN (SELECT forlag_id FROM bok);
	-- UNION(bok forlag:(bok.forlag_id = forlag.forlag_id):tittel utgitt_aar forlag_navn adresse telefon, forlag:(forlag_id != PROJECT(bok::forlag_id)):NULL NULL forlag_navn adresse telefon, R::);
