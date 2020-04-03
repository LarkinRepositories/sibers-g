# Sibers test for applicants: Java Developer tasks application
##Build
gradle build
##Usage Manual
### Configuring database
Before starting the application, you need to deploy the database. 
The project uses PostgreSQL as a database. 
The database must be deployed on port 5437 and is called sibers. 
Or, it will be necessary to change the settings for spring data and liquibase in src/main/resources/application.properties
#### Alternative way using database dump
Its possible to use pre added data.
Database dump file: ./db/sibers.sql
Files in ./db/upload-images folder should be put into your file upload path folder. 
### Configuring file upload path
Before launching its important to configure file upload path.
Change upload.path property value in src/main/resources/application.properties to whatever path you are able to write down data on your filesystem.
##Launching
To launch the application run src/main/java/SibersApplication.java
By default, the application will start at localhost:9000. 
At the application start liquibase will create the necessary tables.
Done! Now you can add news.

