USE [Store]
GO 

create proc p_createProductCategory
(
	@ParentId	Int,
	@Category	Varchar(30),
	@Summary	Varchar(60),
	@Remark	varchar(250),
	@IsRecommend	Bit,
	@success bit = 0 output
)
as
begin
INSERT INTO [dbo].[ProductCategory]
           ([ParentId]
           ,[Category]
           ,[Summary]
           ,[Remark]
           ,[CreatedTime]
           ,[ModifiedTime]
           ,[IsRecommend]
           ,[Deleted])
     VALUES
           (@ParentId
           ,@Category
           ,@Summary
           ,@Remark
           ,getdate()
           ,getdate()
           ,@IsRecommend
           ,0)
		   set @success = 1
end
GO

create proc pc_ProductCategory
(
	@PageIndex int,
	@PageSize decimal,
	@Category varchar(50) = '',
	@ParentId int = null,
	@Id int = null,
	@PageCount int output
)
as
begin
	if @Id is null
		begin
			select pc1.*, pc2.Category ParentCategory from ProductCategory pc1 left join ProductCategory pc2
			on pc1.ParentId = pc2.Id  
			where pc1.Deleted=0
				and pc1.ParentId = ISNULL(@ParentId, pc1.ParentId)
				and pc1.Category like '%'+@Category+'%'
			order by Id 
			offset (@PageIndex-1)*cast(@PageSize as int) rows 
			fetch next cast(@PageSize as int) rows only
			select @PageCount = CEILING(count(Id)/@PageSize) from ProductCategory where Deleted=0
				and ParentId = ISNULL(@ParentId, ParentId)
				and Category like '%'+@Category+'%'
		end
	else
		begin
			select * from ProductCategory where Id = @Id
			select @PageCount = CEILING(count(Id)/@PageSize) from ProductCategory where Id = @Id;
		end
end
go

create proc p_updateProductCategory
(
	@Id int,
	@ParentId	Int = null,
	@Category	Varchar(30) = null,
	@Summary	Varchar(60) = null,
	@Remark	varchar(250) = null,
	@IsRecommend	Bit = null,
	@Deleted bit = null,
	@success bit = 0 output
)
as
begin
UPDATE [dbo].[ProductCategory]
   SET [ParentId] = ISNULL(@ParentId, ParentId)
      ,[Category] = ISNULL(@Category, Category)
      ,[Summary] = ISNULL(@Summary, Summary)
      ,[Remark] = ISNULL(@Remark, Remark)
      ,[IsRecommend] = ISNULL(@IsRecommend, IsRecommend)
      ,[Deleted] = ISNULL(@Deleted, Deleted)
 WHERE Id=@Id
 set @success = 1
end
GO

