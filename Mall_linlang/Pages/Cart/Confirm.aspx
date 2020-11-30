<%@ Page Title="" Language="C#" MasterPageFile="~/Cart.Master" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="Mall_linlang.Pages.Cart.Confirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainCart" runat="server">

    <div id="header_top">
        <form class="form" method="post" runat="server">
            <fieldset>
                <!--快递选择-->

                <!--付款方式-->

                <!--产品列表-->
                <div class="product_List">
                    <table id="cart_list">
                        <thead>
                            <tr class="title">
                                <td class="name">商品名称</td>
                                <td class="price">商品价格</td>
                                <td class="Preferential">优惠价</td>
                                <td class="Quantity">购买数量</td>
                                <td class="Money">金额</td>
                            </tr>
                        </thead>
                        <tbody></tbody>
                    </table>
                    <div class="Pay_info">
                        <label>订单留言</label><input name="message" type="text" class="text_name " />
                        <span class="wordage">剩余字数：<span id="sy" style="color: Red;">50</span></span>
                    </div>
                    <!--价格-->
                    <div class="price_style">
                        <div class="right_direction">
                            <ul>
                                <li>
                                    <label>商品总价</label><i>￥</i><span id="totalAmount"></span></li>
                                <li>
                                    <label>优惠金额</label><i>￥</i><span>-23.00</span></li>
                                <li>
                                    <label>配&nbsp;&nbsp;送&nbsp;&nbsp;费</label><i>￥</i><span>0</span></li>
                                <li class="shiji_price">
                                    <label>实&nbsp;&nbsp;付&nbsp;&nbsp;款</label><i>￥</i><span id="buySubmit"></span></li>
                            </ul>
                            <div class="btn">
                                <input name="submit" type="submit" value="提交订单" class="submit_btn" />
                                <input name="" type="button" onclick="window.history.go(-1);" value="返回购物车"
                                    class="return_btn" />
                            </div>
                            <div class="integral right">待订单确认后，你将获得<span>345</span>积分</div>
                        </div>
                    </div>
                </div>
            </fieldset>
        </form>
    </div>

    <script src="../../Content/Custom/jquery.cookie.js"></script>
    <script src="../../Content/Custom/jquery.tmpl.js"></script>

    <script type="text/x-jquery-tmpl" id="tmpl_cart">

        <tr>
            <td class="Product_info">
                <a href="#">
                    <img src="http://localhost:65320/{{= Picture}}" style="width: 100px; height: 100px" /></a>
                <a href="#" class="product_name">{{= ProName}}</a>
            </td>
            <td><i>￥</i>{{= Price.toFixed(2)}}</td>
            <td><i>￥</i>{{= Price.toFixed(2)}}</td>
            <td>{{= ProductCount}}</td>
            <td class="Moneys"><i>￥</i>{{= ProductCount*Price.toFixed(2)}}</td>
        </tr>
    </script>
    <script src="../../Content/Custom/jquery.cookie.js"></script>
    <script type="text/javascript">
        $(function () {
            
            var confilmPage = {
                init: function () {
                    confilmPage.getData();
                },
                getData: function () {
                    var cookie = $.cookie('confilmInfo');
                    console.log($.cookie('confilmInfo'));
                    var confilmInfo = JSON.parse(cookie);
                    if (confilmInfo.source == 'cart') {
                        console.log('cart')
                        console.log(confilmInfo.cartsId)
                        $.get('/AJAX/Confilm_Ajax.ashx', {
                            type: 'getConfilm',
                            cartsId: confilmInfo.cartsId
                        },
                        
                       function (result) {
                           console.log(result);
                           $('#cart_list>tbody').empty();
                           console.log(result);
                           $("#cart_list").append($('#tmpl_cart').tmpl(result.Data))
                           var totalAmount = 0;
                           $.each(result.Data, function (index, item) {
                               totalAmount += (item.ProductCount * item.Price);

                           });
                           $('#totalAmount').text(totalAmount);
                           $('#buySubmit').text(totalAmount);
                       });

                    } else {
                        console.log('detail');
                        //var cookie = $.cookie('confilmInfo');
                        //根据产品Id 取产品信息
                        console.log(confilmInfo.ProId);
                        $.get('/Ajax/Product_AJAX.ashx', {
                            type:"get",
                            id: confilmInfo.ProId,
                            
                             
                        },
                        function (result) {                       
                           var data = result.Data.list[0];
                           console.log(data)
                            var formData = {
                                Picture:data.Picture,
                                Price: data.Price,
                                ProName: data.Name,
                                ProductCount: confilmInfo.count
                            };
                            

                            $('#cart_list>tbody').empty();


                            $('#tmpl_cart').tmpl(formData).appendTo('#cart_list>tbody')
                           // $("#cart_list").append($('#tmpl_cart').tmpl(formData))
                            $('#totalAmount,#buySubmit').text((formData.Price * formData.ProductCount).toFixed(2));


                        })
                    }


                }

            }
            confilmPage.init();

        })


    </script>



</asp:Content>
