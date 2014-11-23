create table person_id(
pid number(5) primary key);

create table Doctor(
doc_id number(5) primary key,
constraint doc_fk foreign key (doc_id) references person_id(pid),
name varchar2(50) not null,
clinic_address varchar2(1000) not null
);

create table Authentication(
id number(5) primary key references Doctor(doc_id),
userId varchar(10) not null unique,
userPassword varchar(20) not null
);

create table PetOwner(
own_id number(5) primary key,
constraint pet_owner_fk foreign key (own_id) references person_id(pid),
name varchar2(50) not null,
email_address varchar2(100) not null unique,
profession varchar2(100)
);

create table ContatDetails (
per_id number(5) references person_id(pid),
role varchar2(10) not null,
phone_number number(10) not null,
contact_type varchar2(50) DEFAULT 'PRIMARY',
constraint contact_det_pk primary key (per_id, role, contact_type),
constraint contact_role CHECK (role in ('DOCTOR','OWNER')),
constraint contact_type CHECK (contact_type in ('PRIMARY','SECONDARY', 'FAX'))
);

create table Pet(
pet_id number(10) primary key,
pet_owner number(5) not null references PetOwner(own_id),
breed varchar2(30) not null,
color varchar2(20) not null,
date_of_birth date,
gender varchar2(6) not null check (gender in ('MALE','FEMALE'))
);

create table Dog(
dog_id number(10) primary key references Pet(pet_id),
name varchar2(50) not null,
kennel_club_number number(25) unique,
microchip_number varchar2(30) unique
);

create table Cat(
cat_id number(10) primary key references Pet(pet_id),
name varchar2(50) not null,
reg_number number(20) unique
);

create table Appointment(
apt_id number(20) primary key,
pet_id number(10) references Pet(pet_id),
attending_doc number(5) references Doctor(doc_id),
start_time Date not null,
end_time Date not null,
notes varchar2(2000),
unique(apt_id, pet_id, attending_doc,start_time,end_time)
);

create table AppointmentHealthRecord (
rec_id number(20) primary key references Appointment(apt_id),
height double precision,
weight double precision not null
);

create table Vaccination(
vac_id number(20) references Appointment(apt_id),
name varchar2(100) not null,
next_dose date not null,
primary key (vac_id, name)
);

create table BillingInfo(
bill_id number(20) references Appointment(apt_id),
description varchar2(50) not null,
amount double precision not null,
primary key (bill_id, description)
);


/* Add first Doctor*/
insert into person_id values (1);
insert into Doctor values (1 , '&DOC_NAME' ,'&DOC');
insert into authentication values (1 , '&USERNAME' ,'&PASS');
commit;


/* sequences for auto incrementing primary keys*/

create sequence person_id_seq
minvalue 1 
maxvalue 99999
increment by 1
nocache
nocycle;

create sequence pet_id_seq
increment by 1
minvalue 1 
maxvalue 9999999999
nocache
nocycle;

create sequence apt_id_seq
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

create or replace view appointment_details_vw as
select apt.*, o.name, o.email_address from appointment apt, pet p, petowner o
where p.pet_id = apt.pet_id
and P.PET_OWNER = O.OWN_ID;


create or replace view pet_details_for_appointment_vw as 
select
apt.attending_doc as doc,
apt.start_time as starts,
apt.end_time as ends,
apt.name as owner,
apt.email_Address as email,
c.name as petname
from appointment_details_vw apt, cat c
where apt.pet_id = c.cat_id
union
select
apt.attending_doc as doc,
apt.start_time as starts,
apt.end_time as ends,
apt.name as owner,
apt.email_Address as email,
d.name as petname
from appointment_details_vw apt, dog d
where apt.pet_id = d.dog_id;


/* Procedure for fetching appointment details by date and doctor */

create or replace procedure fetch_appointments(for_date varchar2, doc_id number)
as
 
cursor apt_details is 
select * from pet_details_for_appointment_vw where trunc(starts) = trunc(to_date (for_date ,'mm/dd/yyyy'))
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

/