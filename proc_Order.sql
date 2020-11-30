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
	--����������µ�����
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
	--������ϸ������µ�����
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

	--�������е����в�Ʒ�Ľ��ͳ�Ƶ�����������ȥ
	declare @totalAmount decimal
	select @totalAmount = sum(amount)
	from OrderDetail
	where orderid = @orderId

	update odr
	set Amount =@totalAmount
	from [Order] odr
	where odr.id = @orderId
	--�ύ����
	commit transaction

	end try
	begin catch
	--����ع�
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

--��ʼ����
begin tran

begin try

		--����������µ�����
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
		--������ϸ������µ�����
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
		--�������е����в�Ʒ�Ľ��ͳ�Ƶ�����������ȥ
		declare @totalAmount decimal
		select @totalAmount = sum(Amount)
		from	OrderDetail
		where	OrderId=@orderId

		update [Order]
		set	   Amount=@totalAmount
		from   [Order]

		--ɾ�����ﳵ�еĲ�Ʒ��Ϣ���Ѿ��µ��Ĳ�Ʒ�ӹ��ﳵ��ɾ����
		delete from Cart
		where  exists(
			select 1 from [dbo].[F_strToTable](@cardIds)as t
			 where Cart.Id=t.[value]
		)



--�ύ����
	commit tran
	set @success=1
 end try

begin catch

--����ع�

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
--�ú������ڰ�һ���ö��ŷָ��Ķ�������ַ������һ�����һ�У������ַ���'1,2,3,4,5' �����һ���������
Begin
set @str = @str+','
Declare @insertStr varchar(50) --��ȡ��ĵ�һ���ַ���
Declare @newstr varchar(1000) --��ȡ��һ���ַ�����ʣ����ַ���
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