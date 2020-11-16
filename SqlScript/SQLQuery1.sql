create database Store
use store
go
--1.Ա����Ϣ��
create table Employee(
Id	Int	primary key identity(1,1)	 not null,	
Name	Varchar(20)		not null,	--Ա������
Gender	Int		not null,	--0δ��д1��2Ů
Email	Varchar(50),			--Email
IsSuper	Bit			not null,	--�Ƿ�Ϊ�����û��������û������Ա��޸ĺ�ɾ��
PhoneNumber	Varchar(20)		not null,	--�绰����
LoginId	Varchar(20)		not null,	--��¼ID
LoginPWD	Varchar(50)		not null,	--��¼����
Disabled	Bit			not null,	--0��Ч��Ĭ�ϣ���1ʧЧ
CreatedTime	Datetime			not null,	--����ʱ��
ModifiedTime	Datetime				--�޸�ʱ��
)
go
--2.��Ʒ�����
create table ProductCategory(
Id	Int	primary key 	identity(1,1),	
ParentId	Int		not null,	--��Id,û��Ϊ0
Category	Varchar(30)		not null,	--�����
Summary	Varchar(60)	,		--���
Remark	varchar(250),			--��ע
CreatedTime	datetime			not null,	
ModifiedTime	Datetime	,			
IsRecommend	Bit			not null,	--�Ƿ��Ƽ��÷��ࣻ�Ƽ�����չʾ����ҳ�ķ����б�
Deleted	bit				--�Ƿ���ɾ��

)
go
--3.��Ʒ��
create table Product(
Id	Int		primary key	identity(1,1),	
CategoryId	int			not null,	--���ID
SubCategoryId	Int			not null,	--�����ID
Name	Varchar	(100)		not null,	--��Ʒ����
Summary	Varchar	(250)		not null,	--���
Picture	Varchar	(125)		not null,	--ͼƬURL
Price	Money			not null,	--����
OnSale	Bit			not null,	--0������1����
Description	Varchar	(1000)	,		--����
ActualStock	Int			not null,	--ʵ�ʿ��
AvailableStock	Int			not null,	--���ÿ��
HoldingStock	Int			not null,	--ռ�ÿ��
Deleted	Bit			not null,	--�Ƿ���ɾ��
CreatedTime	Datetime			not null,	--����ʱ��
ModifiedTime	datetime	,			--�޸�ʱ��
IsRecommend	bit				--�Ƿ��Ƽ���ҳ
)
go
--4.����¼��
create table Inventory(
Id	Int		primary key	identity(1,1),	
ProductId	Int			not null,	--��ƷID
InventoryAction	Int			not null,	--�����������ö�٣���⣬ռ�ã������
CreatedTime	Datetime			not null,	--����ʱ��
OrderId	Int		,		--����Id�����������Ͷ����й����¼��
Remark	Varchar(250)			--��ע
)
--5.�û���
create table [User] (
Id	Int		primary key identity(1,1) not null,	
NickName	Varchar(20)		not null,	--�ǳ�
Gender	Int			not null,	--0����1��2Ů
Email	Varchar(50)	,		--Email
Birthday	Date	,			--����
Balance	Money			not null,	--Ǯ�����
LoginId	Varchar(20)		not null,	--��¼Id
LoginPWD	Varchar(50)		not null,	--��¼����
CreateTime	Datetime				--��������
)
go
--6.Ǯ����Ŀ
create table WalletBilling(
Id	int		primary key	 identity(1,1),	
UserId	Int			not null,	--�û�Id
BillingType	Int			not null,	--��Ŀ���ͣ�ö�٣���ֵ������
Billing	Money			not null,	--��Ŀ���
OrderId	Int			,	--����ID������Ƕ���������洢
CreateTime	Datetime			not null	--��Ŀ����ʱ��
)
go
--7.�û���ַ
create table [Address](
Id	Int		primary key	identity(1,1),	
UserId	Int			not null,	--�û�Id
Title	Varchar(20)		not null,	--����
Addr	Varchar	(200)		not null,	--��ϸ��ַ
PhoneNumber	Varchar	(20)		not null,	--��ϵ�绰
IsDefault	Bit			not null,	--�Ƿ�Ĭ��
CreateTime	Datetime			not null,	--����ʱ��
ModifiedTime	Datetime				--�޸�ʱ��
)
go
--8.����
create table [Order](
Id	Int		primary key	 identity(1,1),	
Code	Varchar(20)	 not null,	--�������
UserId	Int			not null,	--�û�ID
Amount	Money			not null,	--�������
AddressId	Int			not null,	--�û���ַId
Status	Int			not null,	--����״̬;ö�٣�������Ѹ�����ջ��������ۡ�����ɡ��ѹر�
CreateTime	Datetime			not null,	--����ʱ��
ModifiedTime	Datetime	,			--�޸�ʱ��
Remark	Varchar(250)			--��ע
)
go
--9.������ϸ
create table OrderDetail(
Id	Int		primary key	 identity(1,1),	
OrderId	Int			not null,	--����Id
ProductId	Int			not null,	--��ƷID
Price	Money			not null,	--����
ProductCount	Int			not null,	--����
Amount	Money			not null,	--���
CreatedTime	Datetime			not null,	--����ʱ��
ModifiedTime	Datetime				--�޸�ʱ��
)
go
--10.���۱�
create table Comment(
Id	Int		primary key	 identity(1,1),	
ReplyToId	Int		,		--�ظ�������Id
ProductId	Int			not null,	--��ƷId
OrderId	Int			not null,	--����Id
Point	Int			not null,	--����
Content	nvarchar(250)		not null,	--����
UserId	Int		,		--�û�Id
EmployeeId	Int		,		--Ա��Id
CreatedTime	 Datetime			not null	--����ʱ��
)
go
--11.�û��ղ�
create table [Collection] (
Id	Int		primary key	 identity(1,1),	
UserId	Int			not null,	--�û�Id
ProductId	Int			not null,	--��ƷId
CreatedTime	 Datetime			not null	--�ղ�ʱ��
)
go
--12.���ﳵ
create table Cart(
Id	Int	 primary key not null,	
UserId	Int		,		--�û�Id
ProductId	Int			not null,	--��ƷId
ProductCount	Int			not null,	--����
CreatedTime		Datetime		not null,	
ModifiedTime	Datetime	
)
go
--13������
create table AD(
Id	Int		primary key	identity(1,1),	
Name	Nvarchar(20)			not null,	--���λ����
RedirectUrl	Varchar(100)			not null,	--��������ת������
IsDeleted	bit			not null,	--����Ƿ����
CreatedTime	 Datetime			not null,	--������ʱ��
AdImageUrl	Varchar(200)			not null,	--���ͼƬ�ĵ�ַ
)
go

