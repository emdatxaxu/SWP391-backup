
CREATE DATABASE SWP391;

USE SWP391;


ALTER DATABASE swp391 CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE Role 
(
	id bigint not null primary key auto_increment,
    role varchar(50)
);

CREATE TABLE Category
(
	id bigint not null primary key auto_increment,
    category varchar(50),
	parentCategory bigint null
);

alter table Category add constraint fk_Category_parentCategory foreign key (parentCategory) references Category(id);


CREATE TABLE BlogCategory
(
	id bigint not null primary key auto_increment,
    category varchar(50)
);

CREATE TABLE User
(
	id bigint not null primary key auto_increment,
    email varchar(150) not null,
    password varchar(255) not null,
    name varchar(150) not null,
    phone varchar(10) not null,
    address text not null,
    sex boolean not null,
    status boolean null,
    verificationCode varchar(255) null,
    roleid bigint not null
);

Alter table User add constraint fk_User_Role foreign key (roleid) references Role(id);


CREATE TABLE Orders
(
	id bigint not null primary key auto_increment,
    orderdate timestamp not null,
    total double not null,
    status varchar(100) not null,
    userid bigint not null
);

Alter table Orders add constraint fk_Orders_User foreign key (userid) references User(id);


CREATE TABLE Product
(
	id bigint not null primary key auto_increment,
	name varchar(150) not null,
    price double not null,
    description text null,
    maker varchar(100) not null,
    status boolean not null,
    inventory int not null,
    categoryid bigint not null
);

Alter table Product add constraint fk_Product_Category foreign key (categoryid) references Category(id);



CREATE TABLE OrderLine
(
	id bigint not null primary key auto_increment,
    quantity int not null,    
    price double not null,
    orderid bigint not null,
    saleid bigint not null,
    productid bigint not null
);



Alter table OrderLine add constraint fk_OrderLine_Product foreign key (productid) references Product(id);
Alter table OrderLine add constraint fk_OrderLine_Sale foreign key (saleid) references User(id);
Alter table OrderLine add constraint fk_OrderLine_Orders foreign key (orderid) references Orders(id);


CREATE TABLE Cart
(
	id bigint not null primary key auto_increment,
    total double not null,
    userid bigint not null
);

Alter table Cart add constraint fk_Cart_User foreign key (userid) references User(id);


CREATE TABLE CartItem
(
	id bigint not null primary key auto_increment,
    quantity int not null,
    price double not null,
    cartid bigint not null,
    productid bigint not null
);

Alter table CartItem add constraint fk_CartItem_Cart foreign key (cartid) references Cart(id);
Alter table CartItem add constraint fk_CartItem_Product foreign key (productid) references Product(id);


CREATE TABLE Feedback
(
	id bigint not null primary key auto_increment,
	content text not null,
    star int not null,
    postdate timestamp not null,
    status boolean not null,
    userid bigint not null,
    productid bigint not null,
    parentFeedback bigint null
);

Alter table Feedback add constraint fk_Feedback_User foreign key (userid) references User(id);
Alter table Feedback add constraint fk_Feedback_Product foreign key (productid) references Product(id);
Alter table Feedback add constraint fk_Feedback_parentFeedback foreign key (parentFeedback) references Feedback(id);



CREATE TABLE Slider
(
	id bigint not null primary key auto_increment,
	title varchar(255) not null,
    backlink text not null,
    status boolean not null
);


CREATE TABLE Blog
(
	id bigint not null primary key auto_increment,
	title text not null,
    briefinfor text not null,
    content text not null,
    author varchar (50) not null,
    postdate timestamp not null,
    status boolean not null,
    blogcategoryid bigint not null    
);
alter table Blog add constraint fk_Blog_BlogCategory foreign key (blogcategoryid) references BlogCategory(id);

CREATE TABLE Comments
(
	id bigint not null primary key auto_increment,
	content text not null,
    postdate timestamp not null,
    userid bigint not null,
    blogid bigint not null,
    parentComment bigint null
);
Alter table Comments add constraint fk_Comments_Blog foreign key (blogid) references Blog(id);
Alter table Comments add constraint fk_Comments_User foreign key (userid) references User(id);
Alter table Comments add constraint fk_Comments_parentComment foreign key (parentComment) references Comments(id);

