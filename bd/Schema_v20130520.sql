USE [myStreet]
GO
ALTER TABLE [dbo].[Utilizador] DROP CONSTRAINT [FK_Utilizador_LocalidadeID]
GO
ALTER TABLE [dbo].[Ocorrencia_Tags] DROP CONSTRAINT [FK_Ocorrencia_Tags_TagsID]
GO
ALTER TABLE [dbo].[Ocorrencia_Tags] DROP CONSTRAINT [FK_Ocorrencia_Tags_OcorrenciaID]
GO
ALTER TABLE [dbo].[Ocorrencia] DROP CONSTRAINT [FK_Ocorrencia_UtilizadorID]
GO
ALTER TABLE [dbo].[Ocorrencia] DROP CONSTRAINT [FK_Ocorrencia_LocalidadeID]
GO
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_UtilizadorID]
GO
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [FK_Likes_OcorrenciaID]
GO
ALTER TABLE [dbo].[Intervencao] DROP CONSTRAINT [FK_Intervencao_UtilizadorID]
GO
ALTER TABLE [dbo].[Intervencao] DROP CONSTRAINT [FK_Intervencao_OcorrenciaID]
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia] DROP CONSTRAINT [FK_Imagem_Ocorrencia_OcorrenciaID]
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia] DROP CONSTRAINT [FK_Imagem_Ocorrencia_ImagemID]
GO
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [FK_Comentarios_UtilizadorID]
GO
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [FK_Comentarios_OcorrenciaID]
GO
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [FK_Comentarios_ImagemID]
GO
ALTER TABLE [dbo].[Classificacao] DROP CONSTRAINT [FK_Classificacao_UtilizadorID]
GO
ALTER TABLE [dbo].[Classificacao] DROP CONSTRAINT [FK_Classificacao_IntervencaoID]
GO
ALTER TABLE [dbo].[Amigos] DROP CONSTRAINT [FK_Amigos_UtilizadorID]
GO
ALTER TABLE [dbo].[Amigos] DROP CONSTRAINT [FK_Amigos_AmigosID]
GO
/****** Object:  Index [UQ__Utilizad__90F8E1C986F5CBFE]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Utilizador] DROP CONSTRAINT [UQ__Utilizad__90F8E1C986F5CBFE]
GO
/****** Object:  Index [UQ__Tags__657CFA4DE464D4D9]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [UQ__Tags__657CFA4DE464D4D9]
GO
/****** Object:  Index [UQ__Tags__008BA9EF1CD6EB06]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Tags] DROP CONSTRAINT [UQ__Tags__008BA9EF1CD6EB06]
GO
/****** Object:  Index [UQ__Ocorrenc__657CFA4DAE83A756]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Ocorrencia_Tags] DROP CONSTRAINT [UQ__Ocorrenc__657CFA4DAE83A756]
GO
/****** Object:  Index [UQ__Ocorrenc__30F55609256AF7CB]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Ocorrencia_Tags] DROP CONSTRAINT [UQ__Ocorrenc__30F55609256AF7CB]
GO
/****** Object:  Index [UQ__Ocorrenc__90F8E1C9A25F1D23]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Ocorrencia] DROP CONSTRAINT [UQ__Ocorrenc__90F8E1C9A25F1D23]
GO
/****** Object:  Index [UQ__Ocorrenc__30F55609E2AF9A1C]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Ocorrencia] DROP CONSTRAINT [UQ__Ocorrenc__30F55609E2AF9A1C]
GO
/****** Object:  Index [UQ__Localida__4C0E1EABBA23C600]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Localidades] DROP CONSTRAINT [UQ__Localida__4C0E1EABBA23C600]
GO
/****** Object:  Index [UQ__Likes__90F8E1C99039D01A]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [UQ__Likes__90F8E1C99039D01A]
GO
/****** Object:  Index [UQ__Likes__30F556091B6425A0]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Likes] DROP CONSTRAINT [UQ__Likes__30F556091B6425A0]
GO
/****** Object:  Index [UQ__Interven__90F8E1C968658AFD]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Intervencao] DROP CONSTRAINT [UQ__Interven__90F8E1C968658AFD]
GO
/****** Object:  Index [UQ__Interven__70D6B4C396AD6EAC]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Intervencao] DROP CONSTRAINT [UQ__Interven__70D6B4C396AD6EAC]
GO
/****** Object:  Index [UQ__Interven__30F55609733FC21A]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Intervencao] DROP CONSTRAINT [UQ__Interven__30F55609733FC21A]
GO
/****** Object:  Index [UQ__Imagens__0CBF2ACF969F316D]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Imagens] DROP CONSTRAINT [UQ__Imagens__0CBF2ACF969F316D]
GO
/****** Object:  Index [UQ__Imagem_O__30F55609A6506CF9]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Imagem_Ocorrencia] DROP CONSTRAINT [UQ__Imagem_O__30F55609A6506CF9]
GO
/****** Object:  Index [UQ__Imagem_O__0CBF2ACF6E75D552]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Imagem_Ocorrencia] DROP CONSTRAINT [UQ__Imagem_O__0CBF2ACF6E75D552]
GO
/****** Object:  Index [UQ__Comentar__F18449594F5BCFA4]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [UQ__Comentar__F18449594F5BCFA4]
GO
/****** Object:  Index [UQ__Comentar__90F8E1C95598407D]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [UQ__Comentar__90F8E1C95598407D]
GO
/****** Object:  Index [UQ__Comentar__30F55609A75BFB2D]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [UQ__Comentar__30F55609A75BFB2D]
GO
/****** Object:  Index [UQ__Comentar__0CBF2ACF3A817BD7]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Comentarios] DROP CONSTRAINT [UQ__Comentar__0CBF2ACF3A817BD7]
GO
/****** Object:  Index [UQ__Classifi__90F8E1C95F8AB996]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Classificacao] DROP CONSTRAINT [UQ__Classifi__90F8E1C95F8AB996]
GO
/****** Object:  Index [UQ__Classifi__70D6B4C3BE459150]    Script Date: 19-05-2013 23:53:55 ******/
ALTER TABLE [dbo].[Classificacao] DROP CONSTRAINT [UQ__Classifi__70D6B4C3BE459150]
GO
/****** Object:  Index [IX_Amigos_UtilizadorID]    Script Date: 19-05-2013 23:53:55 ******/
DROP INDEX [IX_Amigos_UtilizadorID] ON [dbo].[Amigos]
GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Utilizador]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Tags]
GO
/****** Object:  Table [dbo].[Ocorrencia_Tags]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Ocorrencia_Tags]
GO
/****** Object:  Table [dbo].[Ocorrencia]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Ocorrencia]
GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Localidades]
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Likes]
GO
/****** Object:  Table [dbo].[Intervencao]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Intervencao]
GO
/****** Object:  Table [dbo].[Imagens]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Imagens]
GO
/****** Object:  Table [dbo].[Imagem_Ocorrencia]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Imagem_Ocorrencia]
GO
/****** Object:  Table [dbo].[Configuracao]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Configuracao]
GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Comentarios]
GO
/****** Object:  Table [dbo].[Classificacao]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Classificacao]
GO
/****** Object:  Table [dbo].[Amigos]    Script Date: 19-05-2013 23:53:55 ******/
DROP TABLE [dbo].[Amigos]
GO
USE [master]
GO
/****** Object:  Database [myStreet]    Script Date: 19-05-2013 23:53:55 ******/
ALTER DATABASE [myStreet]
SET SINGLE_USER --or RESTRICTED_USER
WITH ROLLBACK IMMEDIATE;
GO
DROP DATABASE [myStreet];
GO
/****** Object:  Database [myStreet]    Script Date: 19-05-2013 23:53:55 ******/
CREATE DATABASE [myStreet]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'myStreet', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\myStreet.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'myStreet_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\myStreet_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [myStreet] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [myStreet].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [myStreet] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [myStreet] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [myStreet] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [myStreet] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [myStreet] SET ARITHABORT OFF 
GO
ALTER DATABASE [myStreet] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [myStreet] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [myStreet] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [myStreet] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [myStreet] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [myStreet] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [myStreet] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [myStreet] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [myStreet] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [myStreet] SET RECURSIVE_TRIGGERS OFF 
GO
--ALTER DATABASE [myStreet] SET  DISABLE_BROKER 
--GO
ALTER DATABASE [myStreet] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
--ALTER DATABASE [myStreet] SET DATE_CORRELATION_OPTIMIZATION OFF 
--GO
ALTER DATABASE [myStreet] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [myStreet] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [myStreet] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [myStreet] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [myStreet] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [myStreet] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [myStreet] SET  MULTI_USER 
GO
ALTER DATABASE [myStreet] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [myStreet] SET DB_CHAINING OFF 
GO
--ALTER DATABASE [myStreet] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
--GO
ALTER DATABASE [myStreet] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [myStreet]
GO
/****** Object:  Table [dbo].[Amigos]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amigos](
	[UtilizadorID] [int] NOT NULL,
	[AmigoID] [int] NOT NULL,
 CONSTRAINT [PK_Amigos] PRIMARY KEY CLUSTERED 
(
	[UtilizadorID] ASC,
	[AmigoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Classificacao]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Classificacao](
	[UtilizadorID] [int] NOT NULL,
	[IntervencaoID] [int] NOT NULL,
	[Valor] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Comentarios](
	[ComentarioID] [int] NOT NULL,
	[UtilizadorID] [int] NOT NULL,
	[OcorrenciaID] [int] NOT NULL,
	[Conteudo] [varchar](1000) NOT NULL,
	[ImagemID] [int] NULL,
 CONSTRAINT [PK_Comentarios] PRIMARY KEY CLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Configuracao]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Configuracao](
	[Seccao] [varchar](200) NOT NULL,
	[Chave] [varchar](200) NOT NULL,
	[Valor] [varchar](2000) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Imagem_Ocorrencia]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagem_Ocorrencia](
	[OcorrenciaID] [int] NOT NULL,
	[ImagemID] [int] NOT NULL,
 CONSTRAINT [PK_Imagem_Ocorrencia] PRIMARY KEY CLUSTERED 
(
	[OcorrenciaID] ASC,
	[ImagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Imagens]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Imagens](
	[ImagemID] [int] NOT NULL,
	[Imagem] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Imagens] PRIMARY KEY CLUSTERED 
(
	[ImagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Intervencao]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Intervencao](
	[IntervencaoID] [int] NOT NULL,
	[OcorrenciaID] [int] NOT NULL,
	[UtilizadorID] [int] NOT NULL,
	[Descricao] [varchar](500) NOT NULL,
 CONSTRAINT [PK_Intervencao] PRIMARY KEY CLUSTERED 
(
	[IntervencaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Likes]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[UtilizadorID] [int] NOT NULL,
	[OcorrenciaID] [int] NOT NULL,
 CONSTRAINT [PK_Likes] PRIMARY KEY CLUSTERED 
(
	[UtilizadorID] ASC,
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Localidades]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Localidades](
	[LocalidadeID] [int] NOT NULL,
	[Nome] [varchar](400) NOT NULL,
	[Coordenadas] [geography] NULL,
 CONSTRAINT [PK_Localidades] PRIMARY KEY CLUSTERED 
(
	[LocalidadeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ocorrencia]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ocorrencia](
	[OcorrenciaID] [int] NOT NULL,
	[UtilizadorID] [int] NOT NULL,
	[Descricao] [int] NOT NULL,
	[Estado] [varchar](255) NOT NULL,
	[Morada] [varchar](255) NULL,
	[Coordenadas] [geography] NULL,
	[LocalidadeID] [int] NOT NULL,
 CONSTRAINT [PK_Ocorrencia] PRIMARY KEY CLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ocorrencia_Tags]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ocorrencia_Tags](
	[OcorrenciaID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_Ocorrencia_Tags] PRIMARY KEY CLUSTERED 
(
	[OcorrenciaID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tags]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tags](
	[TagID] [int] NOT NULL,
	[Descricao] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Utilizador]    Script Date: 19-05-2013 23:53:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Utilizador](
	[UtilizadorID] [int] NOT NULL,
	[Nome] [varchar](255) NOT NULL,
	[Morada] [varchar](255) NOT NULL,
	[Tipo] [char](1) NOT NULL,
	[Login] [varchar](255) NOT NULL,
	[Password] [varchar](255) NOT NULL,
	[LocalidadeID] [int] NULL,
 CONSTRAINT [PK_Utilizador] PRIMARY KEY CLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Configuracao] ([Seccao], [Chave], [Valor]) VALUES (N'BD', N'VERSAO', N'20130519')
GO
/****** Object:  Index [IX_Amigos_UtilizadorID]    Script Date: 19-05-2013 23:54:00 ******/
CREATE NONCLUSTERED INDEX [IX_Amigos_UtilizadorID] ON [dbo].[Amigos]
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Classifi__70D6B4C3BE459150]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Classificacao] ADD UNIQUE NONCLUSTERED 
(
	[IntervencaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Classifi__90F8E1C95F8AB996]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Classificacao] ADD UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Comentar__0CBF2ACF3A817BD7]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Comentarios] ADD  CONSTRAINT [UQ__Comentar__0CBF2ACF3A817BD7] UNIQUE NONCLUSTERED 
