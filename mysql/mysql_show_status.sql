mysql> show processlist;
+----+------+-------------------+------+---------+------+-------+------------------+
| Id | User | Host              | db   | Command | Time | State | Info             |
+----+------+-------------------+------+---------+------+-------+------------------+
| 67 | root | localhost         | NULL | Sleep   | 4019 |       | NULL             |
| 75 | root | 172.29.48.77:6285 | NULL | Query   |    0 | init  | show processlist |
+----+------+-------------------+------+---------+------+-------+------------------+
2 rows in set (0.00 sec)

mysql> status;
--------------
mysql  Ver 14.14 Distrib 5.5.35, for CYGWIN (i686) using readline 6.1

Connection id:          75
Current database:
Current user:           root@172.29.48.77
SSL:                    Not in use
Current pager:          stdout
Using outfile:          ''
Using delimiter:        ;
Server version:         5.6.19 MySQL Community Server (GPL)
Protocol version:       10
Connection:             ad0dbor003vx via TCP/IP
Server characterset:    latin1
Db     characterset:    latin1
Client characterset:    utf8
Conn.  characterset:    utf8
TCP port:               3306
Uptime:                 3 days 4 hours 8 min 41 sec

Threads: 2  Questions: 2649  Slow queries: 0  Opens: 652  Flush tables: 1  Open tables: 126  Queries per second avg: 0.009
--------------

mysql> SHOW session STATUS like '%lock%';
+------------------------------------------+-------+
| Variable_name                            | Value |
+------------------------------------------+-------+
| Com_lock_tables                          | 0     |
| Com_unlock_tables                        | 0     |
| Handler_external_lock                    | 0     |
| Innodb_row_lock_current_waits            | 0     |
| Innodb_row_lock_time                     | 0     |
| Innodb_row_lock_time_avg                 | 0     |
| Innodb_row_lock_time_max                 | 0     |
| Innodb_row_lock_waits                    | 0     |
| Key_blocks_not_flushed                   | 0     |
| Key_blocks_unused                        | 6680  |
| Key_blocks_used                          | 21    |
| Performance_schema_locker_lost           | 0     |
| Performance_schema_rwlock_classes_lost   | 0     |
| Performance_schema_rwlock_instances_lost | 0     |
| Qcache_free_blocks                       | 1     |
| Qcache_total_blocks                      | 1     |
| Table_locks_immediate                    | 374   |
| Table_locks_waited                       | 0     |
+------------------------------------------+-------+
18 rows in set (0.00 sec)

mysql> SHOW GLOBAL STATUS like '%lock%';
+------------------------------------------+-------+
| Variable_name                            | Value |
+------------------------------------------+-------+
| Com_lock_tables                          | 33    |
| Com_unlock_tables                        | 34    |
| Handler_external_lock                    | 844   |
| Innodb_row_lock_current_waits            | 0     |
| Innodb_row_lock_time                     | 0     |
| Innodb_row_lock_time_avg                 | 0     |
| Innodb_row_lock_time_max                 | 0     |
| Innodb_row_lock_waits                    | 0     |
| Key_blocks_not_flushed                   | 0     |
| Key_blocks_unused                        | 6680  |
| Key_blocks_used                          | 21    |
| Performance_schema_locker_lost           | 0     |
| Performance_schema_rwlock_classes_lost   | 0     |
| Performance_schema_rwlock_instances_lost | 0     |
| Qcache_free_blocks                       | 1     |
| Qcache_total_blocks                      | 1     |
| Table_locks_immediate                    | 374   |
| Table_locks_waited                       | 0     |
+------------------------------------------+-------+
18 rows in set (0.00 sec)

mysql> SHOW VARIABLES like '%conn%';
+-----------------------------------------------+-----------------+
| Variable_name                                 | Value           |
+-----------------------------------------------+-----------------+
| character_set_connection                      | utf8            |
| collation_connection                          | utf8_general_ci |
| connect_timeout                               | 10              |
| disconnect_on_expired_password                | ON              |
| init_connect                                  |                 |
| max_connect_errors                            | 100             |
| max_connections                               | 151             |
| max_user_connections                          | 0               |
| performance_schema_session_connect_attrs_size | 512             |
+-----------------------------------------------+-----------------+
9 rows in set (0.00 sec)

mysql> select user();
+-------------------+
| user()            |
+-------------------+
| root@172.29.48.77 |
+-------------------+
1 row in set (0.00 sec)

