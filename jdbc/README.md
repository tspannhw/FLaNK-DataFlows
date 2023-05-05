### Reading from Apache Iceberg Tables with Cloudera DataFlow


#### Processor Settings

* Normalize Tables/Column Names: true
* Use Avro Logical Types: true
* Query

````
SELECT * FROM  `default`.tim_syslog_critical_archive

````

#### Services Settings

DBCPConnectionPool Impala Iceberg

* Database Connection URL:       jdbc:impala://oss-kudu-demo-gateway.oss-demo.qsm5-opic.cloudera.site:443/;ssl=1;transportMode=http;httpPath=oss-kudu-demo/cdp-proxy-api/impala;AuthMech=3;
* Database Driver Class Name:    com.cloudera.impala.jdbc.Driver 
* Database Driver Location(s):   #{Database Driver Location}    Set parameter and then upload driver
* Database User:                 #{CDP Workload Username} 
* Password:                      #{CDP Workload User Password} 
