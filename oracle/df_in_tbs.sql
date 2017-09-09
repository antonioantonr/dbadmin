col FILE_NAME format a85
select FILE_ID,tablespace_name,file_name,autoextensible,sum(bytes)/1024/1024 total_mb,sum(MAXBYTES)/1024/1024 from dba_data_files
where tablespace_name like '%&1%'
group by FILE_ID,tablespace_name,file_name,autoextensible
order by 1,3
/