(
	[ImagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Comentar__30F55609A75BFB2D]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Comentarios] ADD  CONSTRAINT [UQ__Comentar__30F55609A75BFB2D] UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Comentar__90F8E1C95598407D]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Comentarios] ADD  CONSTRAINT [UQ__Comentar__90F8E1C95598407D] UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Comentar__F18449594F5BCFA4]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Comentarios] ADD  CONSTRAINT [UQ__Comentar__F18449594F5BCFA4] UNIQUE NONCLUSTERED 
(
	[ComentarioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Imagem_O__0CBF2ACF6E75D552]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Imagem_Ocorrencia] ADD UNIQUE NONCLUSTERED 
(
	[ImagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Imagem_O__30F55609A6506CF9]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Imagem_Ocorrencia] ADD UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Imagens__0CBF2ACF969F316D]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Imagens] ADD  CONSTRAINT [UQ__Imagens__0CBF2ACF969F316D] UNIQUE NONCLUSTERED 
(
	[ImagemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Interven__30F55609733FC21A]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Intervencao] ADD  CONSTRAINT [UQ__Interven__30F55609733FC21A] UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Interven__70D6B4C396AD6EAC]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Intervencao] ADD  CONSTRAINT [UQ__Interven__70D6B4C396AD6EAC] UNIQUE NONCLUSTERED 
