BREAK on tablespace_name skip 1 on report
COMPUTE SUM OF TOTAL_MB on tablespace_name
COMPUTE SUM OF TOTAL_MB on report
COMPUTE SUM OF max_mb on tablespace_name
COMPUTE SUM OF max_mb on report

col FILE_NAME format a85
select tablespace_name,file_id,file_name,autoextensible,sum(bytes)/1024/1024 total_mb,sum(MAXBYTES)/1024/1024 max_mb from dba_data_files
where tablespace_name like '%%'
group by tablespace_name,file_id,file_name,autoextensible
union
select tablespace_name,file_id,file_name,autoextensible,sum(bytes)/1024/1024 total_mb,sum(MAXBYTES)/1024/1024 mx_mb from dba_temp_files
where tablespace_name like '%%'
group by tablespace_name,file_id,file_name,autoextensible
--order by 1,3
order by 1,2
/

CLEAR BREAKS
CLEAR COMPUTES
