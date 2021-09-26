USE [test]
GO

/****** Object: Table [dbo].[Users] Script Date: 26.09.2021 14:26:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Users] (
    [Id]        INT            IDENTITY (1, 1) NOT NULL,
    [FirstName] NVARCHAR (50)  NULL,
    [LastName]  NVARCHAR (50)  NULL,
    [Email]     NVARCHAR (100) NULL,
    [password]  NVARCHAR (24)  NULL
);


