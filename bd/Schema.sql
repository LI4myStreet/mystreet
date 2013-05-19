/*
Realiza o drop de toads as tabelas\
*/
ALTER TABLE Comentarios DROP CONSTRAINT FKComentario456261;
ALTER TABLE Localidades DROP CONSTRAINT FKLocalidade448199;
ALTER TABLE Comentarios DROP CONSTRAINT FKComentario809369;
ALTER TABLE Ocorrencia DROP CONSTRAINT FKOcorrencia229570;
ALTER TABLE Ocorrencia_Tags DROP CONSTRAINT FKOcorrencia671639;
ALTER TABLE Ocorrencia_Tags DROP CONSTRAINT FKOcorrencia40433;
ALTER TABLE Likes DROP CONSTRAINT FKLikes389562;
ALTER TABLE Likes DROP CONSTRAINT FKLikes316397;
ALTER TABLE Classificacao DROP CONSTRAINT FKClassifica480636;
ALTER TABLE Amigos DROP CONSTRAINT FKAmigos52968;
ALTER TABLE Amigos DROP CONSTRAINT FKAmigos52969;
ALTER TABLE Intervencao DROP CONSTRAINT FKIntervenca847918;
ALTER TABLE Classificacao DROP CONSTRAINT FKClassifica862287;
ALTER TABLE Localidades DROP CONSTRAINT FKLocalidade154159;
ALTER TABLE Imagens DROP CONSTRAINT FKImagens166878;
ALTER TABLE Imagem_Ocorrencia DROP CONSTRAINT FKImagem_Oco122695;
ALTER TABLE Imagens DROP CONSTRAINT FKImagens471146;
DROP TABLE Imagem_Ocorrencia;
DROP TABLE Intervencao;
DROP TABLE Amigos;
DROP TABLE Imagens;
DROP TABLE Likes;
DROP TABLE Ocorrencia_Tags;
DROP TABLE Localidades;
DROP TABLE Classificacao;
DROP TABLE Tags;
DROP TABLE Comentarios;
DROP TABLE Ocorrencia;
DROP TABLE Utilizador;


/*
Adiciona as tabelas\
*/

CREATE TABLE Imagem_Ocorrencia (OcorrenciaID int NOT NULL UNIQUE, ImagemID int NOT NULL UNIQUE);
CREATE TABLE Intervencao (OcorrenciaID int NOT NULL UNIQUE, UtilizadorID int NOT NULL UNIQUE, IntervencaoID int NOT NULL UNIQUE, Descricao varchar(255) NOT NULL);
CREATE TABLE Amigos (UtilizadorID int NULL, AmigoID int NULL);
CREATE TABLE Imagens (ImagemID int NOT NULL UNIQUE, Imagem binary(1000) NOT NULL);
CREATE TABLE Likes (UtilizadorID int NOT NULL UNIQUE, OcorrenciaID int NOT NULL UNIQUE);
CREATE TABLE Ocorrencia_Tags (OcorrenciaID int NOT NULL UNIQUE, TagID int NOT NULL UNIQUE);
CREATE TABLE Localidades (LocalidadeID int NOT NULL UNIQUE, Nome varchar(400) NULL, Coordenadas varchar(255) NULL);
CREATE TABLE Classificacao (UtilizadorID int NOT NULL UNIQUE, IntervencaoID int NOT NULL UNIQUE, Valor int NOT NULL);
CREATE TABLE Tags (TagID int NOT NULL UNIQUE, Descricao varchar(255) NOT NULL UNIQUE);
CREATE TABLE Comentarios (UtilizadorID int NOT NULL UNIQUE, OcorrenciaID int NOT NULL UNIQUE, Conteudo int NOT NULL, ImagemID varchar(255) NULL UNIQUE, ComentarioID int NOT NULL UNIQUE);
CREATE TABLE Ocorrencia (UtilizadorID int NOT NULL UNIQUE, OcorrenciaID int NOT NULL UNIQUE, Descricao int NOT NULL, Estado varchar(255) NOT NULL, Morada varchar(255) NULL, Coordenadas varchar(255) NULL);
CREATE TABLE Utilizador (UtilizadorID int NOT NULL UNIQUE, Nome varchar(255) NOT NULL, Morada varchar(255) NOT NULL, Tipo char(1) NOT NULL, Login varchar(255) NOT NULL, Password varchar(255) NOT NULL, LocalidadeID int NULL);
