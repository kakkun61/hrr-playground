DROP TABLE IF EXISTS tutorial.fruit;
CREATE TABLE tutorial.fruit (
  id int primary key auto_increment,
  name varchar(10) not null,
  price int not null
);

DROP TABLE IF EXISTS tutorial.market_history;
CREATE TABLE tutorial.market_history (
  id int primary key,
  product int not null,
  quantity int not null
);
