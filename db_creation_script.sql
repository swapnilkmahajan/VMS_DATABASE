drop user vms_database cascade;

@vms_database_user_creation.sql;

show err;

connect vms_database/vms_database;

@tables.sql;

show err;

exit;