CREATE TABLE Image
(
	id bigint not null primary key auto_increment,
	source text not null,
    type varchar(100) not null,
    productid bigint null,
    blogid bigint null,
    sliderid bigint null,
    userid bigint null
);

Alter table Image add constraint fk_Image_Product foreign key (productid) references Product(id);
Alter table Image add constraint fk_Image_Blog foreign key (blogid) references Blog(id);
Alter table Image add constraint fk_Image_Slider foreign key (sliderid) references Slider(id);
Alter table Image add constraint fk_Image_User foreign key (userid) references User(id);



CREATE TABLE Specification
(
	id bigint not null primary key auto_increment,
    name varchar(150) not null,
    value varchar(255) null,
    productid bigint not null,
    categoryid bigint not null
);
alter table Specification add constraint fk_Specification_Product foreign key (productid) references Product(id);
alter table Specification add constraint fk_Specification_Category foreign key (categoryid) references Category(id);



CREATE TABLE ModifyHistory
(
	id bigint not null primary key auto_increment,
    name varchar(50) not null,
    valueBefore varchar(255) null,
    valueAfter varchar(255) null,
    updatedBy varchar(255) null,
    updatedDate timestamp,
    userid bigint not null
);

alter table ModifyHistory add constraint fk_ModifyHistory_User foreign key (userid) references User(id);



insert into role(role)
values("customer");
insert into role(role)
values("admin");
insert into role(role)
values("sale");
insert into role(role)
values("salemanager");
insert into role(role)
values("mkt");


select * from category;

insert into category(category)
values("smartphone");
insert into category(category)
values("laptop");
insert into category(category)
values("smartwatch");
insert into category(category)
values("audio");
insert into category(category)
values("accessory");


insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc@gmail.com", "123", "admin1", "0123456789","Vietnam", true, true, null, 2);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc2@gmail.com", "123", "customer1", "0123426789","Vietnam", true, true, null, 1);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc3@gmail.com", "123", "customer2", "0122456789","Vietnam", true, true, null, 1);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc4@gmail.com", "123", "sale1", "0123456289","Vietnam", true, true, null, 3);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc5@gmail.com", "123", "salemanager1", "0121456789","Vietnam", true, true, null, 4);
insert into user(email, password, name, phone, address, sex, status, verificationCode, roleid)
values("abc6@gmail.com", "123", "mkt", "0121451789","Vietnam", true, true, null, 5);

select* from category;


insert into product(name,price,description,maker,status,inventory,categoryid)
values("Samsung Galaxy Z Flip5 512GB", 20590000, null, "samsung", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-flip-5-256gb_1_5.png",
		"thumbnail", 1);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/galaxy_z_flip5_-_1.png",
		"detail", 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/galaxy_z_flip5_-_3.png",
		"detail", 1);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/s/a/samsung-galaxy-z-flip5-tim-4.jpg",
		"detail", 1);
        



insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 14 Pro 128GB | Chính hãng VN/A", 25190000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro_2__4.png",
		"thumbnail", 2);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-14-pro-1tb-2.png",
		"detail", 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_14_pro_1tb_-_1_1_.png",
		"detail", 2);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/1/21.7.png",
		"detail", 2);


  
  
  
  
insert into product(name,price,description,maker,status,inventory,categoryid)
values("Xiaomi 13 8GB 256GB", 18090000, null, "xiaomi", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-13.png",
		"thumbnail", 3);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi-13.png",
		"detail", 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1670745756.94572133.png",
		"detail", 3);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1670745783.81546234.png",
		"detail", 3);  
  
  
insert into specification(name, value, productid, categoryid)
values("screensize", "6.36", 3, 1);
insert into specification(name, value, productid, categoryid)
values("screentype", "amoled", 3, 1);
insert into specification(name, value, productid, categoryid)
values("refreshrate", "120", 3, 1);
insert into specification(name, value, productid, categoryid)
values("chipset", "snapdragon 8", 3, 1);
insert into specification(name, value, productid, categoryid)
values("ram", "8", 3, 1);
insert into specification(name, value, productid, categoryid)
values("drive", "256", 3, 1);

