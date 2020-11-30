USE [Store] 
go
create proc p_createProduct
(
	@CategoryId	int,	--类别ID
	@SubCategoryId	Int,	--子类别ID
	@Name	Varchar	(100),	--商品名称
	@Summary	Varchar	(250),	--简介
	@Picture	Varchar	(125),	--图片URL
	@Price	Money,	--单价
	@OnSale	Bit = 1,	--0不在售1在售
	@Description	Varchar	(1000)	,		--描述
	@ActualStock	Int = 0,	--实际库存
	@AvailableStock	Int = 0,	--实际库存
	@HoldingStock	Int = 0,	--实际库存
	@IsRecommend	bit = 0,				--是否推荐首页
	@success bit = 0 output
)
as
begin
INSERT INTO [dbo].[Product]
           ([CategoryId]
           ,[SubCategoryId]
           ,[Name]
           ,[Summary]
           ,[Picture]
           ,[Price]
           ,[OnSale]
           ,[Description]
           ,[ActualStock]
           ,[AvailableStock]
           ,[HoldingStock]
           ,[Deleted]
           ,[CreatedTime]
           ,[ModifiedTime]
           ,[IsRecommend])
     VALUES
           (@CategoryId
           ,@SubCategoryId
           ,@Name
           ,@Summary
           ,@Picture
           ,@Price
           ,@OnSale
           ,@Description
           ,@ActualStock
           ,@AvailableStock
           ,@HoldingStock
           ,0
           ,getdate()
           ,getdate()
           ,@IsRecommend)
		   set @success = 1
end
GO

create proc pc_Product
(
	@PageIndex int = 1,
	@PageSize decimal = 10,
	@CategoryId varchar(20) = null,
	@SubCategoryId int = null,
	@Name varchar(100) = '',
	@Id int = null,
	@PageCount int = 0 output
)
as
begin
	if @Id is null
		begin
			select pc1.Category ParentCategory, pc2.Category SubCategory, p.* 
			from (
				select * from Product
					where Deleted=0 
					and Name like '%'+ISNULL(@Name,'')+'%' 
					and CategoryId = ISNULL(@CategoryId, CategoryId)
					and SubCategoryId = ISNULL(@SubCategoryId, SubCategoryId)
					order by Id offset (@PageIndex-1)*cast(@PageSize as int) rows 
					fetch next cast(@PageSize as int) rows only
			)p
			left join ProductCategory pc1 
			on p.CategoryId = pc1.Id 
			left join ProductCategory pc2 
			on p.SubCategoryId = pc2.Id
			select @PageCount = CEILING(count(Id)/@PageSize) from Product
					where Deleted=0 
					and Name like '%'+ISNULL(@Name,'')+'%' 
					and CategoryId = ISNULL(@CategoryId, CategoryId) 
					and SubCategoryId = ISNULL(@SubCategoryId, SubCategoryId);
		end
	else
		begin
			select pc1.Category ParentCategory, pc2.Category SubCategory, p.* 
			from (
				select * from Product 
					where Id = @Id
					and Deleted = 0
			)p 
			left join ProductCategory pc1 
			on p.CategoryId = pc1.Id 
			left join ProductCategory pc2 
			on p.SubCategoryId = pc2.Id
			select @PageCount = count(id) from Product where Id = @Id;
		end
end
go

create proc p_updateProduct
(
	@Id int,
	@CategoryId	int = null,	--类别ID
	@SubCategoryId	Int = null,	--子类别ID
	@Name	Varchar	(100) = null,	--商品名称
	@Summary	Varchar	(250) = null,	--简介
	@Picture	Varchar	(125) = null,	--图片URL
	@Price	Money = null,	--单价
	@OnSale	Bit = 1,	--0不在售1在售
	@Description	Varchar	(1000) = null,		--描述
	@ActualStock	Int = 0,	--实际库存
	@AvailableStock	Int = 0,	--实际库存
	@HoldingStock	Int = 0,	--实际库存
	@Deleted bit = 0,
	@IsRecommend	bit = 0,				--是否推荐首页
	@success bit = 0 output
)
as
begin
	UPDATE [dbo].[Product]
   SET [CategoryId] = ISNULL(@CategoryId, CategoryId)
      ,[SubCategoryId] = ISNULL(@SubCategoryId, SubCategoryId)
      ,[Name] = ISNULL(@Name, Name)
      ,[Summary] = ISNULL(@Summary, Summary)
      ,[Picture] =ISNULL(@Picture, Picture) 
      ,[Price] = ISNULL(@Price, Price)
      ,[OnSale] = ISNULL(@OnSale, OnSale)
      ,[Description] = ISNULL(@Description, Description)
      ,[ActualStock] = ISNULL(@ActualStock, ActualStock)
      ,[AvailableStock] =ISNULL(@AvailableStock, AvailableStock) 
      ,[HoldingStock] = ISNULL(@HoldingStock, HoldingStock)
      ,[Deleted] = ISNULL(@Deleted, Deleted)
      ,[ModifiedTime] = getdate()
      ,[IsRecommend] = ISNULL(@IsRecommend, IsRecommend)
	WHERE Id=@Id
	set @success = 1
end
GO