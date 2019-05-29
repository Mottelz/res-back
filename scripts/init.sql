-- noinspection SqlNoDataSourceInspectionForFile

CREATE TABLE users (
    uid INT PRIMARY KEY AUTOINCREMENT,
    email VARCHAR UNIQUE NOT NULL,
    password VARCHAR NOT NULL
);

create table country (
    cid INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL UNIQUE,
    code VARCHAR NOT NULL UNIQUE
);

create table province(
    pid INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR UNIQUE NOT NULL,
    code VARCHAR UNIQUE NOT NULL,
    country INT NOT NULL,
    foreign key (country) references country(cid)
);

create table cities(
    cid INT PRIMARY KEY AUTOINCREMENT,
    name VARCHAR NOT NULL,
    province INT NOT NULL,
    foreign key (province) references province(pid)
);

create table addresses(
    aid INT PRIMARY KEY AUTOINCREMENT,
    number VARCHAR not null,
    street VARCHAR not null,
    apt VARCHAR,
    city not null,
    foreign key city references cities(cid)
);

create table  contact (
  cid INT PRIMARY KEY AUTOINCREMENT,
  uid INT UNIQUE NOT NULL,
  fname VARCHAR NOT NULL,
  lname VARCHAR NOT NULL,
  email VARCHAR NOT NULL,
  address INT UNIQUE,
  website VARCHAR,
  links VARCHAR,
  position VARCHAR,
  foreign key (uid) REFERENCES users(uid),
  foreign key (address) REFERENCES addresses(aid)
);

create table skills(
    sid INT PRIMARY KEY AUTOINCREMENT,
    skill varchar not null,
    user int not null,
    foreign key (user) references users(uid)
);

create table projects(
    pid INT PRIMARY KEY AUTOINCREMENT,
    title varchar not null,
    tech varchar not null,
    description varchar,
    user int not null,
    foreign key (user) references users(uid)
);

create table employment(
    eid INT PRIMARY KEY AUTOINCREMENT,
    user int not null,
    employer not null,
    start varchar not null,
    end varchar,
    position varchar not null,
    duties varchar,
    foreign key (user) references users(uid)
);

create table education(
    eid INT PRIMARY KEY AUTOINCREMENT,
    user int not null,
    level varchar not null,
    school varchar not null,
    completed varchar not null,
    foreign key (user) references users(uid)
);
