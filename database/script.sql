USE [master]
GO
/****** Object:  Database [PolyOEAsg]    Script Date: 7/26/2021 10:49:43 AM ******/
CREATE DATABASE [PolyOEAsg]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PolyOEAsg', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PolyOEAsg.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'PolyOEAsg_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\PolyOEAsg_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [PolyOEAsg] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PolyOEAsg].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PolyOEAsg] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PolyOEAsg] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PolyOEAsg] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PolyOEAsg] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PolyOEAsg] SET ARITHABORT OFF 
GO
ALTER DATABASE [PolyOEAsg] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PolyOEAsg] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PolyOEAsg] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PolyOEAsg] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PolyOEAsg] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PolyOEAsg] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PolyOEAsg] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PolyOEAsg] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PolyOEAsg] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PolyOEAsg] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PolyOEAsg] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PolyOEAsg] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PolyOEAsg] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PolyOEAsg] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PolyOEAsg] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PolyOEAsg] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PolyOEAsg] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PolyOEAsg] SET RECOVERY FULL 
GO
ALTER DATABASE [PolyOEAsg] SET  MULTI_USER 
GO
ALTER DATABASE [PolyOEAsg] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PolyOEAsg] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PolyOEAsg] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PolyOEAsg] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [PolyOEAsg] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PolyOEAsg', N'ON'
GO
USE [PolyOEAsg]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 7/26/2021 10:49:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Favorites](
	[FavoriteId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[LikeDate] [date] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[FavoriteId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shares]    Script Date: 7/26/2021 10:49:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shares](
	[ShareId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NULL,
	[VideoId] [varchar](50) NULL,
	[Emails] [nvarchar](250) NULL,
	[ShareDate] [date] NULL,
 CONSTRAINT [PK_Shares] PRIMARY KEY CLUSTERED 
(
	[ShareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/26/2021 10:49:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Username] [varchar](30) NOT NULL,
	[Fullname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Admin] [bit] NOT NULL,
	[Password] [varchar](20) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Videos]    Script Date: 7/26/2021 10:49:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Videos](
	[VideoId] [varchar](50) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Poster] [nvarchar](150) NOT NULL,
	[Views] [int] NOT NULL,
	[Description] [nvarchar](1500) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Videos] PRIMARY KEY CLUSTERED 
(
	[VideoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([FavoriteId], [Username], [VideoId], [LikeDate]) VALUES (81, N'phucmt', N'V02', CAST(N'2021-03-09' AS Date))
SET IDENTITY_INSERT [dbo].[Favorites] OFF
SET IDENTITY_INSERT [dbo].[Shares] ON 

INSERT [dbo].[Shares] ([ShareId], [Username], [VideoId], [Emails], [ShareDate]) VALUES (5, N'boy', N'V02', N'thongho431@gmail.com', CAST(N'2021-03-09' AS Date))
SET IDENTITY_INSERT [dbo].[Shares] OFF
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'boy', N'boy boy', N'thongho431@gmail.com', 0, N'1234')
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'minh', N'minhok', N'thongho431@gmail.com', 0, N'123')
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'phucmt', N'tran minh phuc ', N'thongho431@gmail.com', 0, N'1234')
INSERT [dbo].[Users] ([Username], [Fullname], [Email], [Admin], [Password]) VALUES (N'thonghh', N'ho huynh thong 1234', N'thongho431@gmail.com', 1, N'123')
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'V02', N'Raya and the last dragon', N'uploads/V02.jpg', 2, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v3', N'The flash', N'uploads/v3.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v4', N'Black fighting', N'uploads/v4.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v5', N'wandavision', N'uploads/v5.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v6', N'wonderwoman', N'uploads/v6.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v7', N'Snow peicking', N'uploads/v7.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v8', N'Tom and jerry', N'uploads/v8.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
INSERT [dbo].[Videos] ([VideoId], [Title], [Poster], [Views], [Description], [Active]) VALUES (N'v9', N'Monster hunter', N'uploads/v9.jpg', 0, N'Long ago, in the fantasy world of Kumandra, humans and dragons lived together in harmony. But when an evil force threatened the land, the dragons sacrificed themselves to save humanity. Now, 500 years later, that same evil has returned and its up to a lone warrior, Raya, to track down the legendary last dragon to restore the fractured land and its divided people.', 1)
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Users]
GO
ALTER TABLE [dbo].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Favorites] CHECK CONSTRAINT [FK_Favorites_Videos]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Users] FOREIGN KEY([Username])
REFERENCES [dbo].[Users] ([Username])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Users]
GO
ALTER TABLE [dbo].[Shares]  WITH CHECK ADD  CONSTRAINT [FK_Shares_Videos] FOREIGN KEY([VideoId])
REFERENCES [dbo].[Videos] ([VideoId])
GO
ALTER TABLE [dbo].[Shares] CHECK CONSTRAINT [FK_Shares_Videos]
GO
USE [master]
GO
ALTER DATABASE [PolyOEAsg] SET  READ_WRITE 
GO
