alter session set nls_territory=SPAIN;
set lin 300 pages 2000
col MEGS_ALLOC format 999G999G999D999
col MEGS_FREE format 999G999G999D999
col USED_MB format 999G999G999D999
col PCT_FREE format 999D99
col PCT_USED format 999D99
col MAX_MB format 999G999G999D999
col PCT_USED_MAX format 999D99
select  a.tablespace_name,
	   round(a.bytes_alloc / 1024 / 1024, 2) megs_alloc,
	   round(nvl(b.bytes_free, 0) / 1024 / 1024, 2) megs_free,
	   round((a.bytes_alloc - nvl(b.bytes_free, 0)) / 1024 / 1024, 2) USED_MB,
	   round((nvl(b.bytes_free, 0) / a.bytes_alloc) * 100,2) Pct_Free,
	   100 - round((nvl(b.bytes_free, 0) / a.bytes_alloc) * 100,2) Pct_used,
	   round(maxbytes/1048576,2) Max_MB
	   ,round((nvl(a.bytes_alloc-b.bytes_free, 0) / a.maxbytes) * 100,2) Pct_used_max
from  ( select  f.tablespace_name,
			   sum(f.bytes) bytes_alloc,
			   sum(decode(f.autoextensible, 'YES',f.maxbytes,'NO', f.bytes)) maxbytes
		from dba_data_files f
		group by tablespace_name) a,
	  ( select  f.tablespace_name,
			   sum(f.bytes)  bytes_free
		from dba_free_space f
		group by tablespace_name) b
where a.tablespace_name = b.tablespace_name (+)
union
select h.tablespace_name,
	   round(sum(h.bytes_free + h.bytes_used) / 1048576, 2),
	   round(sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / 1048576, 2),
	   round(sum(nvl(p.bytes_used, 0))/ 1048576, 2),
	   round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100,2),
	   100 - round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100,2),
	   round(max(h.bytes_used + h.bytes_free) / 1048576, 2),
	   100 - round((sum((h.bytes_free + h.bytes_used) - nvl(p.bytes_used, 0)) / sum(h.bytes_used + h.bytes_free)) * 100,2)
from   sys.v_$TEMP_SPACE_HEADER h, sys.v_$Temp_extent_pool p
where  p.file_id(+) = h.file_id
and    p.tablespace_name(+) = h.tablespace_name
group by h.tablespace_name
ORDER BY 8 desc
/
