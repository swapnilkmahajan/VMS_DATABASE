@echo off

sqlplus "/as sysdba" @E:\Database\Backup\project\GIT\VMS_DATABASE\db_creation_script.sql > db_creation.log

call first-doc.bat