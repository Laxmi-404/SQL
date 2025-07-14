USE [MyDatabase]
GO

/****** Object:  Table [dbo].[persons1]    Script Date: 06-07-2025 09:08:19 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[persons1](
	[id] [int] NOT NULL,
	[person_name] [varchar](50) NOT NULL,
	[birth_date] [date] NULL,
	[phone] [varchar](15) NOT NULL
) ON [PRIMARY]
GO


