alter session set nls_territory=SPAIN;
col PATH format a60
col REDUNDANCY_TYPE format a10
col "DSKGRP_NO:DISKGROUP" format a30
col max_dsk_size format 9G999G999G999
col min_dsk_size format 9G999G999G999
col TOTAL_MB format 9G999G999G999
col FREE_MB format 9G999G999G999
col TOTAL_NET_MB format 9G999G999G999
col FREE_NET_MB format 9G999G999G999
col PCT_USED format 9G999G999G999D99
col MAX_DSK_GB format 9G999G999G999D99
set pages 2000 lines 300
select
           b.GROUP_NUMBER || ':' || b.NAME  as "DSKGRP_NO:DISKGROUP",
           count(a.DISK_NUMBER)  as "NO_OF_DISKS",
		   max(a.TOTAL_MB)/1024 as "MAX_DSK_GB",
		   max(a.TOTAL_MB) as "max_dsk_size",
		   min(a.TOTAL_MB) as "min_dsk_size",
           sum(a.TOTAL_MB) as TOTAL_MB,
           sum(a.FREE_MB) as FREE_MB,
		   CASE b.TYPE 
			WHEN 'NORMAL' THEN sum(a.TOTAL_MB)/2
			ELSE sum(a.TOTAL_MB) 
		   END as TOTAL_NET_MB,
		   CASE b.TYPE 
			WHEN 'NORMAL' THEN sum(a.FREE_MB)/2
			ELSE sum(a.FREE_MB) 
		   END as FREE_NET_MB,
		   round((1-(sum(a.FREE_MB)/sum(a.TOTAL_MB)))*100,2) as PCT_USED,
		   b.TYPE as REDUNDANCY_TYPE
from v$asm_disk a
join v$asm_diskgroup b
on a.GROUP_NUMBER = b.GROUP_NUMBER
where a.NAME like '%&DISKGROUP%'
group by 
			b.GROUP_NUMBER || ':' || b.NAME,
			b.TYPE
order by 
			b.GROUP_NUMBER || ':' || b.NAME
/