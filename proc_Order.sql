use Store
go

create proc p_createorder
(
	@code varchar(20),
	@userId int,
	@productId int,
	@productCount int,
	@msg varchar(250),
	@success bit output
)
as
begin
	begin transaction
	begin try
	--订单表插入新的数据
	insert into [Order]
	values(@code,
			@userId,
			0,
			0,
			0,
			GETDATE(),
			GETDATE(),
			@msg)
    
	declare @orderId int 
	set @orderId = SCOPE_IDENTITY()
	--订单明细表插入新的数据
	insert into [OrderDetail]
	select @orderId,
			@ProductId,
			Price,
			@ProductCount,
			@productCount*Price,
			getdate(),
			getdate()
	from Product 
	where Id=@productId

	--将订单中的所有产品的金额统计到订单主表中去
	declare @totalAmount decimal
	select @totalAmount = sum(amount)
	from OrderDetail
	where orderid = @orderId

	update odr
	set Amount =@totalAmount
	from [Order] odr
	where odr.id = @orderId
	--提交事务
	commit transaction

	end try
	begin catch
	--事务回滚
	rollback transaction
	end catch

	set @success =1 
end
go


create proc p_createOrderFormCart
(
		@code varchar(20),
		@userId int,
		@remark nvarchar(250),
		@cardIds varchar(100),
		@success bit output
)as

begin

--开始事务
begin tran

begin try

		--订单表插入新的数据
		insert into [Order]
		values(
				@code,
				@userId,
				0,
				0,
				0,
				getdate(),
				getdate(),
				@remark)
				declare @orderId int
				set @orderId=SCOPE_IDENTITY()
		--订单明细表插入新的数据
		insert into [OrderDetail]
		select @orderId,
			   ProductId,
			   pro.Price,
			   cart.ProductCount,
			   pro.Price*Cart.ProductCount,
			   getdate(),
			   getdate()

		from   Cart
		join   Product pro on Cart.ProductId=pro.Id
		where  exists(
			 select 1 from [dbo].[F_strToTable](@cardIds)as t
			 where Cart.Id=t.[value]
		)
		--将订单中的所有产品的金额统计到订单主表中去
		declare @totalAmount decimal
		select @totalAmount = sum(Amount)
		from	OrderDetail
		where	OrderId=@orderId

		update [Order]
		set	   Amount=@totalAmount
		from   [Order]

		--删除购物车中的产品信息（已经下单的产品从购物车中删除）
		delete from Cart
		where  exists(
			select 1 from [dbo].[F_strToTable](@cardIds)as t
			 where Cart.Id=t.[value]
		)



--提交事务
	commit tran
	set @success=1
 end try

begin catch

--事务回滚

rollback tran
set @success=0
end catch

end
go

create function [dbo].[F_strToTable]
(
	@str varchar(1000)
)
Returns @splitTable Table
(
   value varchar(50)
)
As
--该函数用于把一个用逗号分隔的多个数据字符串变成一个表的一列，例如字符串'1,2,3,4,5' 将编程一个表，这个表
Begin
set @str = @str+','
Declare @insertStr varchar(50) --截取后的第一个字符串
Declare @newstr varchar(1000) --截取第一个字符串后剩余的字符串
set @insertStr = left(@str,charindex(',',@str)-1)
set @newstr = stuff(@str,1,charindex(',',@str),'')
Insert @splitTable Values(@insertStr)
while(len(@newstr)>0)
begin
   set @insertStr = left(@newstr,charindex(',',@newstr)-1)
   Insert @splitTable Values(@insertStr)
   set @newstr = stuff(@newstr,1,charindex(',',@newstr),'')
end
Return
end
go



create proc readconfilm
(
@cartids varchar(100),
@success int output
)as

begin


		select*
		from Cart join Product pro on pro.Id=Cart.ProductId
		where exists(
		select 1 
		from[dbo].[F_strToTable] (@cartids)
		where [value]=Cart.Id
		
		)
	set @success=1

end
go