<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Product.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
							<div class="img"><a href="Product_detail.html"><img src="/Content/images/p_4.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="/Content/images/p_55.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="/Content/images/p_17.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="/Content/images/p_54.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Product_detail.html">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Product_detail.html"><img src="/Content/images/p_58.jpg" width="120"
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
									<p><img src="/Content/images/p_32.jpg"></p>
									<p class="p_name">商品名称</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="/Content/images/p_33.jpg"></p>
									<p class="p_name">【麻麻派】东北特产野生开口松子 孕妇休闲零食坚果 原味坚果特产东</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="/Content/images/p_34.jpg"></p>
									<p class="p_name">商品名称</p>
								</a>
								<p><span class="p_Price left">价格:<b>￥5.30</b></span><span
										class="p_Sales right">销量：2345件</span></p>
							</li>
							<li>
								<a href="Product_Detail.html">
									<p><img src="/Content/images/p_36.jpg"></p>
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
										<a href="Product_Detail.html"><img src="/Content/images/p_29.jpg" width="90"
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
								<div class="img"><a href="Product_detail.html"><img src="/Content/images/P_1.jpg"
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
								<div class="img"><a href="Product_detail.html"><img src="/Content/images/P_2.jpg"
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
								<div class="img"><a href="Product_detail.html"><img src="/Content/images/P_3.jpg"
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
								<div class="img"><a href="Product_detail.html"><img src="/Content/images/P_4.jpg"
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
								<div class="img"><a href="Product_detail.html"><img src="/Content/images/P_5.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_6.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_7.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_15.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_9.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_8.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_11.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_16.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_16.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_17.jpg"
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
								<div class="img"><a href="Product_Detail.html"><img src="/Content/images/P_15.jpg"
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
</asp:Content>
