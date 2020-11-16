USE [Store]
GO

alter proc p_createEmployee 
(
	@Name	Varchar(20),
	@Gender	Int,
	@Email	Varchar(50),
	@IsSuper	Bit,
	@PhoneNumber	Varchar(20),
	@LoginId	Varchar(20),
	@LoginPWD	Varchar(50),
	@Disabled	Bit,
	@success bit = 0 output
)
as
begin
INSERT INTO [dbo].[Employee]
           ([Name]
           ,[Gender]
           ,[Email]
           ,[IsSuper]
           ,[PhoneNumber]
           ,[LoginId]
           ,[LoginPWD]
           ,[Disabled]
           ,[CreatedTime]
           ,[ModifiedTime])
     VALUES
           (@Name
           ,@Gender
           ,@Email
           ,@IsSuper
           ,@PhoneNumber
           ,@LoginId
           ,@LoginPWD
           ,@Disabled
           ,GETDATE()
           ,GETDATE())
		   set @success = 1
end
GO

alter proc pc_Employee
(
	@PageIndex int,
	@PageSize decimal,
	@Name varchar(20),
	@Gender int,
	@PageCount int output
)
as
begin
	if @Gender>0
		begin
			select * from Employee where Disabled=0 and Name like '%'+@Name+'%' and Gender=@Gender order by Id offset (@PageIndex-1)*cast(@PageSize as int) rows fetch next cast(@PageSize as int) rows only
		end
	else
		begin
			select * from Employee where Disabled=0 and Name like '%'+@Name+'%' order by Id offset (@PageIndex-1)*cast(@PageSize as int) rows fetch next cast(@PageSize as int) rows only
		end
select @PageCount = CEILING(count(Id)/@PageSize) from Employee;
end
go

alter proc p_updateEmployee 
(
	@Id int,
	@Name	Varchar(20),
	@Gender	Int,
	@Email	Varchar(50),
	@IsSuper	Bit = 0,
	@PhoneNumber	Varchar(20),
	@LoginId	Varchar(20) = null,
	@LoginPWD	Varchar(50) = null,
	@Disabled	Bit = 0,
	@success bit = 0 output
)
as
begin
UPDATE [dbo].[Employee]
   SET [Name] = ISNULL(@Name, Name)
      ,[Gender] = ISNULL(@Gender, Gender)
      ,[Email] = ISNULL(@Email, Email)
      ,[IsSuper] = ISNULL(@IsSuper, IsSuper)
      ,[PhoneNumber] = ISNULL(@PhoneNumber, PhoneNumber)
      ,[LoginId] = ISNULL(@LoginId, LoginId)
      ,[LoginPWD] = ISNULL(@LoginPWD, LoginPWD)
      ,[Disabled] = ISNULL(@Disabled, Disabled)
      ,[ModifiedTime] = getDate()
 WHERE Id=@Id
 set @success = 1
end
GO


alter proc p_deleteEmployee 
(
	@Id int,
	@success bit = 0 output
)
as
begin
UPDATE [dbo].[Employee]
   SET [Disabled] = 1
      ,[ModifiedTime] = getDate()
 WHERE Id=@Id
 set @success = 1
end
GO

