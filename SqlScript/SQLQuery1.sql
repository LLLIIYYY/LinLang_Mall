create database Store
use store
go
--1.员工信息表
create table Employee(
Id	Int	primary key identity(1,1)	 not null,	
Name	Varchar(20)		not null,	--员工姓名
Gender	Int		not null,	--0未填写1男2女
Email	Varchar(50),			--Email
IsSuper	Bit			not null,	--是否为超级用户；超级用户不可以被修改和删除
PhoneNumber	Varchar(20)		not null,	--电话号码
LoginId	Varchar(20)		not null,	--登录ID
LoginPWD	Varchar(50)		not null,	--登录密码
Disabled	Bit			not null,	--0有效（默认）；1失效
CreatedTime	Datetime			not null,	--创建时间
ModifiedTime	Datetime				--修改时间
)
go
--2.商品分类表
create table ProductCategory(
Id	Int	primary key 	identity(1,1),	
ParentId	Int		not null,	--父Id,没有为0
Category	Varchar(30)		not null,	--类别名
Summary	Varchar(60)	,		--简介
Remark	varchar(250),			--备注
CreatedTime	datetime			not null,	
ModifiedTime	Datetime	,			
IsRecommend	Bit			not null,	--是否推荐该分类；推荐分类展示到首页的分类列表
Deleted	bit				--是否已删除

)
go
--3.商品表
create table Product(
Id	Int		primary key	identity(1,1),	
CategoryId	int			not null,	--类别ID
SubCategoryId	Int			not null,	--子类别ID
Name	Varchar	(100)		not null,	--商品名称
Summary	Varchar	(250)		not null,	--简介
Picture	Varchar	(125)		not null,	--图片URL
Price	Money			not null,	--单价
OnSale	Bit			not null,	--0不在售1在售
Description	Varchar	(1000)	,		--描述
ActualStock	Int			not null,	--实际库存
AvailableStock	Int			not null,	--可用库存
HoldingStock	Int			not null,	--占用库存
Deleted	Bit			not null,	--是否已删除
CreatedTime	Datetime			not null,	--创建时间
ModifiedTime	datetime	,			--修改时间
IsRecommend	bit				--是否推荐首页
)
go
--4.库存记录表
create table Inventory(
Id	Int		primary key	identity(1,1),	
ProductId	Int			not null,	--商品ID
InventoryAction	Int			not null,	--库存变更动作；枚举：入库，占用，出库等
CreatedTime	Datetime			not null,	--创建时间
OrderId	Int		,		--订单Id（如果库存变更和订单有关则记录）
Remark	Varchar(250)			--备注
)
--5.用户表
create table [User] (
Id	Int		primary key identity(1,1) not null,	
NickName	Varchar(20)		not null,	--昵称
Gender	Int			not null,	--0保密1男2女
Email	Varchar(50)	,		--Email
Birthday	Date	,			--生日
Balance	Money			not null,	--钱包余额
LoginId	Varchar(20)		not null,	--登录Id
LoginPWD	Varchar(50)		not null,	--登录密码
CreateTime	Datetime				--创建日期
)
go
--6.钱包账目
create table WalletBilling(
Id	int		primary key	 identity(1,1),	
UserId	Int			not null,	--用户Id
BillingType	Int			not null,	--账目类型，枚举：充值、消费
Billing	Money			not null,	--账目金额
OrderId	Int			,	--订单ID，如果是订单消费则存储
CreateTime	Datetime			not null	--账目产生时间
)
go
--7.用户地址
create table [Address](
Id	Int		primary key	identity(1,1),	
UserId	Int			not null,	--用户Id
Title	Varchar(20)		not null,	--标题
Addr	Varchar	(200)		not null,	--详细地址
PhoneNumber	Varchar	(20)		not null,	--联系电话
IsDefault	Bit			not null,	--是否默认
CreateTime	Datetime			not null,	--创建时间
ModifiedTime	Datetime				--修改时间
)
go
--8.订单
create table [Order](
Id	Int		primary key	 identity(1,1),	
Code	Varchar(20)	 not null,	--订单编号
UserId	Int			not null,	--用户ID
Amount	Money			not null,	--订单金额
AddressId	Int			not null,	--用户地址Id
Status	Int			not null,	--订单状态;枚举：待付款、已付款、待收货、待评论、已完成、已关闭
CreateTime	Datetime			not null,	--创建时间
ModifiedTime	Datetime	,			--修改时间
Remark	Varchar(250)			--备注
)
go
--9.订单明细
create table OrderDetail(
Id	Int		primary key	 identity(1,1),	
OrderId	Int			not null,	--订单Id
ProductId	Int			not null,	--商品ID
Price	Money			not null,	--单价
ProductCount	Int			not null,	--数量
Amount	Money			not null,	--金额
CreatedTime	Datetime			not null,	--创建时间
ModifiedTime	Datetime				--修改时间
)
go
--10.评论表
create table Comment(
Id	Int		primary key	 identity(1,1),	
ReplyToId	Int		,		--回复的评论Id
ProductId	Int			not null,	--商品Id
OrderId	Int			not null,	--订单Id
Point	Int			not null,	--分数
Content	nvarchar(250)		not null,	--内容
UserId	Int		,		--用户Id
EmployeeId	Int		,		--员工Id
CreatedTime	 Datetime			not null	--评论时间
)
go
--11.用户收藏
create table [Collection] (
Id	Int		primary key	 identity(1,1),	
UserId	Int			not null,	--用户Id
ProductId	Int			not null,	--商品Id
CreatedTime	 Datetime			not null	--收藏时间
)
go
--12.购物车
create table Cart(
Id	Int	 primary key not null,	
UserId	Int		,		--用户Id
ProductId	Int			not null,	--商品Id
ProductCount	Int			not null,	--数量
CreatedTime		Datetime		not null,	
ModifiedTime	Datetime	
)
go
--13、广告表
create table AD(
Id	Int		primary key	identity(1,1),	
Name	Nvarchar(20)			not null,	--广告位名字
RedirectUrl	Varchar(100)			not null,	--点击广告跳转的链接
IsDeleted	bit			not null,	--广告是否过期
CreatedTime	 Datetime			not null,	--创建的时间
AdImageUrl	Varchar(200)			not null,	--广告图片的地址
)
go