mysql> show engine innodb status;
+--------+------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| Type   | Name | Status                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
+--------+------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
| InnoDB |      |
=====================================
2014-08-04 14:47:20 7f3f439eb700 INNODB MONITOR OUTPUT
=====================================
Per second averages calculated from the last 25 seconds
-----------------
BACKGROUND THREAD
-----------------
srv_master_thread loops: 5 srv_active, 0 srv_shutdown, 274401 srv_idle
srv_master_thread log flush and writes: 274406
----------
SEMAPHORES
----------
OS WAIT ARRAY INFO: reservation count 5
OS WAIT ARRAY INFO: signal count 5
Mutex spin waits 7, rounds 42, OS waits 1
RW-shared spins 4, rounds 120, OS waits 4
RW-excl spins 0, rounds 0, OS waits 0
Spin rounds per wait: 6.00 mutex, 30.00 RW-shared, 0.00 RW-excl
------------
TRANSACTIONS
------------
Trx id counter 2889
Purge done for trx's n:o < 0 undo n:o < 0 state: running but idle
History list length 0
LIST OF TRANSACTIONS FOR EACH SESSION:
---TRANSACTION 0, not started
MySQL thread id 76, OS thread handle 0x7f3f439eb700, query id 2678 172.29.48.77 root init
show engine innodb status
--------
FILE I/O
--------
I/O thread 0 state: waiting for completed aio requests (insert buffer thread)
I/O thread 1 state: waiting for completed aio requests (log thread)
I/O thread 2 state: waiting for completed aio requests (read thread)
I/O thread 3 state: waiting for completed aio requests (read thread)
I/O thread 4 state: waiting for completed aio requests (read thread)
I/O thread 5 state: waiting for completed aio requests (read thread)
I/O thread 6 state: waiting for completed aio requests (write thread)
I/O thread 7 state: waiting for completed aio requests (write thread)
I/O thread 8 state: waiting for completed aio requests (write thread)
I/O thread 9 state: waiting for completed aio requests (write thread)
Pending normal aio reads: 0 [0, 0, 0, 0] , aio writes: 0 [0, 0, 0, 0] ,
 ibuf aio reads: 0, log i/o's: 0, sync i/o's: 0
Pending flushes (fsync) log: 0; buffer pool: 0
190 OS file reads, 188 OS file writes, 80 OS fsyncs
0.00 reads/s, 0 avg bytes/read, 0.00 writes/s, 0.00 fsyncs/s
-------------------------------------
INSERT BUFFER AND ADAPTIVE HASH INDEX
-------------------------------------
Ibuf: size 1, free list len 0, seg size 2, 0 merges
merged operations:
 insert 0, delete mark 0, delete 0
discarded operations:
 insert 0, delete mark 0, delete 0
Hash table size 276707, node heap has 0 buffer(s)
0.00 hash searches/s, 0.00 non-hash searches/s
---
LOG
---
Log sequence number 1693423
Log flushed up to   1693423
Pages flushed up to 1693423
Last checkpoint at  1693423
0 pending log writes, 0 pending chkp writes
37 log i/o's done, 0.00 log i/o's/second
----------------------
BUFFER POOL AND MEMORY
----------------------
Total memory allocated 137363456; in additional pool allocated 0
Dictionary memory allocated 99225
Buffer pool size   8192
Free buffers       7952
Database pages     240
Old database pages 0
Modified db pages  0
Pending reads 0
Pending writes: LRU 0, flush list 0, single page 0
Pages made young 0, not young 0
0.00 youngs/s, 0.00 non-youngs/s
Pages read 174, created 66, written 123
0.00 reads/s, 0.00 creates/s, 0.00 writes/s
No buffer pool page gets since the last printout
Pages read ahead 0.00/s, evicted without access 0.00/s, Random read ahead 0.00/s
LRU len: 240, unzip_LRU len: 0
I/O sum[0]:cur[0], unzip sum[0]:cur[0]
--------------
ROW OPERATIONS
--------------
0 queries inside InnoDB, 0 queries in queue
0 read views open inside InnoDB
Main thread process no. 886, id 139909656209152, state: sleeping
Number of rows inserted 0, updated 0, deleted 0, read 45
0.00 inserts/s, 0.00 updates/s, 0.00 deletes/s, 0.00 reads/s
----------------------------
END OF INNODB MONITOR OUTPUT
============================
 |
+--------+------+--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
1 row in set (0.00 sec)