(
	[IntervencaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Interven__90F8E1C968658AFD]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Intervencao] ADD  CONSTRAINT [UQ__Interven__90F8E1C968658AFD] UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Likes__30F556091B6425A0]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Likes] ADD UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Likes__90F8E1C99039D01A]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Likes] ADD UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Localida__4C0E1EABBA23C600]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Localidades] ADD  CONSTRAINT [UQ__Localida__4C0E1EABBA23C600] UNIQUE NONCLUSTERED 
(
	[LocalidadeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Ocorrenc__30F55609E2AF9A1C]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Ocorrencia] ADD  CONSTRAINT [UQ__Ocorrenc__30F55609E2AF9A1C] UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Ocorrenc__90F8E1C9A25F1D23]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Ocorrencia] ADD  CONSTRAINT [UQ__Ocorrenc__90F8E1C9A25F1D23] UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Ocorrenc__30F55609256AF7CB]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Ocorrencia_Tags] ADD UNIQUE NONCLUSTERED 
(
	[OcorrenciaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Ocorrenc__657CFA4DAE83A756]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Ocorrencia_Tags] ADD UNIQUE NONCLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Tags__008BA9EF1CD6EB06]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Tags] ADD UNIQUE NONCLUSTERED 
(
	[Descricao] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Tags__657CFA4DE464D4D9]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Tags] ADD UNIQUE NONCLUSTERED 
