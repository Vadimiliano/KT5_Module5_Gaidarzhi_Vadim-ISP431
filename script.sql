USE [master]
GO
/****** Object:  Database [SportAppBD]    Script Date: 21.11.2024 11:17:15 ******/
CREATE DATABASE [SportAppBD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SportAppBD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportAppBD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SportAppBD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SportAppBD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SportAppBD] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SportAppBD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SportAppBD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SportAppBD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SportAppBD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SportAppBD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SportAppBD] SET ARITHABORT OFF 
GO
ALTER DATABASE [SportAppBD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SportAppBD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SportAppBD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SportAppBD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SportAppBD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SportAppBD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SportAppBD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SportAppBD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SportAppBD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SportAppBD] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SportAppBD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SportAppBD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SportAppBD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SportAppBD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SportAppBD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SportAppBD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SportAppBD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SportAppBD] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SportAppBD] SET  MULTI_USER 
GO
ALTER DATABASE [SportAppBD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SportAppBD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SportAppBD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SportAppBD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SportAppBD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SportAppBD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [SportAppBD] SET QUERY_STORE = OFF
GO
USE [SportAppBD]
GO
/****** Object:  Table [dbo].[UserGender]    Script Date: 21.11.2024 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGender](
	[id] [int] NOT NULL,
	[Gender] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserGender] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 21.11.2024 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[id] [int] NOT NULL,
	[Role] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 21.11.2024 11:17:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] NOT NULL,
	[IdRole] [int] NOT NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[SeriaPasporta] [nvarchar](50) NOT NULL,
	[NomerPasporta] [nvarchar](50) NOT NULL,
	[DateOfBirth] [date] NOT NULL,
	[LastEntry] [datetime] NULL,
	[TypeEntry] [bit] NULL,
	[idGender] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[UserGender] ([id], [Gender]) VALUES (1, N'женский')
INSERT [dbo].[UserGender] ([id], [Gender]) VALUES (2, N'мужской')
GO
INSERT [dbo].[UserRole] ([id], [Role]) VALUES (1, N'Администратор')
INSERT [dbo].[UserRole] ([id], [Role]) VALUES (2, N'Исполнитель')
INSERT [dbo].[UserRole] ([id], [Role]) VALUES (3, N'Менеджер')
GO
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (1, 3, N'Акимов Ян Алексеевич', N'gohufreilagrau-3818@yopmail.com', N'akimovya', N'bn069Caj', N'+7(781) 785-5837', N'2367', N'558134', CAST(N'1993-07-03' AS Date), CAST(N'2023-02-01T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (2, 2, N'Гончарова Ульяна Львовна', N'xawugosune-1385@yopmail.com', N'goncharovaul', N'pW4qZhL!', N'+7(230) 906-8815', N'7101', N'669343', CAST(N'1975-06-22' AS Date), CAST(N'2023-02-13T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (3, 1, N'Анохина Елизавета Матвеевна', N'leuttevitrafo1998@mail.ru', N'anochinaem', N'y6UNmaJg', N'+7(555) 444-8316', N'3455', N'719630', CAST(N'1991-08-16' AS Date), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (4, 3, N'Николаев Илья Владиславович', N'frapreubrulloba1141@yandex.ru', N'nickolaeviv', N'ebOt@4y$', N'+7(392) 682-4442', N'2377', N'871623', CAST(N'1970-12-22' AS Date), CAST(N'2023-02-03T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (5, 2, N'Уткин Дмитрий Платонович', N'zapramaxesu-7741@yopmail.com', N'utkindp', N'zQt8g@GH', N'+7(836) 429-0386', N'8755', N'921148', CAST(N'1999-05-04' AS Date), CAST(N'2023-02-15T00:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (6, 2, N'Куликова Стефания Никитична', N'rouzecroummegre-3899@yopmail.com', N'kulikovasn', N'TCmE7Jon', N'+7(283) 945-3092', N'4355', N'104594', CAST(N'1994-12-06' AS Date), CAST(N'2023-02-11T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (7, 2, N'Волков Егор Матвеевич', N'ziyeuddocrabri-4748@@yopmail.com', N'volkovem', N'pbgO3Vv5', N'+7(621) 359-3669', N'2791', N'114390', CAST(N'1995-03-28' AS Date), CAST(N'2023-02-15T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (8, 1, N'Соколова Софья Георгиевна', N'ketameissoinnei-1951@yopmail.com', N'sokolovasg', N'lITaH?Bs', N'+7(440) 561-0314', N'5582', N'126286', CAST(N'1977-03-27' AS Date), CAST(N'2023-02-15T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (9, 3, N'Голубева Полина Андреевна', N'yipraubaponou-5849@yopmail.com', N'golubevapa', N's|ke*p@~', N'+7(331) 918-2434', N'2978', N'133653', CAST(N'1975-04-12' AS Date), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (10, 3, N'Вишневская Мария Андреевна', N'crapedocouca-3572@yopmail.com', N'vishnevskayama', N'OCaywHJZ', N'+7(493) 219-3942', N'7512', N'141956', CAST(N'1975-12-23' AS Date), NULL, 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (11, 3, N'Васильева Арина Данииловна', N'ceigoixakaunni-9227@yopmail.com', N'vasilevad', N'DAWuV%#u', N'+7(407) 485-5030', N'5046', N'158433', CAST(N'2000-01-22' AS Date), NULL, 0, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (12, 3, N'Павлов Дмитрий Максимович', N'yeimmeiwauzomo-7054@yopmail.com', N'pavlovdm', N'ptoED%zE', N'+7(919) 478-2497', N'2460', N'169505', CAST(N'1983-10-03' AS Date), CAST(N'2023-02-04T00:00:00.000' AS DateTime), 0, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (13, 2, N'Горбунова Мирослава Артуровна', N'pixil59@gmail.com', N'gorbunovama', N'ZFR2~Zl*', N'+7(482) 802-9580', N'3412', N'174593', CAST(N'1998-03-03' AS Date), CAST(N'2023-02-16T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (14, 3, N'Демина София Романовна', N'deummecillummu-4992@mail.ru', N'deminasr', N'D%DVKyDN', N'+7(455) 944-6449', N'4950', N'183034', CAST(N'1993-06-08' AS Date), CAST(N'2023-02-10T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (15, 2, N'Петрова Алина Робертовна', N'vilagajaunne-5170@yandex.ru', N'petrovaar', N'z7ZE?8N5', N'+7(710) 388-2563', N'5829', N'219464', CAST(N'1980-09-23' AS Date), CAST(N'2023-02-01T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (16, 2, N'Плотников Григорий Александрович', N'frusubroppotou656@yandex.ru', N'plotnikovga', N'yh+S4@yc', N'+7(759) 452-3846', N'6443', N'208059', CAST(N'1991-03-13' AS Date), CAST(N'2023-02-08T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (17, 2, N'Прохорова Есения Тимофеевна', N'vhopkins@lewis-mullen.com', N'prochorovaet', N'wLF186dB', N'+7(687) 801-1332', N'7079', N'213265', CAST(N'1998-04-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (18, 2, N'Чернов Алексей Егорович', N'nlewis@yahoo.com', N'chernovae', N'Sjkr*1zV', N'+7(425) 783-2253', N'8207', N'522702', CAST(N'1980-04-16' AS Date), CAST(N'2023-02-05T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (19, 3, N'Горбунов Степан Артёмович', N'garciadavid@mckinney-mcbride.com', N'gorbunovsa', N'hFhK%$JI', N'+7(889) 449-4391', N'9307', N'232158', CAST(N'1993-07-23' AS Date), CAST(N'2023-02-13T00:00:00.000' AS DateTime), 1, 2)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (20, 2, N'Рябинина Софья Артёмовна', N'loudittoimmolau1900@gmail.com', N'ryabininasa', N'&yw1da4K', N'+7(825) 301-8250', N'1357', N'242839', CAST(N'1990-06-01' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (21, 2, N'Козлова Яна Даниловна', N'hittuprofassa4984@mail.com', N'kozlovayd', N'wCH7dl3k', N'+7(397) 334-2086', N'1167', N'256636', CAST(N'1987-12-21' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (22, 3, N'Лукьянова Ульяна Олеговна', N'freineiciweijau888@yandex.ru', N'lyckyanovayo', N'JadQ24D5', N'+7(241) 570-3040', N'1768', N'266986', CAST(N'1981-10-22' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (23, 2, N'Кондрашова Арина Ивановна', N'jessica84@hotmail.com', N'kondrashovai', N'YlBz$8vJ', N'+7(713) 462-8265', N'1710', N'427875', CAST(N'1976-12-22' AS Date), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 0, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (24, 3, N'Быкова Виктория Тимуровна', N'nokupekidda2001@gmail.com', N'bykovavt', N'nx8Z$K98', N'+7(854) 822-2331', N'1806', N'289145', CAST(N'1973-06-14' AS Date), NULL, NULL, 1)
INSERT [dbo].[Users] ([Id], [IdRole], [UserName], [Email], [Login], [Password], [PhoneNumber], [SeriaPasporta], [NomerPasporta], [DateOfBirth], [LastEntry], [TypeEntry], [idGender]) VALUES (25, 2, N'Гуляев Тимофей Даниилович', N'ginaritter@schneider-buchanan.com', N'gylyaevtd', N'lz$kp1?f', N'+7(439) 713-6117', N'1587', N'291249', CAST(N'1987-02-05' AS Date), CAST(N'2023-02-07T00:00:00.000' AS DateTime), 0, 2)
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserGender] FOREIGN KEY([idGender])
REFERENCES [dbo].[UserGender] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserGender]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_UserRole] FOREIGN KEY([IdRole])
REFERENCES [dbo].[UserRole] ([id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_UserRole]
GO
USE [master]
GO
ALTER DATABASE [SportAppBD] SET  READ_WRITE 
GO
