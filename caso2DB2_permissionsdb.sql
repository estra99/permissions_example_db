USE [master]
GO
/****** Object:  Database [Permissions]    Script Date: 18/09/2020 11:16:14 ******/
CREATE DATABASE [Permissions]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Permissions', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Permissions.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Permissions_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Permissions_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Permissions] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Permissions].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Permissions] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Permissions] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Permissions] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Permissions] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Permissions] SET ARITHABORT OFF 
GO
ALTER DATABASE [Permissions] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Permissions] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Permissions] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Permissions] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Permissions] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Permissions] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Permissions] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Permissions] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Permissions] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Permissions] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Permissions] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Permissions] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Permissions] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Permissions] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Permissions] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Permissions] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Permissions] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Permissions] SET RECOVERY FULL 
GO
ALTER DATABASE [Permissions] SET  MULTI_USER 
GO
ALTER DATABASE [Permissions] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Permissions] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Permissions] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Permissions] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Permissions] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Permissions', N'ON'
GO
ALTER DATABASE [Permissions] SET QUERY_STORE = OFF
GO
USE [Permissions]
GO
/****** Object:  Table [dbo].[PermissionCategory]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionCategory](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](100) NOT NULL,
 CONSTRAINT [PK_PermissionCategory] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Permissions]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](100) NOT NULL,
	[PermissionCode] [int] NOT NULL,
	[PermissionType] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionXRol]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionXRol](
	[PXRID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Checksum] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PermissionXRol] PRIMARY KEY CLUSTERED 
(
	[PXRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PermissionXUser]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionXUser](
	[PXUID] [int] IDENTITY(1,1) NOT NULL,
	[PermissionId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Checksum] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_PermissionXUser] PRIMARY KEY CLUSTERED 
(
	[PXUID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](100) NOT NULL,
	[Email] [nchar](100) NOT NULL,
	[Password] [binary](256) NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserXRole]    Script Date: 18/09/2020 11:16:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserXRole](
	[UXRID] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
	[PostTime] [datetime] NOT NULL,
	[Checksum] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_UserXRole] PRIMARY KEY CLUSTERED 
(
	[UXRID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_PermissionCategory] FOREIGN KEY([PermissionType])
REFERENCES [dbo].[PermissionCategory] ([CategoryId])
GO
ALTER TABLE [dbo].[Permissions] CHECK CONSTRAINT [FK_Permissions_PermissionCategory]
GO
ALTER TABLE [dbo].[PermissionXRol]  WITH CHECK ADD  CONSTRAINT [FK_PermissionXRol_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([PermissionId])
GO
ALTER TABLE [dbo].[PermissionXRol] CHECK CONSTRAINT [FK_PermissionXRol_Permissions]
GO
ALTER TABLE [dbo].[PermissionXRol]  WITH CHECK ADD  CONSTRAINT [FK_PermissionXRol_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[PermissionXRol] CHECK CONSTRAINT [FK_PermissionXRol_Roles]
GO
ALTER TABLE [dbo].[PermissionXUser]  WITH CHECK ADD  CONSTRAINT [FK_PermissionXUser_Permissions] FOREIGN KEY([PermissionId])
REFERENCES [dbo].[Permissions] ([PermissionId])
GO
ALTER TABLE [dbo].[PermissionXUser] CHECK CONSTRAINT [FK_PermissionXUser_Permissions]
GO
ALTER TABLE [dbo].[PermissionXUser]  WITH CHECK ADD  CONSTRAINT [FK_PermissionXUser_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[PermissionXUser] CHECK CONSTRAINT [FK_PermissionXUser_Users]
GO
ALTER TABLE [dbo].[UserXRole]  WITH CHECK ADD  CONSTRAINT [FK_UserXRole_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([RoleId])
GO
ALTER TABLE [dbo].[UserXRole] CHECK CONSTRAINT [FK_UserXRole_Roles]
GO
ALTER TABLE [dbo].[UserXRole]  WITH CHECK ADD  CONSTRAINT [FK_UserXRole_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([UserId])
GO
ALTER TABLE [dbo].[UserXRole] CHECK CONSTRAINT [FK_UserXRole_Users]
GO
USE [master]
GO
ALTER DATABASE [Permissions] SET  READ_WRITE 
GO


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Procedimiento-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE PROCEDURE sp_GetUserPermission @email nchar(100),@password binary(256)
	AS
		(SELECT u.email ,p.PermissionCode
		FROM Permissions.dbo.Permissions as p INNER JOIN 
			 Permissions.dbo.PermissionXUser pu ON p.PermissionId = pu.PermissionId RIGHT JOIN
			 Permissions.dbo.Users u ON pu.UserId = u.UserId
		where u.Email = @email and u.Password = @password) 
		UNION
		(SELECT u.email ,p.PermissionCode
		FROM Permissions.dbo.Permissions as p INNER JOIN 
			 Permissions.dbo.PermissionXRol pr ON p.PermissionId = pr.PermissionId INNER JOIN
			 Permissions.dbo.UserXRole ur ON ur.RoleId = pr.RoleId RIGHT JOIN
			 Permissions.dbo.Users u ON ur.UserId = u.UserId
		where u.Email = @email and u.Password = @password)
	

go

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Inserciones-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--PD: HICE LAS INSERCIONES POR CODIGO SOLO EN LAS TABLAS QUE NECESITABAN EL CHECKSUM O PASSWORD, LAS OTRAS FUERON MANUALES, PERDON POR LA VAGANCIA XD --------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT INTO Permissions.dbo.Users (Email,Name,Password) VALUES ('Manu@gmail.com','Manuel',CAST( 123456 AS BINARY(256)))				
INSERT INTO Permissions.dbo.Users (Email,Name,Password) VALUES ('Ale@gmail.com','Alejandra',CAST( 123456 AS BINARY(256)))
INSERT INTO Permissions.dbo.PermissionXUser (UserId,PermissionId,PostTime,Deleted,Checksum) VALUES (1,1,GETDATE(),0,CAST(123456 AS BINARY(256)))
INSERT INTO Permissions.dbo.PermissionXRol(RoleId,PermissionId,PostTime,Deleted,Checksum) values (1,2,getdate(),0,CAST(86748 AS BINARY(256)))
INSERT INTO Permissions.dbo.UserXRole(RoleId,UserId,PostTime,Deleted,Checksum) values (1,1,getdate(),0,CAST(86748 AS BINARY(256)))

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--Pruebas-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

declare @bin binary(256)
set @bin = CAST( 123456 AS BINARY(256))
exec sp_GetUserPermission 'Manu@gmail.com',@bin   --Usuario con permisos
exec sp_GetUserPermission 'Ale@gmail.com',@bin		--Usuario sin permisos

