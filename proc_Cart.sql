use Store
go

alter proc p_readCart
(
		@isPaging bit=0,
		@userId int,
		@pageIndex int=1,
		@pageSize int=10,
		@records int output
)as
begin
		if(isnull (@isPaging,0)=0)
		begin
			select  Cart.*,
					pro.Name ProName,
					pro.Price,
					pro.Picture
			from	cart
			join    Product pro on Cart.ProductId=pro.Id
			where   Cart.UserId=@userId
			order by CreatedTime desc
		end
		else
		begin
		------·ÖÒ³
				select  Cart.*,
						pro.Name ProName,
						pro.Price,
						pro.Picture
				from	cart
				join    Product pro on Cart.ProductId=pro.Id
				where   Cart.UserId=@userId
				order by CreatedTime desc
				offset(@pageIndex-1)*@pageSize rows
				fetch next @pageSize rows only
		end
		select @records=count(*) 
		from	 Cart
		join	 Product pro on Cart.ProductId=pro.Id
		where    Cart.UserId=@userId
end
go


create proc p_addToCart
(
@UserId int,
@ProductId int,
@ProdeuctCount int,
@success bit output
)as
begin
			if exists(select 1 from Cart
			where UserId=@UserId 
			and ProductId=@ProductId)
			begin
			update Cart
			set ProductCount=ProductCount+@ProdeuctCount
			where UserId=@UserId
			and ProductId=@ProductId
			end
			else
			begin
insert into Cart (UserId, ProductId, ProductCount, CreatedTime, ModifiedTime)
	values(
		@UserId,
		@ProductId,
		@ProdeuctCount,
		getdate(),
		getdate()
	)
end
set @success=1
end



