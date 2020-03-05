create table participant(
mail varchar(30) primary key,
fname varchar(25),
lname varchar(25)
);

create table answers(
question integer,
answer varchar(5)
);

insert into answers values(1,'b');
insert into answers values(2,'a');
insert into answers values(3,'a');
insert into answers values(4,'b');
insert into answers values(5,'c');
insert into answers values(6,'b');
insert into answers values(7,'b');
insert into answers values(8,'a');
insert into answers values(9,'b');
insert into answers values(10,'b');

create table user_score
(
mail varchar(30) references participant(mail),
correctans integer,
timemins double precision,
starttime varchar(20),
endtime varchar(20)
)