Customer Table:

Faker Table:

DROP TABLE IF EXISTS customer_test;
CREATE TABLE customer_test (
 `first_name` STRING,
 `last_name` STRING,
 `age` INT,
 `city`  STRING,
 `country`  STRING,
 `email`  STRING,
 `phone_number`  STRING
) WITH (
'connector' = 'faker',
'fields.first_name.expression' = '#{name.firstName}',
'fields.last_name.expression' = '#{name.lastName}',
'fields.age.expression' = '#{number.numberBetween ''18'',''100''}',
'fields.city.expression' = '#{address.cityName}',
'fields.country.expression' = '#{country.name}',
'fields.email.expression' = '#{internet.emailAddress}',
'fields.phone_number.expression' = '#{phone_number.cellPhone}',
'rows-per-second' = '10'
);



Kafka Table:

CREATE TABLE customer (
 `first_name` STRING,
 `last_name` STRING,
 `age` INT,
 `city`  STRING,
 `country`  STRING,
 `email`  STRING,
 `phone_number`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'customer',
 'properties.group.id' = 'customer-group-id',
 'properties.auto.offset.reset' = 'latest'
);


CREATE TABLE customer (
`first_name` STRING,
`last_name` STRING,
`age` INT,
`city`  STRING,
`country`  STRING,
`email`  STRING,
`phone_number`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'customer',
'properties.group.id' = 'customer-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen:
insert into customer
select * from customer_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "first_name",
     "type": "string",
     "doc": "Type inferred from '\"Vern\"'"
   },
   {
     "name": "last_name",
     "type": "string",
     "doc": "Type inferred from '\"Reichel\"'"
   },
   {
     "name": "age",
     "type": "long",
     "doc": "Type inferred from '95'"
   },
   {
     "name": "city",
     "type": "string",
     "doc": "Type inferred from '\"South Verlene\"'"
   },
   {
     "name": "country",
     "type": "string",
     "doc": "Type inferred from '\"Samoa\"'"
   },
   {
     "name": "email",
     "type": "string",
     "doc": "Type inferred from '\"saturnina.grady@gmail.com\"'"
   },
   {
     "name": "phone_number",
     "type": "string",
     "doc": "Type inferred from '\"(524) 420-9613\"'"
   }
 ]
}


Orders Table:

Faker Table:

DROP TABLE IF EXISTS orders;
CREATE TABLE  orders_test (
order_id INTEGER,
city STRING,
street_address STRING,
amount INTEGER,
order_time TIMESTAMP(3),
order_status STRING,
WATERMARK FOR `order_time` AS order_time - INTERVAL '15' SECOND
) WITH (
'connector' = 'faker',
'rows-per-second' = '1',
'fields.order_id.expression' = '#{number.numberBetween ''0'',''99999999''}',
'fields.city.expression' = '#{Address.city}',
'fields.street_address.expression' = '#{Address.street_address}',
'fields.amount.expression' = '#{number.numberBetween ''0'',''100''}',
'fields.order_time.expression' = '#{date.past ''15'',''SECONDS''}',
'fields.order_status.expression' = '#{regexify ''(RECEIVED|PREPARING|DELIVERING|DELIVERED|CANCELED){1}''}'
);

Kafka Table:

CREATE TABLE `ssb`.`ssb_default`.`orders` (
 `order_id` INT,
 `city` VARCHAR(2147483647),
 `street_address` VARCHAR(2147483647),
 `amount` INT,
 `order_time` TIMESTAMP(3),
 `order_status` VARCHAR(2147483647)
) WITH (
'connector' = 'kafka: oss-kafka-datagen,
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'orders',
 'properties.group.id' = 'order-group-id',
 'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE orders (
`order_id` INT,
`city` STRING,
`street_address` STRING,
`amount` INT,
`order_time` TIMESTAMP(3),
`order_status` STRING
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'orders',
'properties.group.id' = 'order-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen:

insert into orders
select * from orders_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "order_id",
     "type": "long",
     "doc": "Type inferred from '1941426'"
   },
   {
     "name": "city",
     "type": "string",
     "doc": "Type inferred from '\"East Jakestad\"'"
   },
   {
     "name": "street_address",
     "type": "string",
     "doc": "Type inferred from '\"9213 Mitchell Viaduct\"'"
   },
   {
     "name": "amount",
     "type": "long",
     "doc": "Type inferred from '14'"
   },
   {
     "name": "order_time",
     "type": "string",
     "doc": "Type inferred from '\"2023-04-20 21:33:02.226\"'"
   },
   {
     "name": "order_status",
     "type": "string",
     "doc": "Type inferred from '\"DELIVERED\"'"
   }
 ]
}

IP Tables:

Faker Table:

