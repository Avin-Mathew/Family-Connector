USE [db_ccs2]
GO
/****** Object:  Table [dbo].[tbl_usertype]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_usertype](
	[usertype_id] [int] IDENTITY(1,1) NOT NULL,
	[usertype_name] [char](25) NOT NULL,
 CONSTRAINT [PK_tbl_usertype] PRIMARY KEY CLUSTERED 
(
	[usertype_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_usertype] ON
INSERT [dbo].[tbl_usertype] ([usertype_id], [usertype_name]) VALUES (1, N'Admin                    ')
INSERT [dbo].[tbl_usertype] ([usertype_id], [usertype_name]) VALUES (2, N'Group_Admin              ')
INSERT [dbo].[tbl_usertype] ([usertype_id], [usertype_name]) VALUES (3, N'Member                   ')
SET IDENTITY_INSERT [dbo].[tbl_usertype] OFF
/****** Object:  Table [dbo].[tbl_suggestion]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_suggestion](
	[suggestion_id] [int] IDENTITY(1,1) NOT NULL,
	[suggestion_name] [varchar](50) NOT NULL,
	[suggestion_email] [nvarchar](max) NOT NULL,
	[suggestion_message] [nvarchar](max) NOT NULL,
	[suggestion_time] [varchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_feedback] PRIMARY KEY CLUSTERED 
(
	[suggestion_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_suggestion] ON
INSERT [dbo].[tbl_suggestion] ([suggestion_id], [suggestion_name], [suggestion_email], [suggestion_message], [suggestion_time]) VALUES (2, N'Avin', N'avinm4u@gmail.com', N'Excellent...', N'23-02-2014')
INSERT [dbo].[tbl_suggestion] ([suggestion_id], [suggestion_name], [suggestion_email], [suggestion_message], [suggestion_time]) VALUES (3, N'kevin', N'kevin123@gmail.com', N'good..', N'24-02-2014')
INSERT [dbo].[tbl_suggestion] ([suggestion_id], [suggestion_name], [suggestion_email], [suggestion_message], [suggestion_time]) VALUES (4, N'Alexy', N'alex123456@gmail.com', N'very good..', N'26-02-2014')
SET IDENTITY_INSERT [dbo].[tbl_suggestion] OFF
/****** Object:  Table [dbo].[tbl_subgrp]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_subgrp](
	[subgrp_id] [int] IDENTITY(1,1) NOT NULL,
	[subgrp_name] [nvarchar](50) NOT NULL,
	[group_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_subgrp] PRIMARY KEY CLUSTERED 
(
	[subgrp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_state]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_state](
	[state_id] [int] IDENTITY(1,1) NOT NULL,
	[state_name] [varchar](max) NOT NULL,
	[country_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_state] PRIMARY KEY CLUSTERED 
(
	[state_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_state] ON
INSERT [dbo].[tbl_state] ([state_id], [state_name], [country_id]) VALUES (4, N'Maharashtra', 7)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [country_id]) VALUES (12, N'Karnataka', 7)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [country_id]) VALUES (14, N'Florida', 9)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [country_id]) VALUES (15, N'Los Angels', 9)
INSERT [dbo].[tbl_state] ([state_id], [state_name], [country_id]) VALUES (16, N'Kerala', 7)
SET IDENTITY_INSERT [dbo].[tbl_state] OFF
/****** Object:  Table [dbo].[tbl_relationship]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_relationship](
	[relationship_id] [int] IDENTITY(1,1) NOT NULL,
	[relationship_type] [char](25) NOT NULL,
 CONSTRAINT [PK_tbl] PRIMARY KEY CLUSTERED 
(
	[relationship_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_relationship] ON
INSERT [dbo].[tbl_relationship] ([relationship_id], [relationship_type]) VALUES (1, N'Self                     ')
INSERT [dbo].[tbl_relationship] ([relationship_id], [relationship_type]) VALUES (2, N'Son                      ')
INSERT [dbo].[tbl_relationship] ([relationship_id], [relationship_type]) VALUES (3, N'Daughter                 ')
INSERT [dbo].[tbl_relationship] ([relationship_id], [relationship_type]) VALUES (4, N'Wife                     ')
SET IDENTITY_INSERT [dbo].[tbl_relationship] OFF
/****** Object:  Table [dbo].[tbl_registration]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_registration](
	[registration_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[parent_id] [int] NULL,
	[relationship_id] [int] NULL,
	[registration_fname] [char](50) NOT NULL,
	[registration_lname] [char](50) NOT NULL,
	[registration_nickname] [char](50) NULL,
	[registration_gender] [char](25) NOT NULL,
	[registration_maritalstatus] [char](25) NULL,
	[registration_dob] [varchar](50) NULL,
	[registration_profession] [varchar](50) NULL,
	[bloodgrp_id] [int] NULL,
	[registration_address] [varchar](max) NULL,
	[district_id] [int] NULL,
	[registration_pincode] [int] NULL,
	[registration_landline] [varchar](50) NULL,
	[registration_mobile] [varchar](50) NULL,
	[registration_email] [varchar](50) NULL,
	[registration_writeup] [varchar](max) NULL,
	[registration_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_registration] PRIMARY KEY CLUSTERED 
(
	[registration_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_registration] ON
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (1, 3, 0, 1, N'Manu                                              ', N'Jacob                                             ', N'Manu                                              ', N'Male                     ', N'Single                   ', N'', N'', NULL, NULL, NULL, NULL, NULL, N'999999999', NULL, NULL, N'Approved')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (2, 3, 1, 1, N'Mony                                              ', N'Jacob                                             ', N'yhyh                                              ', N'Male                     ', N'Single                   ', N'2/26/2014', N'Novelist', 3, N'Venkadathu (H)', 15, 686006, N'04812310661', N'67676767', N'mony@gmail.com', N'bbgbf', N'Approved')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (3, 3, 1, 2, N'Tomy                                              ', N'jacob                                             ', N'tomi                                              ', N'Male                     ', N'Married                  ', N'2/5/1979', N'teacher', 1, N'venkadathu', 15, 686541, N'0792341923', N'9678126787', N'admin@gmail.com', N'hhhhh', N'Approved')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (4, 3, 1, 3, N'Lissy                                             ', N'Jacob                                             ', N'Lisamma                                           ', N'Female                   ', N'Married                  ', N'3/9/1982', N'teacher', 3, N'cherpunkal', 23, 680934, N'0777535889', N'9588093490', N'lissyjacob@gmail.com', N'tuytuui', N'Approved')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (5, 3, 3, 2, N'Alex                                              ', N'Tomy                                              ', N'Alexy                                             ', N'Male                     ', N'Single                   ', N'4/26/1993', N'Engineer', 5, N'Venkadathu (H)', 15, 686006, N'0481256066', N'9497480663', N'alexy@gmail.com', N'Single And Happy..', N'Approved')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (6, 3, 3, 3, N'Annie                                             ', N'Tomy                                              ', N'Anniem                                            ', N'Female                   ', N'Single                   ', N'6/21/1994', N'Judge', 3, N'Venkadathu (H)', 31, 686002, N'04812462680', N'9497480063', N'ann@gmail.com', N'have two children...', N'OnRequest')
INSERT [dbo].[tbl_registration] ([registration_id], [group_id], [parent_id], [relationship_id], [registration_fname], [registration_lname], [registration_nickname], [registration_gender], [registration_maritalstatus], [registration_dob], [registration_profession], [bloodgrp_id], [registration_address], [district_id], [registration_pincode], [registration_landline], [registration_mobile], [registration_email], [registration_writeup], [registration_status]) VALUES (7, 3, 5, 2, N'John                                              ', N'Mathew                                            ', N'Johny                                             ', N'Male                     ', N'Married                  ', N'7/29/1998', N'Journalist', 4, N'Venkadathu', 15, 686003, N'04812310661', N'9497566236', N'john@gmail.com', N'happy..', N'Approved')
SET IDENTITY_INSERT [dbo].[tbl_registration] OFF
/****** Object:  Table [dbo].[tbl_profession]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_profession](
	[profession_id] [int] NOT NULL,
	[profession_name] [char](50) NOT NULL,
 CONSTRAINT [PK_tbl_profession] PRIMARY KEY CLUSTERED 
(
	[profession_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_newsnevents]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_newsnevents](
	[newsnevents_id] [int] IDENTITY(1,1) NOT NULL,
	[newsnevents_title] [varchar](50) NOT NULL,
	[newsnevents_description] [varchar](max) NOT NULL,
	[newsnevents_datentime] [varchar](50) NOT NULL,
	[registration_id] [int] NOT NULL,
	[newsnevents_status] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tbl_news] PRIMARY KEY CLUSTERED 
(
	[newsnevents_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_newsnevents] ON
INSERT [dbo].[tbl_newsnevents] ([newsnevents_id], [newsnevents_title], [newsnevents_description], [newsnevents_datentime], [registration_id], [newsnevents_status]) VALUES (1, N'Annual Meet', N'Annual Family Meet of this year is sheduled on 26th January 2014 at the House of Mr.Jacob Kurian ', N'08-02-2014', 2, N'approved')
INSERT [dbo].[tbl_newsnevents] ([newsnevents_id], [newsnevents_title], [newsnevents_description], [newsnevents_datentime], [registration_id], [newsnevents_status]) VALUES (2, N'Family tour', N'Annual Family Tour is Sheduled To Be Conducted on 1st May 2014 starting from the house of Mr.Georgre Mathew at 5 A.M.', N'10-03-2014', 2, N'approved')
INSERT [dbo].[tbl_newsnevents] ([newsnevents_id], [newsnevents_title], [newsnevents_description], [newsnevents_datentime], [registration_id], [newsnevents_status]) VALUES (3, N'Youth Meet', N'At Philip Kurians Home 22nd May', N'15-03-2014', 7, N'approved')
INSERT [dbo].[tbl_newsnevents] ([newsnevents_id], [newsnevents_title], [newsnevents_description], [newsnevents_datentime], [registration_id], [newsnevents_status]) VALUES (4, N'Fr.Andrews Obituary', N'At St.Marys Church', N'15-03-2014', 5, N'notapprove')
SET IDENTITY_INSERT [dbo].[tbl_newsnevents] OFF
/****** Object:  Table [dbo].[tbl_message]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_message](
	[message_id] [int] IDENTITY(1,1) NOT NULL,
	[message_fromid] [int] NOT NULL,
	[message_toid] [int] NOT NULL,
	[message_message] [nvarchar](max) NOT NULL,
	[message_datentime] [varchar](50) NOT NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_tbl_message] PRIMARY KEY CLUSTERED 
(
	[message_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_message] ON
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (1, 2, 2, N'hello', N'Feb 10 2014 10:53PM', NULL)
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (3, 2, 2, N'haiii', N'Feb 10 2014 10:53PM', NULL)
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (4, 2, 2, N'hello', N'17-02-2014 17:23:18', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (5, 2, 4, N'hai how  are tou...', N'19-02-2014 11:34:19', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (6, 2, 2, N'good afternoon', N'19-02-2014 13:41:14', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (7, 2, 2, N'good afternoon', N'19-02-2014 13:41:50', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (8, 2, 3, N'hello...where are u?', N'19-02-2014 13:45:36', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (9, 2, 4, N'haaai...', N'19-02-2014 13:54:25', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (10, 2, 4, N'hai...', N'24-02-2014 12:33:00', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (11, 2, 2, N'hello...', N'24-02-2014 13:03:04', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (12, 2, 2, N'hello...', N'24-02-2014 13:03:10', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (13, 2, 4, N'hai', N'24-02-2014 13:17:07', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (14, 2, 2, N'to mee....', N'24-02-2014 13:46:20', N'notviewed')
INSERT [dbo].[tbl_message] ([message_id], [message_fromid], [message_toid], [message_message], [message_datentime], [status]) VALUES (15, 2, 4, N'hai...............', N'26-02-2014 14:44:26', N'notviewed')
SET IDENTITY_INSERT [dbo].[tbl_message] OFF
/****** Object:  Table [dbo].[tbl_login]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_login](
	[login_id] [int] IDENTITY(1,1) NOT NULL,
	[login_username] [nchar](25) NOT NULL,
	[login_password] [varchar](50) NOT NULL,
	[usertype_id] [int] NOT NULL,
	[registration_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_login] PRIMARY KEY CLUSTERED 
(
	[login_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_login] ON
INSERT [dbo].[tbl_login] ([login_id], [login_username], [login_password], [usertype_id], [registration_id]) VALUES (1, N'admin@gmail.com          ', N'admin', 1, 3)
INSERT [dbo].[tbl_login] ([login_id], [login_username], [login_password], [usertype_id], [registration_id]) VALUES (2, N'mony@gmail.com           ', N'mony', 3, 2)
INSERT [dbo].[tbl_login] ([login_id], [login_username], [login_password], [usertype_id], [registration_id]) VALUES (3, N'lissyjacob@gmail.com     ', N'Hs20rE', 3, 4)
INSERT [dbo].[tbl_login] ([login_id], [login_username], [login_password], [usertype_id], [registration_id]) VALUES (4, N'alexy@gmail.com          ', N'TUOPD1', 3, 5)
INSERT [dbo].[tbl_login] ([login_id], [login_username], [login_password], [usertype_id], [registration_id]) VALUES (5, N'john@gmail.com           ', N'N6K7j7', 2, 7)
SET IDENTITY_INSERT [dbo].[tbl_login] OFF
/****** Object:  Table [dbo].[tbl_history]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_history](
	[history_id] [int] IDENTITY(1,1) NOT NULL,
	[history_desciption] [nvarchar](max) NOT NULL,
	[history_path] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_history] PRIMARY KEY CLUSTERED 
(
	[history_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_group]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_group](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[group_name] [varchar](50) NOT NULL,
	[group_description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_group] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_group] ON
INSERT [dbo].[tbl_group] ([group_id], [group_name], [group_description]) VALUES (3, N'Puthenpurackel', N'Generation Starting From Mathew')
INSERT [dbo].[tbl_group] ([group_id], [group_name], [group_description]) VALUES (4, N'Theverthattil', N'Generation Starting From Thomas')
SET IDENTITY_INSERT [dbo].[tbl_group] OFF
/****** Object:  Table [dbo].[tbl_governbody]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_governbody](
	[governbody_id] [int] IDENTITY(1,1) NOT NULL,
	[governbody_name] [nvarchar](max) NOT NULL,
	[governbody_position] [nvarchar](50) NOT NULL,
	[governbody_photo] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_governbody] PRIMARY KEY CLUSTERED 
(
	[governbody_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_generation]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_generation](
	[generation_id] [int] IDENTITY(1,1) NOT NULL,
	[generation_number] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_tbl_generation] PRIMARY KEY CLUSTERED 
(
	[generation_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_district]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_district](
	[district_id] [int] IDENTITY(1,1) NOT NULL,
	[district_name] [nvarchar](max) NOT NULL,
	[state_id] [int] NOT NULL,
 CONSTRAINT [PK_tbl_city] PRIMARY KEY CLUSTERED 
(
	[district_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_district] ON
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (1, N'Chennai', 4)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (4, N'Kodagu', 12)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (8, N'Bangalore', 7)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (15, N'Kottayam', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (16, N'Eranakulam', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (23, N'Kannur', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (24, N'Kozhikode', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (31, N'Palakkad', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (32, N'Alappuzha', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (34, N'Kollam', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (35, N'Idukki', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (37, N'Thiruvananthapuram', 16)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (38, N'mysore', 12)
INSERT [dbo].[tbl_district] ([district_id], [district_name], [state_id]) VALUES (39, N'Pune', 4)
SET IDENTITY_INSERT [dbo].[tbl_district] OFF
/****** Object:  Table [dbo].[tbl_country]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_country](
	[country_id] [int] IDENTITY(1,1) NOT NULL,
	[country_name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_tbl_country] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_country] ON
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (3, N'Japan')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (6, N'Russia')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (7, N'India')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (9, N'U.S.A.')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (24, N'China')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (25, N'U.A.E.')
INSERT [dbo].[tbl_country] ([country_id], [country_name]) VALUES (26, N'France')
SET IDENTITY_INSERT [dbo].[tbl_country] OFF
/****** Object:  Table [dbo].[tbl_children]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_children](
	[children_id] [int] IDENTITY(1,1) NOT NULL,
	[children_num] [numeric](18, 0) NOT NULL,
 CONSTRAINT [PK_tbl_children] PRIMARY KEY CLUSTERED 
(
	[children_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_chat]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_chat](
	[chat_id] [int] IDENTITY(1,1) NOT NULL,
	[chat_fromid] [int] NOT NULL,
	[chat_toid] [int] NOT NULL,
	[chat_message] [nvarchar](max) NOT NULL,
	[chat_datentime] [datetime] NOT NULL,
 CONSTRAINT [PK_tbl_chat] PRIMARY KEY CLUSTERED 
(
	[chat_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_bloodgrp]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_bloodgrp](
	[bloodgrp_id] [int] IDENTITY(1,1) NOT NULL,
	[bloodgrp_name] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_tbl_bloodgrp] PRIMARY KEY CLUSTERED 
(
	[bloodgrp_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_bloodgrp] ON
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (1, N'A +ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (2, N'A -ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (3, N'B +ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (4, N'B -ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (5, N'O +ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (6, N'O -ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (7, N'AB +ve')
INSERT [dbo].[tbl_bloodgrp] ([bloodgrp_id], [bloodgrp_name]) VALUES (8, N'AB -ve')
SET IDENTITY_INSERT [dbo].[tbl_bloodgrp] OFF
/****** Object:  Table [dbo].[tbl_addpraents]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_addpraents](
	[addpraents_id] [int] IDENTITY(1,1) NOT NULL,
	[group_id] [int] NOT NULL,
	[generation_id] [int] NOT NULL,
	[addpraents_name] [char](50) NOT NULL,
	[addpraents_nick] [char](50) NULL,
	[addpraents_wname] [char](50) NOT NULL,
	[addpraents_wfamily] [char](50) NOT NULL,
 CONSTRAINT [PK_tbl_addpraents] PRIMARY KEY CLUSTERED 
(
	[addpraents_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PhotAlbum]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhotAlbum](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[Photo] [varchar](max) NULL,
	[PhotoName] [varchar](max) NULL,
	[AlbumID] [int] NULL,
 CONSTRAINT [PK_tbl_photo] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PhotAlbum] ON
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (12, N'/Images/12.jpg', N'new', 12)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (13, N'/Images/13.jpg', N'next', 12)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (14, N'/Images/14.jpg', N'Fort', 13)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (15, N'/Images/15.jpg', N'bird', 14)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (16, N'/Images/16.jpg', N'tuttle', 14)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (17, N'/Images/17.jpg', N'st mary', 15)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (18, N'/Images/18.jpg', N'', 16)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (19, N'/Images/19.jpg', N'Panda', 12)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (20, N'/Images/20.jpg', N'joyful', 19)
INSERT [dbo].[PhotAlbum] ([PhotoID], [Photo], [PhotoName], [AlbumID]) VALUES (21, N'/Images/21.jpg', N'Fort', 20)
SET IDENTITY_INSERT [dbo].[PhotAlbum] OFF
/****** Object:  Table [dbo].[Album]    Script Date: 03/15/2014 10:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Album](
	[AlbumID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumName] [varchar](50) NULL,
	[DefaultPhotID] [int] NULL,
	[registration_id] [int] NULL,
	[status] [varchar](50) NULL,
 CONSTRAINT [PK_Album] PRIMARY KEY CLUSTERED 
(
	[AlbumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Album] ON
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DefaultPhotID], [registration_id], [status]) VALUES (12, N'Annual Tour', 19, 1, N'Pending')
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DefaultPhotID], [registration_id], [status]) VALUES (14, N'New', 16, 2, N'approved')
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DefaultPhotID], [registration_id], [status]) VALUES (18, N'tour2013', NULL, 2, N'Pending')
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DefaultPhotID], [registration_id], [status]) VALUES (19, N'joyful', 20, 2, N'Pending')
INSERT [dbo].[Album] ([AlbumID], [AlbumName], [DefaultPhotID], [registration_id], [status]) VALUES (20, N'', 21, 2, N'Pending')
SET IDENTITY_INSERT [dbo].[Album] OFF
