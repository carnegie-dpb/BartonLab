--
-- coerce individual time-wise FPKM tables into the single timewise expression table with vector data in time order
--

--------------------------
-- SET THE SCHEMA HERE! --
--------------------------

SET search_path TO grtiny;

CREATE TEMP TABLE bigstack (
       tracking_id	   character varying	NOT NULL,
       class_code	   character varying,
       nearest_ref_id	   character varying,
       gene_id		   character varying,
       gene_short_name	   character varying,
       tss_id		   character varying,
       locus		   character varying,
       length		   character varying,
       coverage		   character varying,
       fpkm		   double precision,
       fpkm_conf_lo	   double precision,
       fpkm_conf_hi	   double precision,
       fpkm_status	   character varying,
       num		   integer
);

-- expression
-- id           | character varying  | 
-- values       | double precision[] | not null
-- probe_set_id | character varying  | 

-- load in all the data

-- Col 1-9    Ot7911 Ot7912 Ot7913  Ot7914 Ot7915 Ot7916  Ot7917 Ot7918 Ot7919

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7911/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=1 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7912/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=2 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7913/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=3 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7914/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=4 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7915/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=5 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7916/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=6 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7917/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=7 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7918/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=8 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7919/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=9 WHERE num IS NULL;

-- GR-AS2 10-18 Ot7923 Ot7924 Ot7925  Ot7926 Ot7927 Ot7928  Ot7929 Ot7930 Ot7931

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7923/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=10 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7924/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=11 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7925/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=12 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7926/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=13 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7927/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=14 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7928/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=15 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7929/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=16 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7930/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=17 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7931/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=18 WHERE num IS NULL;

-- GR-KAN 19-27 Ot7958 Ot7959 Ot7960  Ot7961 Ot7962 Ot7963  Ot7964 Ot7965 Ot7966

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7958/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=19 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7959/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=20 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7960/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=21 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7961/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=22 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7962/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=23 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7963/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=24 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7964/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=25 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7965/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=26 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7966/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=27 WHERE num IS NULL;

-- GR-REV 28-35 Ot7947 Ot7948 Ot7949  Ot7950 Ot7951         Ot7952 Ot7953 Ot7954

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7947/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=28 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7948/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=29 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7949/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=30 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7950/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=31 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7951/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=32 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7952/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=33 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7953/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=34 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7954/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=35 WHERE num IS NULL;

-- GR-STM 36-47 Ot7935 Ot7936 Ot7937  Ot7938 Ot7939 Ot7940  Ot7941 Ot7942 Ot7943

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7935/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=36 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7936/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=37 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7937/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=38 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7938/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=39 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7939/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=40 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7940/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=41 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7941/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=42 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7942/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=43 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/400-093f/cufflinks/Ot7943/genes.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=44 WHERE num IS NULL;

-- GR-TINY 45-53 OtB5765 OtB5766 OtB5767  OtB5768 OtB5769 OtB5770  OtB5771  OtB5772  OtB5773

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5765/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=45 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5766/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=46 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5767/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=47 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5768/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=48 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5769/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=49 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5770/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=50 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5771/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=51 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5772/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=52 WHERE num IS NULL;

COPY bigstack (tracking_id,class_code,nearest_ref_id,gene_id,gene_short_name,tss_id,locus,length,coverage,fpkm,fpkm_conf_lo,fpkm_conf_hi,fpkm_status)
     FROM '/home/sam/BartonLab/900-1917a-2/cufflinks/OtB5773/genes.updated.fpkm_tracking' WITH CSV HEADER DELIMITER AS '	';
UPDATE bigstack SET num=53 WHERE num IS NULL;


-- some clean up

DELETE FROM bigstack WHERE tracking_id IS NULL;

CREATE INDEX bigstack_idx ON bigstack(tracking_id,num);

-- create our target table, load the IDs, drop not null constraints so we can slowly fill it

DROP TABLE expression;
CREATE TABLE expression () INHERITS (public.expression);
ALTER TABLE expression ALTER COLUMN values DROP NOT NULL;

-- instantiate the rows

INSERT INTO expression (id) SELECT DISTINCT tracking_id FROM bigstack;

-- update the table data column by data column using array(), being sure to order by num to get the array values in the correct order

UPDATE expression SET values=array(SELECT fpkm FROM bigstack WHERE bigstack.tracking_id=expression.id ORDER BY num);

-- don't need bigstack any longer

DROP TABLE bigstack;

-- restore NOT NULL on expression values

ALTER TABLE expression ALTER COLUMN values SET NOT NULL;
      
-- remove the CUFF.* records that Cufflinks creates these days

DELETE FROM expression WHERE id LIKE 'CUFF%';

-- remove the records that don't have the full complement of expression (how do we get records with MORE? multiple gene entries??)

DELETE FROM expression WHERE cardinality(values)!=53;

