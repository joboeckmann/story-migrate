drop schema if exists stories;
create schema stories;
use stories;
#user
create table user (id varchar(25), username varchar(30), password varchar(30), token varchar(20), primary key (id), INDEX id_ind (id));
#stories
create table genre (id int, type varchar(30), primary key(id));
insert into genre values 
	(1, 'mystery'), 
    (2, 'nonfiction'), 
    (3, 'horror'), 
    (4, 'fan fiction'), 
    (5, 'romance'), 
    (6, 'comedy'), 
    (7, 'fantasy'), 
    (8, 'science fiction'),
    (9, 'fiction');
create table story (
id int, 
title varchar(50), 
description varchar(300),
 file_location varchar(100),
 length int,
 genre_id int,
 triggers_warning varchar(100),
 user_id varchar(25), 
 date_uploaded date, 
 num_chapters int,
 primary key (id),
 index in_user (user_id),
 foreign key (user_id) references user(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
 foreign key (genre_id) references genre(id) ON DELETE NO ACTION ON UPDATE NO ACTION
 );
 
 create table chapter (
 id int, 
 user_id varchar(25),
 story_id int,
 title varchar(50), 
 file_location varchar(100), 
 order_num int,
 primary key (id),
 index in_story (story_id),
 foreign key (user_id) references user(id) ON DELETE NO ACTION ON UPDATE NO ACTION,
 foreign key (story_id) references story(id) ON DELETE NO ACTION ON UPDATE NO ACTION);



# test data
insert into user values ('5aab03938bd5067ff5775918', 'joboeckmann', 'Password12!', 'token');
insert into story values(1, 'A Story Title', 'This is a story description', 'here/here',10,1, null,'5aab03938bd5067ff5775918',now(),0);
insert into story values(2, 'A Story Title With Chapters', 'This is a story description', 'here/here',10,1,null,'5aab03938bd5067ff5775918',now(),3);
insert into story values(3, 'Another Story Title', 'This is a story description', 'here/here',15,1,null,'5aab03938bd5067ff5775918',now(),0);
insert into chapter values(1, '5aab03938bd5067ff5775918',2,'Chapter 1', 'here/here', 0);
insert into chapter values(2, '5aab03938bd5067ff5775918',2,'Chapter 3', 'here/here', 2);
insert into chapter values(3, '5aab03938bd5067ff5775918',2,'Chapter 2', 'here/here', 1);
