-- OPT_LOCAL_INFILE=1
-- This restriction can be removed from MySQL Workbench 8.0 in the following way. Edit the connection, on the Connection tab, go to the 'Advanced' sub-tab, and in the 'Others:' box add the line 'OPT_LOCAL_INFILE=1'.
-- This should allow a client using the Workbench to run LOAD DATA INFILE as usual.


CREATE SCHEMA escolas;

use escolas;

create table estudantes(
id int primary key auto_increment,
school varchar(2),
sex char,
age int
);

LOAD DATA LOCAL INFILE 'C:/Users/marci/OneDrive/Documentos/clientes.csv"'
INTO TABLE estudantes;

select * from estudantes;

select school, round(avg(age)), std(age)
from estudantes
where sex = 'F'
group by school;
