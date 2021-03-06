﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Product.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
	<style>
	    @media screen and (max-width: 710px) {
			.side_content{
				display:none;
			 }	
			.page_right_style{
				float:none;
				width:100%;
				padding:0;
				margin:0;
			}
			.Inside_pages {
				width:100% !important;
			}
			#Filter_style{
				width:100% !important;
				overflow:hidden;
			}
			.page_recommend{
				width:100% !important;
				overflow:hidden;
			}

			.CategoryId_box, .SubCategoryId_box{
				width:unset !important;
			}
			.Sorted_style{
				width:unset !important;
			}
			.p_list ul{
				display:flex;
				flex-wrap:wrap;
				justify-content:space-around;
			}
			.gl-item{
			    width: 45%;
				border:none;
			}
			.gl-item .Borders{
				padding:0;
				width:unset;
				margin:0!important;
			}
			.gl-item img{
				width: 100%!important;
				height: unset !important;
			}
			.Inside_pages .Pagination{
				width:unset;
			}
	    }

		#pager{
			
    display: flex;
    justify-content: center;
		}
		#pager .active{
			color: #999999;
			margin: 0px 5px;
			font-size: 14px;
			padding: 5px 15px;
			border: 1px solid #ddd;
			background-color:#ff7200;
		}
	 
	</style>
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
							<div class="img"><a href="Detail.aspx"><img src="/Content/images/p_4.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Detail.aspx">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Detail.aspx"><img src="/Content/images/p_55.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Detail.aspx">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Detail.aspx"><img src="/Content/images/p_17.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Detail.aspx">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Detail.aspx"><img src="/Content/images/p_54.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Detail.aspx">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
								<p class="Price"><i>￥</i>231.00</p>
								<p class="Sales">热销：<b>1234</b>件</p>
							</div>
						</li>
						<li>
							<div class="img"><a href="Detail.aspx"><img src="/Content/images/p_58.jpg" width="120"
										height="120" /></a>
							</div>
							<div class="pro_info">
								<a href="Detail.aspx">洗颜专科 柔澈泡沫 洁面乳 120g（资生堂旗下）</a>
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
					<div class="Filter_title"><span>一级分类：</span></div>
					<div class="p_f_name CategoryId_box">
						<input type="radio" name="CategoryId" value="-1" checked="checked"/>全部
					</div>
				</div>
				<div class="Filter_list clearfix">
					<div class="Filter_title"><span>二级分类：</span></div>
					<div class="p_f_name SubCategoryId_box">
                        <input type="radio" name="SubCategoryId" value="-1" checked="checked"/>全部
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
								<a href="Detail.aspx">
									<p><img src="/Content/images/p_32.jpg"></p>
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
										<h3><a href="Detail.aspx">韩束墨菊深度补水八件套（补水保湿 深层）</a></h3>
									</dt>
									<dd class="clearfix">
										<a href="Detail.aspx"><img src="/Content/images/p_29.jpg" width="90"
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
				//$(function () {
				//	$("#scrollsidebar").fix({
				//		float: 'left',
				//		//minStatue : true,
				//		skin: 'green',
				//		durationTime: 600
				//	});
				//});
            </script>
			<!--列表样式属性-->
			<div class="page_right_style">
				<div id="Sorted">
					<div class="Sorted">
						<div class="Sorted_style">
							<a href="#" class="on">综合<i class="iconfont icon-fold"></i></a>
							<a href="#">销量<i class="iconfont icon-fold"></i></a>
							<a href="#">价格<i class="iconfont icon-fold"></i></a>
							<a href="#">新品<i class="iconfont icon-fold"></i></a>
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
							<a href="Detail.aspx" class="on">&lt;</a>
							<a href="Detail.aspx">&gt;</a>
						</div>
					</div>
				</div>
				<!--产品列表样式-->
				<div class="p_list clearfix">
					<ul>
						
					</ul>
					<div class="Paging">
						<div class="Pagination" id="pager"></div>
					</div>
				</div>
			</div>
		</div>
		<link href="/Content/css/pagination.css" rel="Stylesheet" />
		<script src="/Content/js/jquery.tmpl.js" type="text/javascript"></script>
		<script src="/Content/js/jquery.pagination.js" type="text/javascript"></script>
		<script type="text/x-jquery-tmpl" id="list_tmpl">
			<li class="gl-item">
				<em class="icon_special tejia"></em>
				<div class="Borders">
					<div class="img"><a href="Detail.aspx?id={{= Id}}"><img src="http://<%= ConfigurationManager.ConnectionStrings["manageUri"].ConnectionString %>upload/{{= Picture}}"
								style="width:220px;height:220px"></a></div>
					<div class="Price"><b>¥{{= Price}}</b><span>[¥49.01/500g]</span></div>
					<div class="name"><a href="Detail.aspx">{{= Name}} {{= Description}}</a></div>
					<div class="Review">已有<a href="Detail.aspx">2345</a>评论</div>
					<div class="p-operate">
						<a href="Detail.aspx" class="p-o-btn Collect"><em></em>收藏</a>
						<a href="Detail.aspx" class="p-o-btn shop_cart"><em></em>加入购物车</a>
					</div>
				</div>
            <%--<td>{{= AvailableStock}}</td>--%>
			</li>
    </script>
	<script type="text/javascript">
        renderCategory($('.CategoryId_box'), 'CategoryId', 0);
        let CategoryId_box = $('.SubCategoryId_box');
        $(".CategoryId_box").on('change', 'input[type=radio]', function (e) {
            renderCategory(CategoryId_box, 'SubCategoryId', e.target.value);
            pageObj.getData();
        });
        CategoryId_box.on('change', 'input[type=radio]', function (e) {
            pageObj.getData();
        })
        function renderCategory(el, name, ParentId) {
                $.ajax({
                    url: '/Ajax/ProductCategory.ashx?type=GetAllByPage',
                    method: 'post',
                    dataType: 'json',
                    data: { ParentId: ParentId, pageIndex: 1, pageSize: 9999 },
                    success: function (res) {
                        let c_html = '<input type="radio" name="' + name + '" value="-1" checked="checked"/> 全部 ';
                        if (!(name === 'SubCategoryId' && ParentId == -1))
							res.Data.list.forEach(c => {
								c_html += '<input type="radio" name="' + name + '" value="' + c.Id + '" /> ' + c.Category + ' ';
							});
                        el.html(c_html);
                    }
                })
            }

        var pageObj = {
            option: {
                type: 'get',
                pageIndex: 1,
				pageSize: 10,
				CategoryId: 0,
				SubCategoryId: -1,
            },
			getData() {
                $(".p_list ul").html('<svg xmlns="http://www.w3.org/2000/svg" xmlns: xlink="http://www.w3.org/1999/xlink" width="30px" height="30px" viewBox="0 0 40 40" enable-background="new 0 0 40 40" xml: space="preserve"><path opacity="0.2" fill="#FF6700" d="M20.201,5.169c-8.254,0-14.946,6.692-14.946,14.946c0,8.255,6.692,14.946,14.946,14.946s14.946-6.691,14.946-14.946C35.146,11.861,28.455,5.169,20.201,5.169z M20.201,31.749c-6.425,0-11.634-5.208-11.634-11.634c0-6.425,5.209-11.634,11.634-11.634c6.425,0,11.633,5.209,11.633,11.634C31.834,26.541,26.626,31.749,20.201,31.749z"></path><path fill="#FF6700" d="M26.013,10.047l1.654-2.866c-2.198-1.272-4.743-2.012-7.466-2.012h0v3.312h0C22.32,8.481,24.301,9.057,26.013,10.047z" transform="rotate(42.1171 20 20)"><animateTransform attributeType="xml" attributeName="transform" type="rotate" from="0 20 20" to="360 20 20" dur="0.5s" repeatCount="indefinite"></animateTransform></path></svg >');
                let that = this;
                pageObj.option.CategoryId = $('input[name=CategoryId]:checked').val()
                pageObj.option.SubCategoryId = $('input[name=SubCategoryId]:checked').val()
				let svg = $();
                $.ajax({
                    url: '/Ajax/Product.ashx?type=GetAllByPage',
                    method: 'post',
                    dataType: 'json',
                    data: this.option,
                    success: function (res) {
                        that.renderList(res.Data.list);
                        that.renderPager(res.Data.pageCount, pageObj.option.pageIndex);
                    }
                })
			},
            renderList(list) {
				let t_html = $('#list_tmpl').tmpl(list);
                if (t_html.length > 0)
					$(".p_list ul").html(t_html);
				else
                    $(".p_list ul").html("<h2>暂无此类商品</h2>");
			},
			renderPager(pageCount, index) {
				let that = this;
                $("#pager").pagination({
                    pageCount: pageCount,
                    current: index,
                    callback(e) {
                        that.option.pageIndex = e.getCurrent();
                        that.getData();
                    }
                })
            },
        }
		pageObj.getData();
		
        function query() {
            pageObj.option.Name = $("#Name").val();
            pageObj.option.Gender = $("#Gender").val();
            pageObj.getData();
		}

    </script>
	<script type="text/javascript">
		function updatenum(type) {
			var qty = parseInt(document.forms['ECS_FORMBUY'].elements['number'].value);
			if (type == 'del') {
				if (qty > 1) {
					document.forms['ECS_FORMBUY'].elements['number'].value = (qty - 1);
				}
			} else {
				document.forms['ECS_FORMBUY'].elements['number'].value = (qty + 1);
			}
			//changePrice();
		}
		function dorank(rank_id) {
			var rank_id;
			$("#rank").val(rank_id);
		}
		function send_cooment() {
			$(".commentBox").toggle();
		}
		function checkLength(which) {
			var maxChars = 1000; //
			if (which.value.length > maxChars) {
				alert("您出入的字数超多限制!");
				which.value = which.value.substring(0, maxChars);
				return false;
			} else {
				var curr = maxChars - which.value.length; //250 减去 当前输入的
				document.getElementById("sy").innerHTML = curr.toString();
				return true;
			}
		}
	</script>
</asp:Content>
		
