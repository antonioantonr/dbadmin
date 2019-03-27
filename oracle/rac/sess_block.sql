col sidserial format a15
col HORA_LOGIN format a20
col client_identifier format a10
col hora_ini format a10
col h_logon format a10
col texto format a30
col ET format 999999
col ss_wait format 999999
col I format 9
col bi format 9
col bs format 999999
col username format a15
col module format a15
col machine format a15
col srv format a10
col EVENT format a25
col OSUSER format a10
select ses.sid||','||ses.serial#||',@'||ses.inst_id as sidserial,
       p.spid ospid,
       ses.process,
	   ses.username,
	   ses.machine,
 ses.module,
       ses.program, -- Esta SI
       substr(ses.status,0,1) status, -- Esta SI
	   ses.osuser,
	   ses.client_identifier, -- Esta SI
       ses.wait_class, --Esta SI
	   ses.event,
		blocking_instance bi,
		blocking_session bs,
		to_char(ses.logon_time,'YYYY/MM/DD HH24:MI:SS') as h_logon,
	   to_char(sysdate-(ses.last_call_et/24/60/60),'YYYY/MM/DD HH24:MI:SS') as hora_ini,
    seconds_in_wait as ss_wait,
	   last_call_et ET,
	   substr((select sql_text from gv$sql vsql where vsql.sql_id=ses.sql_id and rownum = 1),0,150) texto,
		ses.sql_id
  from gv$session ses
  left outer join gv$sql sq on (ses.sql_id = sq.sql_id and sq.inst_id = ses.inst_id and sq.child_number = ses.sql_child_number)
  ,gv$process p
  where p.addr = ses.paddr
  and p.inst_id = ses.inst_id
   and ses.type <> 'BACKGROUND'
  and (ses.inst_id||','||ses.sid in (select blocking_instance||','||blocking_session
		  from gv$session
		  where blocking_session is not null)
  or blocking_session is not null)
order by last_call_et;
