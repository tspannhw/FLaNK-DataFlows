CREATE TABLE syslog_critical_archive
(priority int, severity int, facility int, version int, event_timestamp bigint, hostname string,
body string, appName string, procid string, messageid string, 
structureddata struct<sdid:struct<eventid:string,eventsource:string,iut:string>>)
STORED BY ICEBERG
STORED AS PARQUET
