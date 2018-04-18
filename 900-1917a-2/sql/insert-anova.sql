--
-- insert ANOVA results data from an R dump into the anovaresults table
--
-- id   condition_df      condition_meansq        condition_f      condition_p
--      time_df           time_meansq             time_f           time_p
--      condition_time_df condition_time_meansq   condition_time_f condition_time_p
--      residuals_df residuals_meansq, condition_q time_q, condition_time_q
--

SET search_path TO grtiny;

-- anova.ALL.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ALL.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ALL' WHERE conditions IS NULL;

---------------------------

-- anova.ColxGR-AS2.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ColxGR-AS2.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ColxGR-AS2' WHERE conditions IS NULL;

-- anova.ColxGR-KAN.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ColxGR-KAN.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ColxGR-KAN' WHERE conditions IS NULL;

-- anova.ColxGR-REV.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ColxGR-REV.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ColxGR-REV' WHERE conditions IS NULL;

-- anova.ColxGR-STM.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ColxGR-STM.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ColxGR-STM' WHERE conditions IS NULL;

-- anova.ColxGR-TINY.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.ColxGR-TINY.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='ColxGR-TINY' WHERE conditions IS NULL;

---------------------------

-- anova.GR-AS2xGR-KAN.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-AS2xGR-KAN.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-AS2xGR-KAN' WHERE conditions IS NULL;

-- anova.GR-AS2xGR-REV.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-AS2xGR-REV.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-AS2xGR-REV' WHERE conditions IS NULL;

-- anova.GR-AS2xGR-STM.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-AS2xGR-STM.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-AS2xGR-STM' WHERE conditions IS NULL;

-- anova.GR-AS2xGR-TINY.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-AS2xGR-TINY.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-AS2xGR-TINY' WHERE conditions IS NULL;

---------------------------

-- anova.GR-KANxGR-REV.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-KANxGR-REV.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-KANxGR-REV' WHERE conditions IS NULL;

-- anova.GR-KANxGR-STM.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-KANxGR-STM.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-KANxGR-STM' WHERE conditions IS NULL;

-- anova.GR-KANxGR-TINY.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-KANxGR-TINY.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-KANxGR-TINY' WHERE conditions IS NULL;

---------------------------

-- anova.GR-REVxGR-STM.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-REVxGR-STM.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-REVxGR-STM' WHERE conditions IS NULL;

-- anova.GR-REVxGR-TINY.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-REVxGR-TINY.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-REVxGR-TINY' WHERE conditions IS NULL;

---------------------------

-- anova.GR-STMxGR-TINY.tsv
COPY anovaresults (id, condition_df,      condition_meansq,      condition_f,      condition_p,
                       time_df,           time_meansq,           time_f,           time_p,
                       condition_time_df, condition_time_meansq, condition_time_f, condition_time_p,
                       residuals_df, residuals_meansq, condition_p_adj, time_p_adj, condition_time_p_adj)
FROM '/home/shokin/BartonLab/900-1917a-2/anova/anova.GR-STMxGR-TINY.tsv' DELIMITER E'\t' CSV HEADER;
UPDATE anovaresults SET conditions='GR-STMxGR-TINY' WHERE conditions IS NULL;

                       
