delete from user_role;
delete from user;

insert into user(id, active, password, username) values
    (1, true, '202cb962ac59075b964b07152d234b70', 'admin'),
    (2, true, '202cb962ac59075b964b07152d234b70', 'mike');

insert into user_role(user_id, roles) VALUES
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');