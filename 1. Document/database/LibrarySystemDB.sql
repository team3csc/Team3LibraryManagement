create database Library;
use Library;
create table BOOK(
	isbn bigint(13) primary key not null,
	title varchar(50) not null,
    publisher_id int not null,
    publishing_year year not null,
    category_id int not null,
    short_description varchar(1000),
    brw_tckt_nber int not null,
    valid_status boolean,
    amount int not null,
    importance int(1) not null
);
create table AUTHOR_DETAILS(
	author_id int not null auto_increment primary key,
    author_name varchar(30) not null
);
create table BOOK_AUTHOR(
	author_id int,
    isbn bigint(13),
    constraint pk_author_isbn_book_author primary key (author_id, isbn)
);
create table PUBLISHER_DETAILS(
	publisher_id int not null auto_increment primary key,
    publisher_name varchar(50) not null
);
create table BOOK_CATEGORY_DETAILS(
	category_id int not null primary key auto_increment,
    category_name varchar(30) not null,
	category_description varchar(1000)
);
create table TICKET(
    borrowed_date date not null,
    ticket_id int not null primary key auto_increment,
    user_id int not null,
    borrow_number int not null
);
create table TICKET_BOOK(
	isbn bigint(13) not null,
    ticket_id int not null,
    primary key (isbn, ticket_id)
);
create table STAFF_INFO(
	staff_id int not null primary key auto_increment,
    real_name varchar(30) not null,
    address varchar(30) not null,
    phone_number int(11) not null,
    email varchar(30),
    pword int(20) not null,
    sex varchar(6),
    degree varchar(30),
    dayofbirth date
);
create table ROLE(
	role_id int not null auto_increment primary key,
    role_name varchar(20) not null
);
create table USER_INFO(
	user_id int not null auto_increment primary key,
    real_name varchar(30) not null,
    address varchar(30) not null,
    phone_number int(11) not null,
    email varchar(30) not null,
    pword varchar(20) not null,
    sex varchar(6),
    job varchar(30),
    degree varchar(30),
    valid boolean,
    dayofbirth date
);
create table USER_ROLE(
	user_id int not null,
    role_id int not null,
    primary key (user_id, role_id)
);
create table RETURN_BOOK(
	return_book_id int not null primary key auto_increment,
	user_id int not null,
    returned_date date not null,
    fine int not null
);
create table PAYMENT(
	user_id int not null,
    payment_amount int not null,
    pay_day date not null,
    fine int,
    payment_id int primary key not null auto_increment
);
create table RULES(
	rule_id int(1) not null primary key,
    borrowing_time int not null,
    fine_per_day int not null,
    min_left int not null
);

alter table BOOK 
add constraint category_id_fk_on_book foreign key (category_id) references BOOK_CATEGORY_DETAILS(category_id);
alter table BOOK
add constraint publisher_id_fk_on_book foreign key (publisher_id) references PUBLISHER_DETAILS(publisher_id);
alter table BOOK 
add constraint importance_fk_on_book foreign key (importance) references RULES(rule_id);
alter table BOOK_AUTHOR
add constraint isbn_fk_on_book_author foreign key (isbn) references BOOK(isbn);
alter table BOOK_AUTHOR
add constraint author_id_fk_on_book_author foreign key (author_id) references AUTHOR_DETAILS(author_id);
alter table PAYMENT
add constraint user_id_fk_on_payment foreign key (user_id) references USER_INFO(user_id);
alter table USER_ROLE
add constraint user_id_fk_on_user_role foreign key (user_id) references USER_INFO(user_id);
alter table USER_ROLE
add constraint role_id_fk_on_user_role foreign key (role_id) references ROLE(role_id);
alter table TICKET
add constraint user_id_fk_on_ticket foreign key (user_id) references USER_INFO(user_id);
alter table TICKET_BOOK
add constraint ticket_id_fk_on_ticket_book foreign key (ticket_id) references TICKET(ticket_id);
alter table TICKET_BOOK
add constraint isbn_fk_on_ticket_book foreign key (isbn) references BOOK(isbn);
alter table RETURN_BOOK
add constraint user_id_fk_on_return foreign key (user_id) references TICKET(user_id);

