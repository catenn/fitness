CREATE DATABASE Fitness
GO


USE [Fitness]
GO
/****** Object:  Table [dbo].[RecipePhotos]    Script Date: 6/29/2014 6:06:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RecipePhotos](
	[RecipePhotoID] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](255) NOT NULL,
	[RecipeId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipePhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Recipes]    Script Date: 6/29/2014 6:06:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recipes](
	[RecipeID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Ingredients] [ntext] NULL,
	[Directions] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[RecipeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[RecipePhotos]  WITH CHECK ADD FOREIGN KEY([RecipeId])
REFERENCES [dbo].[Recipes] ([RecipeID])
GO
