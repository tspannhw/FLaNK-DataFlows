# Best in Flow Competition Tutorials
### Author: Michael Kohs,  George Vetticaden,  Timothy Spann,  Pierre Villard,  John Kuchmek,  Richard Cloudera SE Team
### Date: 04/18/2023
### Last Updated: 5/03/2023

### Quick Resource Links

* https://www.cloudera.com/solutions/dim-developer.html 
* https://community.cloudera.com/t5/Community-Articles/DataFlow-Designer-Event/ta-p/368947
* https://www.datainmotion.dev/2023/04/dataflow-processors.html
* https://github.com/tspannhw/FLaNK-TravelAdvisory
* https://github.com/tspannhw/FLaNK-AllTheStreams 
* http://Bestinflow.slack.com 
* https://attend.cloudera.com/nificommitters0503
* https://docs.google.com/forms/d/1Ku2KSDFoxJy45jiOWuLRDi9Trpgm-42aaxeAVwy-fpo/
* https://blog.cloudera.com/cloudera-dataflow-designer-the-key-to-agile-data-pipeline-development/
* https://www.linkedin.com/pulse/streaming-data-ingestion-open-lakehouse-made-easy-vetticaden/
* https://www.linkedin.com/pulse/streaming-data-ingestion-open-lakehouse-made-easy-vetticaden/
* https://www.youtube.com/watch?v=z-Nj7Xm13bI
* https://www.youtube.com/watch?v=p9-Y1PRYDn4&t=2s
* https://blog.cloudera.com/serverless-nifi-flows-with-dataflow-functions-the-next-step-in-the-dataflow-service-evolution/
* https://players.brightcove.net/6082840760001/default_default/index.html?videoId=6312274894112
* https://docs.cloudera.com/dataflow/cloud/overview/topics/cdf-key-features.html


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






#### References

* https://pierrevillard.com/author/pvillard31/
* https://www.datainmotion.dev/
* https://www.flankstack.dev/
* http://flipstackweekly.com/
