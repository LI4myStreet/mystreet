{\rtf1\ansi\ansicpg1252\cocoartf1138\cocoasubrtf510
{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural

\f0\fs24 \cf0 /*\
Realiza o drop de toads as tabelas\
*/\
DROP TABLE IF EXISTS Imagem_Ocorrencia;\
DROP TABLE IF EXISTS Intervencao;\
DROP TABLE IF EXISTS Likes;\
DROP TABLE IF EXISTS Ocorrencia_Tags;\
DROP TABLE IF EXISTS Classificacao;\
DROP TABLE IF EXISTS Tags;\
DROP TABLE IF EXISTS Comentarios;\
DROP TABLE IF EXISTS Ocorrencia;\
DROP TABLE IF EXISTS Utilizador;\
\
\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural
\cf0 /*\
Adiciona as tabelas\
*/\
\pard\tx566\tx1133\tx1700\tx2267\tx2834\tx3401\tx3968\tx4535\tx5102\tx5669\tx6236\tx6803\pardirnatural
\cf0 CREATE TABLE Imagem_Ocorrencia (Cod_Ocorrencia integer(10) NOT NULL UNIQUE, Cod_Imagem integer(10) NOT NULL UNIQUE, FOREIGN KEY() REFERENCES Ocorrencia());\
CREATE TABLE Intervencao (Cod_Ocorrencia integer(10) NOT NULL UNIQUE, Cod_Utilizador integer(10) NOT NULL UNIQUE, Cod_Intervencao integer(10) NOT NULL UNIQUE, Descricao varchar(255) NOT NULL, FOREIGN KEY() REFERENCES Ocorrencia());\
CREATE TABLE Likes (Cod_Utilizador integer(10) NOT NULL UNIQUE, Cod_Ocorrencia integer(10) NOT NULL UNIQUE, FOREIGN KEY() REFERENCES Utilizador(), FOREIGN KEY() REFERENCES Ocorrencia());\
CREATE TABLE Ocorrencia_Tags (Cod_Ocorrencia integer(10) NOT NULL UNIQUE, Cod_Tag integer(10) NOT NULL UNIQUE, FOREIGN KEY() REFERENCES Tags(), FOREIGN KEY() REFERENCES Ocorrencia());\
CREATE TABLE Classificacao (Cod_Utilizador integer(10) NOT NULL UNIQUE, Cod_Intervencao integer(10) NOT NULL UNIQUE, Valor integer(10) NOT NULL, FOREIGN KEY() REFERENCES Intervencao(), FOREIGN KEY() REFERENCES Utilizador());\
CREATE TABLE Tags (Cod_Tag integer(10) NOT NULL UNIQUE, Descricao varchar(255) NOT NULL UNIQUE);\
CREATE TABLE Comentarios (Cod_Utilizador integer(10) NOT NULL UNIQUE, Cod_Ocorrencia integer(10) NOT NULL UNIQUE, Conteudo integer(10) NOT NULL, Cod_Imagem varchar(255) UNIQUE, Cod_Comentario integer(10) NOT NULL UNIQUE, FOREIGN KEY() REFERENCES Utilizador(), FOREIGN KEY() REFERENCES Ocorrencia());\
CREATE TABLE Ocorrencia (Cod_Utilizador integer(10) NOT NULL UNIQUE, Cod_Ocorrencia integer(10) NOT NULL UNIQUE, Descricao integer(10) NOT NULL, Estado varchar(255) NOT NULL, FOREIGN KEY() REFERENCES Utilizador());\
CREATE TABLE Utilizador (Cod_Utilizador integer(10) NOT NULL UNIQUE, Nome varchar(255) NOT NULL, Morada varchar(255) NOT NULL, Tipo char(1) NOT NULL, Login varchar(255) NOT NULL, Password varchar(255) NOT NULL);\
}