/* Add first Doctor*/
insert into person_id values (1);
insert into Doctor values (1 , '&DOC_NAME' ,'&CLINIC_ADDRESS');
insert into authentication values (1, '&USERNAME' ,'&PASS');
insert into contactdetails values (1, 'DOCTOR', &PHONE_NUMBER, 'PRIMARY');
commit;
exit;