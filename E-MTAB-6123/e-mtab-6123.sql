--
-- load the E-MTAB-6123 data into bartonlab
--

--
-- the experiment schema
--
DROP SCHEMA "e-mtab-6123" CASCADE;
CREATE SCHEMA "e-mtab-6123";

---------------------+-------------------+----------------------
-- experiments (insert row in public table)
-------------------+-------------------+------------------------
-- schema          | character varying | not null
-- title           | character varying | not null
-- description     | character varying | 
-- notes           | character varying | 
-- geoseries       | character varying | 
-- geodataset      | character varying | 
-- pmid            | integer           | 
-- expressionlabel | character varying | 
-- contributors    | character varying | 
-- publicdata      | boolean           | not null default false
-- assay           | character varying | 
-- annotation      | character varying | 
-- genus           | character varying | 
-- species         | character varying |

DELETE FROM experiments WHERE schema='e-mtab-6123';
INSERT INTO experiments VALUES (
       'e-mtab-6123',
       'Timecourse analysis of STM-responsive gene expression',
       'Arabidopsis transcription factor SHOOT MERISTEMLESS (STM) expression was induced using the dexamethasone-inducible TGV system in the Ler background and differentially expressed genes were identified compared to an induced empty-vector control line at each time point using RMA and LIMMA analysis.',
       'Transcription profiling by array time course of Arabidopsis thaliana Ler-1 plants with STM RNAi knock down or overexpression compared to controls',
       NULL,
       NULL,
       29650590,
       'RMA intensity',
       'Scofield S, Murison A, Jones A, Fozard J, Aida M, Band LR, Bennett M, Murray JAH',
       true,
       'Microarray',
       'TAIR10',
       'Arabidopsis',
       'thaliana'
);

-----------------+-------------------+------------------------
-- "e-mtab-6123".samples
-----------------+-------------------+------------------------
-- label         | character varying | not null
-- num           | integer           | not null
-- condition     | character varying | not null
-- control       | boolean           | not null default false
-- time          | integer           | 
-- comment       | character varying | 
-- replicate     | integer           | 
-- internalscale | double precision  | not null default 1.0

CREATE TABLE "e-mtab-6123".samples () INHERITS (public.samples);
COPY "e-mtab-6123".samples FROM '/home/shokin/BartonLab/E-MTAB-6123/samples.tsv' WITH CSV HEADER DELIMITER AS '	';

-----------------+-------------------+-----------
-- "e-mtab-6123".limmaresults
-----------------+-------------------+-----------
-- probe_set_id  | character varying | not null
-- logfc         | double precision  | 
-- aveexpr       | double precision  | 
-- t             | double precision  | 
-- pvalue        | double precision  | 
-- adjpvalue     | double precision  | 
-- b             | double precision  | 
-- id            | character varying | 
-- decondition   | character varying | 
-- basecondition | character varying | 

CREATE TABLE "e-mtab-6123".limmaresults () INHERITS (public.limmaresults);

-- res.STM8.WT8.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM8.WT8.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM8',basecondition='WT8' WHERE decondition IS NULL;

-- res.STM24.WT24.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM24.WT24.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM24',basecondition='WT24' WHERE decondition IS NULL;

-- res.STM72.WT72.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM72.WT72.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM72',basecondition='WT72' WHERE decondition IS NULL;

-- res.STM216.WT216.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM216.WT216.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM216',basecondition='WT216' WHERE decondition IS NULL;

-- res.KD72.WT72.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.KD72.WT72.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='KD72',basecondition='WT72' WHERE decondition IS NULL;

-- res.KD216.WT216.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.KD216.WT216.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='KD216',basecondition='WT216' WHERE decondition IS NULL;


-- res.STM72.KD72.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM72.KD72.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM72',basecondition='KD72' WHERE decondition IS NULL;

-- res.STM216.KD216.tsv
COPY "e-mtab-6123".limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
'/home/shokin/BartonLab/E-MTAB-6123/res.STM216.KD216.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE "e-mtab-6123".limmaresults SET decondition='STM216',basecondition='KD216' WHERE decondition IS NULL;

-- get the AT IDs
UPDATE "e-mtab-6123".limmaresults SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id="e-mtab-6123".limmaresults.probe_set_id);

--
-- "e-mtab-6123".expression - use ordering of samples above!
--
CREATE TABLE "e-mtab-6123".expression () INHERITS (public.expression);

-- load the RMA data from a single text file
CREATE TEMP TABLE rma (
       probe_set_id   varchar,
       ev8h1	double precision,
       ev8h2	double precision,
       ev8h3	double precision,
       stmoe8h1	double precision,
       stmoe8h2	double precision,
       stmoe8h3	double precision,
       ev24h1	double precision,
       ev24h2	double precision,
       ev24h3	double precision,
       stmoe24h1	double precision,
       stmoe24h2	double precision,
       stmoe24h3	double precision,
       ev72h1	double precision,
       ev72h2	double precision,
       ev72h3	double precision,
       stmoe72h1	double precision,
       stmoe72h2	double precision,
       stmoe72h3	double precision,
       stmrnai72h1	double precision,
       stmrnai72h2	double precision,
       stmrnai72h3	double precision,
       ev9d1	double precision,
       ev9d2	double precision,
       ev9d3	double precision,
       stmoe9d1	double precision,
       stmoe9d2	double precision,
       stmoe9d3	double precision,
       stmrnai9d1	double precision,
       stmrnai9d2	double precision,
       stmrnai9d3	double precision
       );
COPY rma FROM '/home/shokin/BartonLab/E-MTAB-6123/rma.exprs.tsv' WITH CSV HEADER DELIMITER AS '	';

-- drop not null so we can insert the probeset ids first
ALTER TABLE "e-mtab-6123".expression ALTER COLUMN values DROP NOT NULL;

-- create the rows by inserting the probeset ids
INSERT INTO "e-mtab-6123".expression (probe_set_id) SELECT probe_set_id FROM rma;

-- update the table data column by data column using array(), being sure to order by num to get the array values in the correct order
UPDATE "e-mtab-6123".expression SET values = (
       SELECT array[ev8h1,ev8h2,ev8h3,
                    stmoe8h1,stmoe8h2,stmoe8h3,
                    ev24h1,ev24h2,ev24h3,
                    stmoe24h1,stmoe24h2,stmoe24h3,
                    ev72h1,ev72h2,ev72h3,
                    stmoe72h1,stmoe72h2,stmoe72h3,
                    stmrnai72h1,stmrnai72h2,stmrnai72h3,
                    ev9d1,ev9d2,ev9d3,
                    stmoe9d1,stmoe9d2,stmoe9d3,
                    stmrnai9d1,stmrnai9d2,stmrnai9d3]
       FROM rma WHERE rma.probe_set_id=expression.probe_set_id
       );

-- restore not null
ALTER TABLE "e-mtab-6123".expression ALTER COLUMN values SET NOT NULL;

-- import the gene ids
UPDATE "e-mtab-6123".expression SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id="e-mtab-6123".expression.probe_set_id);