(
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Utilizad__90F8E1C986F5CBFE]    Script Date: 19-05-2013 23:54:00 ******/
ALTER TABLE [dbo].[Utilizador] ADD UNIQUE NONCLUSTERED 
(
	[UtilizadorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Amigos]  WITH CHECK ADD  CONSTRAINT [FK_Amigos_AmigosID] FOREIGN KEY([AmigoID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
GO
ALTER TABLE [dbo].[Amigos] CHECK CONSTRAINT [FK_Amigos_AmigosID]
GO
ALTER TABLE [dbo].[Amigos]  WITH CHECK ADD  CONSTRAINT [FK_Amigos_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Amigos] CHECK CONSTRAINT [FK_Amigos_UtilizadorID]
GO
ALTER TABLE [dbo].[Classificacao]  WITH CHECK ADD  CONSTRAINT [FK_Classificacao_IntervencaoID] FOREIGN KEY([IntervencaoID])
REFERENCES [dbo].[Intervencao] ([IntervencaoID])
GO
ALTER TABLE [dbo].[Classificacao] CHECK CONSTRAINT [FK_Classificacao_IntervencaoID]
GO
ALTER TABLE [dbo].[Classificacao]  WITH CHECK ADD  CONSTRAINT [FK_Classificacao_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Classificacao] CHECK CONSTRAINT [FK_Classificacao_UtilizadorID]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_ImagemID] FOREIGN KEY([ComentarioID])
REFERENCES [dbo].[Comentarios] ([ComentarioID])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_ImagemID]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_OcorrenciaID] FOREIGN KEY([OcorrenciaID])
REFERENCES [dbo].[Ocorrencia] ([OcorrenciaID])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_OcorrenciaID]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_UtilizadorID]
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Ocorrencia_ImagemID] FOREIGN KEY([ImagemID])
REFERENCES [dbo].[Imagens] ([ImagemID])
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia] CHECK CONSTRAINT [FK_Imagem_Ocorrencia_ImagemID]
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_Imagem_Ocorrencia_OcorrenciaID] FOREIGN KEY([OcorrenciaID])
REFERENCES [dbo].[Ocorrencia] ([OcorrenciaID])
GO
ALTER TABLE [dbo].[Imagem_Ocorrencia] CHECK CONSTRAINT [FK_Imagem_Ocorrencia_OcorrenciaID]
GO
ALTER TABLE [dbo].[Intervencao]  WITH CHECK ADD  CONSTRAINT [FK_Intervencao_OcorrenciaID] FOREIGN KEY([OcorrenciaID])
REFERENCES [dbo].[Ocorrencia] ([OcorrenciaID])
GO
ALTER TABLE [dbo].[Intervencao] CHECK CONSTRAINT [FK_Intervencao_OcorrenciaID]
GO
ALTER TABLE [dbo].[Intervencao]  WITH CHECK ADD  CONSTRAINT [FK_Intervencao_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
GO
ALTER TABLE [dbo].[Intervencao] CHECK CONSTRAINT [FK_Intervencao_UtilizadorID]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_OcorrenciaID] FOREIGN KEY([OcorrenciaID])
REFERENCES [dbo].[Ocorrencia] ([OcorrenciaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_OcorrenciaID]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_Likes_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_Likes_UtilizadorID]
GO
ALTER TABLE [dbo].[Ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_Ocorrencia_LocalidadeID] FOREIGN KEY([LocalidadeID])
REFERENCES [dbo].[Localidades] ([LocalidadeID])
GO
ALTER TABLE [dbo].[Ocorrencia] CHECK CONSTRAINT [FK_Ocorrencia_LocalidadeID]
GO
ALTER TABLE [dbo].[Ocorrencia]  WITH CHECK ADD  CONSTRAINT [FK_Ocorrencia_UtilizadorID] FOREIGN KEY([UtilizadorID])
REFERENCES [dbo].[Utilizador] ([UtilizadorID])
GO
ALTER TABLE [dbo].[Ocorrencia] CHECK CONSTRAINT [FK_Ocorrencia_UtilizadorID]
GO
ALTER TABLE [dbo].[Ocorrencia_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Ocorrencia_Tags_OcorrenciaID] FOREIGN KEY([OcorrenciaID])
REFERENCES [dbo].[Ocorrencia] ([OcorrenciaID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ocorrencia_Tags] CHECK CONSTRAINT [FK_Ocorrencia_Tags_OcorrenciaID]
GO
ALTER TABLE [dbo].[Ocorrencia_Tags]  WITH CHECK ADD  CONSTRAINT [FK_Ocorrencia_Tags_TagsID] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tags] ([TagID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Ocorrencia_Tags] CHECK CONSTRAINT [FK_Ocorrencia_Tags_TagsID]
GO
ALTER TABLE [dbo].[Utilizador]  WITH CHECK ADD  CONSTRAINT [FK_Utilizador_LocalidadeID] FOREIGN KEY([LocalidadeID])
REFERENCES [dbo].[Localidades] ([LocalidadeID])
GO
ALTER TABLE [dbo].[Utilizador] CHECK CONSTRAINT [FK_Utilizador_LocalidadeID]
GO
USE [master]
GO
ALTER DATABASE [myStreet] SET  READ_WRITE 
GO
