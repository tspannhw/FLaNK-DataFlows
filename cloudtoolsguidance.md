Cloud Tools Guidance
Author: Michael Kohs  George Vetticaden Timothy Spann 
Date: 04/19/2023
Last Updated: 5/01/2023

### References:

* https://www.datainmotion.dev/2023/05/cloud-tools-guidance-how-to-build-data.html
* https://www.datainmotion.dev/2023/05/cloud-tools-guidance-how-to-build-data_2.html
* https://www.datainmotion.dev/2023/05/cloud-tools-guidance-how-to-build-data_18.html
* https://www.datainmotion.dev/2023/05/best-in-flow-competition-bring-your-own.html
* https://www.datainmotion.dev/2023/05/best-in-flow-competition-streaming-data.html




### Notice

This document assumes that you have registered for an account, activated it and logged into the CDP Sandbox.   This is for authorized users only who have attended the webinar and have read the training materials.

A short guide and references are listed here.

## THIS IS NOT FOR USE WITH THE FIRST TWO TUTORIALS.   THIS IS FOR BUILDING ASSETS FOR YOUR OWN NEW FLOWS.

### How To Build Data Assets

#### 1.1 Create a Kafka Topic

#### Navigate to Data Hub Clusters



 
Navigate to the oss-kafka-demo cluster



Navigate to Streams Messaging Manager   




Info:   Streams Messaging Manager (SMM) is a tool for working with Apache Kafka.



Now that you are in SMM. 


Navigate to the round icon third from the top, click this Topic button. 

You are now in the Topic browser.


Click Add New to build a new topic.

Enter the name of your topic prefixed with your “Workload User Name“ <yourusername>_yournewtopic, ex:   tim_younewtopic.



Enter the name of your topic prefixed with your Workload User Name, ex:   tim_younewtopic.   For settings you should create it with (3 partitions, cleanup.policy: delete, availability maximum) as shown above.

Congratulations! You have built a new topic.   










1.2 Create a Schema If You Need One.  Not Required For Using Kafka Topics or Tutorials.


Navigate to Schema Registry from the Kafka Data Hub.





You will see existing schemas.   



Click the white plus sign in the gray hexagon to create a new schema.





You can now add a new schema by entering a unique name starting with your Workload User Name (ex:  tim), followed by a short description and then the schema text as shown.   If you need examples, see the github list at the end of this guide.




Click Save and you have a new schema.   If there were errors they will be shown and you can fix them.   For more help see, Schema Registry Documentation and Schema Registry Public Cloud.


Congratulations! You have built a new schema.   Start using it in your DataFlow application.




1.3 Create an Apache Iceberg Table

Navigate to oss-kudu-demo from the Data Hubs list






Navigate to Hue from the Kudu Data Hub.




Inside of Hue you can now create your table.



Navigate to your database, this was created for you. 


Info:   The database name pattern is your email address and then all special characters are replaced with underscore and then _db is appended to that to make the db name and the ranger policy is created to limit access to just the user and those that are in the admin group.   For example:  







Create your Apache Iceberg table, it must be prefixed with your Work Load User Name (userid).  



CREATE TABLE <<userid>>_syslog_critical_archive
(priority int, severity int, facility int, version int, event_timestamp bigint, hostname string,
body string, appName string, procid string, messageid string,
structureddata struct<sdid:struct<eventid:string,eventsource:string,iut:string>>)
STORED BY ICEBERG






Your table is created in s3a://oss-uat2/iceberg/ 



Once you have sent data to your table, you can query it.




Additional Documentation
Create a Table
Query a Table
Apache Iceberg Table Properties








Streaming Data Sets Available for Apps

The following Kafka topics are being populated with streaming data for you.


These come from the read-only Kafka cluster.

Navigate to the Data Hub Clusters.




Click on oss-kafka-datagen.


Click Schema Registry.



Click Streams Messaging Manager.




Use these brokers to connect to them:

Brokers

oss-kafka-datagen-corebroker1.oss-demo.qsm5-opic.cloudera.site:9093,oss-kafka-datagen-corebroker0.oss-demo.qsm5-opic.cloudera.site:9093,oss-kafka-datagen-corebroker2.oss-demo.qsm5-opic.cloudera.site:9093

