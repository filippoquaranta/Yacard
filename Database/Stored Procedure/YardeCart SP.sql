USE [YardeCart]
GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ValidateUser] 
(
@UserName Nvarchar(50),
@UserPassword Nvarchar(50)
)
as

IF NOT EXISTS (Select UserName from UserRegistration where UserName=@UserName and UserStatus=1) 
		 BEGIN

				  RAISERROR ('InValid User name. Please try again!.',16,1)
					RETURN -1 
		 END

IF NOT EXISTS (Select UserPassword from UserRegistration where UserPassword=@UserPassword and UserStatus=1) 
		 BEGIN

				  RAISERROR ('InValid Password. Please try again!.',16,1)
					RETURN -1 
		 END

If EXISTS(Select * from UserRegistration where UserName=@UserName and userPassword=@UserPassword and UserStatus=1)
		 BEGIN
			Select UserId from UserRegistration where UserName=@UserName and userPassword=@UserPassword and UserStatus=1
		 END
ELSE
		 BEGIN
				  RAISERROR ('InValid UserName and Password. Please try again!.',16,1)
				  RETURN -1 
		 END
Select UserId from UserRegistration where UserName=@UserName and userPassword=@UserPassword and UserStatus=1
GO
/****** Object:  StoredProcedure [dbo].[ValidateAdmin]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[ValidateAdmin] 
(
@adminName Nvarchar(50),
@adminPassword Nvarchar(50)
)
as

IF NOT EXISTS (Select AdminName from AdminLogin where AdminName=@adminName) 
		 BEGIN

				  RAISERROR ('Invalid Admin name. Please try again!.',16,1)
					RETURN -1 
		 END

IF NOT EXISTS (Select AdminPassword from AdminLogin where AdminPassword=@adminPassword) 
		 BEGIN

				  RAISERROR ('Invalid Password. Please try again!.',16,1)
					RETURN -1 
		 END

If EXISTS(Select * from AdminLogin where AdminName=@adminName and AdminPassword=@adminPassword)
		 BEGIN
			Select AdminID from AdminLogin where AdminName=@adminName and AdminPassword=@adminPassword
		 END
ELSE
		 BEGIN
				  RAISERROR ('InValid adminName and Password. Please try again!.',16,1)
				  RETURN -1 
		 END
Select AdminID from AdminLogin where AdminName=@adminName and AdminName=@adminPassword
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDeleteStatus]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUserDeleteStatus]
@userid int,
@delvalue int
As
Update UserRegistration set UserDeleted=@delvalue where UserId=@userid
Update AdDetails set AdDeleted=@delvalue where UserId=@userid
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserBlockStatus]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateUserBlockStatus]
@userid int,
@blockvalue int
As
Update UserRegistration set UserBlocked=@blockvalue where UserId=@userid
Update AdDetails set AdBlocked=@blockvalue where UserId=@userid
GO
/****** Object:  StoredProcedure [dbo].[UpdateAdDeleteStatus]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateAdDeleteStatus]
@adpostid int,
@delvalue int
As
Update AdDetails set AdDeleted=@delvalue where AdPostId=@adpostid
GO
/****** Object:  StoredProcedure [dbo].[UpdateAdBlockStatus]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[UpdateAdBlockStatus]
@adpostid int,
@blockvalue int
As
Update AdDetails set AdBlocked=@blockvalue where AdPostId=@adpostid
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProfile]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectAllProfile]  

as  
select *
from UserRegistration
GO
/****** Object:  StoredProcedure [dbo].[GetAllAdDetails]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAllAdDetails]  
As  

Select A.AdPostTitle,A.Description,A.CategoryId,A.CityId,A.CountryId,A.StateId,A.Price,
I.ImagePath,I.VideoLink,C.CategoryName,A.AdPostId,A.UserId,A.AdBlocked,A.AdDeleted
from  
AdDetails A, AdImageDetails I,Category C
Where  
A.AdPostId=I.AdPostId and A.CategoryId=C.CategoryId
GO
/****** Object:  StoredProcedure [dbo].[CategoryEdit]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryEdit]
@categoryId int,
@categoryName varchar(50)
As
Begin    
if(Select count(*) as cnt from Category where CategoryId=@categoryId)=0 
 Begin    
 Insert into Category (CategoryName,CreatedOn,CreatedBy)    
 Values (@categoryName,getdate(),1)
 End    
Else
Begin

UPDATE Category 
set CategoryName=@categoryName
where CategoryId=@categoryId
END
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryDelete]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CategoryDelete]
@categoryId int
As
Delete from Category where CategoryId=@categoryId
GO
/****** Object:  StoredProcedure [dbo].[AvailableMail]    Script Date: 07/16/2013 19:36:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[AvailableMail] 
(
@email Nvarchar(50)
)
as

Select UserId,Username,Email from UserRegistration where Email=LTrim(RTrim(@email))
GO
