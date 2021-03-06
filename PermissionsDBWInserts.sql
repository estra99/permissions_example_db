USE [master]
GO
/****** Object:  Database [Permissions]    Script Date: 21/09/2020 13:28:10 ******/
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
/****** Object:  Table [dbo].[PermissionCategory]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[Permissions]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[PermissionXRol]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[PermissionXUser]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[Roles]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  Table [dbo].[UserXRole]    Script Date: 21/09/2020 13:28:11 ******/
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
/****** Object:  StoredProcedure [dbo].[sp_GetUserPermission]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Esteban Salas, Estiven Fernández,Gabriel Vargas>
-- Create date: <18-09-2020>
-- Description:	<Obtiene los permisos de un usuario>
-- =============================================

CREATE PROCEDURE [dbo].[sp_GetUserPermission]
	@email nchar(100),
	@password binary(256)
AS
BEGIN
	SET NOCOUNT ON;

		(SELECT U.[Email] , P.[PermissionCode]
		 FROM [dbo].[Permissions] as P 
		 INNER JOIN [dbo].PermissionXUser as PU 
		 ON P.[PermissionId] = PU.[PermissionId] 
		 RIGHT JOIN [dbo].[Users] as U 
		 ON PU.[UserId] = U.[UserId]
		 WHERE U.[Email] = @email and U.[Password] = @password) 
		
		UNION

		(SELECT U.[Email] , P.[PermissionCode]
		 FROM [dbo].[Permissions] as P 
		 INNER JOIN [dbo].[PermissionXRol] as PR 
		 ON P.[PermissionId] = PR.[PermissionId] 
		 INNER JOIN [dbo].[UserXRole] as UR 
		 ON UR.[RoleId] = PR.[RoleId] 
		 RIGHT JOIN [dbo].[Users] as U 
		 ON UR.[UserId] = U.[UserId]
		 WHERE U.[Email] = @email and U.[Password] = @password)
END



GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPermission]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertPermission]
	@description nchar(100),
	@permissionCode int,
	@permissionType int
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[Permissions] ([Description], [PermissionCode], [PermissionType])
	VALUES (@description, @permissionCode, @permissionType)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPermissionCategory]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertPermissionCategory]
	@description nchar(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[PermissionCategory] ([Description])
	VALUES (@description)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPermissionXRol]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertPermissionXRol]
	@PermissionCode int,
	@roleName nchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @permissionId int
	DECLARE @roleId int

	SELECT @permissionId = [PermissionId] FROM [dbo].[Permissions] 
	WHERE [PermissionCode] = @PermissionCode

	SELECT @roleId = [RoleId] FROM [dbo].[Roles] 
	WHERE [Name] = @roleName

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO [dbo].[PermissionXRol] ([PermissionId], [RoleId], [PostTime], [Checksum], [Deleted])
		VALUES (@permissionId, @roleId, GETDATE(), 0, 0)

		UPDATE [dbo].[PermissionXRol]
		SET [Checksum] = BINARY_CHECKSUM ([PXRID], [PermissionId], [RoleId], [PostTime], [Deleted])
		WHERE [PXRID] = IDENT_CURRENT('PermissionXRol')

	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW;
	END CATCH
END




GO
/****** Object:  StoredProcedure [dbo].[sp_InsertPermissionXUser]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertPermissionXUser]
	@PermissionCode int,
	@userName nchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @permissionId int
	DECLARE @userId int

	SELECT @permissionId = [PermissionId] FROM [dbo].[Permissions] 
	WHERE [PermissionCode] = @PermissionCode

	SELECT @userId = [UserId] FROM [dbo].[Users] 
	WHERE [Name] = @userName

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO [dbo].[PermissionXUser] ([PermissionId], [UserId], [PostTime], [Checksum], [Deleted])
		VALUES (@permissionId, @userId, GETDATE(), 0, 0)

		UPDATE [dbo].[PermissionXUser]
		SET [Checksum] = BINARY_CHECKSUM ([PXUID], [PermissionId], [UserId], [PostTime], [Deleted])
		WHERE [PXUID] = IDENT_CURRENT('PermissionXUser')

	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertRol]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertRol]
	@nameRol nchar(100)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[Roles]([Name])
	VALUES (@nameRol)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUser]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Esteban Salas, Estiven Fernádez, Gabriel Vargas>
-- Create date: <20-09-2020>
-- Description:	<Insertar para Usuario>
-- =============================================
CREATE PROC [dbo].[sp_InsertUser]
	@name nchar(100),
	@email nchar(100),
	@password nchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @sha256Password binary(256)

	SELECT @sha256Password = HASHBYTES('SHA2_256', @password);
	INSERT INTO [dbo].[Users] ([Name], [Email], [Password])
	VALUES (@name, @email, @sha256Password)

END
GO
/****** Object:  StoredProcedure [dbo].[sp_InsertUserXRol]    Script Date: 21/09/2020 13:28:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[sp_InsertUserXRol]
	@roleName nchar(100),
	@userName nchar(100)
AS
BEGIN
	SET NOCOUNT ON;
	
	DECLARE @roleId int
	DECLARE @userId int

	SELECT @roleId = [RoleId] FROM [dbo].[Roles] 
	WHERE [Name] = @roleName

	SELECT @userId = [UserId] FROM [dbo].[Users] 
	WHERE [Name] = @userName

	BEGIN TRY
	BEGIN TRAN
		INSERT INTO [dbo].[UserXRole] ([RoleId], [UserId], [PostTime], [Checksum], [Deleted])
		VALUES (@roleId, @userId, GETDATE(), 0, 0)

		UPDATE [dbo].[UserXRole]
		SET [Checksum] = BINARY_CHECKSUM ([UXRID], [RoleId], [UserId], [PostTime], [Deleted])
		WHERE [UXRID] = IDENT_CURRENT('UserXRole')

	COMMIT
	END TRY
	BEGIN CATCH
		ROLLBACK TRAN;
		THROW;
	END CATCH
END
GO
USE [master]
GO
ALTER DATABASE [Permissions] SET  READ_WRITE 
GO
