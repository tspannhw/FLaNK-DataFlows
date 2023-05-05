### Reading from Apache Iceberg Tables with Cloudera DataFlow

Add a processor to your page to read, for example, ExecuteSQLRecord 1.20.0.2.3.8.1-1, and name it ExecuteSQLRecord Impala.  You can use any that use JDBC connections such as


![add](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/addprocessor.jpg)


* ExecuteSQL
* ExecuteSQLRecord
* QueryDatabaseTable
* QueryDatabaseTableRecord


![example](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/exampleflow.jpg)


#### Processor Settings

* Normalize Tables/Column Names: true
* Use Avro Logical Types: true
* Query

````
SELECT * FROM  `default`.tim_syslog_critical_archive

````

Set all your parameters in the processor.

![processor](https://github.com/tspannhw/FLaNK-DataFlows/blob/main/jdbc/querysettings.jpg)



#### Services Settings

First add a connection service for your processor.

![add](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/addservice.jpg)

Now you can add parameters to your service.

![service](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/dbconnectionpool.jpg)


Set all the following parameters.

![set](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/dbconnectionsettings.jpg)

* Service Name: DBCPConnectionPool Impala Iceberg

* Database Connection URL:       

````
jdbc:impala://oss-kudu-demo-gateway.oss-demo.qsm5-opic.cloudera.site:443/;ssl=1;transportMode=http;httpPath=oss-kudu-demo/cdp-proxy-api/impala;AuthMech=3;
````

* Database Driver Class Name:    

````
com.cloudera.impala.jdbc.Driver 
````

* Database Driver Location(s):   

````
#{Database Driver Location}    
`````

Set parameter and then upload driver

![upload](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/uploaddriver.jpg)


* Database User:                 

````
#{CDP Workload Username} 
````

* Password:                      

````
#{CDP Workload User Password} 
````

Detailed Parameters

![parm](https://raw.githubusercontent.com/tspannhw/FLaNK-DataFlows/main/jdbc/properties.jpg)

