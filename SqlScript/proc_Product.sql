USE [Store]
GO

alter proc p_createProduct
(
	@CategoryId	int,	--���ID
	@SubCategoryId	Int,	--�����ID
	@Name	Varchar	(100),	--��Ʒ����
	@Summary	Varchar	(250),	--���
	@Picture	Varchar	(125),	--ͼƬURL
	@Price	Money,	--����
	@OnSale	Bit = 1,	--0������1����
	@Description	Varchar	(1000)	,		--����
	@ActualStock	Int = 0,	--ʵ�ʿ��
	@AvailableStock	Int = 0,	--ʵ�ʿ��
	@HoldingStock	Int = 0,	--ʵ�ʿ��
	@IsRecommend	bit = 0,				--�Ƿ��Ƽ���ҳ
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


alter proc pc_Product
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
	if @Id = null
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
		end
	else
		begin
			select pc1.Category ParentCategory, pc2.Category SubCategory, p.* 
			from (
				select * from Product
					where Deleted=0 
					and Name like '%'+@Name+'%' 
					and CategoryId = ISNULL(@CategoryId, CategoryId) 
					and SubCategoryId = ISNULL(@SubCategoryId, SubCategoryId) 
					order by Id offset (@PageIndex-1)*cast(@PageSize as int) rows 
					fetch next cast(@PageSize as int) rows only
			)p
			left join ProductCategory pc1 
			on p.CategoryId = pc1.Id 
			left join ProductCategory pc2 
			on p.SubCategoryId = pc2.Id
		end
select @PageCount = CEILING(count(Id)/@PageSize) from Product;
end
go

alter proc p_updateProduct
(
	@Id int,
	@CategoryId	int = null,	--���ID
	@SubCategoryId	Int = null,	--�����ID
	@Name	Varchar	(100) = null,	--��Ʒ����
	@Summary	Varchar	(250) = null,	--���
	@Picture	Varchar	(125) = null,	--ͼƬURL
	@Price	Money = null,	--����
	@OnSale	Bit = 1,	--0������1����
	@Description	Varchar	(1000) = null,		--����
	@ActualStock	Int = 0,	--ʵ�ʿ��
	@AvailableStock	Int = 0,	--ʵ�ʿ��
	@HoldingStock	Int = 0,	--ʵ�ʿ��
	@Deleted bit = 0,
	@IsRecommend	bit = 0,				--�Ƿ��Ƽ���ҳ
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





select * from product