--1.small and large:

set serveroutput on 
declare
num_small number(5):=&small;
num_large number(5):=&large;
num_temp number(5);
begin
if(num_small>num_large) then
    num_temp:=num_small;
    num_small:=num_large;
    num_large:=num_temp;
end if;
dbms_output.put_line('num_small='||num_small);
dbms_output.put_line('num_large='||num_large);
end;

--2.incentives:

declare
sal_achieved number(5):=&salary;
target_qty number(5):=&qty;
empid number(4):=&id;
update_rec varchar2(3):='No';
incentive number(5);
begin
if(sal_achieved>target_qty+200) then
incentive:=(sal_achieved-target_qty)/4;
update emp1 set sal=sal+incentive where empno=empid;
update_rec:='Yes';
end if;
dbms_output.put_line('Target updated='||update_rec||','||'incentive='||incentive||'.');
end;

--3.even or odd:

declare
my_num number:=&num;
begin
if(mod(my_num,2)=0) then
dbms_output.put_line('The number'||my_num||'is even number');
else
dbms_output.put_line('The number'||my_num||'is odd number');
end if;
dbms_output.put_line('Done Successfully');
end;

--4.incentive on a specific target:

declare
sal_achieved number(5):=&salary;
target_qty number(5):=&qty;
empid number(4):=&id;
incentive number(5);
begin
if(sal_achieved>target_qty+200) then
incentive:=(sal_achieved-target_qty)/4;
else:
incentive:=75;
end if;
dbms_output.put_line('incentive='||incentive);
update emp1 set sal=sal+incentive where empno=empid;
end;

--5.Weekends:

declare
d1 date:=TO_DATE('&new_dt','DD-MON-YYYY');
get_day varchar(15);
begin
get_day:=RTRIM(TO_CHAR(d1,'DAY'));
if (get_day in ('SATURDAY','SUNDAY')) then
dbms_output.put_line('The day of the given date is '||get_day||' and it falls on weekends');
else
dbms_output.put_line('The day of the given date is '||get_day||' and it does not fall on weekends');
end if;
dbms_output.put_line('Execution done successfully');
end;

--6.inccentive sale limit:

declare
sal_achieved number(5):=&num;
incentive number(5);
begin
if(sal_achieved>44000) then
incentive:=1800;
elsif(sal_achieved>32000) then
incentive:=800;
else
incentive:=500;
end if;
dbms_output.put_line('sale achieved= '|| sal_achieved || 'incentive' || incentive);
end;

--7.vacancies:

set serveroutput on;
declare
total_number number(4);
begin 
select count(*) into total_number from emp1 e,dept d where e.deptno=d.deptno and e.deptno=40;
if(total_number>5) then
dbms_output.put_line('There are no vacancies in the department number 40');
else
dbms_output.put_line('There are some vacancies in the department number 40');
end if;
end;

--8.grade description:

declare
grade char(1):='&gr';
begin
if grade='A' then 
dbms_output.put_line('Your grade is outstanding');
elsif grade:='B' then 
dbms_output.put_line('Your grade is Excellent');
elsif grade:='C' then 
dbms_output.put_line('Your grade is Very Good');
elsif grade:='D' then 
dbms_output.put_line('Your grade is Average');
elsif grade:='F' then 
dbms_output.put_line('Your grade is Poor');
else d
bms_output.put_line('No such grade in the list');
end if;
end;

--9.number of vacancies:

set serveroutput on;
declare
total_number number(4);
begin 
select count(*) into total_number from emp1 e,dept d where e.deptno=d.deptno and e.deptno=40;
if(total_number>5) then
dbms_output.put_line('There are no vacancies in the department number 40');
else
dbms_output.put_line('There are' ||to_char(5-total_number) ||  'vacancies in the department number 40');
end if;
end;
