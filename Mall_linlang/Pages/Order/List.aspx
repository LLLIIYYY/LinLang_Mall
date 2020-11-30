<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Order.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="css/sumoselect.css" rel="stylesheet" type="text/css" />
	<link href="css/purebox-metro.css" rel="stylesheet" id="skin">
	<script src="js/jquery.sumoselect.js"></script>

	<!--订单管理-->
	<div class="user_style clearfix">
		<div class="user_center">
			<!--左侧菜单栏-->
			<div class="left_style">
				<div class="menu_style">
					<div class="user_title">用户中心</div>
					<div class="user_Head">
						<div class="user_portrait">
							<a href="User_Personalinfo.html" title="修改头像" class="btn_link"></a> <img
								src="images/people.png">
							<div class="background_img"></div>
						</div>
						<div class="user_name">
							<p><span class="name">化海天堂</span><a href="User_changePassword.html">[修改密码]</a></p>
							<p>访问时间：2016-1-21 10:23</p>
						</div>
					</div>
					<div class="sideMen">
						<!--菜单列表图层-->
						<dl class="accountSideOption1">
							<dt class="transaction_manage"><em class="icon_1"></em>订单中心</dt>
							<dd>
								<ul>
									<li> <a href="User_Orderform.html"> 我的订单</a></li>
									<li> <a href="User_address.html">收货地址</a></li>
								</ul>
							</dd>
						</dl>
						<dl class="accountSideOption1">
							<dt class="transaction_manage"><em class="icon_2"></em>会员中心</dt>
							<dd>
								<ul>
									<li> <a href="User_Personalinfo.html"> 用户信息</a></li>
									<li> <a href="User_Collect.html"> 我的收藏</a></li>
									<li> <a href="User_changePassword.html">修改密码</a></li>
									<li> <a href="User_integral.html">我的积分</a></li>
								</ul>
							</dd>
						</dl>
						<dl class="accountSideOption1">
							<dt class="transaction_manage"><em class="icon_3"></em>账户中心</dt>
							<dd>
								<ul>
									<li> <a href="User_funds.html"> 资金管理</a></li>
								</ul>
							</dd>
						</dl>
					</div>
				</div>
			</div>
			<!--右侧样式-->
			<div class="right_style">
				<div class="info_content">
					<div class="title_Section"><span>订单管理</span></div>
					<div class="Order_Sort">
						<ul>
							<li><a href="#"><img src="images/icon-dingdan1.png"><br>代付款（2）</a></li>
							<li><a href="#"><img src="images/icon-dingdan.png"><br>已完成（2）</a></li>
							<li><a href="#"><img src="images/icon-kuaidi.png" <="" a=""><br>运输中（2）</a></li><a href="#">
							</a>
							<li class="noborder"><a href="#"></a><a href="#"><img
										src="images/icon-weibiaoti101.png"><br>派件中（2）</a>
							</li>
						</ul>
					</div>
					<div class="Order_form_list">
						<table>
							<thead>
								<tr>
									<td class="list_name_title0">商品</td>
									<td class="list_name_title1">单价(元)</td>
									<td class="list_name_title2">数量</td>
									<td class="list_name_title4">实付款(元)</td>
									<td class="list_name_title5">订单状态</td>
									<td class="list_name_title6">操作</td>
								</tr>
							</thead>
							<tbody>
								<tr class="Order_info">
									<td colspan="6" class="Order_form_time">下单时间：2015-12-3 | 订单号：445454654654654
										<em></em></td>
								</tr>
								<tr class="Order_Details">
									<td colspan="3">
										<table class="Order_product_style">
											<tbody>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_2.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="split_line">100</td>
									<td class="split_line">已发货，待收货</td>
									<td class="operating">

										<a href="#">删除</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr class="Order_info">
									<td colspan="6" class="Order_form_time">下单时间：2015-12-3 | 订单号：445454654654654
										<em></em></td>
								</tr>
								<tr class="Order_Details">
									<td colspan="3">
										<table class="Order_product_style">
											<tbody>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_11.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_3.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="split_line">100</td>
									<td class="split_line">已发货，待收货</td>
									<td class="operating">

										<a href="#">删除</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr class="Order_info">
									<td colspan="6" class="Order_form_time">下单时间：2015-12-3 |
										订单号：445454654654654<em></em></td>
								</tr>
								<tr class="Order_Details">
									<td colspan="3">
										<table class="Order_product_style">
											<tbody>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_12.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="split_line">100</td>
									<td class="split_line">已发货，待收货</td>
									<td class="operating">

										<a href="#">删除</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr class="Order_info">
									<td colspan="6" class="Order_form_time">下单时间：2015-12-3 |
										订单号：445454654654654<em></em></td>
								</tr>
								<tr class="Order_Details">
									<td colspan="3">
										<table class="Order_product_style">
											<tbody>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_12.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="split_line">100</td>
									<td class="split_line">已发货，待收货</td>
									<td class="operating">

										<a href="#">删除</a>
									</td>
								</tr>
							</tbody>
							<tbody>
								<tr class="Order_info">
									<td colspan="6" class="Order_form_time">下单时间：2015-12-3 |
										订单号：445454654654654<em></em></td>
								</tr>
								<tr class="Order_Details">
									<td colspan="3">
										<table class="Order_product_style">
											<tbody>
												<tr>
													<td>
														<div class="product_name clearfix">
															<a href="#" class="product_img"><img src="images/p_12.jpg"
																	width="80px" height="80px"></a>
															<a href="3">天然绿色多汁香甜无污染水蜜桃</a>
															<p class="specification">礼盒装20个/盒</p>
														</div>
													</td>
													<td>5</td>
													<td>2</td>
												</tr>
											</tbody>
										</table>
									</td>
									<td class="split_line">100</td>
									<td class="split_line">已发货，待收货</td>
									<td class="operating">

										<a href="#">删除</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					<script>jQuery(".Order_form_list").slide({ titCell: ".Order_info", targetCell: ".Order_Details", defaultIndex: 1, delayTime: 300, trigger: "click", defaultPlay: false, returnDefault: false });</script>
				</div>
				<div class="Paging">
					<div class="Pagination">
						<a href="#">首页</a>
						<a href="#" class="pn-prev disabled">&lt;上一页</a>
						<a href="#" class="on">1</a>
						<a href="#">2</a>
						<a href="#">3</a>
						<a href="#">4</a>
						<a href="#">下一页&gt;</a>
						<a href="#">尾页</a>
					</div>
				</div>
				<!---->
			</div>
		</div>
	</div>
</asp:Content>