/*add them*/

insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 15 Pro Max 256GB", 31990000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-pro-max_3.png",
		"thumbnail", 4);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_max_256gb_-_2.png",
		"detail", 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_max_256gb_-_4.png",
		"detail", 4);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_pro_128tb_-_3.png",
		"detail", 4);
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 15 128GB ", 21690000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-15-plus_1__1.png",
		"thumbnail", 5);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_1_1.png",
		"detail", 5);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_3_3.png",
		"detail", 5);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_15_128gb_-_7_3.png",
		"detail", 5);
              insert into product(name,price,description,maker,status,inventory,categoryid)
values("iPhone 13 128GB ", 15690000, null, "apple", true, 200, 1);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone-13_2_.png",
		"thumbnail", 7);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_1_1_.png",
		"detail", 7);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_3_1_.png",
		"detail", 7);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/i/p/iphone_13_128gb_-_8_1_.png",
		"detail", 7);
        
        
        
        /* cate2-----------------------------------------------------*/
        
        
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple MacBook Air M1 256GB 2020", 18690000, null, "apple", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/i/air_m2.png",
		"thumbnail", 8);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/mac_air_ksp.png",
		"detail", 8);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-2020-m1_2_.png",
		"detail", 8);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook-air-2020-m1_5_.png",
		"detail", 8);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Macbook Air M2 2022 8GB 256GB", 26290000, null, "apple", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/m/a/macbook_air_m22.png",
		"thumbnail", 9);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/_/2_54_9.png",
		"detail", 9);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/3/_/3_40_7.png",
		"detail", 9);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/4/_/4_33_8.png",
		"detail", 9);
        
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Asus VivoBook Go 14", 12790000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005130.908.png",
		"thumbnail", 10);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001431.312_2.png",
		"detail", 10);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t005150.492.png",
		"detail", 10);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_-_2023-06-08t001516.526_1.png",
		"detail", 10);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Asus TUF GAMING F15", 16390000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w.png",
		"thumbnail", 11);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-1.png",
		"detail", 11);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-6.png",
		"detail", 11);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/l/a/laptop-asus-tuf-gaming-f15-fx506hf-hn014w-5.png",
		"detail", 11);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Lenovo Yoga Duet 7", 18990000, null, "Asus", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/a/gaming_003_3__3.png",
		"thumbnail", 12);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/g/fgege.jpg",
		"detail", 12);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/h/k/hkgk.jpg",
		"detail", 12);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/f/ffafef.jpg",
		"detail", 12);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Lenovo LOQ", 22990000, null, "Lenovo", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_d_i_3_7.png",
		"thumbnail", 13);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_30__1_8.png",
		"detail", 13);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_25__1_10.png",
		"detail", 13);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_33__1_5.png",
		"detail", 13);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Laptop Dell Inspiron 14", 21490000, null, "Dell", true, 200, 2);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_32__1_6.png",
		"thumbnail", 14);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_34__1_3.png",
		"detail", 14);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_37__1_3.png",
		"detail", 14);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_39__1_4.png",
		"detail", 14);
        
      /* cate3-------------------------------------------------*/
           
        
        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth Apple AirPods Pro 2 2023 USB-C", 5690000, null, "apple", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_1_.png",
		"thumbnail", 15);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c-ksp-1_3_.png",
		"detail", 15);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_7_.png",
		"detail", 15);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-airpods-pro-2-usb-c_2_.png",
		"detail", 15);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth True Wireless Samsung Galaxy Buds2 Pro", 3490000, null, "samsung", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_182_2.png",
		"thumbnail", 16);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_444.png",
		"detail", 16);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/3/_/3_379.png",
		"detail", 16);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/6/_/6_250.png",
		"detail", 16);
        
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth True Wireless Xiaomi Buds 3", 990000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_buds_3_31.png",
		"thumbnail", 17);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-3-4.jpg",
		"detail", 17);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-6.jpg",
		"detail", 17);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-khong-day-xiaomi-buds-3-0_2_.png",
		"detail", 17);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth chụp tai Sony WH-CH520", 1390000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520.png",
		"thumbnail", 18);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-10.png",
		"detail", 18);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520_3_.png",
		"detail", 18);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-7.png",
		"detail", 18);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Apple EarPods Lightning", 490000, null, "apple", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"thumbnail", 19);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"detail", 19);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_9_3_1.jpg",
		"detail", 19);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/u/audifonos-earpods-apple-iphone-7-8-x-lightning-original-d_nq_np_615134-mpe27006605233_032018-f.jpg",
		"detail", 19);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Xiaomi Mi Basic", 140000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"thumbnail", 20);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"detail", 20);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551358.72125327.png",
		"detail", 20);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551418.63826349.png",
		"detail", 20);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Gaming chụp tai không dây Sony INZONE H5", 2490000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_1.png",
		"thumbnail", 21);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5-ksp-2.png",
		"detail", 21);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_7_.png",
		"detail", 21);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_3__1_1.png",
		"detail", 21);
        /* cate4-------------------------------------------------------*/
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("
Apple Watch SE 2 2023 40mm (GPS) viền nhôm", 5690000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm.png",
		"thumbnail", 22);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/2/a/2apple-watch-se-2023-40mm-vien-nhom-day-silicone-xanh-den-2.jpg",
		"detail", 22);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm-vien-nhom-day-silicone-xanh-den-3.jpg",
		"detail", 22);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple-watch-se-2023-40mm-vien-nhom-day-silicone-trang-starlight-3.jpg",
		"detail", 22);
        
                insert into product(name,price,description,maker,status,inventory,categoryid)
