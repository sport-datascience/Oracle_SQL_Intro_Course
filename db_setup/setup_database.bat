@ECHO off
:: Sport Data Science
:: SportDataScience Inc.
:: 
:: Uses SQL*Plus utility to run the SQL scripts that create
:: and populate the tables in the sds_learner.

:: If necessary, edit the username/password
sqlplus system/system@10.0.0.69:1521/XEPDB1 @setup_database

:: Display a message about the log file
ECHO.
ECHO For details, check the setup_database.log file in the current directory.
ECHO.

:: Display 'press any key to continue' message
PAUSE