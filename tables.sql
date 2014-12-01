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
kennel_club_number varchar2(11) unique,
microchip_number number(15) unique
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

CREATE INDEX  VMS_DATABASE.OWNER_NAME_SEARCH  ON VMS_DATABASE.PETOWNER(upper(NAME)) ;

ALTER SYSTEM SET QUERY_REWRITE_ENABLED=TRUE;


CREATE INDEX  VMS_DATABASE.DOG_NAME_SEARCH  ON VMS_DATABASE.DOG(upper(NAME)) ;
CREATE INDEX  VMS_DATABASE.CAT_NAME_SEARCH  ON VMS_DATABASE.CAT(upper(NAME)) ;
CREATE INDEX  VMS_DATABASE.APT_START_TIME  ON VMS_DATABASE.APPOINTMENT (trunc(start_time));

commit;
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

/* Initializin sequences */

select vms_database.person_id_seq.nextval from dual;
select vms_database.pet_id_seq.nextval from dual;
select vms_database.apt_id_seq.nextval from dual;
select vms_database.bill_paid_id_seq.nextval from dual;


/*  Views for Appointment */

create or replace view vms_database.appointment_details_vw as
select apt.*, o.name, o.email_address from vms_database.appointment apt, vms_database.pet p, vms_database.petowner o
where p.pet_id = apt.pet_id
and P.PET_OWNER = O.OWN_ID;


create or replace view vms_database.pet_details_for_appointment_vw as 
select
apt.attending_doc as doc,
apt.apt_id as appt,
apt.pet_id as petid,
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
apt.apt_id as appt,
apt.pet_id as petid,
apt.start_time as starts,
apt.end_time as ends,
apt.name as owner,
apt.email_Address as email,
d.name as petname
from vms_database.appointment_details_vw apt, vms_database.dog d
where apt.pet_id = d.dog_id;

/*
create or replace view vms_database.all_pet_pet_owners_vw as
select p.*, po.*, cd.* from vms_database.pet p, vms_database.petowner po,  vms_database.contactdetails cd
where P.PET_OWNER = PO.OWN_ID
and cd.PER_ID =  PO.OWN_ID
and CD.CONTACT_TYPE = 'PRIMARY';

create or replace view vms_database.all_pt_All_details_vw as 
select  vw.*, c.name as pet_name, c.reg_number as c_reg_no, null as dkci ,  null as dmchip, 'CAT' as pet_type  
from vms_database.all_pet_pet_owners_vw vw, vms_database.cat c where 
C.CAT_ID = VW.PET_ID
union
select  vw.*, d.name as pet_name, null as c_reg_no, d.kennel_club_number as dkci, d.microchip_number as dmchip, 'DOG' as pet_type  
from vms_database.all_pet_pet_owners_vw vw, vms_database.dog d where
D.DOG_ID = VW.PET_ID;
*/

create or replace view vms_database.all_pet_pet_owners_vw as
select  po.*, cd.* from  vms_database.petowner po,  vms_database.contactdetails cd
where cd.PER_ID =  PO.OWN_ID
and CD.CONTACT_TYPE = 'PRIMARY';

create or replace view vms_database.pet_cat_vw as 
select p.*, c.* from vms_database.pet p, vms_database.cat c where C.CAT_ID = P.PET_ID;


create or replace view vms_database.pet_dog_vw as 
select p.*, d.* from vms_database.pet p, vms_database.dog D where D.DOG_ID = P.PET_ID;

create or replace view vms_database.all_pt_All_details_vw as
select vw.*,pc.PET_ID , pc.PET_OWNER, pc.COLOR, pc.DATE_OF_BIRTH ,pc.GENDER, pc.breed as breed , pc.name as pet_name, pc.reg_number as c_reg_no, null as dkci ,  null as dmchip, NVL2(pc.name ,'CAT', NULL) as pet_type
from vms_database.all_pet_pet_owners_vw vw 
left join vms_database.pet_cat_vw pc on VW.OWN_ID = pc.pet_owner
union
select  vw.*,d.PET_ID , d.PET_OWNER, d.COLOR, d.DATE_OF_BIRTH ,d.GENDER ,d.breed as breed ,  d.name as pet_name, null as c_reg_no, d.kennel_club_number as dkci, d.microchip_number as dmchip, NVL2(d.name ,'DOG', NULL) as pet_type
from vms_database.all_pet_pet_owners_vw vw 
left join vms_database.pet_dog_vw d on VW.OWN_ID = d.pet_owner;

/* all dues and pets and owners and contact */

