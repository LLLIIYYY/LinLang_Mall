use Store
go

create proc [dbo].[p_createUser]
	(
		@NickName varchar(20)='_blank',
        @Gender bit=0,
        @Email varchar(50)=null,
        
        @Balance money=0,
        @LoginId varchar(20),
        @LoginPWD varchar(50),
      @success bit output

		   )as
		   begin
		   if exists(select 1 from[User] where LoginId=@LoginId)
		   begin
		   set @success=0
		   return
		   end

		   INSERT INTO [dbo].[User]
           ([NickName]
           ,[Gender]
           ,[Email]
           ,[Birthday]
           ,[Balance]
           ,[LoginId]
           ,[LoginPWD]
           ,[CreateTime])
     VALUES
           (@NickName
           ,@Gender
           ,@Email
           ,getdate()
           ,@Balance
           ,@LoginId
           ,@LoginPWD
          ,getdate()
		  )
		  set @success=1
		   end

		   select *from [User]
GO