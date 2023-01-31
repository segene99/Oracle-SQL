create or replace procedure my_new_job_proc1
(p_job_id in jobs.job_id%type, 
p_job_title in jobs.job_title%type,
p_update_date in jobs.update_date%type := sysdate,
p_min_sal in jobs.min_salary%type := 10, 
p_max_sal in jobs.max_salary%type := 100 
) -- vd_cur_date
is 
    vn_cnt number := 0;
    vn_cur_date jobs.update_date%type := sysdate;
begin
    SELECT  COUNT(*) --1
    INTO    VN_CNT
    FROM    JOBS
    WHERE   JOB_ID = P_JOB_ID;
    
    IF  VN_CNT > 0  THEN
        UPDATE  JOBS
        SET     JOB_TITLE   = P_JOB_TITLE,
                MIN_SALARY  = P_MIN_SAL,
                MAX_SALARY  = P_MAX_SAL,
                UPDATE_DATE = VN_CUR_DATE
        WHERE   JOB_ID = P_JOB_ID;
    ELSE
        INSERT INTO JOBS (JOB_ID, JOB_TITLE, MIN_SALARY, MAX_SALARY, CREATE_DATE, UPDATE_DATE)
        VALUES (P_JOB_ID, P_JOB_TITLE, P_MIN_SAL, P_MAX_SAL, SYSDATE, SYSDATE);
    END IF;
    
    
    COMMIT;
END;
/ 





