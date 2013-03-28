--USE [master]
--GO
/****** Object:  Database [Gpserver]    Script Date: 05/26/2012 19:51:45 ******/
--CREATE DATABASE [Gpserver] ON  PRIMARY 
--( NAME -= N'Gpserver', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Gpserver.mdf' , SIZE = 10240KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
-- LOG ON 
--( NAME = N'Gpserver_log', FILENAME = N'E:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\Gpserver_log.ldf' , SIZE = 52416KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
--GO
ALTER DATABASE [Gpserver] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Gpserver].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Gpserver] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Gpserver] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Gpserver] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Gpserver] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Gpserver] SET ARITHABORT OFF
GO
ALTER DATABASE [Gpserver] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Gpserver] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Gpserver] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Gpserver] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Gpserver] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Gpserver] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Gpserver] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Gpserver] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Gpserver] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Gpserver] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Gpserver] SET  DISABLE_BROKER
GO
ALTER DATABASE [Gpserver] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Gpserver] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Gpserver] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Gpserver] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Gpserver] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Gpserver] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Gpserver] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Gpserver] SET  READ_WRITE
GO
ALTER DATABASE [Gpserver] SET RECOVERY FULL
GO
ALTER DATABASE [Gpserver] SET  MULTI_USER
GO
ALTER DATABASE [Gpserver] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Gpserver] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'Gpserver', N'ON'
GO
USE [Gpserver]
GO
/****** Object:  Table [dbo].[T_TEMP_POSITION]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TEMP_POSITION](
	[SIM] [nvarchar](30) NOT NULL,
	[LOCATION_MODEL] [nvarchar](30) NULL,
	[STATION_ID] [nvarchar](15) NULL,
	[PLOT_ID] [nvarchar](15) NULL,
	[LATI_DIRECTION] [nvarchar](10) NULL,
	[LATITUDE] [float] NULL,
	[LONG_DIRECTION] [nvarchar](10) NULL,
	[LONGITUDE] [float] NULL,
	[DIRECTION] [nvarchar](30) NULL,
	[SPEED] [float] NULL,
	[P_TIME] [datetime] NULL,
	[LATOFFSET] [float] NULL,
	[LNGOFFSET] [float] NULL,
	[STATUS] [nvarchar](10) NULL,
	[WORKTIME] [int] NULL,
	[ELEPRESS] [nvarchar](30) NULL,
	[SIGNAL] [int] NULL,
 CONSTRAINT [PK_T_TEMP_POSITION] PRIMARY KEY CLUSTERED 
(
	[SIM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_TEMP_POSITION] 
(
	[SIM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰʵʱ��λ��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_TEMP_POSITION'
GO
/****** Object:  Table [dbo].[T_TEMP_LATLNG]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TEMP_LATLNG](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LAT] [int] NULL,
	[LNG] [int] NULL,
	[OFFSET_X] [int] NULL,
	[OFFSET_Y] [int] NULL,
	[OFFSET_LNG] [nvarchar](15) NULL,
	[OFFSET_LAT] [nvarchar](15) NULL,
 CONSTRAINT [PK_T_TEMP_LATLNG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_TEMP_LATLNG] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ȸ��ͼ��ƫ���ݱ�' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_TEMP_LATLNG'
GO
/****** Object:  Table [dbo].[T_CAR_INFO]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_CAR_INFO](
	[CAR_TYPE_ID] [int] IDENTITY(1,1) NOT NULL,
	[TYPE_NAME] [nvarchar](10) NULL,
	[OUTLINE] [nvarchar](20) NULL,
	[ONLINE_ON] [nvarchar](20) NULL,
	[ONLINE_STOP] [nvarchar](20) NULL,
	[ONLINE_WORK] [nvarchar](20) NULL,
	[R1] [nvarchar](20) NULL,
	[REMARK] [nvarchar](20) NULL,
 CONSTRAINT [PK_T_CAR_INFO] PRIMARY KEY CLUSTERED 
(
	[CAR_TYPE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_CAR_INFO] 
(
	[CAR_TYPE_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'������Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_CAR_INFO'
GO
/****** Object:  Table [dbo].[T_AREA]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_AREA](
	[AREA_ID] [int] IDENTITY(1,1) NOT NULL,
	[NAME] [nvarchar](30) NULL,
 CONSTRAINT [PK_T_AREA] PRIMARY KEY CLUSTERED 
(
	[AREA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_AREA] 
(
	[AREA_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[T_POSITION]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_POSITION](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[SIM] [int] NULL,
	[LOCATION_MODEL] [nvarchar](30) NULL,
	[STATION_ID] [nvarchar](15) NULL,
	[PLOT_ID] [nvarchar](15) NULL,
	[LATI_DIRECTION] [nvarchar](10) NULL,
	[LATITUDE] [float] NULL,
	[LONG_DIRECTION] [nvarchar](10) NULL,
	[LONGITUDE] [float] NULL,
	[DIRECTION] [nvarchar](30) NULL,
	[SPEED] [float] NULL,
	[P_TIME] [datetime] NULL,
	[LATOFFSET] [float] NULL,
	[LNGOFFSET] [float] NULL,
	[STATUS] [nvarchar](10) NULL,
	[WORKTIME] [int] NULL,
	[ELEPRESS] [nvarchar](30) NULL,
	[SIGNAL] [int] NULL,
 CONSTRAINT [PK_T_POSITION] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_POSITION] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��ǰʵʱ��λ��Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_POSITION'
GO
/****** Object:  Table [dbo].[T_ORGAINZATION]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ORGAINZATION](
	[ORG_ID] [int] IDENTITY(1,1) NOT NULL,
	[UPORG_ID] [int] NULL,
	[ORG_LEVEL] [int] NULL,
	[NAME] [nvarchar](50) NULL,
	[ADDRESS] [nvarchar](50) NULL,
	[TELEPHONE] [nvarchar](20) NULL,
	[LINKMAN] [nvarchar](30) NULL,
	[CELLPHONE] [nvarchar](20) NULL,
	[REGISTERTIME] [datetime] NULL,
	[AREA_ID] [int] NULL,
	[WARNPHONE] [nvarchar](20) NULL,
	[FEESTANDARD] [int] NULL,
	[BALANCE] [int] NULL,
	[SHORT_NAME] [nvarchar](50) NULL,
	[R1] [nvarchar](50) NULL,
	[R2] [nvarchar](50) NULL,
	[REMARK] [nvarchar](250) NULL,
 CONSTRAINT [PK_T_ORGAINZATION] PRIMARY KEY CLUSTERED 
(
	[ORG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_ORGAINZATION] 
(
	[ORG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��֯������Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_ORGAINZATION'
GO
/****** Object:  Table [dbo].[T_ACCOUNT]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_ACCOUNT](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PAIDER] [nvarchar](20) NULL,
	[EXPENSE] [int] NULL,
	[PAIDDATE] [datetime] NULL,
	[REMARK] [nvarchar](50) NULL,
	[ORG_ID] [int] NULL,
 CONSTRAINT [PK_T_ACCOUNT] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_ACCOUNT] 
(
	[ID] ASC,
	[PAIDER] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ɷ��˵���Ϣ��¼' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_ACCOUNT'
GO
/****** Object:  Table [dbo].[T_USER]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_USER](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ORG_ID] [int] NULL,
	[USERID] [nvarchar](20) NULL,
	[PWD] [nvarchar](30) NULL,
	[NAME] [nvarchar](30) NULL,
	[REGISTERTIME] [datetime] NULL,
	[CELLPHONE] [nvarchar](30) NULL,
	[OILELE] [int] NULL,
	[MODIFY] [int] NULL,
	[EXPORT] [int] NULL,
 CONSTRAINT [PK_T_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_USER] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��½�˻���Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_USER'
GO
/****** Object:  Table [dbo].[T_TERMINAL]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TERMINAL](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ORG_ID] [int] NULL,
	[SIM] [nvarchar](30) NULL,
	[PHONE] [nvarchar](20) NULL,
	[CAR_TYPE_ID] [int] NULL,
	[MODEL] [nvarchar](30) NULL,
	[CARNUMBER] [nvarchar](40) NULL,
	[GAS] [nvarchar](30) NULL,
	[REGISTERTIME] [datetime] NULL,
	[START_TIME] [nvarchar](30) NULL,
	[END_TIME] [nvarchar](30) NULL,
	[PRIVILEGE1] [nvarchar](30) NULL,
	[PRIVILEGE2] [nvarchar](30) NULL,
	[PRIVILEGE3] [nvarchar](30) NULL,
	[P_PERIOD] [int] NULL,
	[BASEKILO] [int] NULL,
	[MAINTENANCE] [int] NULL,
	[USERNAME] [nvarchar](30) NULL,
	[CELLPHONE] [nvarchar](30) NULL,
	[AREA_ID] [int] NULL,
	[PRINCIPAL] [nvarchar](30) NULL,
	[REMARK] [nvarchar](100) NULL,
 CONSTRAINT [PK_T_TERMINAL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_TERMINAL] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_2] ON [dbo].[T_TERMINAL] 
(
	[SIM] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ն���Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_TERMINAL'
GO
/****** Object:  Table [dbo].[T_RESPONSE]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_RESPONSE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TME] [datetime] NULL,
	[RESPONSE] [nvarchar](40) NULL,
	[SIM_ID] [int] NULL,
 CONSTRAINT [PK_T_RESPONSE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_RESPONSE] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�������ͨѶ ������Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_RESPONSE'
GO
/****** Object:  Table [dbo].[T_REQUEST]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_REQUEST](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TIME] [datetime] NULL,
	[COMMAND] [nvarchar](40) NULL,
	[SIM_ID] [int] NULL,
 CONSTRAINT [PK_T_REQUEST] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [key1] ON [dbo].[T_REQUEST] 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'����������� ���������' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_REQUEST'
GO
/****** Object:  Table [dbo].[T_LOG]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_LOG](
	[LOG_ID] [int] IDENTITY(1,1) NOT NULL,
	[USER_ID] [int] NULL,
	[LOG_EVENT] [nvarchar](100) NULL,
	[LOG_TIME] [datetime] NULL,
 CONSTRAINT [PK_T_LOG] PRIMARY KEY CLUSTERED 
(
	[LOG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_LOG] 
(
	[LOG_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'��־��Ϣ��' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_LOG'
GO
/****** Object:  Table [dbo].[T_FENCE]    Script Date: 05/26/2012 19:51:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_FENCE](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SIM_ID] [int] NOT NULL,
	[ONOFF] [int] NULL,
	[LONGITUDE] [float] NULL,
	[LATITUDE] [float] NULL,
	[RADIOUS] [float] NULL,
 CONSTRAINT [PK_T_FENCE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_1] ON [dbo].[T_FENCE] 
(
	[SIM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'�ն˵���դ����Ϣ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'T_FENCE'
GO
/****** Object:  ForeignKey [FK_T_ORGAIN_REFERENCE_T_AREA]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_ORGAINZATION]  WITH CHECK ADD  CONSTRAINT [FK_T_ORGAIN_REFERENCE_T_AREA] FOREIGN KEY([AREA_ID])
REFERENCES [dbo].[T_AREA] ([AREA_ID])
GO
ALTER TABLE [dbo].[T_ORGAINZATION] CHECK CONSTRAINT [FK_T_ORGAIN_REFERENCE_T_AREA]
GO
/****** Object:  ForeignKey [FK_T_ORGAIN_REFERENCE_T_ORGAIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_ORGAINZATION]  WITH CHECK ADD  CONSTRAINT [FK_T_ORGAIN_REFERENCE_T_ORGAIN] FOREIGN KEY([UPORG_ID])
REFERENCES [dbo].[T_ORGAINZATION] ([ORG_ID])
GO
ALTER TABLE [dbo].[T_ORGAINZATION] CHECK CONSTRAINT [FK_T_ORGAIN_REFERENCE_T_ORGAIN]
GO
/****** Object:  ForeignKey [FK_T_ACCOUN_REFERENCE_T_USER]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_ACCOUNT]  WITH CHECK ADD  CONSTRAINT [FK_T_ACCOUN_REFERENCE_T_USER] FOREIGN KEY([ORG_ID])
REFERENCES [dbo].[T_ORGAINZATION] ([ORG_ID])
GO
ALTER TABLE [dbo].[T_ACCOUNT] CHECK CONSTRAINT [FK_T_ACCOUN_REFERENCE_T_USER]
GO
/****** Object:  ForeignKey [FK_T_USER_REFERENCE_T_ORGAIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_USER]  WITH CHECK ADD  CONSTRAINT [FK_T_USER_REFERENCE_T_ORGAIN] FOREIGN KEY([ORG_ID])
REFERENCES [dbo].[T_ORGAINZATION] ([ORG_ID])
GO
ALTER TABLE [dbo].[T_USER] CHECK CONSTRAINT [FK_T_USER_REFERENCE_T_ORGAIN]
GO
/****** Object:  ForeignKey [FK_T_TERMIN_REFERENCE_T_CAR_IN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_TERMINAL]  WITH CHECK ADD  CONSTRAINT [FK_T_TERMIN_REFERENCE_T_CAR_IN] FOREIGN KEY([CAR_TYPE_ID])
REFERENCES [dbo].[T_CAR_INFO] ([CAR_TYPE_ID])
GO
ALTER TABLE [dbo].[T_TERMINAL] CHECK CONSTRAINT [FK_T_TERMIN_REFERENCE_T_CAR_IN]
GO
/****** Object:  ForeignKey [FK_T_TERMIN_REFERENCE_T_ORGAIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_TERMINAL]  WITH CHECK ADD  CONSTRAINT [FK_T_TERMIN_REFERENCE_T_ORGAIN] FOREIGN KEY([ORG_ID])
REFERENCES [dbo].[T_ORGAINZATION] ([ORG_ID])
GO
ALTER TABLE [dbo].[T_TERMINAL] CHECK CONSTRAINT [FK_T_TERMIN_REFERENCE_T_ORGAIN]
GO
/****** Object:  ForeignKey [FK_T_RESPON_REFERENCE_T_TERMIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_RESPONSE]  WITH CHECK ADD  CONSTRAINT [FK_T_RESPON_REFERENCE_T_TERMIN] FOREIGN KEY([SIM_ID])
REFERENCES [dbo].[T_TERMINAL] ([ID])
GO
ALTER TABLE [dbo].[T_RESPONSE] CHECK CONSTRAINT [FK_T_RESPON_REFERENCE_T_TERMIN]
GO
/****** Object:  ForeignKey [FK_T_REQUES_REFERENCE_T_TERMIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_REQUEST]  WITH CHECK ADD  CONSTRAINT [FK_T_REQUES_REFERENCE_T_TERMIN] FOREIGN KEY([SIM_ID])
REFERENCES [dbo].[T_TERMINAL] ([ID])
GO
ALTER TABLE [dbo].[T_REQUEST] CHECK CONSTRAINT [FK_T_REQUES_REFERENCE_T_TERMIN]
GO
/****** Object:  ForeignKey [FK_T_LOG_REFERENCE_T_USER]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_LOG]  WITH CHECK ADD  CONSTRAINT [FK_T_LOG_REFERENCE_T_USER] FOREIGN KEY([USER_ID])
REFERENCES [dbo].[T_USER] ([ID])
GO
ALTER TABLE [dbo].[T_LOG] CHECK CONSTRAINT [FK_T_LOG_REFERENCE_T_USER]
GO
/****** Object:  ForeignKey [FK_T_FENCE_REFERENCE_T_TERMIN]    Script Date: 05/26/2012 19:51:47 ******/
ALTER TABLE [dbo].[T_FENCE]  WITH CHECK ADD  CONSTRAINT [FK_T_FENCE_REFERENCE_T_TERMIN] FOREIGN KEY([SIM_ID])
REFERENCES [dbo].[T_TERMINAL] ([ID])
GO
ALTER TABLE [dbo].[T_FENCE] CHECK CONSTRAINT [FK_T_FENCE_REFERENCE_T_TERMIN]
GO