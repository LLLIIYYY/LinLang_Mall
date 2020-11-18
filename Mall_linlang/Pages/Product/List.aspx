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
						<input type="radio" name="CategoryId" value="0" checked="checked"/>全部
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
							<a href="Detail.aspx" class="on">综合<i class="iconfont icon-fold"></i></a>
							<a href="Detail.aspx">销量<i class="iconfont icon-fold"></i></a>
							<a href="Detail.aspx">价格<i class="iconfont icon-fold"></i></a>
							<a href="Detail.aspx">新品<i class="iconfont icon-fold"></i></a>
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
						<li class="gl-item">
							<em class="icon_special tejia"></em>
							<div class="Borders">
								<div class="img"><a href="Detail.aspx"><img src="/Content/images/P_1.jpg"
											style="width:220px;height:220px"></a></div>
								<div class="Price"><b>¥89</b><span>[¥49.01/500g]</span></div>
								<div class="name"><a href="Detail.aspx">乐事 无限薯片三连装（原味+番茄+烤肉）104g*3/组</a></div>
								<div class="Review">已有<a href="Detail.aspx">2345</a>评论</div>
								<div class="p-operate">
									<a href="Detail.aspx" class="p-o-btn Collect"><em></em>收藏</a>
									<a href="Detail.aspx" class="p-o-btn shop_cart"><em></em>加入购物车</a>
								</div>
							</div>
						</li>
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
					<div class="img"><a href="Detail.aspx"><img src="/upload/{{= Picture}}"
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
        let CategoryId_box = $('CategoryId_box');
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
                        let c_html = '<input type="radio" name="' + name + '" value="' + (name == 'SubCategoryId' ? '-1' :'-1')+'" checked="checked"/> 全部 ';
                        res.Data.list.forEach(c => {
                            c_html += '<input type="radio" name="' + name + '" value="' + c.Id + '" checked="checked"/> ' + c.Category + ' ';
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
                let that = this;
                pageObj.option.CategoryId = $('input[name=CategoryId]:checked').val()
                pageObj.option.SubCategoryId = $('input[name=SubCategoryId]:checked').val()

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
                $(".p_list ul").html(t_html);
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
		
