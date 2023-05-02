To give a user write access to an Iceberg table, we need to do two things:

create a policy that grants write access to the table object

create a policy that grants "RW Storage" access to the storage URL

It looks like you have done 1)

Now we need to do 2):

Storage type: iceberg
Storage URL: DBname/Table*, or
Storage URL: DBname/*


Cloudera Data Platform Group Rules

* DataCatalogCspRuleViewer	

* DFCatalogAdmin	

* DFCatalogViewer	

* DFFunctionMachineUser	

* EnvironmentUser