Use this link for Schema Registry

https://#{Schema2}:7790/api/v1

Schema Registry Parameter Hostname:   Schema2

oss-kafka-datagen-master0.oss-demo.qsm5-opic.cloudera.site

To View Schemas in the Schema Registry click the icon from the datahub

https://oss-kafka-datagen-gateway.oss-demo.qsm5-opic.cloudera.site/oss-kafka-datagen/cdp-proxy/schema-registry/ui/#/

Schemas
https://github.com/tspannhw/FLaNK-DataFlows/tree/main/schemas

Group ID:   yourid_cdf 


Customers  (customer)

Example Row
{"first_name":"Charley","last_name":"Farrell","age":19,"city":"Sawaynside","country":"Guinea","email":"keven.herzog@hotmail.com","phone_number":"312-269-6619"}



IP Tables (ip_address)

Example Row
{"source_ip":"216.25.204.241","dest_port":219,"tcp_flags_ack":0,"tcp_flags_reset":0,"ts":"2023-04-20 15:26:45.517"}



Orders       (orders)

Example Row
{"order_id":84170282,"city":"Wintheiserton","street_address":"80206 Caroyln Lakes","amount":29,"order_time":"2023-04-20 13:25:06.097","order_status":"DELIVERED"}





Plants (plant)

Example Row
{"plant_id":829,"city":"Lake Gerald","lat":"39.568679","lon":"-151.64497","country":"Eritrea"}


Sensors (sensor)

Example Row
{"sensor_id":264,"timestamp_of_production":"2023-04-20 18:28:42.751"}




Sensor Data (sensor_data)

Example Row
{"sensor_id":250,"timestamp_of_production":"2023-04-20 18:42:04.847","sensor_value":-72}



Weather (weather)

Example Row
{"city":"New Ernesto","temp_c":21,"description":"Sleet"}




Transactions  (transactions)

Example Row
{"sender_id":40816,"receiver_id":96057,"amount":557,"execution_date":"2023-04-20 16:15:30.744","currency":"UYU"}




These are realistic generated data sources that you can use, they are available from read-only Kafka topics.   These can be consumed by any developers in the sandbox.

Make sure you name your Kafka Consumer your Workload Username _ Some Name.

Ex:    tim_customerdata_reader



Bring Your Own Data (Public Only)

Data is visible and downloadable to all, make sure it is safe, free, open, public data.
Public REST Feeds are good
Wikipedia https://docs.cloudera.com/dataflow/cloud/flow-designer-beginners-guide-readyflow/topics/cdf-flow-designer-getting-started-readyflow.html 
https://gbfs.citibikenyc.com/gbfs/en/station_status.json
https://travel.state.gov/_res/rss/TAsTWs.xml 
https://www.njtransit.com/rss/BusAdvisories_feed.xml 
https://www.njtransit.com/rss/RailAdvisories_feed.xml
https://www.njtransit.com/rss/LightRailAdvisories_feed.xml 
https://www.njtransit.com/rss/CustomerNotices_feed.xml 
https://w1.weather.gov/xml/current_obs/all_xml.zip 
https://dailymed.nlm.nih.gov/dailymed/services/v2/spls.json?page=1&pagesize=100 
https://dailymed.nlm.nih.gov/dailymed/services/v2/drugnames.json?pagesize=100 
https://dailymed.nlm.nih.gov/dailymed/rss.cfm 
Generic data files
https://aws.amazon.com/data-exchange 
Simulators
Use external data simulators via REST
Use GeneralFlowFile see:  https://www.datainmotion.dev/2019/04/integration-testing-for-apache-nifi.html 
Schemas, Data Sources  and Examples
https://github.com/tspannhw/FLaNK-AllTheStreams/
https://github.com/tspannhw/FLaNK-DataFlows
https://github.com/tspannhw/FLaNK-TravelAdvisory/
https://github.com/tspannhw/FLiP-Current22-LetsMonitorAllTheThings 
https://github.com/tspannhw/create-nifi-kafka-flink-apps 
https://www.datainmotion.dev/2021/01/flank-real-time-transit-information-for.html 