create or replace view vms_database.all_dues_apt as 
select due.* , ap_vw.* from 
(select  pb.*, b.* from vms_database.paidbill pb,
(select min(bi.bill_id) billno, sum(bi.amount) total, bi.apt_id  aptid  from vms_database.billinginfo bi group by bi.apt_id) b
where pb.bill_id = b.billno) due,
(select apt.apt_id ,to_char(apt.start_time,'mm/dd/yyyy')as aptdate ,to_char(apt.start_time,'hh24:mi') aptstart ,to_char(apt.end_time,'hh24:mi') as aptend, 
 vw.pet_name, vw.name, VW.PHONE_NUMBER  from vms_database.appointment apt , vms_database.all_pt_All_details_vw vw 
where  apt.pet_id = vw.pet_id) ap_vw where due.aptid = ap_vw.apt_id;

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
/

create or replace procedure vms_database.add_new_pet_owner(own_name varchar2, mailid varchar2,
                                              profess varchar2 default null,
                                              prmary_ph number, secon_ph number default null,
                                              fax number default null, result out varchar2)
as                                              
user_exists number(1);
seq_val vms_database.person_id.pid%type;
 
begin
select count(*) into user_exists from vms_database.petowner where name=own_name and email_address = mailid;
if user_exists <> 0 then
result := 'DUPLICATE';
else 
    begin
    insert into vms_database.person_id values (vms_database.person_id_seq.nextval);
    insert into vms_database.petowner values (vms_database.person_id_seq.currval , own_name, mailid, profess);
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
	dbms_output.put_line('ERROR COde is ' || SQLCODE ||' Message ' || SQLERRM);
        result:= 'ERROR';    
    end;
end if;
end;

/


create or replace procedure vms_database.addNewPet(owner_id number, pname varchar2, breed varchar2, color varchar2,
 DOB varchar2, gender varchar2, pet_type varchar2, kci varchar2, mchip number, regnum number, result OUT varchar2, new_pet_id out number)
 
 as
 
 pet_exists number(10);
 var_dob date;
 var_kci vms_database.Dog.kennel_club_number%type;
 var_mchip vms_database.Dog.microchip_number%type;
 var_regnum vms_database.Cat.reg_number%type;
 dup_kci number(1) := 0;
 dup_mchip number(1):= 0;
 dup_regnum number(1) := 0;
 begin
 
 if kci = '' then
    var_kci := null;
 else
    var_kci := kci;
 end if;
 
 if mchip = 0 then
    var_mchip := null;
 else
    var_mchip := mchip;
 end if; 
 
 if regnum = 0 then
    var_regnum := null;
 else
    var_regnum := regnum;
 end if;
 
 if DOB = '' then
        var_dob := null;
    else
       var_dob:= to_date(DOB,'mm/dd/yyyy');
 end if;
 
 if upper(pet_type) = 'DOG' then
    select count(*) into pet_exists from vms_database.pet p, vms_database.dog d where
    P.PET_OWNER = owner_id and
    upper(P.BREED) = upper(breed) and
    upper(P.COLOR) = upper(color) and 
    upper(gender) = upper(P.GENDER) and
    upper(D.NAME) = upper(pname);
    /*D.KENNEL_CLUB_NUMBER = var_kci and
    D.MICROCHIP_NUMBER = var_mchip;*/
    
    if var_kci is not null then
    select count(*) into dup_kci from vms_database.dog where kennel_club_number = var_kci;
     end if;
     
     if var_mchip is not null then
        select count(*) into dup_mchip from vms_database.dog where microchip_number = var_mchip;
     end if;
 else
    select count(*) into pet_exists from vms_database.pet p, vms_database.cat c where
    P.PET_OWNER = owner_id and
    upper(P.BREED) = upper(breed) and
    upper(P.COLOR) = upper(color) and 
    upper(gender) = upper(P.GENDER) and
    upper(C.NAME) = upper(pname);
    -- c.reg_number = var_regnum;
    
    if var_regnum is not null then
    select count(*) into dup_regnum from vms_database.cat where reg_number = var_regnum; 
    end if;
 
 end if;
 
/* DBMS_OUTPUT.PUT_LINE ( 'pet_exists = ' || pet_exists );
 DBMS_OUTPUT.PUT_LINE ( 'dup_kci = ' || dup_kci );
 DBMS_OUTPUT.PUT_LINE ( 'dup_mchip = ' || dup_mchip );
 DBMS_OUTPUT.PUT_LINE ( 'dup_regnum = ' || dup_regnum );*/
 
 
 if (pet_exists <> 0) or (dup_kci <> 0) or (dup_mchip <> 0) or (dup_regnum <> 0) THEN
 result:= 'DUPLICATE';
 NEW_PET_ID := 0;
 else
    begin
    if var_dob is not null then
        insert into vms_database.pet values (vms_database.pet_id_seq.nextval, owner_id, breed, color,to_date(DOB,'mm/dd/yyyy'),upper(gender));
    else
        insert into vms_database.pet values (vms_database.pet_id_seq.nextval, owner_id, breed, color,null,upper(gender));
    end if;
    
    if upper(pet_type) = 'DOG' then 
        insert into vms_database.dog values (vms_database.pet_id_seq.currval, pname, var_kci, var_mchip);
    end if;
    
    if upper(pet_type) = 'CAT' then 
        insert into vms_database.cat values (vms_database.pet_id_seq.currval, pname, var_regnum);
    end if;
    
    result:= 'SUCCESS';
    new_pet_id:= vms_database.pet_id_seq.currval;
    exception
    when others then
        Rollback;
   /* dbms_output.put_line('ERROR COde is ' || SQLCODE ||' Message ' || SQLERRM);*/
        result:= 'ERROR';    
	NEW_PET_ID := 0;
    end;
 end if;
