# Best in Flow Competition Tutorials
### Author: Michael Kohs  George Vetticaden Timothy Spann
### Date: 04/18/2023
### Last Updated: 4/28/2023


### Useful Data Assets

* Setting Your Workload Password
* Creating a Kafka Topic
* Use Case walkthrough	
* 1. Reading and filtering a stream of syslog data	
* 2. Writing critical syslog events to Apache Iceberg for analysis	

### Use Case Walkthrough for Competition

#### Notice

This document assumes that you have registered for an account, activated it and logged into the CDP Sandbox.   This is for authorized users only who have attended the webinar and have read the training materials.

#### A short guide and references are listed here.

#### Competition Resources

#### Kafka Broker connection string 

````
oss-kafka-demo-corebroker2.oss-demo.qsm5-opic.cloudera.site:9093,
oss-kafka-demo-corebroker1.oss-demo.qsm5-opic.cloudera.site:9093,
oss-kafka-demo-corebroker0.oss-demo.qsm5-opic.cloudera.site:9093
````

#### Kafka Topics

````
syslog_json
syslog_avro
syslog_critical
````

#### Schema Registry Hostname

````
oss-kafka-demo-master0.oss-demo.qsm5-opic.cloudera.site
````

#### Schema Name

````
syslog
syslog_avro
syslog_transformed
````


#### Syslog Filter Rule

````
SELECT * FROM FLOWFILE WHERE severity <= 2
````

####  Your Workflow User Name and Password



If your Workload Password does not say currently set or you forgot it, follow the steps below to reset it.   Your userid is shown above at Workload User Name.
