--
-- load the GSE30702 data into bartonlab
--

-- --
-- -- the experiment schema
-- --
-- DROP SCHEMA gse30702 CASCADE;
-- CREATE SCHEMA gse30702;

-- -------------------+-------------------+------------------------
-- -- experiments (insert row in public table)
-- -------------------+-------------------+------------------------
-- -- schema          | character varying | not null
-- -- title           | character varying | not null
-- -- description     | character varying | 
-- -- notes           | character varying | 
-- -- geoseries       | character varying | 
-- -- geodataset      | character varying | 
-- -- pmid            | integer           | 
-- -- expressionlabel | character varying | 
-- -- contributors    | character varying | 
-- -- publicdata      | boolean           | not null default false
-- -- assay           | character varying | 
-- -- annotation      | character varying | 
-- -- genus           | character varying | 
-- -- species         | character varying |

-- DELETE FROM experiments WHERE schema='gse30702';
-- INSERT INTO experiments VALUES (
--        'gse30702',
--        'Expression data from Arabidopsis GR-REVOLUTA and KANADI1-GR transgenic seedlings',
--        'The REVOLUTA and KANADI1 transcription factors act in opposite directions to control polarity in Arabidopsis. By analyzing mRNA profiles following activation of REVOLUTA or KANADI1 proteins we identified genes regulated by both transcription factors, focusing on those regulated in opposite directions.',
--        'To coordinate transcriptional responses for microarray analysis, we constructed transgenic seedlings with the REV or KAN1 transcription factor fused to a glucocorticoid receptor (GR) domain. The GR domain tethers the transcription factor in the cytoplasm, and treatment with dexamethasone (DEX) allows movement into the nucleus. Transgenic seedlings and wild-type controls were grown simultaneously in liquid culture, treated with dexamethasone for 0min, 30min, 60min, or 120min, and total RNA was extracted and hybridized to Affymetrix arrays.
-- Treatment: Dexamethasone; Biological replicates.
-- <b>One sample, GSM761636=Columbia_120min_biorep2, has been removed due to quality assessment as a strong outlier.</b>',
--        'GSE30702',
--        NULL,
--        24076978,
--        'RMA intensity',
--        'Reinhart BJ, Liu T, Newell NR, Magnani E, Huang T, Kerstetter R, Michaels S, Barton MK',
--        true,
--        'Microarray',
--        'TAIR10',
--        'Arabidopsis',
--        'thaliana'
-- );

-- -----------------+-------------------+------------------------
-- -- gse30702.samples
-- -----------------+-------------------+------------------------
-- -- label         | character varying | not null
-- -- num           | integer           | not null
-- -- condition     | character varying | not null
-- -- control       | boolean           | not null default false
-- -- time          | integer           | 
-- -- comment       | character varying | 
-- -- replicate     | integer           | 
-- -- internalscale | double precision  | not null default 1.0

-- CREATE TABLE gse30702.samples () INHERITS (public.samples);
-- COPY gse30702.samples FROM '/home/shokin/BartonLab/GSE30702/samples.tsv' WITH CSV HEADER DELIMITER AS '	';

-- -------------------------------------------------------
-- -- gse30702.expression - use ordering of samples above!
-- -------------------------------------------------------

-- CREATE TABLE gse30702.expression () INHERITS (public.expression);

