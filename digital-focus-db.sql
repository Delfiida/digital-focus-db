USE [master]
GO
/****** Object:  Database [DigitalFocusDB]    Script Date: 17.05.2026 15:50:47 ******/
CREATE DATABASE [DigitalFocusDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalFocusDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DigitalFocusDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalFocusDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\DigitalFocusDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DigitalFocusDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalFocusDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalFocusDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DigitalFocusDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalFocusDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalFocusDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DigitalFocusDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalFocusDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DigitalFocusDB] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalFocusDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalFocusDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalFocusDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalFocusDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalFocusDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DigitalFocusDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DigitalFocusDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [DigitalFocusDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DigitalFocusDB]
GO
/****** Object:  Table [dbo].[Achievements]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Achievements](
	[AchievementID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](255) NULL,
	[Requirement] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[AchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppBlockHistory]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppBlockHistory](
	[BlockHistoryID] [int] IDENTITY(1,1) NOT NULL,
	[RuleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[AppName] [varchar](100) NOT NULL,
	[BlockedAt] [datetime] NOT NULL,
	[ReleasedAt] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlockHistoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AppsUsed]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AppsUsed](
	[AppUsageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AppName] [varchar](100) NOT NULL,
	[UsageDate] [date] NOT NULL,
	[DurationMinutes] [int] NOT NULL,
	[UsageCategory] [varchar](50) NULL,
	[IsBlockedDuringUse] [bit] NULL,
	[WasIntentional] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AppUsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlockedApps]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlockedApps](
	[BlockedAppID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AppName] [varchar](100) NOT NULL,
	[BlockStart] [datetime] NOT NULL,
	[BlockEnd] [datetime] NULL,
	[Reason] [varchar](255) NULL,
	[WasManual] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[BlockedAppID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomBlockRules]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomBlockRules](
	[RuleID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AppName] [varchar](100) NOT NULL,
	[UsageThresholdMinutes] [int] NOT NULL,
	[BlockDurationMinutes] [int] NOT NULL,
	[RuleDescription] [varchar](255) NULL,
	[IsActive] [bit] NULL,
	[IsTemporary] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[RuleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DailySummaries]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DailySummaries](
	[SummaryID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[TotalScreenTime] [int] NULL,
	[TotalFocusTime] [int] NULL,
	[DistractionCount] [int] NULL,
	[BlockedAppCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[SummaryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DeviceUsage]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceUsage](
	[DeviceUsageID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[DeviceName] [varchar](100) NULL,
	[OS] [varchar](50) NULL,
	[LastUsed] [datetime] NULL,
	[TotalUsageMinutes] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DeviceUsageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FocusScores]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FocusScores](
	[FocusScoreID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[Date] [date] NOT NULL,
	[Score] [int] NOT NULL,
	[Notes] [varchar](1000) NULL,
	[SessionCount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[FocusScoreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Friends]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Friends](
	[FriendID] [int] IDENTITY(1,1) NOT NULL,
	[RequesterID] [int] NOT NULL,
	[AddresseeID] [int] NOT NULL,
	[Status] [varchar](20) NOT NULL,
	[RequestDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[FriendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GoalLogs]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GoalLogs](
	[GoalLogID] [int] IDENTITY(1,1) NOT NULL,
	[GoalID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[LogDate] [date] NOT NULL,
	[ActualMinutes] [int] NULL,
	[IsGoalMet] [bit] NULL,
	[Notes] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[GoalLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Goals]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Goals](
	[GoalID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[GoalType] [varchar](50) NOT NULL,
	[TargetName] [varchar](100) NULL,
	[LimitMinutes] [int] NULL,
	[MinFocusMinutes] [int] NULL,
	[StartDate] [date] NOT NULL,
	[EndDate] [date] NULL,
	[IsActive] [bit] NULL,
	[Description] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[GoalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MoodLogs]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MoodLogs](
	[MoodLogID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[LogDate] [date] NOT NULL,
	[Mood] [varchar](20) NULL,
	[Notes] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MoodLogID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[NotificationID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[Message] [varchar](255) NOT NULL,
	[NotificationType] [varchar](50) NULL,
	[SentTime] [datetime] NOT NULL,
	[IsRead] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotificationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rewards]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rewards](
	[RewardID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Description] [varchar](500) NULL,
	[PointsRequired] [int] NOT NULL,
	[Category] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[RewardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sessions]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sessions](
	[SessionID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[EndTime] [datetime] NOT NULL,
	[SessionType] [varchar](30) NOT NULL,
	[Distractions] [int] NULL,
	[AppBlockedCount] [int] NULL,
	[DeviceUsed] [varchar](100) NULL,
	[WasSuccessful] [bit] NULL,
	[AdjustedSettingsNote] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[SessionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAchievements]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAchievements](
	[UserAchievementID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AchievementID] [int] NOT NULL,
	[EarnedDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserAchievementID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserAppPreferences]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserAppPreferences](
	[PreferenceID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[AppName] [varchar](100) NOT NULL,
	[ShouldBlock] [bit] NOT NULL,
	[IsPermanent] [bit] NULL,
	[LastModified] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PreferenceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRewards]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRewards](
	[UserRewardID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[RewardID] [int] NOT NULL,
	[DateEarned] [date] NOT NULL,
	[WasRedeemed] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserRewardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NOT NULL,
	[Email] [varchar](255) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[AgeGroup] [varchar](20) NULL,
	[Occupation] [varchar](100) NULL,
	[Gender] [varchar](10) NULL,
	[JoinDate] [date] NOT NULL,
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSettings]    Script Date: 17.05.2026 15:50:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSettings](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[SettingName] [varchar](100) NOT NULL,
	[SettingValue] [varchar](255) NULL,
	[LastUpdated] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AppsUsed] ADD  DEFAULT ((0)) FOR [IsBlockedDuringUse]
GO
ALTER TABLE [dbo].[AppsUsed] ADD  DEFAULT ((1)) FOR [WasIntentional]
GO
ALTER TABLE [dbo].[BlockedApps] ADD  DEFAULT ((1)) FOR [WasManual]
GO
ALTER TABLE [dbo].[CustomBlockRules] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[CustomBlockRules] ADD  DEFAULT ((0)) FOR [IsTemporary]
GO
ALTER TABLE [dbo].[DeviceUsage] ADD  DEFAULT ((0)) FOR [TotalUsageMinutes]
GO
ALTER TABLE [dbo].[FocusScores] ADD  DEFAULT ((0)) FOR [SessionCount]
GO
ALTER TABLE [dbo].[Friends] ADD  DEFAULT ('pending') FOR [Status]
GO
ALTER TABLE [dbo].[Goals] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[Notifications] ADD  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [Distractions]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [AppBlockedCount]
GO
ALTER TABLE [dbo].[Sessions] ADD  DEFAULT ((0)) FOR [WasSuccessful]
GO
ALTER TABLE [dbo].[UserAppPreferences] ADD  DEFAULT ((1)) FOR [ShouldBlock]
GO
ALTER TABLE [dbo].[UserAppPreferences] ADD  DEFAULT ((0)) FOR [IsPermanent]
GO
ALTER TABLE [dbo].[UserAppPreferences] ADD  DEFAULT (getdate()) FOR [LastModified]
GO
ALTER TABLE [dbo].[UserRewards] ADD  DEFAULT ((0)) FOR [WasRedeemed]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserSettings] ADD  DEFAULT (getdate()) FOR [LastUpdated]
GO
ALTER TABLE [dbo].[AppBlockHistory]  WITH CHECK ADD FOREIGN KEY([RuleID])
REFERENCES [dbo].[CustomBlockRules] ([RuleID])
GO
ALTER TABLE [dbo].[AppBlockHistory]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[AppsUsed]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[BlockedApps]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[CustomBlockRules]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[DailySummaries]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[DeviceUsage]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FocusScores]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([AddresseeID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Friends]  WITH CHECK ADD FOREIGN KEY([RequesterID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[GoalLogs]  WITH CHECK ADD FOREIGN KEY([GoalID])
REFERENCES [dbo].[Goals] ([GoalID])
GO
ALTER TABLE [dbo].[GoalLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Goals]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[MoodLogs]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Sessions]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAchievements]  WITH CHECK ADD FOREIGN KEY([AchievementID])
REFERENCES [dbo].[Achievements] ([AchievementID])
GO
ALTER TABLE [dbo].[UserAchievements]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserAppPreferences]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserRewards]  WITH CHECK ADD FOREIGN KEY([RewardID])
REFERENCES [dbo].[Rewards] ([RewardID])
GO
ALTER TABLE [dbo].[UserRewards]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[UserSettings]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[FocusScores]  WITH CHECK ADD CHECK  (([Score]>=(0) AND [Score]<=(100)))
GO
USE [master]
GO
ALTER DATABASE [DigitalFocusDB] SET  READ_WRITE 
GO
