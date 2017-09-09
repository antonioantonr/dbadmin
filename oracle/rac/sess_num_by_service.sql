col username format a20
col machine format a30
col program format a50
col module format a35
col process format a20
col service_name format a25
col osuser format a17
col client_identifier format a15
col min_h_logon format a25
col max_h_logon format a25
select inst_id,
username,machine--,terminal,program
--,status
--,client_identifier
,
service_name,
to_char(min(logon_time),'YYYY/MM/DD HH24:MI:SS') as min_h_logon,
to_char(max(logon_time),'YYYY/MM/DD HH24:MI:SS') as max_h_logon,
--to_char(sysdate-(last_call_et/24/60/60),'YYYY/MM/DD') as hora_ini,
--,module
--osuser,--process,
--status,
count(*)
from gv$session
--where upper(machine) like '%APPS%'
--where upper(machine) not like '%DBOR%'
--where username = 'INFOPAL'
--where username is not null
group by inst_id,
username,machine--,terminal,program
--,client_identifier
--,status
,service_name
--,to_char(logon_time,'YYYY/MM/DD HH24:MI:SS')
--,to_char(sysdate-(last_call_et/24/60/60),'YYYY/MM/DD')
--,module
--,osuser--,process
--,status
order by service_name,username,machine;
