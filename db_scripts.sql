USE [master]
GO
/****** Object:  Database [ChildrenCare]    Script Date: 12/14/2022 9:15:14 PM ******/
CREATE DATABASE [ChildrenCare]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ChildrenCare', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChildrenCare.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ChildrenCare_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\ChildrenCare_log.ldf' , SIZE = 73728KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ChildrenCare] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ChildrenCare].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ChildrenCare] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ChildrenCare] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ChildrenCare] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ChildrenCare] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ChildrenCare] SET ARITHABORT OFF 
GO
ALTER DATABASE [ChildrenCare] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ChildrenCare] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ChildrenCare] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ChildrenCare] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ChildrenCare] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ChildrenCare] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ChildrenCare] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ChildrenCare] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ChildrenCare] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ChildrenCare] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ChildrenCare] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ChildrenCare] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ChildrenCare] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ChildrenCare] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ChildrenCare] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ChildrenCare] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ChildrenCare] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ChildrenCare] SET RECOVERY FULL 
GO
ALTER DATABASE [ChildrenCare] SET  MULTI_USER 
GO
ALTER DATABASE [ChildrenCare] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ChildrenCare] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ChildrenCare] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ChildrenCare] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ChildrenCare] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ChildrenCare] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ChildrenCare', N'ON'
GO
ALTER DATABASE [ChildrenCare] SET QUERY_STORE = OFF
GO
USE [ChildrenCare]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[acc_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[acc_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Blog]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blog](
	[blog_id] [int] NOT NULL,
	[manager_id] [int] NULL,
	[content] [nvarchar](max) NULL,
	[time] [datetime] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[blog_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Doctor]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Doctor](
	[doctor_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[specialist_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoctorProfile]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoctorProfile](
	[profile_id] [int] IDENTITY(1,1) NOT NULL,
	[doctor_id] [int] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[dob] [date] NULL,
	[avatar] [nvarchar](max) NULL,
	[sex] [bit] NULL,
	[address_hospital] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[profile_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[fb_id] [int] IDENTITY(1,1) NOT NULL,
	[fb_content] [nvarchar](max) NULL,
	[fb_time] [datetime] NULL,
	[reservation_id] [int] NULL,
	[user_id] [int] NULL,
 CONSTRAINT [PK_FeedBack] PRIMARY KEY CLUSTERED 
(
	[fb_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackReply]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackReply](
	[reply_id] [int] IDENTITY(1,1) NOT NULL,
	[fb_id] [int] NULL,
	[user_id] [int] NULL,
	[reply_content] [nvarchar](max) NULL,
	[reply_time] [datetime] NULL,
 CONSTRAINT [PK_FeedBack Reply] PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[manager_id] [int] IDENTITY(1,1) NOT NULL,
	[acc_id] [int] NULL,
	[service_id] [int] NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[avata] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[manager_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MedicalRecord]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MedicalRecord](
	[record_id] [int] IDENTITY(1,1) NOT NULL,
	[reservation_id] [int] NULL,
	[diease_name] [nvarchar](50) NULL,
	[prescription] [nvarchar](max) NULL,
	[record_note] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patient](
	[patient_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NULL,
	[name] [nchar](10) NULL,
	[dob] [date] NULL,
	[avatar] [nvarchar](50) NULL,
	[sex] [bit] NULL,
	[patient_note] [nvarchar](50) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[patient_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pharmacy]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pharmacy](
	[pharmacy_id] [int] NOT NULL,
	[name] [nvarchar](50) NULL,
	[content] [nvarchar](max) NULL,
	[manager_id] [int] NULL,
	[price] [int] NULL,
 CONSTRAINT [PK_Pharmacy] PRIMARY KEY CLUSTERED 
(
	[pharmacy_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservation]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservation](
	[reservation_id] [int] IDENTITY(1,1) NOT NULL,
	[time_slot_id] [int] NULL,
	[doctor_id] [int] NULL,
	[date_booking] [date] NULL,
	[phone_contact] [nvarchar](10) NULL,
	[status] [nchar](10) NULL,
	[issue] [nvarchar](max) NULL,
	[user_id] [int] NULL,
	[patient_id] [int] NULL,
 CONSTRAINT [PK__Reservat__173326C54EB7F6CA] PRIMARY KEY CLUSTERED 
(
	[reservation_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Room]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Room](
	[room_id] [int] IDENTITY(1,1) NOT NULL,
	[room_meet] [nvarchar](30) NULL,
	[doctor_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[room_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specialist]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specialist](
	[specialist_id] [int] IDENTITY(1,1) NOT NULL,
	[specialist_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[specialist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeSlot]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TimeSlot](
	[slot_id] [int] IDENTITY(1,1) NOT NULL,
	[slot_time] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[slot_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/14/2022 9:15:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[phone] [nvarchar](10) NULL,
	[address] [nvarchar](50) NULL,
	[avatar] [nvarchar](max) NULL,
	[sex] [bit] NULL,
	[acc_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (1, N'admin1', N'123', N'hkamall0@un.org
', 1)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (2, N'admin2', N'123', N'nfiddy1@shinystat.com
', 1)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (3, N'manager1', N'123', N'planghorn2@accuweather.com
', 2)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (4, N'manager2', N'123', N'rbrighouse3@mediafire.com
', 2)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (5, N'manager3', N'123', N'dnelthrop4@opera.com
', 2)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (6, N'manager4', N'123', N'dludron5@live.com
', 2)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (7, N'manager5', N'123', N'rmawford6@networkadvertising.org
', 2)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (8, N'doctor1', N'123', N'kragless7@de.vu
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (9, N'doctor2', N'123', N'wkitt8@blogs.com
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (10, N'doctor3', N'123', N'mfryatt9@livejournal.com
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (11, N'doctor4', N'123', N'tgrevesa@uiuc.edu
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (12, N'doctor5', N'123', N'dsebbornb@etsy.com
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (13, N'doctor6', N'123', N'fcayzerc@shutterfly.com
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (14, N'doctor7', N'123', N'npeald@google.com.au
', 3)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (15, N'user1', N'123', N'mgiacominie@bigcartel.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (16, N'user2', N'123', N'enannettif@dot.gov
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (17, N'user3', N'123', N'btoyneg@github.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (18, N'user4', N'123', N'kgynnih@marketwatch.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (19, N'user5', N'123', N'clemmeni@scribd.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (20, N'user6', N'123', N'hscandwrightj@stanford.edu
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (21, N'user7', N'123', N'hgabalak@nyu.edu
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (22, N'user8', N'123', N'ahassewelll@weibo.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (23, N'user9', N'123', N'rbartleym@cdbaby.com
', 4)
INSERT [dbo].[Account] ([acc_id], [username], [password], [email], [role_id]) VALUES (24, N'user10', N'123', N'jspraguen@artisteer.com
', 4)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Doctor] ON 

INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (1, 8, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (2, 9, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (3, 10, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (4, 11, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (5, 12, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (6, 13, NULL)
INSERT [dbo].[Doctor] ([doctor_id], [acc_id], [specialist_id]) VALUES (7, 14, NULL)
SET IDENTITY_INSERT [dbo].[Doctor] OFF
GO
SET IDENTITY_INSERT [dbo].[DoctorProfile] ON 

INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (1, 1, N'Reinwald', N'Engall', CAST(N'2022-07-19' AS Date), NULL, 0, N'11888 Browning Court')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (2, 2, N'Terrie', N'Shaudfurth', CAST(N'2022-07-08' AS Date), NULL, 0, N'45 Jay Junction')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (3, 3, N'Doralin', N'Piotr', CAST(N'2022-07-27' AS Date), NULL, 0, N'7477 Daystar Drive')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (4, 4, N'Fan', N'Fuentes', CAST(N'2022-09-28' AS Date), NULL, 0, N'90282 Atwood Place')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (5, 5, N'Calla', N'Henkmann', CAST(N'2022-08-03' AS Date), NULL, 1, N'11729 Graedel Avenue')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (6, 6, N'Angie', N'Yurenev', CAST(N'2022-10-07' AS Date), NULL, 1, N'4582 Rutledge Court')
INSERT [dbo].[DoctorProfile] ([profile_id], [doctor_id], [first_name], [last_name], [dob], [avatar], [sex], [address_hospital]) VALUES (7, 7, N'Rey', N'Kelley', CAST(N'2022-01-23' AS Date), NULL, 0, N'9091 Lien Terrace')
SET IDENTITY_INSERT [dbo].[DoctorProfile] OFF
GO
SET IDENTITY_INSERT [dbo].[Manager] ON 

INSERT [dbo].[Manager] ([manager_id], [acc_id], [service_id], [first_name], [last_name], [phone], [avata]) VALUES (1, 3, NULL, N'Walter', N'Gaston', N'1234567809', N'https://web-static.wrike.com/blog/content/uploads/2017/06/blogpost_image_program-manager-vs-project-manager.jpg?av=b2973e52badbf61b6c5cf5ae81abd1a8')
INSERT [dbo].[Manager] ([manager_id], [acc_id], [service_id], [first_name], [last_name], [phone], [avata]) VALUES (2, 4, NULL, N'Erin', N'Cate', N'4321567809', N'https://web-static.wrike.com/blog/content/uploads/2020/11/What-Do-Project-Managers-Do-1-896x518.jpg?av=6de98f2cd10e1887a940ea43c05b1d76')
INSERT [dbo].[Manager] ([manager_id], [acc_id], [service_id], [first_name], [last_name], [phone], [avata]) VALUES (3, 5, NULL, N'Rebecca', N'Russell', N'9087654321', N'https://blog.hubspot.es/hubfs/media/contentmanagerquehace.jpeg')
INSERT [dbo].[Manager] ([manager_id], [acc_id], [service_id], [first_name], [last_name], [phone], [avata]) VALUES (4, 6, NULL, N'Henny', N'Thornton', N'3421786509', N'https://www.unir.net/wp-content/uploads/2020/11/hombreconportatil.jpg')
INSERT [dbo].[Manager] ([manager_id], [acc_id], [service_id], [first_name], [last_name], [phone], [avata]) VALUES (5, 7, NULL, N'Robert', N'Thomas', N'9078563421', N'https://puranigadi.com/jobs/wp-content/uploads/2022/09/Apple-Advisor-Manager-Jobs.jpeg')
SET IDENTITY_INSERT [dbo].[Manager] OFF
GO
SET IDENTITY_INSERT [dbo].[MedicalRecord] ON 

INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (1, 1, N'Viêm xoang', N'Amoxicillin (Clamoxyl) 0,5g: Số lượng 2 viên, uống 2 lần/ngày. Cefadroxil (Biodroxil) 0,5g: Số lượng 2 viên, uống 2 lần/ngày. Cefuroxim (Zinnat, Zinmax, Cefuroxim) 0,25 - 0,5g: Số lượng 1 viên, uống 2 lần/ngày.', N'')
INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (2, 2, N'Xơ vữa động mạch', N'Đến bệnh viện để kiểm tra thêm', N'')
INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (3, 4, N'Viêm phế quản', N'natri benzoat, penicillin', NULL)
INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (4, 5, N'Viêm tai giữa', N'ibuprofen, antipyrine, otrivin sunfarin, collydexa', NULL)
INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (5, 6, N'Viêm amidan', N'alphachymotrypcin, Iba-mentin 250mg, 
Acid cluvulanic, 
Amoxicilin 250mg, 
Cephalecin ', NULL)
INSERT [dbo].[MedicalRecord] ([record_id], [reservation_id], [diease_name], [prescription], [record_note]) VALUES (6, 7, N'Viêm mũi xoang dị ứng', N'Zyrtec, Cetirizin, Clarityne', NULL)
SET IDENTITY_INSERT [dbo].[MedicalRecord] OFF
GO
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (5, 12, N'Burty Cran', CAST(N'2011-07-28' AS Date), NULL, 1, N'Pellentesque ultrices mattis odio.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (27, 12, N'Taber Lee ', CAST(N'2006-10-21' AS Date), NULL, 0, N'Duis consequat dui nec nisi volutpat eleifend.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (33, 12, N'Ki Purkiss', CAST(N'2009-12-17' AS Date), NULL, 1, N'Duis aliquam convallis nunc.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (40, 12, N'Alair Dent', CAST(N'2019-06-26' AS Date), NULL, 1, N'Aliquam quis turpis eget elit sodales scelerisque.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (53, 12, N'Morris Ebi', CAST(N'2007-04-14' AS Date), NULL, 1, N'Suspendisse accumsan tortor quis turpis.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (55, 12, N'Juan Dri  ', CAST(N'2008-12-20' AS Date), NULL, 1, N'Vivamus tortor.')
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (71, 13, N'Mano      ', CAST(N'2004-03-10' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (72, 13, N'Drew      ', CAST(N'2006-05-08' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (73, 13, N'Finley    ', CAST(N'2010-11-13' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (74, 13, N'Aylmar    ', CAST(N'2012-03-07' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (75, 14, N'Gilligan  ', CAST(N'2015-11-08' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (76, 14, N'Kare      ', CAST(N'2005-05-07' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (77, 14, N'Christiana', CAST(N'2012-07-23' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (78, 14, N'Lucius    ', CAST(N'2016-06-13' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (79, 14, N'Marleah   ', CAST(N'2007-10-23' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (80, 14, N'Clovis    ', CAST(N'2006-08-14' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (81, 14, N'Kelbee    ', CAST(N'2012-11-03' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (82, 14, N'Malcolm   ', CAST(N'2020-12-28' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (83, 15, N'Sigrid    ', CAST(N'2017-08-16' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (84, 15, N'Clarabelle', CAST(N'2021-01-31' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (85, 15, N'Finley    ', CAST(N'2006-02-15' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (86, 15, N'Kristal   ', CAST(N'2009-01-08' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (87, 15, N'Janie     ', CAST(N'2018-07-13' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (88, 16, N'Camala    ', CAST(N'2013-07-18' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (89, 17, N'Haily     ', CAST(N'2022-01-18' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (90, 17, N'Rob       ', CAST(N'2019-08-13' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (91, 17, N'Mervin    ', CAST(N'2014-03-06' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (92, 17, N'Olivero   ', CAST(N'2022-10-15' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (93, 17, N'Keir      ', CAST(N'2016-10-28' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (94, 17, N'Sisile    ', CAST(N'2011-05-25' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (95, 17, N'Annnora   ', CAST(N'2013-01-08' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (96, 17, N'Risa      ', CAST(N'2013-05-05' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (97, 17, N'Kaela     ', CAST(N'2005-01-06' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (98, 17, N'Izak      ', CAST(N'2022-03-24' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (99, 18, N'Livy      ', CAST(N'2006-01-08' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (100, 18, N'Latrina   ', CAST(N'2009-09-27' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (101, 18, N'Kim       ', CAST(N'2021-03-12' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (102, 18, N'Puff      ', CAST(N'2018-12-16' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (103, 18, N'Way       ', CAST(N'2015-03-11' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (104, 18, N'Dulsea    ', CAST(N'2010-10-09' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (105, 19, N'Ag        ', CAST(N'2007-05-30' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (106, 19, N'Emmanuel  ', CAST(N'2012-07-05' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (107, 19, N'Madonna   ', CAST(N'2019-11-25' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (108, 19, N'Dmitri    ', CAST(N'2021-01-24' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (109, 20, N'Guthrie   ', CAST(N'2012-06-27' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (110, 20, N'Inger     ', CAST(N'2013-12-31' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (111, 20, N'Fay       ', CAST(N'2004-01-02' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (112, 20, N'Cole      ', CAST(N'2014-09-22' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (113, 20, N'Cale      ', CAST(N'2018-06-05' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (114, 20, N'Bryan     ', CAST(N'2010-10-29' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (115, 20, N'Farra     ', CAST(N'2011-09-14' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (116, 20, N'Errick    ', CAST(N'2007-11-04' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (117, 21, N'Clarita   ', CAST(N'2013-11-22' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (118, 21, N'Michelina ', CAST(N'2020-02-19' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (119, 21, N'Patrice   ', CAST(N'2005-09-02' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (120, 21, N'Alyce     ', CAST(N'2016-06-13' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (121, 21, N'Pyotr     ', CAST(N'2016-05-27' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (122, 21, N'Mick      ', CAST(N'2014-08-19' AS Date), NULL, 0, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (123, 21, N'Mick      ', CAST(N'2008-02-18' AS Date), NULL, 1, NULL)
INSERT [dbo].[Patient] ([patient_id], [user_id], [name], [dob], [avatar], [sex], [patient_note]) VALUES (124, 21, N'Garrik    ', CAST(N'2007-09-17' AS Date), NULL, 0, NULL)
SET IDENTITY_INSERT [dbo].[Patient] OFF
GO
SET IDENTITY_INSERT [dbo].[Reservation] ON 

INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (1, 1, 5, CAST(N'2022-05-12' AS Date), N'0123456789', N'REQUESTED ', N'có vấn đề về đường hô hấp', 12, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (2, 2, 2, CAST(N'2022-04-16' AS Date), N'0123456789', N'COMPLETED ', N'
Các vấn đề về tim mạch', 13, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (3, 2, 6, CAST(N'2022-05-12' AS Date), N'0123456789', N'ACCEPTED  ', N'viêm xoang', 14, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (4, 3, 5, CAST(N'2022-05-10' AS Date), N'0123456789', N'COMPLETED ', N'viêm phế quản', 15, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (5, 4, 6, CAST(N'2022-05-10' AS Date), N'0123456789', N'COMPLETED ', N'Viêm tai giữa', 16, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (6, 5, 6, CAST(N'2021-05-01' AS Date), N'0123456789', N'COMPLETED ', N'Viêm amidan', 17, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (7, 1, 6, CAST(N'2021-05-11' AS Date), N'0123456789', N'ACCEPTED  ', N'Viêm mũi xoang dị ứng', 15, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (8, 3, 6, CAST(N'2021-05-10' AS Date), N'0123456789', N'COMPLETED ', N'Viêm tai giữa', 12, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (9, 4, 6, CAST(N'2021-05-09' AS Date), N'0123456789', N'COMPLETED ', N'Viêm amidan', 13, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (10, 5, 6, CAST(N'2021-05-08' AS Date), N'0123456789', N'COMPLETED ', N'Viêm tai giữa', 14, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (11, 2, 6, CAST(N'2021-05-07' AS Date), N'0123456789', N'COMPLETED ', N'Viêm tai giữa', 17, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (12, 4, 6, CAST(N'2021-05-06' AS Date), N'0123456789', N'COMPLETED ', N'Viêm amidan', 20, NULL)
INSERT [dbo].[Reservation] ([reservation_id], [time_slot_id], [doctor_id], [date_booking], [phone_contact], [status], [issue], [user_id], [patient_id]) VALUES (13, 2, 6, CAST(N'2021-05-06' AS Date), N'0123456789', N'COMPLETED ', N'Viêm amidan', 19, NULL)
SET IDENTITY_INSERT [dbo].[Reservation] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (1, N'Admin')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (2, N'Manager')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (3, N'Doctor')
INSERT [dbo].[Role] ([role_id], [role_name]) VALUES (4, N'User')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Specialist] ON 

INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (1, N'Tiết niệu thận học')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (2, N'Tim mạch')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (3, N'Tiêu hóa - gan mật - tụy')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (4, N'Cơ xương khớp')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (5, N'Nội hô hấp')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (6, N'Tai mũi họng')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (7, N'Nội tiết')
INSERT [dbo].[Specialist] ([specialist_id], [specialist_name]) VALUES (8, N'Ung bướu')
SET IDENTITY_INSERT [dbo].[Specialist] OFF
GO
SET IDENTITY_INSERT [dbo].[TimeSlot] ON 

INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (1, N'7h00-8h00')
INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (2, N'8h30-9h30')
INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (3, N'10h00-11h30')
INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (4, N'13h30-14h30')
INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (5, N'15h00-16h00')
INSERT [dbo].[TimeSlot] ([slot_id], [slot_time]) VALUES (6, N'16h30-17h30')
SET IDENTITY_INSERT [dbo].[TimeSlot] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (12, N'Karoline', N'Emlen', N'4626169770', N'78 Karstens Alley', N'https://www.kevinashleyphotography.com/wp-content/uploads/2015/11/person.jpg', 1, 15)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (13, N'Jerome', N'Mynard', N'9282325527', N'7043 Loeprich Crossing', N'https://www.gre.ac.uk/__data/assets/image/0029/8687/AlexanderGuschanski.jpg', 1, 16)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (14, N'Deedee', N'Sinnie', N'3478373166', N'6 Valley Edge Junction', N'https://storage.googleapis.com/stateless-ceoblognation-com/sites/2/2017/01/perry-professional.jpg', 0, 17)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (15, N'Janie', N'Cliff', N'2608848878', N'20767 Westerfield Court', N'https://www.socialfix.com/wp-content/uploads/2015/05/JOHN-FIXED.jpg', 0, 18)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (16, N'Welch', N'Cannam', N'2226146909', N'46 Raven Trail', N'https://marriedwiki.com/uploads/bio/2016/10/24/thumb/george-stroumboulopoulos-260-260.jpeg', 1, 19)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (17, N'Babara', N'Kopelman', N'1938401455', N'9452 Everett Hill', N'https://www.thepoke.co.uk/wp-content/uploads/2017/05/YiaZYhjq-228x228.jpg', 1, 20)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (18, N'Koralle', N'Sworn', N'9575781859', N'23 Mccormick Point', N'https://th.bing.com/th/id/R.6da659c5efe5a1fd438d644d1a34d6f1?rik=1qx0fCKAxcmAEg&riu=http%3a%2f%2fyesofcorsa.com%2fwp-content%2fuploads%2f2017%2f10%2fPortraits-Of-People-Best-Wallpaper.jpg&ehk=Vii2S2DphdHm%2fHzfkv64wcBaFT33Xf77md7RPXW%2bgjY%3d&risl=&pid=ImgRaw&r=0', 0, 21)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (19, N'Shay', N'Hadlow', N'6926404722', N'0740 Carioca Avenue', N'https://thumbs.dreamstime.com/b/real-normal-person-portrait-22299686.jpg', 0, 22)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (20, N'Hubie', N'Goldberg', N'4009077971', N'1332 Declaration Park', N'https://media.glamour.com/photos/58b893b2f2031249fe2259ea/master/w_1600%2Cc_limit/renee-ud.jpg', 0, 23)
INSERT [dbo].[User] ([user_id], [first_name], [last_name], [phone], [address], [avatar], [sex], [acc_id]) VALUES (21, N'Pearce', N'Bolden', N'4642869541', N'0 Oak Trail', N'https://www.sainou.com/wp-content/uploads/2020/10/Headshot-0767-3-456x608.jpg', 1, 24)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
/****** Object:  Index [IX_Room]    Script Date: 12/14/2022 9:15:15 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Room] ON [dbo].[Room]
(
	[doctor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[Role] ([role_id])
GO
ALTER TABLE [dbo].[Blog]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Manager] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Manager] ([manager_id])
GO
ALTER TABLE [dbo].[Blog] CHECK CONSTRAINT [FK_Blog_Manager]
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
ALTER TABLE [dbo].[Doctor]  WITH CHECK ADD FOREIGN KEY([specialist_id])
REFERENCES [dbo].[Specialist] ([specialist_id])
GO
ALTER TABLE [dbo].[DoctorProfile]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK__FeedBack__Reserv__3C69FB99] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK__FeedBack__Reserv__3C69FB99]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[FeedbackReply]  WITH CHECK ADD FOREIGN KEY([fb_id])
REFERENCES [dbo].[Feedback] ([fb_id])
GO
ALTER TABLE [dbo].[FeedbackReply]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Manager]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
ALTER TABLE [dbo].[MedicalRecord]  WITH CHECK ADD  CONSTRAINT [FK__Medical R__Reser__46E78A0C] FOREIGN KEY([reservation_id])
REFERENCES [dbo].[Reservation] ([reservation_id])
GO
ALTER TABLE [dbo].[MedicalRecord] CHECK CONSTRAINT [FK__Medical R__Reser__46E78A0C]
GO
ALTER TABLE [dbo].[Patient]  WITH CHECK ADD FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Pharmacy]  WITH CHECK ADD  CONSTRAINT [FK_Pharmacy_Manager] FOREIGN KEY([manager_id])
REFERENCES [dbo].[Manager] ([manager_id])
GO
ALTER TABLE [dbo].[Pharmacy] CHECK CONSTRAINT [FK_Pharmacy_Manager]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK__Reservati__Docto__36B12243] FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK__Reservati__Docto__36B12243]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK__Reservati__TimeS__38996AB5] FOREIGN KEY([time_slot_id])
REFERENCES [dbo].[TimeSlot] ([slot_id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK__Reservati__TimeS__38996AB5]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK__Reservati__UserI__37A5467C] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK__Reservati__UserI__37A5467C]
GO
ALTER TABLE [dbo].[Reservation]  WITH CHECK ADD  CONSTRAINT [FK_Reservation_Patient] FOREIGN KEY([patient_id])
REFERENCES [dbo].[Patient] ([patient_id])
GO
ALTER TABLE [dbo].[Reservation] CHECK CONSTRAINT [FK_Reservation_Patient]
GO
ALTER TABLE [dbo].[Room]  WITH CHECK ADD FOREIGN KEY([doctor_id])
REFERENCES [dbo].[Doctor] ([doctor_id])
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([acc_id])
REFERENCES [dbo].[Account] ([acc_id])
GO
USE [master]
GO
ALTER DATABASE [ChildrenCare] SET  READ_WRITE 
GO
