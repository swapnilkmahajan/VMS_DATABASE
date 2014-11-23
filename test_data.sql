insert into VMS_DATABASE.person_id values (2);
insert into VMS_DATABASE.petowner values (2, 'Swapnil Mahajan', 'swapnilkmahajan@gmail.com', null);
insert into VMS_DATABASE.pet values (1, 2, 'Golden', 'White', sysdate, 'FEMALE');
insert into VMS_DATABASE.DOG values (1, 'Pearl', null, null);
insert into VMS_DATABASE.appointment values (1, 1, 1, sysdate, (sysdate + 1), null);
insert into VMS_DATABASE.pet values (2, 2, 'Percian', 'Black', sysdate, 'MALE');
insert into VMS_DATABASE.CAT values (2, 'Jerry', null);
insert into VMS_DATABASE.appointment values (2, 2, 1, sysdate, (sysdate + 1), null);
commit;