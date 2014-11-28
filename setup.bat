@echo off

sqlplus "/as sysdba" @C:\Users\Ruta\Documents\GitHub\VMS_DATABASE\db_creation_script.sql > db_creation.log

call first-doc.bat