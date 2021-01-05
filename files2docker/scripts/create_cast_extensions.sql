CREATE OR REPLACE FUNCTION siap_interval_to_double(arg interval)
RETURNS real AS
$BODY$
BEGIN
  return CAST( (extract(epoch from arg ) / 86400) as real );
END;
$BODY$
LANGUAGE 'plpgsql';

CREATE CAST (interval AS real) WITH FUNCTION siap_interval_to_double ( interval ) AS IMPLICIT;
create CAST (varchar as numeric) with inout as implicit;
create CAST (varchar as integer) with inout as implicit;
create CAST (char as integer) with inout as implicit;
create CAST (char as numeric) with inout as implicit;
CREATE EXTENSION IF NOT EXISTS unaccent;