end;
/

create or replace procedure vms_database.new_bill_info(apt number, cons double precision, deworm double precision,
 medi double precision, vacc double precision, other double precision, paid double precision, result out varchar2)
as 

min_bil_id VMS_DATABASE.BILLINGINFO.BILL_ID%type;

begin

    begin
        insert into  vms_database.BillingInfo values (vms_database.bill_paid_id_seq.nextval, apt, 'Consultation', cons); 
        min_bil_id :=  vms_database.bill_paid_id_seq.currval;
        
        insert into vms_database.BillingInfo values (vms_database.bill_paid_id_seq.nextval, apt, 'De-Worming', deworm);
        insert into vms_database.BillingInfo values (vms_database.bill_paid_id_seq.nextval, apt, 'Medication', medi);
        insert into vms_database.BillingInfo values (vms_database.bill_paid_id_seq.nextval, apt, 'Vaccination', vacc);
        insert into vms_database.BillingInfo values (vms_database.bill_paid_id_seq.nextval, apt, 'Other', other);
        
        
        insert into vms_database.PaidBill values (min_bil_id, paid);
        commit;
        result:='SUCCESS';
    exception
    when others then
        rollback;
        result:='ERROR';
    end;
end;
/


CREATE OR REPLACE TYPE vms_database.vaccination_rec AS OBJECT( 
  vac_name varchar2(100),
  next_dose VARCHAR2(25)
);
/
 -- My-arr
CREATE OR REPLACE TYPE vms_database.vaccination_array AS TABLE OF vaccination_rec;
/

CREATE OR REPLACE PROCEDURE vms_database.add_vaccinations(vacc_id number, vac_details in vaccination_array,
 in_height double precision, in_weight double precision,  result out varchar2)
AS

dup_health number(3);
dup_vac number(3); 

BEGIN

   select count(*) into dup_health from vms_database.AppointmentHealthRecord where rec_id = vacc_id;
   select count(*) into dup_vac from vms_database.vaccination where vac_id =  vacc_id;
  if (dup_vac = 0) and (dup_health = 0) then
      
      IF vac_details IS NOT NULL THEN
          begin
            insert into vms_database.AppointmentHealthRecord values(vacc_id, in_height, in_weight);
          
            FOR v_d IN 1..vac_details.LAST
            LOOP
            
              INSERT INTO vms_database.Vaccination
                VALUES (vacc_id, vac_details(v_d).vac_name,
                        to_date(vac_details(v_d).next_dose,'mm/dd/yyyy'));
            END LOOP;
            
            commit;
            result:='SUCCESS';
                
          exception 
          when others then
            rollback;
            result:= 'ERROR';
          end;
      END IF;
      
  else
       if dup_health <> 0 then
            result:= 'DUPLICATE HEALTH';
       end if;

       if dup_vac <> 0 then
            result:= 'DUPLICATE VAC';
       end if;
  end if;
END;
/

create or replace procedure vms_database.update_pet_owner(in_own_id number, own_name varchar2, mailid varchar2,
                                              profess varchar2 default null,
                                              prmary_ph number, secon_ph number default null,
                                              fax number default null, result out varchar2)
as                                              
var_sec_exists number(3);
var_profess VMS_DATABASE.PETOWNER.PROFESSION%type;
var_secon_ph VMS_DATABASE.CONTACTDETAILS.PHONE_NUMBER%type;
var_fax VMS_DATABASE.CONTACTDETAILS.PHONE_NUMBER%type;
 