-- -- load the RMA data from a single text file
-- CREATE TEMP TABLE rma (
--        probe_set_id   varchar,
--        gsm761617      double precision,
--        gsm761618      double precision,
--        gsm761619      double precision,
--        gsm761620      double precision,
--        gsm761621      double precision,
--        gsm761622      double precision,
--        gsm761623      double precision,
--        gsm761624      double precision,
--        gsm761625      double precision,
--        gsm761626      double precision,
--        gsm761627      double precision,
--        gsm761628      double precision,
--        gsm761629      double precision,
--        gsm761630      double precision,
--        gsm761631      double precision,
--        gsm761632      double precision,
--        gsm761633      double precision,
--        gsm761634      double precision,
--        gsm761635      double precision,
--        gsm761637      double precision,
--        gsm761638      double precision,
--        gsm761639      double precision,
--        gsm761640      double precision,
--        gsm761641      double precision,
--        gsm761642      double precision,
--        gsm761643      double precision,
--        gsm761644      double precision,
--        gsm761645      double precision,
--        gsm761646      double precision,
--        gsm761647      double precision,
--        gsm761648      double precision,
--        gsm761649      double precision,
--        gsm761650      double precision,
--        gsm761651      double precision,
--        gsm761652      double precision,
--        gsm761653      double precision,
--        gsm761654      double precision,
--        gsm761655      double precision,
--        gsm761656      double precision,
--        gsm761657      double precision,
--        gsm761658      double precision
--        );
-- COPY rma FROM '/home/shokin/BartonLab/GSE30702/rma.exprs.tsv' WITH CSV HEADER DELIMITER AS '	';

-- -- drop not null so we can insert the probeset ids first
-- ALTER TABLE gse30702.expression ALTER COLUMN values DROP NOT NULL;

-- -- create the rows by inserting the probeset ids
-- INSERT INTO gse30702.expression (probe_set_id) SELECT probe_set_id FROM rma;

-- -- update the table data column by data column using array(), being sure to order by num to get the array values in the correct order
-- UPDATE gse30702.expression SET values = (
--        SELECT array[
--        gsm761617,
--        gsm761618,
--        gsm761619,
--        gsm761620,
--        gsm761621,
--        gsm761622,
--        gsm761623,
--        gsm761624,
--        gsm761625,
--        gsm761626,
--        gsm761627,
--        gsm761628,
--        gsm761629,
--        gsm761630,
--        gsm761631,
--        gsm761632,
--        gsm761633,
--        gsm761634,
--        gsm761635,
--        gsm761637,
--        gsm761638,
--        gsm761639,
--        gsm761640,
--        gsm761641,
--        gsm761642,
--        gsm761643,
--        gsm761644,
--        gsm761645,
--        gsm761646,
--        gsm761647,
--        gsm761648,
--        gsm761649,
--        gsm761650,
--        gsm761651,
--        gsm761652,
--        gsm761653,
--        gsm761654,
--        gsm761655,
--        gsm761656,
--        gsm761657,
--        gsm761658
--        ]
--        FROM rma WHERE rma.probe_set_id=expression.probe_set_id
--        );

-- -- restore not null
-- ALTER TABLE gse30702.expression ALTER COLUMN values SET NOT NULL;

-- -- import the gene ids
-- UPDATE gse30702.expression SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id=gse30702.expression.probe_set_id);

-- -----------------+-------------------+-----------
-- -- gse30702.limmaresults
-- -----------------+-------------------+-----------
-- -- probe_set_id  | character varying | not null
-- -- logfc         | double precision  | 
-- -- aveexpr       | double precision  | 
-- -- t             | double precision  | 
-- -- pvalue        | double precision  | 
-- -- adjpvalue     | double precision  | 
-- -- b             | double precision  | 
-- -- id            | character varying | 
-- -- decondition   | character varying | 
-- -- basecondition | character varying | 

-- CREATE TABLE gse30702.limmaresults () INHERITS (public.limmaresults);

-- -- res.GRREV.WT.tsv
-- COPY gse30702.limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.GRREV.WT.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE gse30702.limmaresults SET decondition='GRREV',basecondition='WT' WHERE decondition IS NULL;

-- -- res.KAN1GR.WT.tsv
-- COPY gse30702.limmaresults (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.KAN1GR.WT.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE gse30702.limmaresults SET decondition='KAN1GR',basecondition='WT' WHERE decondition IS NULL;

-- -- get the AT IDs
-- UPDATE gse30702.limmaresults SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id=gse30702.limmaresults.probe_set_id);

