CREATE TABLE "users" (
  "id_user" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id_category" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL
);

CREATE TABLE "posts" (
  "id_post" SERIAL PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar(250),
  "content" varchar NOT NULL,
  "id_author" int,
  "id_category" int
);

CREATE TABLE "authors" (
  "id_author" SERIAL PRIMARY KEY,
  "name" varchar NOT NULL,
  "age" int NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL
);

CREATE TABLE "comments" (
  "id_comment" SERIAL PRIMARY KEY,
  "content" varchar NOT NULL,
  "id_post" int,
  "id_user" int
);

CREATE TABLE "rel_posts_categories" (
  "id" SERIAL PRIMARY KEY,
  "id_post" int,
  "id_category" int
);

ALTER TABLE "comments" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_category") REFERENCES "categories" ("id_category");

ALTER TABLE "rel_posts_categories" ADD FOREIGN KEY ("id_post") REFERENCES "posts" ("id_post");

ALTER TABLE "comments" ADD FOREIGN KEY ("id_user") REFERENCES "users" ("id_user");

ALTER TABLE "posts" ADD FOREIGN KEY ("id_author") REFERENCES "authors" ("id_author");


insert into "users" ("name", "age", "email", "password") values ('Gabriela', 51 , 'gaby@gmail.com', 'hello'), ('Guillermo', 55, 'guille@gmail.com', 'Hey');

insert into "categories" ("name") values ('History'), ('Geography'), ('Science'), ('Economy');


insert into "authors" ("name", "age", "email", "password") values 
('Cande', 24, 'cande@gmail.com', 'cccccc'),
('Olivia', 20, 'oli@gmail.com', 'oooooo');


insert into "posts" ("title", "description", "content", "id_author", "id_category") values 
('Descubre la octava maravilla del mundo', 'No te pierdas de esta fantastica maravilla!', 'Sit amet consectetur adipisicing elit. Aliquid quod culpa velit nostrum minima deleniti, illum eaque, aperiam eum vel laborum itaque adipisci accusamus magni suscipit porro! Neque, eaque ea!
', 2 , 2 ),
('Cura contra el cancer a la vuelta de la esquina?', 'Cientificos de Alemania estan por lanzar un tratamiento con un 98% de efectividad', 'Sit amet consectetur adipisicing elit. Aliquid quod culpa velit nostrum minima deleniti, illum eaque, aperiam eum vel laborum itaque adipisci accusamus magni suscipit porro! Neque, eaque ea!
', 1 , 3 );

insert into "comments" ("content", "id_post", "id_user") values ('Que belleza, ya quiero ir a visitarla!', 1 , 2), ('Wow, que bendicion poder curar a todos los que padecen esa terrible enfermedad', 2, 1);

insert into "rel_posts_categories" ("id_post", "id_category") values (1, 2), (2, 3);