begin
    if profess = '' then
        var_profess:= null;
    else 
        var_profess:= profess;
    end if;
    
    if secon_ph = 0 then
        var_secon_ph:= null;
    else 
        var_secon_ph:= secon_ph;
    end if;
    
    if fax = 0 then
        var_fax:= null;
    else 
        var_fax:= fax;
    end if;
    
        begin

			update vms_database.petowner po set PO.NAME = own_name, PO.PROFESSION = var_profess
            where PO.OWN_ID = in_own_id;
              
            update vms_database.contactdetails cd set CD.PHONE_NUMBER = prmary_ph 
            where CD.CONTACT_TYPE = 'PRIMARY' and CD.ROLE = 'OWNER' and CD.PER_ID = in_own_id;
            
            select count(*) into var_sec_exists from vms_database.contactdetails cd
            where CD.CONTACT_TYPE = 'SECONDARY' and CD.ROLE = 'OWNER' and CD.PER_ID = in_own_id; 
            
            if  (var_sec_exists = 0) then
                if (var_secon_ph is not null) then
                    insert into vms_database.contactdetails values (in_own_id, 'OWNER', secon_ph, 'SECONDARY');
                end if;
            else 
                 update vms_database.contactdetails cd set CD.PHONE_NUMBER = var_secon_ph
                 where CD.CONTACT_TYPE = 'SECONDARY' and CD.ROLE = 'OWNER' and CD.PER_ID = in_own_id; 
            end if;
            
            select count(*) into var_sec_exists from vms_database.contactdetails cd
            where CD.CONTACT_TYPE = 'FAX' and CD.ROLE = 'OWNER' and CD.PER_ID = in_own_id;
            
            if (var_sec_exists = 0) then
                if (var_fax is not null) then
                    insert into vms_database.contactdetails values (in_own_id, 'OWNER', fax, 'FAX');
                end if;
            else
                update vms_database.contactdetails cd set CD.PHONE_NUMBER = var_fax
                where CD.CONTACT_TYPE = 'FAX' and CD.ROLE = 'OWNER' and CD.PER_ID = in_own_id; 
            end if;
            
            commit;
            result:='SUCCESS';
        exception
        when others then
            Rollback;
        dbms_output.put_line('ERROR COde is ' || SQLCODE ||' Message ' || SQLERRM);
            --result:= 'ERROR COde is ' || SQLCODE ||' Message ' || SQLERRM;    
			result:= 'ERROR';
        end;

end;

/

create or replace procedure vms_database.update_Pet(in_pet_id number, in_pname varchar2, in_breed varchar2, in_color varchar2,
 in_DOB varchar2, in_gender varchar2, in_pet_type varchar2, in_kci varchar2, in_mchip number, in_regnum number, result OUT varchar2)
 
 as
 
 pet_exists number(10);
 var_dob date;
 var_kci vms_database.Dog.kennel_club_number%type;
 var_mchip vms_database.Dog.microchip_number%type;
 var_regnum vms_database.Cat.reg_number%type;
 dup_kci number(1) := 0;
 dup_mchip number(1):= 0;
 dup_regnum number(1) := 0;
 begin
 
 if in_kci = '' then
    var_kci := null;
 else
    var_kci := in_kci;
 end if;
 
 if in_mchip = 0 then
    var_mchip := null;
 else
    var_mchip := in_mchip;
 end if; 
 
 if in_regnum = 0 then
    var_regnum := null;
 else
    var_regnum := in_regnum;
 end if;
 
 if in_DOB = '' then
        var_dob := null;
    else
       var_dob:= to_date(in_DOB,'mm/dd/yyyy');
 end if;
    
     
     if upper(in_pet_type) = 'DOG' then
         if var_kci is not null then
            select count(*) into dup_kci from vms_database.dog where kennel_club_number = var_kci and dog_id != in_pet_id;
         end if;
         
         if var_mchip is not null then
            select count(*) into dup_mchip from vms_database.dog where microchip_number = var_mchip and dog_id != in_pet_id;
         end if;
         
     end if;
     
     if upper(in_pet_type) = 'CAT' then
         if var_regnum is not null then
            select count(*) into dup_regnum from vms_database.cat where reg_number = var_regnum and cat_id != in_pet_id; 
         end if;
         
      end if;
     
     if (dup_kci <> 0) or (dup_mchip <> 0) or (dup_regnum <> 0) THEN
        result:= 'DUPLICATE';
     else
         begin
            update vms_database.pet set  breed = in_breed, color = in_color, date_of_birth = var_dob, gender = pper(in_gender) where pet_id = in_pet_id;
            
            if upper(in_pet_type) = 'CAT' then
                update VMS_DATABASE.CAT set name = in_pname, reg_number = in_regnum where cat_id = in_pet_id;
            end if;
            
            if upper(in_pet_type) = 'DOG' then
                update VMS_DATABASE.DOG set name = in_pname, kennel_club_number = in_kci, microchip_number = in_mchip where dog_id = in_pet_id;
            end if;
            
         commit;
         result:= 'SUCCESS';
         exception
         when others then
         rollback;
		 result:= 'ERROR COde is ' || SQLCODE ||' Message ' || SQLERRM;    
         --result:= 'ERROR';
         end;
     end if;
end;
/