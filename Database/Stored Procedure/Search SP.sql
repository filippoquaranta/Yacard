USE [YardeCart]
GO
/****** Object:  StoredProcedure [dbo].[CategoryEdit]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryEdit]
@categoryId int,
@categoryName varchar(50),
@categoryGroupId int
As
Begin    
if(Select count(*) as cnt from Category where CategoryId=@categoryId)=0 
 Begin    
 Insert into Category (CategoryName,CategoryGroupId,CreatedOn,CreatedBy)    
 Values (@categoryName,@categoryGroupId,getdate(),1)
 End    
Else
Begin

UPDATE Category 
set CategoryName=@categoryName,CategoryGroupId=@categoryGroupId
where CategoryId=@categoryId
END
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryDelete]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CategoryDelete]
@categoryId int
As
Delete from Category where CategoryId=@categoryId
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserDeleteStatus]    Script Date: 07/18/2013 19:32:06 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUserBlockStatus]    Script Date: 07/18/2013 19:32:06 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateAdDeleteStatus]    Script Date: 07/18/2013 19:32:06 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateAdBlockStatus]    Script Date: 07/18/2013 19:32:06 ******/
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
/****** Object:  StoredProcedure [dbo].[SelectProfile]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectProfile]  
@userid int  
as  
select 
UserName,FirstName,LastName,Gender,UserPassword,Email,Mobile,Address,StreetName,CityId,CountryId,StateId,ZipCode,
AcceptedOn,CreatedOn,UpdatedOn
from UserRegistration    
where   
UserId=@userid
GO
/****** Object:  StoredProcedure [dbo].[SelectCategoryGroup]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectCategoryGroup]
As
Select * from CategoryGroup order by CategoryGroupName
GO
/****** Object:  StoredProcedure [dbo].[SelectCategory]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectCategory]
As
Select C.CategoryId,C.CategoryName,G.CategoryGroupID,G.CategoryGroupName from Category C, CategoryGroup G
where C.CategoryGroupId=G.CategoryGroupID
 order by CategoryName
GO
/****** Object:  StoredProcedure [dbo].[SelectAllProfile]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SelectAllProfile]  

as  
select *
from UserRegistration
GO
/****** Object:  StoredProcedure [dbo].[SearchUsers]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchUsers]
(
@Keyword varchar(50)
)
as
select * from UserRegistration where UserName like '%'+ltrim(rtrim(@Keyword))+'%'
order by UserName
GO
/****** Object:  StoredProcedure [dbo].[SearchAdsByUsername]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchAdsByUsername]
(
@Keyword varchar(50)
)
as
select 
A.AdPostTitle,A.AdBlocked,A.AdDeleted,A.AdPostId,
U.UserName,U.FirstName,U.LastName,U.Email,U.UserBlocked,U.UserDeleted,U.UserID
 from AdDetails A, UserRegistration U 
where U.UserName like '%'+ltrim(rtrim(@Keyword))+'%' and A.UserId=U.UserID
order by A.AdPostTitle
GO
/****** Object:  StoredProcedure [dbo].[SearchAdsByKeyword]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SearchAdsByKeyword]
(
@Keyword varchar(50)
)  
As  

Select A.AdPostTitle,A.Description,A.CategoryId,A.CityId,A.CountryId,A.StateId,A.Price,
I.ImagePath,I.VideoLink,C.CategoryName,A.AdPostId,A.UserId,A.AdBlocked,A.AdDeleted
from  
AdDetails A, AdImageDetails I,Category C
Where
A.Keywords LIKE '%'+ltrim(rtrim(@Keyword))+'%' AND
(A.AdPostId=I.AdPostId and A.CategoryId=C.CategoryId)
GO
/****** Object:  StoredProcedure [dbo].[SearchAdsByAdtitle]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SearchAdsByAdtitle]
(
@Keyword varchar(50)
)
as
select 
A.AdPostTitle,A.AdBlocked,A.AdDeleted,A.AdPostId,
U.UserName,U.FirstName,U.LastName,U.Email,U.UserBlocked,U.UserDeleted,U.UserID
 from AdDetails A, UserRegistration U 
where A.AdPostTitle like '%'+ltrim(rtrim(@Keyword))+'%' and A.UserId=U.UserID
order by A.AdPostTitle
GO
/****** Object:  StoredProcedure [dbo].[GetAllAdDetails]    Script Date: 07/18/2013 19:32:06 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAdDetails]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetAdDetails]  
(  
@adpostId int,  
@userId int  
)  
As  

Select A.AdPostTitle,A.Description,A.CategoryId,A.CityId,A.CountryId,A.StateId,A.Price,
I.ImagePath,I.VideoLink,C.CategoryName
from  
UserRegistration U, AdDetails A, AdImageDetails I,Category C
Where  
A.UserId=U.UserId and U.UserId=@userId and A.AdPostId=@adpostId and I.AdPostId=@adpostId
and A.CategoryId=C.CategoryId
GO
/****** Object:  StoredProcedure [dbo].[CategoryGroupUpdate]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CategoryGroupUpdate]
@categoryGroupId int,
@categoryGroupName varchar(100)
As
Begin    
if(Select count(*) as cnt from CategoryGroup where CategoryGroupID=@categoryGroupId)=0 
 Begin    
 Insert into CategoryGroup (CategoryGroupName,CreatedOn,CreatedBy)    
 Values (@categoryGroupName,getdate(),1)
 End    
Else
Begin

UPDATE CategoryGroup 
set CategoryGroupName=@categoryGroupName
where CategoryGroupID=@categoryGroupId
END
END
GO
/****** Object:  StoredProcedure [dbo].[CategoryGroupDelete]    Script Date: 07/18/2013 19:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[CategoryGroupDelete]
@categoryGroupId int
As
Delete from CategoryGroup where CategoryGroupID=@categoryGroupId
GO
