#Tạo CSDL - tạo 1 lần cho 1 ứng dụng
#drop database if exists democsdl ;
create database if not exists democsdl ;
# chọn csdl :click đúp chuột vào tên csdl bên bảng sidebar
use democsdl;

#tạo bảng
create table if not exists Catalogs(
	#định nghĩa các trường
    #long , int, short, byle , double, float ,boolean là kiểu số -> SQL sẽ thành bigint, int,smallint,tinyint ,double ,float,bit
    #String,char là chuỗi ->SQL sẽ thành text,blod(ko mặc định giới hạn kí tự và tối đa 65***),varchar(bắt buộc giới hạn ,65***),char (max)
    #Date-> SQL datetime,time,date
    id bigint,
    name varchar(100),
    description text,
    status bit
);
# xoá bảng
#drop table if exists Catalogs;

#định nghĩa lại bảng
#thêm cột
alter table Catalogs
add column imageUrl text;
#xoá cột
alter table Catalogs
drop column imageUrl;

alter table Catalogs
modify column imageUrl varchar(255);