insert into role (role_name) value ("MEMBER_USER");
insert into role (role_name) value ("ADMIN");
insert into role (role_name) value ("GUEST");

INSERT INTO `user_info` (`user_id`, `real_name`, `address`, `phone_number`, `email`, `pword`, `sex`, `job`, `degree`, `valid`, `dayofbirth`) VALUES
(1, 'To The Tan', 'Di An, Binh Duong', 123456789, 'tantt3746@gmail.com', '123456', NULL, NULL, NULL, 1, NULL),
(2, 'Tran Hoang Giang', 'Thu Duc, TP.HCM', 123456788, 'giangcoibp@gmail.com', '123456', NULL, NULL, NULL, 0, NULL);

insert into USER_INFO(real_name, address, phone_number, email, pword, valid, sex, degree)
values("user1","Mar Planet",434234234,"user1@csc","1234",true, "female","");
insert into USER_INFO(real_name, address, phone_number, email, pword, valid, sex, degree)
values("admin1","Venus Planet",32425234,"admin1@csc","1234",true, "female", "");

INSERT INTO `user_role` (`user_id`, `role_id`) VALUES
(1, 1),
(1, 2),
(2, 1);

INSERT INTO `ticket` (`borrowed_date`, `ticket_id`, `user_id`, `borrow_number`) VALUES
('2017-03-16', 1, 1, 1),
('2017-03-17', 2, 2, 2);

INSERT INTO `rules` (`rule_id`, `borrowing_time`, `fine_per_day`, `min_left`) VALUES
(1, 15, 10000, 1),
(2, 7, 30000, 3),
(3, 0, 200000, 5);

INSERT INTO `return_book` (`return_book_id`, `user_id`, `returned_date`, `fine`) VALUES
(1, 1, '2017-03-17', 1),
(2, 2, '2017-03-18', 1);

INSERT INTO `ticket` (`borrowed_date`, `ticket_id`, `user_id`, `borrow_number`) VALUES
('2017-03-16', 1, 1, 1),
('2017-03-17', 2, 2, 2);

insert into rules (rule_id, borrowing_time, fine_per_day, min_left) values (1, 15, 10000, 1);
insert into rules (rule_id, borrowing_time, fine_per_day, min_left) values (2, 7, 30000, 3);
insert into rules (rule_id, borrowing_time, fine_per_day, min_left) values (3, 0, 200000, 5);

insert into book_category_details(category_name) value ("Magazine");
insert into book_category_details(category_name) value ("Fiction");
insert into book_category_details(category_name) value ("History");
insert into book_category_details(category_name) value ("Science");
insert into book_category_details(category_name) value ("Psychology");
insert into book_category_details(category_name) value ("Economics");
insert into book_category_details(category_name) value ("Politics");
insert into book_category_details(category_name) value ("Manga");
insert into book_category_details(category_name) value ("Magazine");
insert into book_category_details(category_name) value ("Novel");
insert into book_category_details(category_name) value ("Cookbook");
insert into book_category_details(category_name) value ("Foreign Language");