CREATE TABLE ip_test (
 `source_ip` VARCHAR(2147483647),
 `dest_port` INT,
 `tcp_flags_ack` INT,
 `tcp_flags_reset` INT,
 `ts` TIMESTAMP(3),
 WATERMARK FOR `ts` AS `ts` - INTERVAL '5' SECOND
) WITH (
 'fields.dest_port.expression' = '#{number.numberBetween ''80'',''9000''}',
 'fields.tcp_flags_reset.expression' = '#{number.numberBetween ''0'',''2''}',
 'fields.ts.expression' = '#{date.past ''15'',''5'',''SECONDS''}',
 'connector' = 'faker',
 'fields.tcp_flags_ack.expression' = '#{number.numberBetween ''0'',''2''}',
 'fields.source_ip.expression' = '#{Internet.ipV4Address}',
 'rows-per-second' = '10'
)


Kafka Table:

CREATE TABLE ip_address (
`source_ip` VARCHAR(2147483647),
`dest_port` INT,
`tcp_flags_ack` INT,
`tcp_flags_reset` INT,
`ts` TIMESTAMP(3),
WATERMARK FOR `ts` AS `ts` - INTERVAL '5' SECOND
) WITH (
'connector' = 'kafka: oss-kafka-demo',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'ip_address',
'properties.group.id' = 'ip-group-id',
'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE ip_address (
`source_ip` VARCHAR(2147483647),
`dest_port` INT,
`tcp_flags_ack` INT,
`tcp_flags_reset` INT,
`ts` TIMESTAMP(3),
WATERMARK FOR `ts` AS `ts` - INTERVAL '5' SECOND
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'ip_address',
'properties.group.id' = 'ip-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen:

insert into ip_address
select * from ip_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "source_ip",
     "type": "string",
     "doc": "Type inferred from '\"250.224.26.210\"'"
   },
   {
     "name": "dest_port",
     "type": "long",
     "doc": "Type inferred from '2153'"
   },
   {
     "name": "tcp_flags_ack",
     "type": "long",
     "doc": "Type inferred from '1'"
   },
   {
     "name": "tcp_flags_reset",
     "type": "long",
     "doc": "Type inferred from '0'"
   },
   {
     "name": "ts",
     "type": "string",
     "doc": "Type inferred from '\"2023-04-20 21:39:08.492\"'"
   }
 ]
}

Transactions:

Faker Table

CREATE TABLE transactions_test (
 `sender_id` INT,
 `receiver_id` INT,
 `amount` INT,
 `execution_date`  TIMESTAMP,
 `currency`  STRING
) WITH (
'connector' = 'faker',
'fields.sender_id.expression' = '#{number.numberBetween ''0'',''100000''}',
'fields.receiver_id.expression' = '#{number.numberBetween ''0'',''100000''}',
'fields.amount.expression' = '#{number.numberBetween ''0'',''5000''}',
'fields.execution_date.expression' = '#{date.past ''15'' ''SECONDS''}',
'fields.currency.expression' = '#{currency.code}',
'rows-per-second' = '10'
);

Kafka Table

CREATE TABLE transactions (
 `sender_id` INT,
 `receiver_id` INT,
 `amount` INT,
 `execution_date`  TIMESTAMP,
 `currency`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'transactions',
 'properties.group.id' = 'transactions-group-id',
 'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE transactions (
`sender_id` INT,
`receiver_id` INT,
`amount` INT,
`execution_date`  TIMESTAMP,
`currency`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'transactions',
'properties.group.id' = 'transactions-group-id',
'properties.auto.offset.reset' = 'latest'
);



DataGen:
insert into transactions
select * from transactions_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "sender_id",
     "type": "long",
     "doc": "Type inferred from '95791'"
   },
   {
     "name": "receiver_id",
     "type": "long",
     "doc": "Type inferred from '58024'"
   },
   {
     "name": "amount",
     "type": "long",
     "doc": "Type inferred from '3409'"
   },
   {
     "name": "execution_date",
     "type": "string",
     "doc": "Type inferred from '\"2023-04-20 21:41:17.589\"'"
   },
   {
     "name": "currency",
     "type": "string",
     "doc": "Type inferred from '\"PLN\"'"
   }
 ]
}


Plant Table:

Faker Table

CREATE TABLE plant_test (
 `plant_id` INT,
 `city` STRING,
 `lat` STRING,
 `lon`  STRING,
 `country`  STRING
) WITH (
'connector' = 'faker',
'fields.plant_id.expression' = '#{number.numberBetween ''0'',''1000''}',
'fields.city.expression' = '#{address.cityName}',
'fields.lat.expression' = '#{address.latitude}',
'fields.lon.expression' = '#{address.longitude}',
'fields.country.expression' = '#{address.country}',
'rows-per-second' = '10'
);

Kafka Table

