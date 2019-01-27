USE [master]
GO
/****** Object:  Database [MemoryGame]    Script Date: 28/01/2019 00:10:19 ******/
CREATE DATABASE [MemoryGame]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MemoryGame', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MemoryGame.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MemoryGame_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\MemoryGame_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MemoryGame] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MemoryGame].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MemoryGame] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MemoryGame] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MemoryGame] SET ARITHABORT OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MemoryGame] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MemoryGame] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MemoryGame] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MemoryGame] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MemoryGame] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MemoryGame] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MemoryGame] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MemoryGame] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MemoryGame] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MemoryGame] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MemoryGame] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MemoryGame] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MemoryGame] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MemoryGame] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MemoryGame] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MemoryGame] SET RECOVERY FULL 
GO
ALTER DATABASE [MemoryGame] SET  MULTI_USER 
GO
ALTER DATABASE [MemoryGame] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MemoryGame] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MemoryGame] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MemoryGame] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MemoryGame] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'MemoryGame', N'ON'
GO
ALTER DATABASE [MemoryGame] SET QUERY_STORE = OFF
GO
USE [MemoryGame]
GO
/****** Object:  Table [dbo].[Contact_us]    Script Date: 28/01/2019 00:10:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact_us](
	[ticket_id] [int] IDENTITY(1,1) NOT NULL,
	[create_date] [datetime] NOT NULL,
	[phone_num] [varchar](50) NULL,
	[e_mail] [varchar](50) NULL,
	[ticket_text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_contact_us] PRIMARY KEY CLUSTERED 
(
	[ticket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedbacks]    Script Date: 28/01/2019 00:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedbacks](
	[feedback_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[create_time] [datetime] NOT NULL,
	[feedback_text] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feedbacks] PRIMARY KEY CLUSTERED 
(
	[feedback_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GameResults]    Script Date: 28/01/2019 00:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GameResults](
	[game_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[game_time] [datetime] NOT NULL,
	[game_duration] [int] NOT NULL,
	[moves_num] [int] NOT NULL,
 CONSTRAINT [PK_GamedResults] PRIMARY KEY CLUSTERED 
(
	[game_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 28/01/2019 00:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[img_id] [int] IDENTITY(1,1) NOT NULL,
	[file_path] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Images] PRIMARY KEY CLUSTERED 
(
	[img_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28/01/2019 00:10:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[full_name] [varchar](50) NOT NULL,
	[user_name] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[birth_date] [varchar](50) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Contact_us] ON 

INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (2, CAST(N'2018-12-23T00:48:31.037' AS DateTime), N'054-6555-65544', N'mngf@gmail.co', N'try1')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (7, CAST(N'2018-12-23T01:45:24.253' AS DateTime), N'056788-5333', N'mois@gffg.com', N'jason text')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (8, CAST(N'2018-12-23T01:46:35.283' AS DateTime), N'056788-5333', N'mois@gffg.com', N'jon text')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (9, CAST(N'2018-12-23T01:47:57.010' AS DateTime), N'056788-5333', N'mois@gffg.com', N'fgfgfgfg')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (10, CAST(N'2018-12-23T02:12:40.113' AS DateTime), N'056788-5333', N'mois@gffg.555', N'fgfgghjkkfgfg')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (11, CAST(N'2019-01-11T13:14:57.817' AS DateTime), N'1', N'l@l.com', N'asd')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (12, CAST(N'2019-01-11T14:59:50.847' AS DateTime), N'3434', N'a@a.com', N'hh')
INSERT [dbo].[Contact_us] ([ticket_id], [create_date], [phone_num], [e_mail], [ticket_text]) VALUES (13, CAST(N'2019-01-27T23:53:10.253' AS DateTime), N'52556785', N'ddd@fsad.com', N'hi fff hhjf')
SET IDENTITY_INSERT [dbo].[Contact_us] OFF
SET IDENTITY_INSERT [dbo].[Feedbacks] ON 

INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (4, 1, CAST(N'2018-12-23T01:04:57.180' AS DateTime), N'test')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (5, 1, CAST(N'2018-12-23T02:14:30.623' AS DateTime), N'fgfgghjkkfgfg')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (6, 4, CAST(N'2019-01-26T20:33:08.233' AS DateTime), N'fgfgfg')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (7, 3, CAST(N'2019-01-26T20:45:00.787' AS DateTime), N'gggddskkkfggjhj')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (8, 14, CAST(N'2019-01-27T22:21:34.090' AS DateTime), N'gggg')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (9, 14, CAST(N'2019-01-27T22:22:53.043' AS DateTime), N'dfgnhjmk,nhjgf')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (10, 14, CAST(N'2019-01-27T23:09:11.860' AS DateTime), N'asasdad')
INSERT [dbo].[Feedbacks] ([feedback_id], [user_id], [create_time], [feedback_text]) VALUES (11, 19, CAST(N'2019-01-27T23:53:29.633' AS DateTime), N'asdvbnm,.mnjgvcfcgvbnm,.mnbgvcfbvnm, bnvcf')
SET IDENTITY_INSERT [dbo].[Feedbacks] OFF
SET IDENTITY_INSERT [dbo].[GameResults] ON 

INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (1, 1, CAST(N'2018-12-23T00:41:20.670' AS DateTime), 5, 7)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (2, 2, CAST(N'2018-12-23T02:17:11.120' AS DateTime), 3, 13)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (5, 14, CAST(N'2019-01-19T18:42:01.377' AS DateTime), 0, 0)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (6, 14, CAST(N'2019-01-19T18:44:01.447' AS DateTime), 0, 31)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (7, 14, CAST(N'2019-01-19T18:52:20.727' AS DateTime), 1, 35)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (8, 14, CAST(N'2019-01-19T18:58:29.917' AS DateTime), 1, 37)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (9, 14, CAST(N'2019-01-19T17:03:08.593' AS DateTime), 0, 0)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (10, 14, CAST(N'2019-01-19T17:06:30.470' AS DateTime), 4, 0)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (11, 14, CAST(N'2019-01-19T17:11:11.220' AS DateTime), 0, 5)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (12, 14, CAST(N'2019-01-27T20:25:32.953' AS DateTime), 1, 29)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (13, 14, CAST(N'2019-01-27T20:27:41.777' AS DateTime), 1, 31)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (14, 14, CAST(N'2019-01-27T20:29:40.640' AS DateTime), 1, 38)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (15, 19, CAST(N'2019-01-27T21:47:40.523' AS DateTime), 0, 26)
INSERT [dbo].[GameResults] ([game_id], [user_id], [game_time], [game_duration], [moves_num]) VALUES (16, 19, CAST(N'2019-01-27T21:50:54.537' AS DateTime), 68, 28)
SET IDENTITY_INSERT [dbo].[GameResults] OFF
SET IDENTITY_INSERT [dbo].[Images] ON 

INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (1, N'/assets/images/1.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (2, N'/assets/images/2.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (3, N'/assets/images/3.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (4, N'/assets/images/4.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (5, N'/assets/images/5.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (6, N'/assets/images/6.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (7, N'/assets/images/7.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (8, N'/assets/images/8.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (9, N'/assets/images/9.jpg')
INSERT [dbo].[Images] ([img_id], [file_path]) VALUES (10, N'/assets/images/10.jpg')
SET IDENTITY_INSERT [dbo].[Images] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (1, N'Moshe', N'Moshe', N'1234', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (2, N'Moshe', N'MosheMat', N'1234', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (3, N'gh', N'fg', N'4545', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (4, N'try', N'056788', N'1224', N'fgfgfgfg@fff.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (5, N'try', N'0567882', N'1224', N'fgfgfgfg@fff.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (6, N'shlomi', N'shlomi1', N'154678', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (7, N'shlomi', N'shlomi2', N'154678', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (8, N'shlomi', N'shlomi3', N'154678', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (9, N'shlomi', N'shlomi4', N'154678', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (10, N'shlomi', N'shlomo', N'154678', N'nnn@gmail.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (11, N'df', N'ddf', N'555', N'asd@ads.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (12, N'fff', N'fff', N'rrr', N'a@a.com', N'2019-01-01')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (13, N'moishy matyas', N'moshe', N'5543', N'moishymat@gmail.com', N'2019-01-11')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (14, N'shira', N'shir', N'1234', N'mmmm@gmail.com', N'2019-01-09')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (15, N'dffff', N'liron', N'2345675432', N'moishymat@gmail.com', N'2019-01-17')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (16, N'moishy matyas', N'ggjkgf', N'234543', N'moishymat@gmail.com', N'2019-01-19')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (17, N'asdfghjkhgfd', N'dfghfdsadfghgfds', N'sdfghbgdfsdfghgf', N'sdfghfdsdfgh@ff.com', N'2019-01-03')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (18, N'liron', N'lirony', N'2345678', N'moishymat@gmail.com', N'2019-01-16')
INSERT [dbo].[Users] ([user_id], [full_name], [user_name], [password], [email], [birth_date]) VALUES (19, N'dvir', N'dvir22', N'1234', N'MMM@fff.com', N'2019-01-22')
SET IDENTITY_INSERT [dbo].[Users] OFF
ALTER TABLE [dbo].[Contact_us] ADD  CONSTRAINT [DF_Contact_us_create_date]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[Feedbacks]  WITH CHECK ADD  CONSTRAINT [FK_Feedbacks_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[Feedbacks] CHECK CONSTRAINT [FK_Feedbacks_Users]
GO
ALTER TABLE [dbo].[GameResults]  WITH NOCHECK ADD  CONSTRAINT [FK_GamedResults_GamedResults] FOREIGN KEY([game_id])
REFERENCES [dbo].[GameResults] ([game_id])
GO
ALTER TABLE [dbo].[GameResults] CHECK CONSTRAINT [FK_GamedResults_GamedResults]
GO
ALTER TABLE [dbo].[GameResults]  WITH CHECK ADD  CONSTRAINT [FK_GamedResults_GamedResults1] FOREIGN KEY([game_id])
REFERENCES [dbo].[GameResults] ([game_id])
GO
ALTER TABLE [dbo].[GameResults] CHECK CONSTRAINT [FK_GamedResults_GamedResults1]
GO
ALTER TABLE [dbo].[GameResults]  WITH CHECK ADD  CONSTRAINT [FK_GameResults_Users] FOREIGN KEY([user_id])
REFERENCES [dbo].[Users] ([user_id])
GO
ALTER TABLE [dbo].[GameResults] CHECK CONSTRAINT [FK_GameResults_Users]
GO
USE [master]
GO
ALTER DATABASE [MemoryGame] SET  READ_WRITE 
GO