insert into publisher_details(publisher_name) value ("Van hoc");
insert into publisher_details(publisher_name) value ("Hoi nha van");
insert into publisher_details(publisher_name) value ("Phu nu");
insert into publisher_details(publisher_name) value ("Hong Duc");
insert into publisher_details(publisher_name) value ("Ha Noi");
insert into publisher_details(publisher_name) value ("Tong hop thanh pho Ho Chi Minh");
insert into publisher_details(publisher_name) value ("Thanh nien");
insert into publisher_details(publisher_name) value ("Tre");
insert into publisher_details(publisher_name) value ("Dai hoc Quoc gia thanh pho Ho Chi Minh");
insert into publisher_details(publisher_name) value ("Kim Dong");
insert into publisher_details(publisher_name) value ("The duc the thao");
insert into publisher_details(publisher_name) value ("Phuong Nam Book");
insert into publisher_details(publisher_name) value ("Amak Books");
insert into publisher_details(publisher_name) value ("Quang Van Books");
insert into publisher_details(publisher_name) value ("Thai Ha Books");
insert into publisher_details(publisher_name) value ("IPM");
insert into publisher_details(publisher_name) value ("TABOOK");
insert into publisher_details(publisher_name) value ("Vintage");
insert into publisher_details(publisher_name) value ("International Publishers Co");
insert into publisher_details(publisher_name) value ("Rodale Books");
insert into publisher_details(publisher_name) value ("Smithsonian Books");
insert into publisher_details(publisher_name) value ("Cambridge University Press");
insert into publisher_details(publisher_name) value ("Haole Library");
insert into publisher_details(publisher_name) value ("Scholastic Press");
insert into publisher_details(publisher_name) value ("Oxford University Press");