-- -----------------+--------------------+-----------
-- -- gse30702.limmatimeresults
-- -----------------+--------------------+-----------
-- -- probe_set_id  | character varying  | not null
-- -- id            | character varying  | not null
-- -- condition     | character varying  | not null
-- -- t             | double precision[] | not null
-- -- logfc         | double precision[] | not null
-- -- aveexpr       | double precision[] | not null
-- -- p_value       | double precision[] | not null
-- -- q_value       | double precision[] | not null
-- -- b             | double precision[] | not null

-- CREATE TABLE gse30702.limmatimeresults () INHERITS (public.limmatimeresults);
-- CREATE INDEX limmatimeresults_idx ON gse30702.limmatimeresults(condition);
-- CREATE UNIQUE INDEX limmatimeresults_unique ON gse30702.limmatimeresults(id,condition);

-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN id      DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN t       DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN logfc   DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN aveexpr DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN p_value DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN q_value DROP NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN b       DROP NOT NULL;

-- -----------------+-------------------+-----------
-- -- bigstack
-- -----------------+-------------------+-----------
-- -- probe_set_id  | character varying | not null
-- -- logfc         | double precision  | 
-- -- aveexpr       | double precision  | 
-- -- t             | double precision  | 
-- -- pvalue        | double precision  | 
-- -- adjpvalue     | double precision  | 
-- -- b             | double precision  | 
-- -- id            | character varying | 
-- -- decondition   | character varying | 
-- -- basecondition | character varying | 

-- CREATE TEMP TABLE bigstack () INHERITS (public.limmaresults);
-- CREATE UNIQUE INDEX bigstack_unique ON bigstack(probe_set_id,basecondition,decondition,t);
-- CREATE INDEX bigstack_idx ON bigstack(id,decondition,t);

-- -- res.WT30.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.WT30.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='WT0',decondition='WT',t=30 WHERE basecondition IS NULL;

-- -- res.WT60.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.WT60.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='WT0',decondition='WT',t=60 WHERE basecondition IS NULL;

-- -- res.WT120.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.WT120.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='WT0',decondition='WT',t=120 WHERE basecondition IS NULL;

-- -- res.GRREV30.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.GRREV30.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='GRREV0',decondition='GRREV',t=30 WHERE basecondition IS NULL;

-- -- res.GRREV60.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.GRREV60.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='GRREV0',decondition='GRREV',t=60 WHERE basecondition IS NULL;

-- -- res.GRREV120.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.GRREV120.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='GRREV0',decondition='GRREV',t=120 WHERE basecondition IS NULL;

-- -- res.KAN1GR30.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.KAN1GR30.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='KAN1GR0',decondition='KAN1GR',t=30 WHERE basecondition IS NULL;

-- -- res.KAN1GR60.tsv
-- COPY bigstack (probe_set_id,logfc,aveexpr,t,pvalue,adjpvalue,b) FROM
-- '/home/shokin/BartonLab/GSE30702/res.KAN1GR60.tsv'
-- WITH CSV HEADER DELIMITER AS '	';
-- UPDATE bigstack SET basecondition='KAN1GR0',decondition='KAN1GR',t=60 WHERE basecondition IS NULL;


-- -- instantiate the limmatimeresults rows
-- INSERT INTO gse30702.limmatimeresults (probe_set_id,condition) SELECT DISTINCT probe_set_id,decondition FROM bigstack;

-- -- get the AT IDs
-- UPDATE gse30702.limmatimeresults SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id=gse30702.limmatimeresults.probe_set_id);

