create table vms_database.person_id(
pid number(5) primary key);

create table vms_database.Doctor(
doc_id number(5) primary key,
constraint doc_fk foreign key (doc_id) references vms_database.person_id(pid),
name varchar2(50) not null,
clinic_address varchar2(1000) not null
);

create table vms_database.Authentication(
id number(5) primary key references vms_database.Doctor(doc_id),
userId varchar(10) not null unique,
userPassword varchar(20) not null
);

create table vms_database.PetOwner(
own_id number(5) primary key,
constraint pet_owner_fk foreign key (own_id) references vms_database.person_id(pid),
name varchar2(50) not null,
email_address varchar2(100) not null unique,
profession varchar2(100)
);

create table vms_database.ContactDetails (
per_id number(5) references vms_database.person_id(pid),
role varchar2(10) not null,
phone_number number(10) not null,
contact_type varchar2(50) DEFAULT 'PRIMARY',
constraint contact_det_pk primary key (per_id, role, contact_type),
constraint contact_role CHECK (role in ('DOCTOR','OWNER')),
constraint contact_type CHECK (contact_type in ('PRIMARY','SECONDARY', 'FAX'))
);

create table vms_database.Pet(
pet_id number(10) primary key,
pet_owner number(5) not null references vms_database.PetOwner(own_id),
breed varchar2(30) not null,
color varchar2(20) not null,
date_of_birth date,
gender varchar2(6) not null check (gender in ('MALE','FEMALE'))
);

create table vms_database.Dog(
dog_id number(10) primary key references vms_database.Pet(pet_id),
name varchar2(50) not null,
kennel_club_number number(25) unique,
microchip_number varchar2(30) unique
);

create table vms_database.Cat(
cat_id number(10) primary key references vms_database.Pet(pet_id),
name varchar2(50) not null,
reg_number number(20) unique
);

create table vms_database.Appointment(
apt_id number(20) primary key,
pet_id number(10) references vms_database.Pet(pet_id),
attending_doc number(5) references vms_database.Doctor(doc_id),
start_time Date not null,
end_time Date not null,
notes varchar2(2000),
unique(apt_id, pet_id, attending_doc,start_time,end_time)
);

create table vms_database.AppointmentHealthRecord (
rec_id number(20) primary key references vms_database.Appointment(apt_id),
height double precision,
weight double precision not null
);

create table vms_database.Vaccination(
vac_id number(20) references vms_database.Appointment(apt_id),
name varchar2(100) not null,
next_dose date not null,
primary key (vac_id, name)
);

create table vms_database.BillingInfo(
bill_id number(20) primary key,
apt_id number(20) references vms_database.Appointment(apt_id),
description varchar2(50) not null,
amount double precision not null,
unique (apt_id, description)
);

create table vms_database.PaidBill(
bill_id number(20) references vms_database.BillingInfo(bill_id),
paid_amount double precision not null
);

/* sequences for auto incrementing primary keys*/

create sequence vms_database.person_id_seq
minvalue 1 
maxvalue 99999
increment by 1
nocache
nocycle;

create sequence vms_database.pet_id_seq
increment by 1
minvalue 1 
maxvalue 9999999999
nocache
nocycle;

create sequence vms_database.apt_id_seq
increment by 1
minvalue 1 
maxvalue 99999999999999999999
nocache
nocycle;


create sequence vms_database.bill_paid_id_seq
increment by 1
minvalue 1 
maxvalue 99999999999999999999
nocache
nocycle;

/*
triggers for using next value for primary key everytime a new row is added in tables
create or replace trigger person_id_seq_trig before insert on person_id
for each row 
BEGIN
:new.pid := person_id_seq.nextval;
END;

create or replace trigger pet_id_seq_trig before insert on Pet
for each row
BEGIN
:new.pet_id :=  pet_id_seq.nextval;
END;

create or replace trigger apt_id_seq_trig before insert on Appointment
for each row
BEGIN
:new.apt_id := apt_id_seq.nextval;
END;

*/


/*  Views for Appointment */

create or replace view vms_database.appointment_details_vw as
select apt.*, o.name, o.email_address from vms_database.appointment apt, vms_database.pet p, vms_database.petowner o
where p.pet_id = apt.pet_id
and P.PET_OWNER = O.OWN_ID;


create or replace view vms_database.pet_details_for_appointment_vw as 
select
apt.attending_doc as doc,
apt.start_time as starts,
apt.end_time as ends,
apt.name as owner,
apt.email_Address as email,
c.name as petname
from vms_database.appointment_details_vw apt, vms_database.cat c
where apt.pet_id = c.cat_id
union
select
apt.attending_doc as doc,
apt.start_time as starts,
apt.end_time as ends,
apt.name as owner,
apt.email_Address as email,
d.name as petname
from vms_database.appointment_details_vw apt, vms_database.dog d
where apt.pet_id = d.dog_id;


/* Procedure for fetching appointment details by date and doctor */

create or replace procedure vms_database.fetch_appointments(for_date varchar2, doc_id number)
as
 
cursor apt_details is 
select * from vms_database.pet_details_for_appointment_vw where trunc(starts) = trunc(to_date (for_date ,'mm/dd/yyyy'))
 and doc = doc_id order by starts asc;
begin

for apt_det in apt_details
loop
DBMS_OUTPUT.PUT_LINE ( 'doc = ' || apt_det.doc );
DBMS_OUTPUT.PUT_LINE ( 'starts = ' || apt_det.starts );
DBMS_OUTPUT.PUT_LINE ( 'ends = ' || apt_det.ends );
DBMS_OUTPUT.PUT_LINE ( 'apt_det.owner = ' || apt_det.owner );
DBMS_OUTPUT.PUT_LINE ( 'apt_detemail = ' || apt_det.email );
DBMS_OUTPUT.PUT_LINE ( 'apt_det.petname = ' || apt_det.petname );
end loop;
end;


create or replace procedure vms_database.add_new_pet_owner(own_name varchar2, mailid varchar2,
                                              profess varchar2 default null,
                                              prmary_ph number, secon_ph number default null,
                                              fax number default null, result out varchar2)
as                                              
user_exists number(1);
 
begin
select count(*) into user_exists from vms_database.petowner where name=own_name and email_address = mailid;
if user_exists <> 0 then
result := 'DUPLICATE';
else 
    begin
    insert into vms_database.person_id values (vms_database.person_id_seq.nextval);
    insert into vms_database.petowner values (vms_database.person_id_seq.currval, own_name, mailid, profess);
    insert into vms_database.contactdetails values (vms_database.person_id_seq.currval, 'OWNER', prmary_ph, 'PRIMARY');
    
    if secon_ph is not null then
        insert into vms_database.contactdetails values (vms_database.person_id_seq.currval, 'OWNER', secon_ph, 'SECONDARY');
    end if;
    
    if fax is not null then
        insert into vms_database.contactdetails values (vms_database.person_id_seq.currval, 'OWNER', fax, 'FAX');
    end if;
    commit;
    result:='SUCCESS';
    exception
    when others then
        Rollback;
        result:='ERROR';    
    end;
end if;
end;

/

/