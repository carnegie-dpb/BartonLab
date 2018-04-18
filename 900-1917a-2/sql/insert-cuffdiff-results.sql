--
-- coerce individual time-wise DE tables into the single timewise results table with vector data in time order
--

--------------------------
-- SET THE SCHEMA HERE! --
--------------------------

SET search_path TO grtiny;

-- load gene_exp.diff DE data into a big stacked table

-- test_id	gene_id	gene	locus	sample_1	sample_2	status	value_1	value_2	log2(fold_change)	test_stat	p_value	q_value	significant

CREATE TEMP TABLE bigstack (
       test_id	  		   character varying	NOT NULL,
       id			   character varying	NOT NULL,
       gene			   character varying,
       locus			   character varying,
       sample_1			   character varying,
       sample_2			   character varying,
       status			   character varying,
       value_1			   double precision,
       value_2			   double precision,
       logfc			   double precision,
       test_stat		   double precision,
       p_value			   double precision,
       q_value			   double precision,
       significant		   character varying,
       t			   integer
);

-- make a unique index in case one of the copies below is redundant

CREATE UNIQUE INDEX bigstack_unique ON bigstack(id,sample_1,sample_2,t);
CREATE INDEX bigstack_idx ON bigstack(id,sample_2,t);

-- load in all the data

-- Col-0-WT
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/400-093f/cuffdiff/Col/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'Col30';
DELETE FROM bigstack WHERE sample_1 = 'Col60';
UPDATE bigstack SET t=30 WHERE sample_2='Col30';
UPDATE bigstack SET t=60 WHERE sample_2='Col60';
DELETE FROM bigstack WHERE test_id IS NULL;

-- GR-AS2
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/400-093f/cuffdiff/GRAS2/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'GRAS230';
DELETE FROM bigstack WHERE sample_1 = 'GRAS260';
UPDATE bigstack SET t=30 WHERE sample_2='GRAS230';
UPDATE bigstack SET t=60 WHERE sample_2='GRAS260';
DELETE FROM bigstack WHERE test_id IS NULL;

-- GR-KAN
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/400-093f/cuffdiff/GRKAN/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'GRKAN30';
DELETE FROM bigstack WHERE sample_1 = 'GRKAN60';
UPDATE bigstack SET t=30 WHERE sample_2='GRKAN30';
UPDATE bigstack SET t=60 WHERE sample_2='GRKAN60';
DELETE FROM bigstack WHERE test_id IS NULL;

-- GR-REV
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/400-093f/cuffdiff/GRREV/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'GRREV30';
DELETE FROM bigstack WHERE sample_1 = 'GRREV60';
UPDATE bigstack SET t=30 WHERE sample_2='GRREV30';
UPDATE bigstack SET t=60 WHERE sample_2='GRREV60';
DELETE FROM bigstack WHERE test_id IS NULL;

-- GR-STM
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/400-093f/cuffdiff/GRSTM/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'GRSTM30';
DELETE FROM bigstack WHERE sample_1 = 'GRSTM60';
UPDATE bigstack SET t=30 WHERE sample_2='GRSTM30';
UPDATE bigstack SET t=60 WHERE sample_2='GRSTM60';
DELETE FROM bigstack WHERE test_id IS NULL;

-- GR-TINY
COPY bigstack (test_id,id,gene,locus,sample_1,sample_2,status,value_1,value_2,logfc,test_stat,p_value,q_value,significant)
     FROM '/home/sam/BartonLab/900-1917a-2/cuffdiff/GTN.0.30.60/gene_exp.diff' WITH CSV HEADER DELIMITER AS '	';
DELETE FROM bigstack WHERE sample_1 = 'GTN30';
DELETE FROM bigstack WHERE sample_1 = 'GTN60';
UPDATE bigstack SET t=30 WHERE sample_2='GTN30';
UPDATE bigstack SET t=60 WHERE sample_2='GTN60';
DELETE FROM bigstack WHERE test_id IS NULL;

-- create our target table, load the IDs, drop not null constraints so we can slowly fill it

DROP TABLE cuffdifftimeresults;
CREATE TABLE cuffdifftimeresults () INHERITS (public.cuffdifftimeresults);
CREATE UNIQUE INDEX cuffdifftimeresults_unique ON cuffdifftimeresults(id,condition);
CREATE INDEX cuffdifftimeresults_condition ON cuffdifftimeresults(condition);

-- instantiate the rows

INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'Col-0-WT' FROM bigstack WHERE sample_1='Col01';
INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'GR-AS2' FROM bigstack WHERE sample_1='GRAS201';
INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'GR-KAN' FROM bigstack WHERE sample_1='GRKAN01';
INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'GR-REV' FROM bigstack WHERE sample_1='GRREV01';
INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'GR-STM' FROM bigstack WHERE sample_1='GRSTM01';
INSERT INTO cuffdifftimeresults (test_id,id,condition) SELECT DISTINCT test_id,id,'GR-TINY' FROM bigstack WHERE sample_1='GTN01';

-- update the table data column by data column using array(), being sure to order by time to get the array values in the correct order

UPDATE cuffdifftimeresults SET locus=(SELECT DISTINCT locus FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id);
UPDATE cuffdifftimeresults SET gene=(SELECT DISTINCT gene FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id);

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='Col01' ORDER BY t) WHERE condition='Col-0-WT';

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRAS201' ORDER BY t) WHERE condition='GR-AS2';

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRKAN01' ORDER BY t) WHERE condition='GR-KAN';

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRREV01' ORDER BY t) WHERE condition='GR-REV';

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GRSTM01' ORDER BY t) WHERE condition='GR-STM';

UPDATE cuffdifftimeresults SET status=array(SELECT status FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET value_1=array(SELECT value_1 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET value_2=array(SELECT value_2 FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET test_stat=array(SELECT test_stat FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET p_value=array(SELECT p_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET q_value=array(SELECT q_value FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';
UPDATE cuffdifftimeresults SET significant=array(SELECT significant FROM bigstack WHERE bigstack.id=cuffdifftimeresults.id AND sample_1='GTN01' ORDER BY t) WHERE condition='GR-TINY';

-- clean-up

DROP TABLE bigstack;