-- -- update the table data column by data column using array(), being sure to order by time to get the array values in the correct order
-- UPDATE gse30702.limmatimeresults SET logfc=array(SELECT logfc FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);
-- UPDATE gse30702.limmatimeresults SET aveexpr=array(SELECT aveexpr FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);
-- UPDATE gse30702.limmatimeresults SET t=array(SELECT t FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);
-- UPDATE gse30702.limmatimeresults SET p_value=array(SELECT pvalue FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);
-- UPDATE gse30702.limmatimeresults SET q_value=array(SELECT adjpvalue FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);
-- UPDATE gse30702.limmatimeresults SET b=array(SELECT b FROM bigstack WHERE bigstack.probe_set_id=gse30702.limmatimeresults.probe_set_id
--                                                         AND bigstack.decondition=gse30702.limmatimeresults.condition ORDER BY t);

-- -- restore the NOT NULL constraints, not that it matters
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN id      SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN t       SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN logfc   SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN aveexpr SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN p_value SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN q_value SET NOT NULL;
-- ALTER TABLE gse30702.limmatimeresults ALTER COLUMN b       SET NOT NULL;


-------------------------+-------------------+-----------
-- gse30702.anovaresults
-------------------------+-------------------+-----------
-- id                    | character varying | 
-- conditions            | character varying | 
-- condition_df          | integer           | not null
-- condition_meansq      | double precision  | not null
-- condition_f           | double precision  | not null
-- condition_p           | double precision  | not null
-- time_df               | integer           | not null
-- time_meansq           | double precision  | not null
-- time_f                | double precision  | not null
-- time_p                | double precision  | not null
-- condition_time_df     | integer           | not null
-- condition_time_meansq | double precision  | not null
-- condition_time_f      | double precision  | not null
-- condition_time_p      | double precision  | not null
-- residuals_df          | integer           | not null
-- residuals_meansq      | double precision  | not null
-- condition_p_adj       | double precision  | 
-- time_p_adj            | double precision  | 
-- condition_time_p_adj  | double precision  | 
-- probe_set_id          | character varying |

DROP TABLE gse30702.anovaresults;
CREATE TABLE gse30702.anovaresults () INHERITS (public.anovaresults);

-- INPUT:
---------------
-- probe_set_id
-- condition_df condition_meansq condition_f condition_p
-- time_df time_meansq time_f time_p
-- condition_time_df condition_time_meansq condition_time_f condition_time_p
-- residuals_df residuals_meansq
-- condition_q time_q condition_time_q

-- anova.ALL
COPY gse30702.anovaresults (probe_set_id,
                            condition_df, condition_meansq, condition_f, condition_p,
                            time_df, time_meansq, time_f, time_p,
                            condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                            residuals_df, residuals_meansq, 
                            condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/GSE30702/anova.ALL.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE gse30702.anovaresults SET conditions='ALL' WHERE conditions IS NULL;

-- anova.GRREV.WT
COPY gse30702.anovaresults (probe_set_id,
                            condition_df, condition_meansq, condition_f, condition_p,
                            time_df, time_meansq, time_f, time_p,
                            condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                            residuals_df, residuals_meansq, 
                            condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/GSE30702/anova.GRREV.WT.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE gse30702.anovaresults SET conditions='GRREVvWT' WHERE conditions IS NULL;

-- anova.KAN1GR.WT
COPY gse30702.anovaresults (probe_set_id,
                            condition_df, condition_meansq, condition_f, condition_p,
                            time_df, time_meansq, time_f, time_p,
                            condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                            residuals_df, residuals_meansq, 
                            condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/GSE30702/anova.KAN1GR.WT.tsv'
WITH CSV HEADER DELIMITER AS '	';
UPDATE gse30702.anovaresults SET conditions='KAN1GRvWT' WHERE conditions IS NULL;

-- get the AT IDs
UPDATE gse30702.anovaresults SET id = (SELECT transcript_id FROM affxannot WHERE affxannot.probe_set_id=gse30702.anovaresults.probe_set_id);


-- reassign ownership
REASSIGN OWNED BY sam TO bartonlab;
REASSIGN OWNED BY shokin TO bartonlab;
