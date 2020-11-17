<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Product.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!DOCTYPE html
	PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="/Content/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/Contentfonts/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="/Contentcss/style.css" rel="stylesheet" type="text/css" />
	<link href="/Contentcss/Orders.css" rel="stylesheet" type="text/css" />
	<link href="/Contentcss/purebox-metro.css" rel="stylesheet" id="skin">
	<script src="/Contentjs/jquery.min.1.8.2.js" type="text/javascript"></script>
	<script src="/Contentjs/jquery.reveal.js" type="text/javascript"></script>
	<script src="/Contentjs/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="/Contentjs/common_js.js" type="text/javascript"></script>
	<script src="/Contentjs/footer.js" type="text/javascript"></script>
	<script src="/Contentjs/lrtk.js" type="text/javascript"></script>
	<script src="/Contentjs/validator.js"></script>
	<title>产品列表</title>
</head>
<script type="text/javascript" charset="UTF-8">

	//点击效果start
	function infonav_more_down(index) {
		var inHeight = ($("div[class='p_f_name infonav_hidden']").eq(index).find('p').length) * 30;//先设置了P的高度，然后计算所有P的高度
		if (inHeight > 60) {
			$("div[class='p_f_name infonav_hidden']").eq(index).animate({ height: inHeight });
			$(".infonav_more").eq(index).replaceWith('<p class="infonav_more"><a class="more"  onclick="infonav_more_up(' + index + ');return false;" href="javascript:">收起<em class="pulldown"></em></a></p>');
		} else {
			return false;
		}
	}
	function infonav_more_up(index) {
		var infonav_height = 85;
		$("div[class='p_f_name infonav_hidden']").eq(index).animate({ height: infonav_height });
		$(".infonav_more").eq(index).replaceWith('<p class="infonav_more"> <a class="more" onclick="infonav_more_down(' + index + ');return false;" href="javascript:">更多<em class="pullup"></em></a></p>');
	}

	function onclick(event) {
		info_more_down();
		return false;
	}
 //点击效果end

</script>

