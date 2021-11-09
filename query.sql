create table Usuario(
	id int,
	email varchar(30),
	primary key (id));
	
create table Post(
	id int,
	usuario_id int,
	titulo varchar(50),
	fecha date,
	primary key (id),
	foreign key (usuario_id) references Usuario(id));
	
create table Comentarios(
	id int,
	post_id int,
	usuario_id int,
	texto varchar(300),
	fecha date,
	primary key (id),
	foreign key(usuario_id) references Usuario(id),
	foreign key(post_id) references Post(id));
	
insert into Usuario values(1, 'usuario01@hotmail.com');
insert into Usuario values(2, 'usuario02@gmail.com');
insert into Usuario values(3, 'usuario03@gmail.com');
insert into Usuario values(4, 'usuario04@hotmail.com');
insert into Usuario values(5, 'usuario05@yahoo.com');
insert into Usuario values(6, 'usuario06@hotmail.com');
insert into Usuario values(7, 'usuario07@yahoo.com');
insert into Usuario values(8, 'usuario08@yahoo.com');
insert into Usuario values(9, 'usuario09@yahoo.com');

select * from Usuario;

insert into Post values(1, 1, 'Post 1: Esto es malo', '2020-06-29');
insert into Post values(2, 5, 'Post 2: Esto es malo', '2020-06-20');
insert into Post values(3, 1, 'Post 3: Esto es excelente', '2020-05-30');
insert into Post values(4, 9, 'Post 4: Esto es bueno', '2020-05-09');
insert into Post values(5, 7, 'Post 5: Esto es bueno', '2020-07-10');
insert into Post values(6, 5, 'Post 6: Esto es excelente', '2020-07-18');
insert into Post values(7, 8, 'Post 7: Esto es excelente', '2020-07-07');

insert into Post values(8, 5, 'Post 8: Esto es excelente', '2020-05-14');
insert into Post values(9, 2, 'Post 9: Esto es bueno', '2020-05-08');
insert into Post values(10, 6, 'Post 10: Esto es bueno', '2020-06-02');
insert into Post values(11, 4, 'Post 11: Esto es bueno', '2020-05-05');
insert into Post values(12, 9, 'Post 12: Esto es malo', '2020-07-23');
insert into Post values(13, 5, 'Post 13: Esto es excelente', '2020-05-30');
insert into Post values(14, 8, 'Post 14: Esto es excelente', '2020-05-01');
insert into Post values(15, 7, 'Post 15: Esto es malo', '2020-06-17');

select * from Post;

insert into Comentarios values(1, 6, 3, 'Este es el comentario 1', '2020-07-08');
insert into Comentarios values(2, 2, 4, 'Este es el comentario 2', '2020-06-07');
insert into Comentarios values(3, 4, 6, 'Este es el comentario 3', '2020-06-16');
insert into Comentarios values(4, 13, 2, 'Este es el comentario 4', '2020-06-15');
insert into Comentarios values(5, 6, 6, 'Este es el comentario 5', '2020-05-14');
insert into Comentarios values(6, 3, 3, 'Este es el comentario 6', '2020-07-08');
insert into Comentarios values(7, 1, 6, 'Este es el comentario 7', '2020-05-22');
insert into Comentarios values(8, 7, 6, 'Este es el comentario 8', '2020-07-09');
insert into Comentarios values(9, 13, 8, 'Este es el comentario 9', '2020-06-30');
insert into Comentarios values(10, 6, 8, 'Este es el comentario 10', '2020-06-19');
insert into Comentarios values(11, 1, 5, 'Este es el comentario 11', '2020-05-09');
insert into Comentarios values(12, 15, 8, 'Este es el comentario 12', '2020-06-17');
insert into Comentarios values(13, 9, 1, 'Este es el comentario 13', '2020-05-01');
insert into Comentarios values(14, 5, 2, 'Este es el comentario 14', '2020-05-31');
insert into Comentarios values(15, 3, 4, 'Este es el comentario 15', '2020-06-28');

select * from Comentarios;

-- correo, id y post del usuario 5
select usuario.id, usuario.email, post.titulo from usuario inner join post on usuario.id= post.usuario_id 
where usuario.id=5;

-- listar correo. id y el detalles de todos los comentarios NO REALIZADOS por usuario con correo usuario06@hotmail.com
select usuario.email, comentarios.usuario_id, comentarios.texto from usuario right join comentarios on usuario.id=comentarios.usuario_id where usuario.email='usuario06@hotmail.com';

-- listar los usuario que no ha publicado algun post
select usuario.id from usuario left join post on usuario.id=post.usuario_id where post.id is null;

-- listar todos los post, incluyendo quien no posee comentario
select * from post full outer join comentarios on post.id=comentarios.post_id;

-- listar todos los usuarios que publicaran un post en junio
select * from usuario inner join post on usuario.id=post.usuario_id where post.fecha between '2020-06-01' and '2020-06-30'order by post.fecha asc;