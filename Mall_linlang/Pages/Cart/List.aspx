<%@ Page Title="" Language="C#" MasterPageFile="~/Cart.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Cart.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainCart" runat="server">
<div class="Inside_pages clearfix">
		<div class="shop_carts">
			<div class="Process"><img src="/Content/images//Process_img_01.png" /></div>
			<div class="Shopping_list">
				<div class="title_name">
					<ul>
						<li class="checkbox"></li>
						<li class="name">商品名称</li>
						<li class="scj">市场价</li>
						<li class="bdj">本店价</li>
						<li class="sl">购买数量</li>
						<li class="xj">小计</li>
						<li class="cz">操作</li>
					</ul>
				</div>
				<div class="shopping">
					<form method="post" action="">
						<table class="table_list">
							<tr class="tr">
								<td class="checkbox"><input name="checkitems" type="checkbox"
										value="金龙鱼 东北大米 蟹稻共生 盘锦大米5KG" /></td>
								<td class="name">
									<div class="img"><a href="Product_Detail.html"><img src="/Content/images//p_1.jpg" /></a>
									</div>
									<div class="p_name"><a href="Product_Detail.html">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								</td>
								<td class="scj sp"><span id="Original_Price_1">￥39.50</span></td>
								<td class="bgj sp"><span id="price_item_1">￥32.40</span></td>
								<td class="sl">
									<div class="Numbers">
										<a onClick="setAmount.reduce('#qty_item_1')" href="javascript:void(0)"
											class="jian">-</a>
										<input type="text" name="qty_item_" value="1" id="qty_item_1"
											onkeyup="setAmount.modify('#qty_item_1')" class="number_text">
										<a onclick="setAmount.add('#qty_item_1')" href="javascript:void(0)"
											class="jia">+</a>
									</div>
								</td>
								<td class="xj"><span id="total_item_1"></span><input type="hidden" name="total_price"
										id="total_price" value=""></td>
								<td class="cz">
									<p><a href="#">删除</a>
									<P>
									<p><a href="#">收藏该商品</a></p>
								</td>
							</tr>
							<tr class="tr on">
								<td class="checkbox"><input name="checkitems" type="checkbox"
										value="金龙鱼 东北大米 蟹稻共生 盘锦大米5KG" /></td>
								<td class="name">
									<div class="img"><a href="Product_Detail.html"><img src="/Content/images//p_2.jpg" /></a>
									</div>
									<div class="p_name"><a href="Product_Detail.html">金龙鱼 东北大米 蟹稻共生 盘锦大米5KG</a></div>
								</td>
								<td class="scj sp">￥39.50</td>
								<td class="bgj sp" id="price_item_2">￥32.40</td>
								<td class="sl">
									<div class="Numbers">
										<a onClick="setAmount.reduce('#qty_item_')" href="javascript:void(0)"
											class="jian">-</a>
										<input type="text" name="qty_item_" value="1" id="qty_item_"
											onkeyup="setAmount.modify('#qty_item_')" class="number_text">
										<a onclick="setAmount.add('#qty_item_')" href="javascript:void(0)"
											class="jia">+</a>
									</div>
								</td>
								<td class="xj"><span id="total_item_2"></span><input type="hidden" name="total_price"
										id="total_price" value=""></td>
								<td class="cz">
									<p><a href="#">删除</a>
									<P>
									<p><a href="#">收藏该商品</a></p>
								</td>
							</tr>
						</table>
						<div class="sp_Operation clearfix">
							<div class="select-all">
								<div class="cart-checkbox"><input type="checkbox" id="CheckedAll"
										name="toggle-checkboxes" class="jdcheckbox" clstag="clickcart">全选</div>
								<div class="operation"><a href="javascript:void(0);" id="send">删除选中的商品</a></div>
							</div>
							<!--结算-->
							<div class="toolbar_right">
								<ul class="Price_Info">
									<li class="p_Total"><label class="text">商品总价：</label><span class="price sumPrice"
											id="Total_price"></span></li>
									<li class="Discount"><label class="text">以&nbsp;&nbsp;节&nbsp;&nbsp;省：</label><span
											class="price" id="Preferential_price"></span></li>
									<li class="integral">本次购物可获得<b id="total_points"></b>积分</li>
								</ul>
								<div class="btn"><a class="cartsubmit" href="Orders_confirm.html"></a><a
										class="continueFind" href="Index.html"></a></div>
							</div>
						</div>
					</form>
				</div>
			</div>
			<!--推荐产品样式-->
			<div class="recommend_shop">
				<div class="title_name">推荐购买</div>
				<div class="recommend_list">
					<div class="hd">
						<a class="prev" href="javascript:void(0)">&gt;</a>
						<a class="next" href="javascript:void(0)">&lt;</a>
					</div>
					<div class="bd">
						<ul>
							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_45.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>
							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_5.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>
							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_36.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>
							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_25.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>

							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_15.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>
							<li class="recommend_info">
								<a href="Product_Detail.html" class="buy_btn">立即购买</a>
								<a href="Product_Detail.html" class="img"><img src="/Content/images//p_37.jpg" width="160px"
										height="160px" /></a>
								<a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
								<h4><span class="Price"><i>RNB</i>123.00</span></h4>
							</li>
						</ul>
					</div>
				</div>
				<script>jQuery(".recommend_list").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 6 });</script>
			</div>
		</div>
	</div>

    
</asp:Content>