<body>
	<!--顶部样式-->
	<div id="header_top">
		<div id="top">
			<div class="Inside_pages">
				<div class="Collection">下午好，欢迎光临琳琅商城！</div>
				<div class="hd_top_manu clearfix">
					<ul class="clearfix">
						<li class="hd_menu_tit zhuce" data-addclass="hd_menu_hover">欢迎光临本店！<a href="login.html"
								class="red">[请登录]</a> 新用户<a href="register.html" class="red">[免费注册]</a></li>
						<li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="User_Orderform.html">我的订单</a></li> <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="User.html">个人中心</a></li>
						<li style="background: 0" class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="#">购物车</a>
						</li>
					</ul>
				</div>
			</div>
		</div>
		<!--顶部样式1-->
		<div id="header" class="header page_style">
			<div class="logo"><a href="index.html"><img src="Content/images/logo.png" /></a></div>
			<!--结束图层-->
			<div class="Search">
				<p><input name="" type="text" class="text" /><input name="" type="submit" value="搜 索"
						class="Search_btn" /></p>
				<p class="Words"><a href="#">苹果</a><a href="#">香蕉</a><a href="#">菠萝</a><a href="#">西红柿</a><a
						href="#">橙子</a><a href="#">苹果</a></p>
			</div>
			<!--购物车样式-->
			<div class="hd_Shopping_list" id="Shopping_list">
				<div class="s_cart"><em class="iconfont icon-cart2"></em><a href="Shop_cart">我的购物车</a> <i
						class="ci-right">&gt;</i><i class="ci-count" id="shopping-amount">0</i></div>
				<div class="dorpdown-layer">
					<div class="spacer"></div>
					<!--<div class="prompt"></div><div class="nogoods"><b></b>购物车中还没有商品，赶紧选购吧！</div>-->
					<ul class="p_s_list">
						<li>
							<div class="img"><img src="Content/images/p_7.jpg"></div>
							<div class="content">
								<p><a href="Product_detail.html">产品名称</a></p>
								<p>颜色分类:紫花8255尺码:XL</p>
							</div>
							<div class="Operations">
								<p class="Price">￥55.00</p>
								<p><a href="#">删除</a></p>
							</div>
						</li>
					</ul>
					<div class="Shopping_style">
						<div class="p-total">共<b>1</b>件商品　共计<strong>￥ 515.00</strong></div>
						<a href="Shop_cart.html" title="去购物车结算" id="btn-payforgoods" class="Shopping">去购物车结算</a>
					</div>
				</div>
			</div>
		</div>
		<!--菜单导航样式-->
		<div id="Menu" class="clearfix">
			<div class="index_style clearfix">
				<div id="allSortOuterbox" class="display">
					<div class="t_menu_img"></div>
					<div class="Category"><a href="#"><em></em>所有产品分类</a></div>
					<div class="hd_allsort_out_box_new">
						<!--左侧栏目开始-->
						<ul class="Menu_list">
							<li class="name">
								<div class="Menu_name"><a href="product_list.html">面部护理</a> <span>&lt;</span></div>
								<div class="link_name">
									<p><a href="Product_detail.html">茅台</a> <a href="#">五粮液</a> <a href="#">郎酒</a> <a
											href="#">剑南春</a></p>
								</div>
	
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">身体护理</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="Product_detail.html"> 面霜</a><a href="#">眼霜</a><a href="#"> 面膜</a><a
										href="#">护肤套装</a>

								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">香水彩妆</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">卸妆 </a><a href="#">防晒</a><a href="#">BB</a>
									<a href="#">女士香水</a>
								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">洗发护发</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">洗发</a><a href="#">护发</a><a href="#">沐浴</a><a href="#">润肤乳</a>
								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">女性护理</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a>
									<a href="#"> 面霜</a>
								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">男性护理</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">洁面</a><a href="#">坚果炒货</a><a href="#">乳液</a>
									<a href="#"> 面霜</a>
								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">推荐品牌</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">欧莱雅</a><a href="#"> 菲诗小铺</a><a href="#"> 雅诗兰黛</a>
								</div>
								
							</li>
							<li class="name">
								<div class="Menu_name"><a href="#">推荐品牌</a><span>&lt;</span></div>
								<div class="link_name">
									<a href="#">欧莱雅</a><a href="#"> 菲诗小铺</a><a href="#"> 雅诗兰黛</a>
								</div>
								
							</li>
						</ul>
					</div>
				</div>
				<script>$("#allSortOuterbox").slide({ titCell: ".Menu_list li", mainCell: ".menv_Detail", });</script>
				<!--菜单栏-->
				<div class="Navigation" id="Navigation">
					<ul class="Navigation_name">
						<li><a href="Index.html">首页</a></li>
						<li class="on"><a href="product_list.html">产品列表</a></li>
					</ul>
				</div>
				<script>$("#Navigation").slide({ titCell: ".Navigation_name li" });</script>
				<!-- <a href="#" class="link_bg"><img src="Content/images/link_bg_03.png" /></a>-->
			</div>
		</div>
	</div>
	<!--产品列表样式-->
	<div class="Inside_pages clearfix">
		<!--位置-->
		<div class="Location_link">
			<em></em><a href="#">进口食品、进口牛</a> &lt; <a href="#">进口饼干/糕点</a>
		</div>
		<!--筛选样式-->
		<div id="Filter_style">
			<!--推荐-->
			<div class="page_recommend">
				<div class="hd"><em></em>今日推荐<ul></ul>
				</div>
				<div class="bd">
					<ul>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="Content/images/p_4.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="Content/images/p_55.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="Content/images/p_17.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="Content/images/p_54.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="Content/images/p_58.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
					</ul>
				</div>
				<a class="next" href="javascript:void(0)"><em class="iconfont icon-left"></em></a>
				<a class="prev" href="javascript:void(0)"><em class="iconfont icon-right"></em></a>
			</div>
			<script type="text/javascript">
				jQuery(".page_recommend").slide({ titCell: ".hd ul", mainCell: ".bd ul", autoPage: true, effect: "left", autoPlay: true, vis: 4, trigger: "click" });
			</script>
			<!--条件筛选样式-->
			<div class="Filter">
				<div class="Filter_list clearfix">
					<div class="Filter_title"><span>品牌：</span></div>
					<div class="Filter_Entire"><a href="#">全部</a></div>
					<div class="p_f_name infonav_hidden">
						<p><a href="#" title="莱家/Loacker">莱家/Loacker </a>
							<a href="#" title="">丽芝士/Richeese</a>
							<a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
							<a href="#">爱时乐/Astick </a>
							<a href="#">利葡/LiPO </a>
							<a href="#">友谊牌/Tipo </a>
							<a href="#"> 三立/SANRITSU </a>
							<a href="#"> 皇冠/Danisa </a> </p>
						<p><a href="#">丹麦蓝罐/Kjeldsens</a>
							<a href="#">茱莉/Julie's </a>
							<a href="#">向日葵/Sunflower </a>
							<a href="#">福多/fudo </a>
							<a href="#">非凡农庄/PEPPER... </a>
							<a href="#">凯尔森/Kelsen </a>
							<a href="#"> 蜜兰诺/Milano </a>
							<a href="#">壹格/EgE </a> </p>
						<p><a href="#">沃尔克斯/Walkers </a>
							<a href="#">澳门永辉/MACAU...</a>
							<a href="#" title="莱家/Loacker">莱家/Loacker </a>
							<a href="#" title="">丽芝士/Richeese</a>
							<a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
							<a href="#">爱时乐/Astick </a>
							<a href="#">利葡/LiPO </a>
							<a href="#">友谊牌/Tipo </a> </p>
						<p><a href="#"> 三立/SANRITSU </a>
							<a href="#"> 皇冠/Danisa </a>
							<a href="#">丹麦蓝罐/Kjeldsens</a>
							<a href="#">茱莉/Julie's </a>
							<a href="#">向日葵/Sunflower </a>
							<a href="#">福多/fudo </a>
							<a href="#">非凡农庄/PEPPER... </a>
							<a href="#">凯尔森/Kelsen </a> </p>
						<p><a href="#"> 蜜兰诺/Milano </a>
							<a href="#">壹格/EgE </a>
							<a href="#">沃尔克斯/Walkers </a>
							<a href="#">澳门永辉/MACAU...</a>
							<a href="#" title="莱家/Loacker">莱家/Loacker </a>
							<a href="#" title="">丽芝士/Richeese</a>
							<a href="#" title="白色恋人/SHIROI KOIBITO ">白色恋人/SHIROI KOIBITO </a>
							<a href="#">爱时乐/Astick </a> </p>

					</div>
					<p class="infonav_more"><a href="#" class="more" onclick="infonav_more_down(0);return false;">更多<em
								class="pullup"></em></a></p>
				</div>
				<div class="Filter_list clearfix">
					<div class="Filter_title"><span>产地：</span></div>
					<div class="Filter_Entire"><a href="#">全部</a></div>
					<div class="p_f_name">
						<a href="#">中国大陆</a>
						<a href="#">中国台湾</a>
						<a href="#">中国香港</a>
						<a href="#">中国澳门</a>
						<a href="#">日本</a>
						<a href="#">韩国</a>
						<a href="#">越南</a>
						<a href="#">泰国</a>
					</div>
				</div>
				<div class="Filter_list clearfix">
					<div class="Filter_title"><span>包装方式：</span></div>
					<div class="Filter_Entire"><a href="#">全部</a></div>
					<div class="p_f_name">
						<a href="#">袋装</a><a href="#">盒装</a><a href="#">罐装</a><a href="#">礼盒装</a><a href="#">散装(称重)</a>
					</div>
				</div>
				<div class="Filter_list clearfix">
					<div class="Filter_title"><span>价格：</span></div>
					<div class="Filter_Entire"><a href="#">全部</a></div>
					<div class="p_f_name">
						<a href="#">0-50</a><a href="#">50-150</a><a href="#">150-500</a><a href="#">500-1000</a><a
							href="#">1000以上</a>
					</div>
				</div>
			</div>
		</div>
		<!--样式-->
		<div class="scrollsidebar side_green clearfix" id="scrollsidebar">
			<div class="show_btn" id="rightArrow"><span></span></div>
			<!--左侧样式-->
			<div class="page_left_style side_content">
				<!--浏览记录-->
				<div class="side_title"><a title="隐藏" class="close_btn"><span></span></a></div>
				<div class=" side_list">
					<div class="Record">
						<div class="title_name">浏览记录</div>
						<ul>
							<li>
								<a href="Product_Detail.html">
									<p><img src="Content/images/p_32.jpg"></p>
									<p class="p_name">商品名称</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="Content/images/p_33.jpg"></p>
									<p class="p_name">【麻麻派】东北特产野生开口松子 孕妇休闲零食坚果 原味坚果特产东</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="Content/images/p_34.jpg"></p>
									<p class="p_name">商品名称</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="Content/images/p_36.jpg"></p>
									<p class="p_name">商品名称</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
						</ul>
					</div>
					<!--销售排行-->
					<div class="pro_ranking">
						<div class="title_name"><em></em>销量排行</div>
						<div class="ranking_list">
							<ul id="tabRank">
								<li class="t_p on">
									<em class="icon_ranking">1</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">2</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">3</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">4</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">5</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">6</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">7</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">8</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">9</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
								<li class="t_p">
									<em class="icon_ranking">10</em>
									<dt>
										<h3><a href="Product_Detail.html">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Product_Detail.html"><img src="Content/images/p_29.jpg" width="90"
												height="90" /></a>
										<span class="Price">￥23.00</span>
									</dd>
								</li>
							</ul>
						</div>
					</div>
					<script type="text/javascript">
						jQuery("#tabRank li").hover(function () { jQuery(this).addClass("on").siblings().removeClass("on") }, function () { });
						jQuery("#tabRank").slide({ titCell: "dt h3", autoPlay: false, effect: "left", delayTime: 300 });
					</script>
				</div>
			</div>
			<script type="text/javascript">
				$(function () {
					$("#scrollsidebar").fix({
						float: 'left',
						//minStatue : true,
						skin: 'green',
						durationTime: 600
					});
				});
            </script>
			<!--列表样式属性-->
			<div class="page_right_style">
				<div id="Sorted">
					<div class="Sorted">
						<div class="Sorted_style">
							<a href="Product_Detail.html" class="on">综合<i class="iconfont icon-fold"></i></a>
							<a href="Product_Detail.html">销量<i class="iconfont icon-fold"></i></a>
							<a href="Product_Detail.html">价格<i class="iconfont icon-fold"></i></a>
							<a href="Product_Detail.html">新品<i class="iconfont icon-fold"></i></a>
						</div>
						<!--产品搜索-->
						<div class="products_search">
							<input name="" type="text" class="search_text" value="请输入你要搜索的产品" onfocus="this.value=''"
								onblur="if(!value){value=defaultValue;}"><input name="" type="submit" value=""
								class="search_btn">
						</div>
						<!--页数-->
						<div class="s_Paging">
							<span> 1/12</span>
							<a href="Product_Detail.html" class="on">&lt;</a>
							<a href="Product_Detail.html">&gt;</a>
						</div>
					</div>
				</div>
				<!--产品列表样式-->
				<div class="p_list  clearfix">
					<ul>
						<li class="gl-item">
							<em class="icon_special tejia"></em>
							<div class="Borders">
								<div class="img"><a href="Product_detail.html"><img src="Content/images/P_1.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<em class="icon_special tejia"></em>
							<div class="Borders">
								<div class="img"><a href="Product_detail.html"><img src="Content/images/P_2.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<em class="icon_special tejia"></em>
							<div class="Borders">
								<div class="img"><a href="Product_detail.html"><img src="Content/images/P_3.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_detail.html"><img src="Content/images/P_4.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<em class="icon_special xinping"></em>
							<div class="Borders">
								<div class="img"><a href="Product_detail.html"><img src="Content/images/P_5.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_6.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_7.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_15.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_9.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_8.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_11.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_16.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_16.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_17.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
						<li class="gl-item">
							<div class="Borders">
								<div class="img"><a href="Product_Detail.html"><img src="Content/images/P_15.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Product_Detail.html">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Product_Detail.html">2345</a>评论</div>
								<div class="p-operate">
									<a href="Product_Detail.html" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Product_Detail.html" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
					</ul>
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
				</div>
			</div>
		</div>
	</div>
</asp:Content>
