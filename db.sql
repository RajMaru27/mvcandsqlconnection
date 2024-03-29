USE [School]
GO
/****** Object:  Table [dbo].[abcd]    Script Date: 26-05-2023 6.04.39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[abcd](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](10) NULL,
	[Qty] [int] NULL,
	[Price] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 26-05-2023 6.04.39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[AddressLine1] [nvarchar](40) NULL,
	[AddressLine2] [nvarchar](40) NULL,
	[Landmark] [nvarchar](15) NULL,
	[City] [nvarchar](15) NULL,
	[State] [nvarchar](15) NULL,
	[Pincode] [int] NULL,
	[CustomerId] [int] NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddUser]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Email] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AxisBank]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AxisBank](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[AccNo] [nvarchar](16) NULL,
	[Deposit] [nvarchar](10) NULL,
	[Withdraw] [nvarchar](10) NULL,
	[AvaBal] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankDetails]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[AccNo] [nvarchar](16) NULL,
	[IfscCode] [nvarchar](10) NULL,
	[Address] [nvarchar](50) NULL,
	[Amount] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Berth]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Berth](
	[BerthId] [int] IDENTITY(1,1) NOT NULL,
	[BerthName] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarShowroom]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarShowroom](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Model] [nvarchar](10) NULL,
	[Qty] [nvarchar](5) NULL,
	[Price] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Class]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassId] [int] IDENTITY(1,1) NOT NULL,
	[ClassName] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClassId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cricket]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cricket](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[PlayerName] [nvarchar](15) NULL,
	[Country] [nvarchar](15) NULL,
	[Role] [nvarchar](20) NULL,
	[Best] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](25) NULL,
	[Email] [nvarchar](25) NULL,
	[Password] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Exam]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ExamId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectId] [int] NULL,
	[OswalId] [int] NULL,
	[Marks] [int] NULL,
	[OutOf] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ExamId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Examination]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Examination](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](15) NULL,
	[RollNumber] [nvarchar](5) NULL,
	[Class] [nvarchar](5) NULL,
	[Division] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Flat]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Flat](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FlatNo] [nvarchar](3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Age] [nvarchar](2) NULL,
	[Emailid] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Maintenence]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Maintenence](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[FlatNo] [nvarchar](3) NULL,
	[AmountPending] [nvarchar](7) NULL,
	[PendingDate] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Medical]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Medical](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[TabName] [nvarchar](15) NULL,
	[TabPower] [nvarchar](10) NULL,
	[Qty] [nvarchar](5) NULL,
	[Price] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MemberClub]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MemberClub](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Address] [nvarchar](60) NULL,
	[Phone] [nvarchar](12) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MobileService]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MobileService](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](10) NULL,
	[Address] [nvarchar](60) NULL,
	[OpenTime] [nvarchar](10) NULL,
	[WorkingDays] [nvarchar](25) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewEmployee]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewEmployee](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Email] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewUser]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewUser](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Phone] [nvarchar](10) NULL,
	[Email] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL,
	[ConfirmPassword] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Ola]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ola](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[PickupLocation] [nvarchar](30) NULL,
	[DropLocation] [nvarchar](30) NULL,
	[CarName] [nvarchar](15) NULL,
	[CarNo] [nvarchar](10) NULL,
	[Price] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Oswal]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Oswal](
	[OswalId] [int] IDENTITY(1,1) NOT NULL,
	[ClassId] [int] NULL,
	[StudentsId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OswalId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneBill]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneBill](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](10) NULL,
	[ModelNo] [nvarchar](10) NULL,
	[Qty] [int] NULL,
	[Price] [int] NULL,
	[Gst] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Railway]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Railway](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](15) NULL,
	[Age] [nvarchar](3) NULL,
	[Departure] [nvarchar](15) NULL,
	[Destination] [nvarchar](15) NULL,
	[Berth] [nvarchar](15) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentDetails]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDetails](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Email] [nvarchar](30) NULL,
	[RollNumber] [nvarchar](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentResult]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentResult](
	[StudentResultID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NULL,
	[Class] [nvarchar](10) NULL,
	[RollNumber] [int] NULL,
	[Email] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentResultID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentsId] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Birthdate] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectId] [int] IDENTITY(1,1) NOT NULL,
	[SubjectName] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[SubjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](10) NULL,
	[LastName] [nvarchar](10) NULL,
	[SetLoginId] [nvarchar](20) NULL,
	[SetPassword] [nvarchar](10) NULL,
	[EmailId] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserData]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserData](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NULL,
	[Name] [nvarchar](20) NULL,
	[Email] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLogin]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLogin](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[EmailId] [nvarchar](30) NULL,
	[Password] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRegister]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegister](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](15) NULL,
	[LastName] [nvarchar](15) NULL,
	[Phone] [nvarchar](30) NULL,
	[PassWord] [nvarchar](12) NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[abcd] ON 

INSERT [dbo].[abcd] ([UserId], [Name], [Qty], [Price]) VALUES (1, N'A', 5, 5000)
SET IDENTITY_INSERT [dbo].[abcd] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (7, N'702, Mahavir ashish bldg,Oswal Park', N'Kharbav Road,Anjurphata', N'Jain Mandir', N'Bhiwandi', N'Maharashtra', 421305, NULL)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (10, N'702, Mahavir ashish bldg,Oswal Park', N'Kharbav Road,Anjurphata', N'Jain Mandir', N'Bhiwandi', N'Maharashtra', 421302, NULL)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (11, N'702, Mahavir ashish bldg,Oswal Park', N'Kharbav Road,Anjurphata', N'Jain Mandir', N'Bhiwandi', N'Maharashtra', 421302, NULL)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (12, N'702, Mahavir ashish bldg,Oswal Park', N'Kharbav Road,Anjurphata', N'Jain Mandir', N'Bhiwandi', N'Maharashtra', 421302, 8)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (13, N'702, Mahavir ashish bldg,Oswal Park', N'anjuphata', N'wadi', N'Bhiwandi', N'Maharashtra', 421302, 9)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (14, N'tata', N'motor', N'reliance', N'world', N'Maharashtra', 123456, 10)
INSERT [dbo].[Address] ([AddressId], [AddressLine1], [AddressLine2], [Landmark], [City], [State], [Pincode], [CustomerId]) VALUES (15, N'djhdfjh', N'safgsgfh', N'Oswal Wadi', N'Bhiwandi', N'Maharashtra', 456123, 11)
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[AddUser] ON 

INSERT [dbo].[AddUser] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Raj', N'Maru', N'RajMaru@gmail.com', N'123456')
INSERT [dbo].[AddUser] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Sagar', N'Malde', N'sagarmalde@gmail.com', N'456123')
SET IDENTITY_INSERT [dbo].[AddUser] OFF
GO
SET IDENTITY_INSERT [dbo].[AxisBank] ON 

INSERT [dbo].[AxisBank] ([UserID], [Name], [AccNo], [Deposit], [Withdraw], [AvaBal]) VALUES (1, N'raj maru', N'0416516464145', N'1000', N'0', N'20000')
SET IDENTITY_INSERT [dbo].[AxisBank] OFF
GO
SET IDENTITY_INSERT [dbo].[BankDetails] ON 

INSERT [dbo].[BankDetails] ([UserId], [Name], [AccNo], [IfscCode], [Address], [Amount]) VALUES (1, N'raj maru', N'768354354464', N'idds54545', N'gjfdfhlgdjgasjjjasjhhfrgergrgrg', N'5321331')
SET IDENTITY_INSERT [dbo].[BankDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Berth] ON 

INSERT [dbo].[Berth] ([BerthId], [BerthName]) VALUES (1, N'LowerBerth')
INSERT [dbo].[Berth] ([BerthId], [BerthName]) VALUES (2, N'UpperBerth')
INSERT [dbo].[Berth] ([BerthId], [BerthName]) VALUES (3, N'MiddleBerth')
INSERT [dbo].[Berth] ([BerthId], [BerthName]) VALUES (4, N'SideLowerBerth')
INSERT [dbo].[Berth] ([BerthId], [BerthName]) VALUES (5, N'SideUpperBerth')
SET IDENTITY_INSERT [dbo].[Berth] OFF
GO
SET IDENTITY_INSERT [dbo].[CarShowroom] ON 

INSERT [dbo].[CarShowroom] ([UserId], [Name], [Model], [Qty], [Price]) VALUES (1, N'Tata', N'Safari', N'12', N'2500000')
SET IDENTITY_INSERT [dbo].[CarShowroom] OFF
GO
SET IDENTITY_INSERT [dbo].[Class] ON 

INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (1, N'1st STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (2, N'2nd STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (3, N'3rd STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (4, N'4th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (5, N'5th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (6, N'6th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (7, N'7th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (8, N'8th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (9, N'9th STD')
INSERT [dbo].[Class] ([ClassId], [ClassName]) VALUES (10, N'10th STD')
SET IDENTITY_INSERT [dbo].[Class] OFF
GO
SET IDENTITY_INSERT [dbo].[Cricket] ON 

INSERT [dbo].[Cricket] ([UserId], [PlayerName], [Country], [Role], [Best]) VALUES (1, N'Virat Kohli', N'India', N'Bat', N'183*')
INSERT [dbo].[Cricket] ([UserId], [PlayerName], [Country], [Role], [Best]) VALUES (3, N'M Starc', N'Aus', N'Bowl', N'5-29')
SET IDENTITY_INSERT [dbo].[Cricket] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (1, N'raj maru', N'RajMaru@gmail.com', N'1212')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (2, N'raj maru', N'RajMaru@gmail.com', N'1212')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (3, N'sagar', N'sagarmalde@gmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (4, N'sagar', N'sagarmalde@gmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (5, N'sagar', N'sagarmalde@gmail.com', N'123456')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (6, N'sagar', N'sagarmalde@gmail.com', N'123456')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (10, N'Tata', N'tata@gmail.com', N'156456')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (11, N'yash', N'yash@gmail.com', N'456')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (7, N'Shrey', N'Shrey@gmail.com', N'12345')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (8, N'sagar', N'RajMaru@gmail.com', N'1212')
INSERT [dbo].[Customer] ([CustomerId], [Name], [Email], [Password]) VALUES (9, N'Shrey', N'Shrey@gmail.com', N'101010')
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Exam] ON 

INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (1, 1, 4, 75, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (3, 2, 4, 73, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (4, 3, 4, 68, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (5, 4, 4, 72, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (6, 5, 4, 55, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (7, 6, 4, 51, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (8, 7, 4, 68, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (9, 1, 1, 75, 100)
INSERT [dbo].[Exam] ([ExamId], [SubjectId], [OswalId], [Marks], [OutOf]) VALUES (10, 2, 1, 72, 100)
SET IDENTITY_INSERT [dbo].[Exam] OFF
GO
SET IDENTITY_INSERT [dbo].[Examination] ON 

INSERT [dbo].[Examination] ([UserId], [StudentName], [RollNumber], [Class], [Division]) VALUES (1, N'Raj Ketan Maru', N'21', N'X', N'A')
SET IDENTITY_INSERT [dbo].[Examination] OFF
GO
SET IDENTITY_INSERT [dbo].[Flat] ON 

INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (1, N'101')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (2, N'102')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (3, N'103')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (4, N'104')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (5, N'105')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (6, N'')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (7, N'')
INSERT [dbo].[Flat] ([UserId], [FlatNo]) VALUES (8, N'106')
SET IDENTITY_INSERT [dbo].[Flat] OFF
GO
SET IDENTITY_INSERT [dbo].[Game] ON 

INSERT [dbo].[Game] ([UserId], [Name], [Age], [Emailid]) VALUES (1, N'Simba', N'25', N'sajhcvsjcksabc')
INSERT [dbo].[Game] ([UserId], [Name], [Age], [Emailid]) VALUES (2, N'nayan', N'25', N'vcbnlnflsk')
INSERT [dbo].[Game] ([UserId], [Name], [Age], [Emailid]) VALUES (4, N'sagar', N'30', N'ndmwjqgdqwhl')
SET IDENTITY_INSERT [dbo].[Game] OFF
GO
SET IDENTITY_INSERT [dbo].[Maintenence] ON 

INSERT [dbo].[Maintenence] ([UserId], [Name], [FlatNo], [AmountPending], [PendingDate]) VALUES (4, N'raj', N'101', N'100000', N'feb2022 to feb2023')
INSERT [dbo].[Maintenence] ([UserId], [Name], [FlatNo], [AmountPending], [PendingDate]) VALUES (7, N'Shreya', N'103', N'100000', N'feb2022 to feb2023')
INSERT [dbo].[Maintenence] ([UserId], [Name], [FlatNo], [AmountPending], [PendingDate]) VALUES (5, N'sagar', N'105', N'100000', N'feb2022 to feb2023')
SET IDENTITY_INSERT [dbo].[Maintenence] OFF
GO
SET IDENTITY_INSERT [dbo].[Medical] ON 

INSERT [dbo].[Medical] ([UserId], [TabName], [TabPower], [Qty], [Price]) VALUES (1, N'clopidrell', N'8464', N'12', N'5543')
INSERT [dbo].[Medical] ([UserId], [TabName], [TabPower], [Qty], [Price]) VALUES (3, N'cedfreg', N'4646', N'168', N'5253')
SET IDENTITY_INSERT [dbo].[Medical] OFF
GO
SET IDENTITY_INSERT [dbo].[MemberClub] ON 

INSERT [dbo].[MemberClub] ([UserId], [FirstName], [LastName], [Address], [Phone]) VALUES (1, N' Raj', N'Maru', N'jhdvjhbdshbsdkbksd', N'984654565')
INSERT [dbo].[MemberClub] ([UserId], [FirstName], [LastName], [Address], [Phone]) VALUES (4, N' Sagar', N'Malde', N'gjfdfhlgdjgasjjjasjhhfrgergrgrg', N'7546565651')
INSERT [dbo].[MemberClub] ([UserId], [FirstName], [LastName], [Address], [Phone]) VALUES (5, N' Sagaru', N'Malde', N'gjfdfhlgdjgasjjjasjhhfrgergrgrg', N'4864654654')
SET IDENTITY_INSERT [dbo].[MemberClub] OFF
GO
SET IDENTITY_INSERT [dbo].[MobileService] ON 

INSERT [dbo].[MobileService] ([UserId], [CompanyName], [Address], [OpenTime], [WorkingDays]) VALUES (4, N'vivo', N'scbkjaskasnkjas', N'52', N'Mon To Sat')
SET IDENTITY_INSERT [dbo].[MobileService] OFF
GO
SET IDENTITY_INSERT [dbo].[NewEmployee] ON 

INSERT [dbo].[NewEmployee] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (2, N'Raj', N'Ma', N'RajMaru@gmail.com', N'35464')
INSERT [dbo].[NewEmployee] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (3, N'Raj', N'Maru', N'raj@gmail.com', N'123456')
INSERT [dbo].[NewEmployee] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (4, N'Raj', N'Maru', N'raj@gmail.com', N'78945')
INSERT [dbo].[NewEmployee] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (6, N'Raj', N'Malde', N'sdfs@dsf.com', N'35354')
INSERT [dbo].[NewEmployee] ([UserId], [FirstName], [LastName], [Email], [Password]) VALUES (7, N'Shreyu', N'Khimasiya', N'Shrey@gmail.com', N'00000')
SET IDENTITY_INSERT [dbo].[NewEmployee] OFF
GO
SET IDENTITY_INSERT [dbo].[NewUser] ON 

INSERT [dbo].[NewUser] ([UserId], [Name], [Phone], [Email], [Password], [ConfirmPassword]) VALUES (2, N'raj', N'7546565651', N'RajMaru@gmail.com', N'123456', N'123456')
INSERT [dbo].[NewUser] ([UserId], [Name], [Phone], [Email], [Password], [ConfirmPassword]) VALUES (3, N'sagar', N'878786786', N'sagar@gmail.com', N'789456', N'789456')
SET IDENTITY_INSERT [dbo].[NewUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Ola] ON 

INSERT [dbo].[Ola] ([UserId], [Name], [PickupLocation], [DropLocation], [CarName], [CarNo], [Price]) VALUES (4, N'raj', N'Bhiwandi', N'Ghansoli', N'WagonR', N'MH05TY3328', N'235')
SET IDENTITY_INSERT [dbo].[Ola] OFF
GO
SET IDENTITY_INSERT [dbo].[Oswal] ON 

INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (1, 10, 2)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (4, 9, 1)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (5, 5, 3)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (6, 8, 6)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (7, 1, 4)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (8, 6, 5)
INSERT [dbo].[Oswal] ([OswalId], [ClassId], [StudentsId]) VALUES (9, 2, 10)
SET IDENTITY_INSERT [dbo].[Oswal] OFF
GO
SET IDENTITY_INSERT [dbo].[PhoneBill] ON 

INSERT [dbo].[PhoneBill] ([UserId], [CompanyName], [ModelNo], [Qty], [Price], [Gst]) VALUES (1, N'vivo', N'V27', 2, 10000, NULL)
INSERT [dbo].[PhoneBill] ([UserId], [CompanyName], [ModelNo], [Qty], [Price], [Gst]) VALUES (5, NULL, NULL, NULL, NULL, 18)
INSERT [dbo].[PhoneBill] ([UserId], [CompanyName], [ModelNo], [Qty], [Price], [Gst]) VALUES (4, N'oppo', N'F21', 2, 20000, NULL)
SET IDENTITY_INSERT [dbo].[PhoneBill] OFF
GO
SET IDENTITY_INSERT [dbo].[Railway] ON 

INSERT [dbo].[Railway] ([UserId], [Name], [Age], [Departure], [Destination], [Berth]) VALUES (2, N'raj', N'25', N'mumbai', N'jamnagar', N'LowerBerth')
INSERT [dbo].[Railway] ([UserId], [Name], [Age], [Departure], [Destination], [Berth]) VALUES (3, N'sagar', N'30', N'mumbai', N'jamnagar', N'MiddleBerth')
INSERT [dbo].[Railway] ([UserId], [Name], [Age], [Departure], [Destination], [Berth]) VALUES (4, N'Shrey', N'29', N'mumbai', N'jamnagar', N'UpperBerth')
SET IDENTITY_INSERT [dbo].[Railway] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([UserId], [Name]) VALUES (3, N'Admin')
INSERT [dbo].[Role] ([UserId], [Name]) VALUES (4, N'Super Admin')
INSERT [dbo].[Role] ([UserId], [Name]) VALUES (5, N'Developer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[StudentDetails] ON 

INSERT [dbo].[StudentDetails] ([UserId], [FirstName], [LastName], [Email], [RollNumber]) VALUES (1, N' Raj', N'Maru', N'raj@gmail.com', N'22')
INSERT [dbo].[StudentDetails] ([UserId], [FirstName], [LastName], [Email], [RollNumber]) VALUES (2, N' Sagar', N'Malde', N'sagar@gmail.com', N'12')
INSERT [dbo].[StudentDetails] ([UserId], [FirstName], [LastName], [Email], [RollNumber]) VALUES (3, N'Shreyu', N'Khimasiya', N'Buddhu@Gmail.com', N'402')
INSERT [dbo].[StudentDetails] ([UserId], [FirstName], [LastName], [Email], [RollNumber]) VALUES (4, N' Naynesh', N'lathiya', N'lathiyagmail.com', N'69')
SET IDENTITY_INSERT [dbo].[StudentDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (1, N'Raj Maru', N'RajMaru@gmail.com', N'27/Nov/1997')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (2, N'Sagar Malde', N'SagarMalde@gmail.com', N'07/July/1993')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (3, N'Shrey Khimasiya', N'ShreyKhimasiya@gmail.com', N'29/Apr/2000')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (4, N'Yash Gudhka', N'yashGudhka@gmail.com', N'30/May/1999')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (5, N'Naynesh Lathiya', N'NayanIsh@gmail.com', N'10/Sep/1997')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (6, N'Mayur Nagda', N'MayurNagda@gmail.com', N'22/Feb/1997')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (7, N'Anuj Gudhka', N'AnujGudhka@gmail.com', N'18/Sep/1997')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (8, N'Aash Chandariya', N'AashChandariya@gmail.com', N'10/Oct/1995')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (9, N'Kunj Shah', N'KunjJakhariya@gmail.com', N'25/Dec/1995')
INSERT [dbo].[Students] ([StudentsId], [StudentName], [Email], [Birthdate]) VALUES (10, N'Yash Savla', N'YashSavla@gmail.com', N'05/Nov/1997')
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (1, N'ENGLISH')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (2, N'MATHS')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (3, N'SCIENCE')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (4, N'HISTORY')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (5, N'GEOGRAPHY')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (6, N'HINDI')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (7, N'MARATHI')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (8, N'DRAWING')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (9, N'EVS')
INSERT [dbo].[Subject] ([SubjectId], [SubjectName]) VALUES (10, N'PT')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [SetLoginId], [SetPassword], [EmailId]) VALUES (2, N'Raj', N'Maru', N'dffdhghfgj', N'dsfsdjkf', N'raj,maru2@gmail.com')
INSERT [dbo].[User] ([UserId], [FirstName], [LastName], [SetLoginId], [SetPassword], [EmailId]) VALUES (3, N'Sagaru', N'Malde', N'jhdbsfkjnakf', N'1651651', N'sagar.malde@gmai.com')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
SET IDENTITY_INSERT [dbo].[UserData] ON 

INSERT [dbo].[UserData] ([UserId], [RoleId], [Name], [Email], [Password]) VALUES (1, 3, N'raj', N'RajMaru@gmail.com', N'1010')
INSERT [dbo].[UserData] ([UserId], [RoleId], [Name], [Email], [Password]) VALUES (2, 4, N'sagar', N'sagarmalde@gmail.com', N'789456')
INSERT [dbo].[UserData] ([UserId], [RoleId], [Name], [Email], [Password]) VALUES (4, 4, N'sagar', N'sagar@gmail.com', N'789456')
SET IDENTITY_INSERT [dbo].[UserData] OFF
GO
SET IDENTITY_INSERT [dbo].[UserLogin] ON 

INSERT [dbo].[UserLogin] ([UserId], [EmailId], [Password]) VALUES (1, N'raj,maru2@gmail.com', N'123456')
INSERT [dbo].[UserLogin] ([UserId], [EmailId], [Password]) VALUES (2, N'sagar.malde@gmai.com', N'789456')
SET IDENTITY_INSERT [dbo].[UserLogin] OFF
GO
SET IDENTITY_INSERT [dbo].[UserRegister] ON 

INSERT [dbo].[UserRegister] ([UserId], [FirstName], [LastName], [Phone], [PassWord]) VALUES (1, N'Raj', N'Maru', N'984654565', N'353555')
INSERT [dbo].[UserRegister] ([UserId], [FirstName], [LastName], [Phone], [PassWord]) VALUES (3, N'Raju', N'Maru', N'7546565651', N'76846465')
SET IDENTITY_INSERT [dbo].[UserRegister] OFF
GO
/****** Object:  StoredProcedure [dbo].[sp_berthData]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_berthData]
			@Id int,
			@Name nvarchar(max)
as
begin
	select * from Berth
	where BerthId=@Id and BerthName=@Name
end
GO
/****** Object:  StoredProcedure [dbo].[sp_getBerth]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getBerth]
as
begin
	select * from Berth
end

GO
/****** Object:  StoredProcedure [dbo].[sp_getBerthDetails]    Script Date: 26-05-2023 6.04.40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[sp_getBerthDetails]
			@Id int
as
begin
	--declare @Idssss int
	select * from Berth
	where BerthId=@Id
end
GO