values("Apple Watch Series 9 41mm (GPS) viền nhôm dây vải ", 9490000, null, "apple", true, 200, 4);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple_lte_1_1.png",
		"thumbnail", 23);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/p/apple_lte_1_1.png",
		"detail", 23);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_23__1_11.png",
		"detail", 23);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/e/text_ng_n_24__1_11.png",
		"detail", 23);
        
                  insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth True Wireless Xiaomi Buds 3", 990000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/x/i/xiaomi_buds_3_31.png",
		"thumbnail", 17);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-3-4.jpg",
		"detail", 17);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/b/u/buds-6.jpg",
		"detail", 17);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-khong-day-xiaomi-buds-3-0_2_.png",
		"detail", 17);
        
                        insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Bluetooth chụp tai Sony WH-CH520", 1390000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520.png",
		"thumbnail", 18);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-10.png",
		"detail", 18);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520_3_.png",
		"detail", 18);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-wh-ch520-7.png",
		"detail", 18);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Apple EarPods Lightning", 490000, null, "apple", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"thumbnail", 19);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/f/r/frame_3_3.png",
		"detail", 19);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/1/_/1_9_3_1.jpg",
		"detail", 19);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/a/u/audifonos-earpods-apple-iphone-7-8-x-lightning-original-d_nq_np_615134-mpe27006605233_032018-f.jpg",
		"detail", 19);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Xiaomi Mi Basic", 140000, null, "Xiaomi", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"thumbnail", 20);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/g/r/group_197_3.png",
		"detail", 20);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551358.72125327.png",
		"detail", 20);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/p/m/pms_1538551418.63826349.png",
		"detail", 20);
        
                     insert into product(name,price,description,maker,status,inventory,categoryid)
values("Tai nghe Gaming chụp tai không dây Sony INZONE H5", 2490000, null, "Sony", true, 200, 3);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:358:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_1.png",
		"thumbnail", 21);
       
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5-ksp-2.png",
		"detail", 21);

insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_7_.png",
		"detail", 21);
        
insert into image(source, type, productid)
values("https://cdn2.cellphones.com.vn/insecure/rs:fill:0:358/q:80/plain/https://cellphones.com.vn/media/catalog/product/t/a/tai-nghe-chup-tai-sony-inzone-h5_3__1_1.png",
		"detail", 21);


        