CREATE TABLE plant (
 `plant_id` INT,
 `city` STRING,
 `lat` STRING,
 `lon`  STRING,
 `country`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'plant',
 'properties.group.id' = 'plant-group-id',
 'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE plant (
`plant_id` INT,
`city` STRING,
`lat` STRING,
`lon`  STRING,
`country`  STRING
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'plant',
'properties.group.id' = 'plant-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen

insert into plant
select * from plant_test
Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "plant_id",
     "type": "long",
     "doc": "Type inferred from '895'"
   },
   {
     "name": "city",
     "type": "string",
     "doc": "Type inferred from '\"Rolfsonshire\"'"
   },
   {
     "name": "lat",
     "type": "string",
     "doc": "Type inferred from '\"-88.804515\"'"
   },
   {
     "name": "lon",
     "type": "string",
     "doc": "Type inferred from '\"46.418342\"'"
   },
   {
     "name": "country",
     "type": "string",
     "doc": "Type inferred from '\"Djibouti\"'"
   }
 ]
}

Sensor Table:

Faker Table

CREATE TABLE sensor_test (
 `sensor_id` INT,
 `timestamp_of_production` TIMESTAMP
) WITH (
'connector' = 'faker',
'fields.sensor_id.expression' = '#{number.numberBetween ''0'',''1000''}',
'fields.timestamp_of_production.expression' = '#{date.past ''15'',''SECONDS''}',
'rows-per-second' = '10'
);

Kafka Table

CREATE TABLE sensor (
 `sensor_id` INT,
 `timestamp_of_production` TIMESTAMP
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'sensor',
 'properties.group.id' = 'sensor-group-id',
 'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE sensor (
`sensor_id` INT,
`timestamp_of_production` TIMESTAMP
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'sensor',
'properties.group.id' = 'sensor-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen

insert into sensor
select * from sensor_test

Schema
{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "sensor_id",
     "type": "long",
     "doc": "Type inferred from '903'"
   },
   {
     "name": "timestamp_of_production",
     "type": "string",
     "doc": "Type inferred from '\"2023-04-20 21:51:34.658\"'"
   }
 ]
}



Sensor Data:

Faker Table:

REATE TABLE sensor_data_test (
 `sensor_id` INT,
 `timestamp_of_production` TIMESTAMP,
 `sensor_value` INT
) WITH (
'connector' = 'faker',
'fields.sensor_id.expression' = '#{number.numberBetween ''0'',''1000''}',
'fields.timestamp_of_production.expression' = '#{date.past ''15'',''SECONDS''}',
'fields.sensor_value.expression' = '#{number.numberBetween ''-100'',''100''}',
'rows-per-second' = '10'
);

Kafka Table:

CREATE TABLE sensor_data (
 `sensor_id` INT,
 `timestamp_of_production` TIMESTAMP,
 `sensor_value` INT
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'sensor_data',
 'properties.group.id' = 'sensor_data-group-id',
 'properties.auto.offset.reset' = 'latest'
);

DataGen

insert into sensor_data
select * from sensor_data_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "sensor_id",
     "type": "long",
     "doc": "Type inferred from '92'"
   },
   {
     "name": "timestamp_of_production",
     "type": "string",
     "doc": "Type inferred from '\"2023-04-20 21:53:05.143\"'"
   },
   {
     "name": "sensor_value",
     "type": "long",
     "doc": "Type inferred from '-26'"
   }
 ]
}


Weather Table:

Faker Table

CREATE TABLE weather_test (
 `city` STRING,
 `temp_c` INT,
 `description` STRING
) WITH (
'connector' = 'faker',
'fields.city.expression' = '#{Address.city}',
'fields.temp_c.expression' = '#{number.numberBetween ''-89'',''56''}',
'fields.description.expression' = '#{weather.description}',
'rows-per-second' = '10'
);

Kafka Table

CREATE TABLE weather (
 `city` STRING,
 `temp_c` INT,
 `description` STRING
) WITH (
'connector' = 'kafka: oss-kafka-demo',
 'format' = 'json',
 'scan.startup.mode' = 'group-offsets',
 'topic' = 'weather',
 'properties.group.id' = 'weather-group-id',
 'properties.auto.offset.reset' = 'latest'
);

CREATE TABLE weather (
`city` STRING,
`temp_c` INT,
`description` STRING
) WITH (
'connector' = 'kafka: oss-kafka-datagen',
'format' = 'json',
'scan.startup.mode' = 'group-offsets',
'topic' = 'weather',
'properties.group.id' = 'weather-group-id',
'properties.auto.offset.reset' = 'latest'
);

DataGen

insert into weather
select * from weather_test

Schema

{
 "type": "record",
 "name": "inferredSchema",
 "fields": [
   {
     "name": "city",
     "type": "string",
     "doc": "Type inferred from '\"East Crissy\"'"
   },
   {
     "name": "temp_c",
     "type": "long",
     "doc": "Type inferred from '-74'"
   },
   {
     "name": "description",
     "type": "string",
     "doc": "Type inferred from '\"Mostly cloudy\"'"
   }
 ]
}