insert into author_details(author_name) value ("Winston Groom");
insert into author_details(author_name) value ("Dominic Midgley");
insert into author_details(author_name) value ("Chris Hutchins");
insert into author_details(author_name) value ("Cuu Ba Dao");
insert into author_details(author_name) value ("Krishnamurti");
insert into author_details(author_name) value ("Hu Min");
insert into author_details(author_name) value ("John Gordon");
insert into author_details(author_name) value ("Ly A Tan");
insert into author_details(author_name) value ("Ta Chi Dai Tuong");
insert into author_details(author_name) value ("Nguyen Tan Dang");
insert into author_details(author_name) value ("Nguyen Xuan Truong");
insert into author_details(author_name) value ("Tatsuhiko Takimoto");
insert into author_details(author_name) value ("Nomura Mizuki");
insert into author_details(author_name) value ("Yoshiharu Tsuboi");
insert into author_details(author_name) value ("Philippe Devillers");
insert into author_details(author_name) value ("Shinkai Makoto");
insert into author_details(author_name) value ("Natsuki Namiya");
insert into author_details(author_name) value ("Arikawa Hiro");
insert into author_details(author_name) value ("Mikami En");
insert into author_details(author_name) value ("Eita Nakatani");
insert into author_details(author_name) value ("Eto Mori");
insert into author_details(author_name) value ("Dazai Osamu");
insert into author_details(author_name) value ("Tanigawa Nagaru");
insert into author_details(author_name) value ("Riku Misora");
insert into author_details(author_name) value ("Kenji Inoue");
insert into author_details(author_name) value ("Chihaya Akane");
insert into author_details(author_name) value ("Inui Kurumi");
insert into author_details(author_name) value ("Yukito Ayatsuji");
insert into author_details(author_name) value ("Hasekura Isuna");
insert into author_details(author_name) value ("Suzumu");
insert into author_details(author_name) value ("Ichikawa Takuji");
insert into author_details(author_name) value ("Yonejawa Honobu");
insert into author_details(author_name) value ("Iwai Shunji");
insert into author_details(author_name) value ("Reiki Kawahara");
insert into author_details(author_name) value ("Gosho Aoyama");
insert into author_details(author_name) value ("Naoshi Arakawa");
insert into author_details(author_name) value ("Yoshitoki Oima");
insert into author_details(author_name) value ("Krishnamurti");
insert into author_details(author_name) value ("Kouji Seo");
insert into author_details(author_name) value ("Karl Marx");
insert into author_details(author_name) value ("Friedrich Engels");
insert into author_details(author_name) value ("Adolf Hitler");
insert into author_details(author_name) value ("Thug Kitchen LLC");
insert into author_details(author_name) value ("Darren Naish");
insert into author_details(author_name) value ("Brett L. Walker");
insert into author_details(author_name) value ("J. K. Rowling ");
insert into author_details(author_name) value ("Duane W. Roller");

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786045332641, "Schoolgirl",2,2015,2,"Essentially the start of Dazai's career, Schoolgirl gained notoriety for its ironic and inventive use of language",0,true,5,1);
insert into book_author(author_id, isbn) values (22,9786045332641);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786049143132, "5 Centimeters per Second",1,2014,10,"Praise for the animated film by Makoto Shinkai",0,true,5,1);
insert into book_author(author_id, isbn) values (16,9786049143132);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786041092969, "A Silent Voice 1",8,2016,8,"LEARNING TO LISTEN",0,true,15,1);
insert into book_author(author_id, isbn) values (37,9786041092969);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780307947390, "Forrest Gump",18,2012,10,"The modern classic that inspired the beloved movie starring Tom Hanks",0,true,10,1);
insert into book_author(author_id, isbn) values (1,9780307947390);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780717802418, "The Communist Manifesto",19,2014,7,"The Communist Manifesto, originally titled Manifesto of the Communist Party is a short 1848 book written by the German Marxist political theorists Karl Marx and Friedrich Engels",0,true,30,2);
insert into book_author(author_id, isbn) values (40,9780717802418);
insert into book_author(author_id, isbn) values (41,9780717802418);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781682040218, "Mein Kampf",23,2015,7,"Unabridged edition of Hitlers original book - Four and a Half Years of Struggle against Lies, Stupidity, and Cowardice",0,true,10,3);
insert into book_author(author_id, isbn) values (42,9781682040218);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781623363581, "Thug Kitchen: The Official Cookbook",20,2014,11,"Eat Like You Give a F*ck",0,true,25,1);
insert into book_author(author_id, isbn) values (43,9781623363581);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781588345820, "Dinosaurs: How They Lived and Evolved",21,2016,4,"Dinosaurs are one of the most spectacular groups of animals that have ever existed. Many were fantastic, bizarre creatures that still capture our imagination: the super-predator Tyrannosaurus, the plate-backed Stegosaurus, and the long-necked, long-tailed Diplodocus.",0,true,15,1);
insert into book_author(author_id, isbn) values (44,9781588345820);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780521178723, "A Concise History of Japan",21,2015,6,"A Concise History of Japan integrates the pageantry of Japanese history",0,true,12,2);
insert into book_author(author_id, isbn) values (45,9780521178723);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876046456568, "SOUL 26",7,2017,1,"Japanese 2D cultural subject",0,true,30,1);
insert into book_author(author_id, isbn) values (11,9876046456568);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045635209, "Book of the end 1",3,2016,2,"Find the true meaning of life",0,true,10,1);
insert into book_author(author_id, isbn) values (30,9876045635209);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045636107, "Book of the end 2",3,2016,2,"What color is the first page?",0,true,10,1);
insert into book_author(author_id, isbn) values (30,9876045636107);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9874045636763, "Book of the end 3",3,2016,2,"So, a new story begins",0,true,10,1);
insert into book_author(author_id, isbn) values (30,9874045636763);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045638088, "Book of the end 4",3,2016,2,"We are nearing the end",0,true,10,1);
insert into book_author(author_id, isbn) values (30,9876045638088);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780590353403, "Harry Potter And The Sorcerer's Stone",24,1998,2,"What did Harry Potter know about magic?",0,true,20,2);
insert into book_author(author_id, isbn) values (46,9780590353403);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9780439064866, "Harry Potter and the Chamber of Secrets",24,1999,2,"In one of the most hotly anticipated sequel in memory",0,true,20,2);
insert into book_author(author_id, isbn) values (46,9780439064866);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786045835807, "IELTS Listening Strategies for the Ielts Test",6,2011,12,"",0,true,30,1);
insert into book_author(author_id, isbn) values (8,9786045835807);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045809747, "Essential Grammer for IELTS",6,2015,12,"",0,true,32,1);
insert into book_author(author_id, isbn) values (6,9876045809747);
insert into book_author(author_id, isbn) values (7,9876045809747);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786048554071, "IELTS Writing Strategies for the Ielts Test",6,2015,12,"",0,true,36,1);
insert into book_author(author_id, isbn) values (6,9786048554071);
insert into book_author(author_id, isbn) values (7,9786048554071);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781570624421, "This Light in Oneself",25,1999,5,"These selections present the core of Krishnamurti's teaching on meditation, taken from discussions with small groups",0,true,8,2);
insert into book_author(author_id, isbn) values (38,9781570624421);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876046915577, "Book Girl and the Suicidal Mime",1,2014,2,"For Tohko Amano, a third-year high school student and self-styled book girl, being the head of the literary club is more than just an extracurricular activity. It's her bread and butter...literally! Tohko is actually a literature-gobbling demon, who can be found at all hours of the day munching on torn out pages from all kinds of books. But for Tohko, the real delicacies are hand-written stories. To satisfy her gourmet tastes, she's employed (rather, browbeaten) one Konoha Inoue, who scribbles away each day after school to satisfy Tohko's appetite. But when another student comes knocking on the literary club door for advice on writing love letters, will Tohko discover a new kind of delicacy?",0,true,18,1);
insert into book_author(author_id, isbn) values (13,9876046915577);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045836095, "Cleopatra: A Biography",25,2015,3,"Few personalities from classical antiquity are more famous--yet more poorly understood--than Cleopatra VII, queen of Egypt. In this major biography, Duane Roller reveals that Cleopatra was in fact a learned and visionary leader whose overarching goal was always the preservation of her dynasty and kingdom.",0,true,6,2);
insert into book_author(author_id, isbn) values (47,9876045836095);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786045835807, "IELTS Listening Strategies for the Ielts Test",6,2011,12,"",0,true,30,1);
insert into book_author(author_id, isbn) values (8,9786045835807);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045809747, "Essential Grammer for IELTS",6,2015,12,"",0,true,32,1);
insert into book_author(author_id, isbn) values (6,9876045809747);
insert into book_author(author_id, isbn) values (7,9876045809747);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9786048554071, "IELTS Writing Strategies for the Ielts Test",6,2015,12,"",0,true,36,1);
insert into book_author(author_id, isbn) values (6,9786048554071);
insert into book_author(author_id, isbn) values (7,9786048554071);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9781570624421, "This Light in Oneself",25,1999,5,"These selections present the core of Krishnamurti's teaching on meditation, taken from discussions with small groups",0,true,8,2);
insert into book_author(author_id, isbn) values (38,9781570624421);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876046915577, "Book Girl and the Suicidal Mime",1,2014,2,"For Tohko Amano, a third-year high school student and self-styled book girl, being the head of the literary club is more than just an extracurricular activity. It's her bread and butter...literally! Tohko is actually a literature-gobbling demon, who can be found at all hours of the day munching on torn out pages from all kinds of books. But for Tohko, the real delicacies are hand-written stories. To satisfy her gourmet tastes, she's employed (rather, browbeaten) one Konoha Inoue, who scribbles away each day after school to satisfy Tohko's appetite. But when another student comes knocking on the literary club door for advice on writing love letters, will Tohko discover a new kind of delicacy?",0,true,18,1);
insert into book_author(author_id, isbn) values (13,9876046915577);

insert into book(isbn, title, publisher_id, publishing_year, category_id, short_description, brw_tckt_nber, valid_status, amount, importance)
values (9876045836095, "Cleopatra: A Biography",25,2015,3,"Few personalities from classical antiquity are more famous--yet more poorly understood--than Cleopatra VII, queen of Egypt. In this major biography, Duane Roller reveals that Cleopatra was in fact a learned and visionary leader whose overarching goal was always the preservation of her dynasty and kingdom.",0,true,6,2);
insert into book_author(author_id, isbn) values (47,9876045836095);insert into book_author(author_id, isbn) values (6,9876045836095)