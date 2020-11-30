<%@ Page Title="" Language="C#" MasterPageFile="~/Cart.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Mall_linlang.Pages.Cart.List" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainCart" runat="server">
    <div class="Inside_pages clearfix">
        <div class="shop_carts">
            <div class="Process">
                <img src="/Content/images//Process_img_01.png" />
            </div>
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
                    <form method="post">
                        <table class="table_list" id="cart_list">
                            <!-----显示购物车-------->

                        </table>
                        <div class="sp_Operation clearfix">
                            <div class="select-all">
                                <div class="cart-checkbox">
                                    <input type="checkbox" id="CheckedAll"
                                        name="toggle-checkboxes" class="jdcheckbox" autocomplete="off" />全选
                                </div>
                                <div class="operation"><a href="javascript:" id="btn_reMoveAll">删除选中的商品</a></div>
                            </div>
                            <!--结算-->
                            <div class="toolbar_right">
                                <ul class="Price_Info">
                                    <li class="p_Total">
                                        <label class="text">商品总价：</label><span class="price sumPrice"
                                            id="Total_price"></span></li>
                                    <li class="Discount">
                                        <label class="text">以&nbsp;&nbsp;节&nbsp;&nbsp;省：</label><span
                                            class="price" id="Preferential_price"></span></li>
                                    <li class="integral">本次购物可获得<b id="total_points"></b>积分</li>
                                </ul>
                                <div class="btn">
                                    <a class="cartsubmit" href="javascript:" id="cart_submit"></a>
                                    <a class="continueFind" href="Index.html"></a>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <script src="../../Content/Custom/jquery.cookie.js"></script>
            <script src="../../Content/Custom/jquery.tmpl.js"></script>
            <script type="text/x-jquery-tmpl" id="tmpl_cart">
                <tr class="tr">
                    <td class="checkbox">
                        <input name="checkitems" type="checkbox" id="checkAll"
                            value="{{= Id}}" /></td>
                    <td class="name">
                        <div class="img">
                            <a href="Product_Detail.html">
                                <img src="http://localhost:65320/{{= Picture}}" /></a>
                        </div>
                        <div class="p_name"><a href="Product_Detail.html">{{= ProName}}</a></div>
                    </td>
                    <td class="scj sp"><span>￥{{= Price.toFixed(2)}}</span></td>
                    <td class="bgj sp"><span>￥{{= Price.toFixed(2)}}</span></td>
                    <td class="sl">
                        <div class="Numbers">
                            <a href="javascript:"
                                class="jian btn-reduce" >-</a>
                            <input type="text" name="qty_item_" id="txt_Name" value="{{= ProductCount}}"
                                class="number_text" />
                            <a href="javascript:"
                                class="jia btn-increase">+</a>
                        </div>
                    </td>
                    <td class="xj">
                        <span class="subAmount">￥{{= ProductCount*Price.toFixed(2)}}
                        </span>

                    </td>
                    <td class="cz">
                        <p>
                            <a href="#" id="reMove">删除</a>
                            <p>
                                <p><a href="#">收藏该商品</a></p>
                    </td>
                </tr>
            </script>
            <script type="text/javascript">
                $(function () {
                    pageObj.getData();
                    $('#cart_list').on('change', 'input[name="checkitems"]', function () {
                        var obj = $(this).tmplItem();


                        //判断一个复选框是否被选中
                        if ($(this).is(':checked')) {
                            pageObj.check(obj);
                        } else {
                            pageObj.uncheck(obj);
                        }

                    });
                    //监听全选选中状态改变事件
                    $('#CheckedAll').on('change', function () {
                        if ($(this).is(':checked')) {
                            $.each($('input[name="checkitems"]'), function (index, item) {
                                if (!$(item).is(':checked')) {
                                    $(item).trigger('click');
                                }

                            });
                        } else {
                            $.each($('input[name="checkitems"]'), function (index, item) {
                                if ($(item).is(':checked')) {
                                    $(item).trigger('click');
                                }

                            });
                        }
                    });
                    //监听+按钮事件
                    $('#cart_list').on('click', '.btn-increase', function () {

                        var obj = $(this).tmplItem();

                        pageObj.increase(obj);

                    });
                    //监听-按钮事件
                    $('#cart_list').on('click', '.btn-reduce', function () {


                        var obj = $(this).tmplItem();
                        pageObj.update(tmplItem.data.Id, tmplItem.data.ProductCount);
                        pageObj.reduce(obj);


                    });
                    //监听文本框
                    $('#cart_list').on('keyup', '.number_text', function () {
                        //console.log(1)
                        var obj = $(this).tmplItem();
                        pageObj.input(obj);
                    });
                        //单个删除
                    $('#cart_list').on('click','#reMove',function(){     
                        var obj = $(this).tmplItem();
                         pageObj.remove(obj)
                    })
                    //批量删除
                    $('#btn_reMoveAll').on('click', function () {

                        var obj = $(this).tmplItem();
                        pageObj.removeAll(obj);


                    })
                    //文本框修改
                    $('#cart_list').on('input', '.number_text', function () {
                        console.log(123)
                        var obj = $(this).tmplItem();
                        console.log(obj)
                        pageObj.update(tmplItem.data.Id, tmplItem.data.ProductCount);
                    });
                    //购物车提交
                    $('#cart_submit').on('click', function () {
                        pageObj.subMitCart();
              
                    })

                });

                var pageObj = {
                    txtbox:[],
                    totalAmount: 0,
                    getData: function () {
                        $.get('/AJAX/Cart_Ajax.ashx',
                           {
                               type: 'get'

                           },
                           function (result) {
                               $('#cart_list').empty();
                               console.log(result);
                               $("#cart_list").append($('#tmpl_cart').tmpl(result.Data))
                           });
                    },
                    check: function (tmplItem) {
                        var cbCount = $('#cart_list').find('input[name="checkitems"]').length;
                        var cbChecked = $('#cart_list').find('input[name="checkitems"]:checked').length;
                        if (cbCount == cbChecked) {
                            $('#CheckedAll').prop('checked', true);
                        }


                        //修改金额
                        var subAmount = tmplItem.data.Price * tmplItem.data.ProductCount;
                        pageObj.totalAmount += subAmount;
                        $('#Total_price').text((pageObj.totalAmount).toFixed(2));


                    },
                    uncheck: function (tmplItem) {
                        var cbCount = $('#cart_list').find('input[name="checkitems"]').length;
                        var cbChecked = $('#cart_list').find('input[name="checkitems"]:checked').length;
                        if (cbChecked < cbCount) {
                            $('#CheckedAll').prop('checked', false);
                        }


                        //修改金额
                        var subAmount = tmplItem.data.Price * tmplItem.data.ProductCount;
                        pageObj.totalAmount -= subAmount;
                        $('#Total_price').text(pageObj.totalAmount);
                    },
                    reduce: function (tmplItem) {
                        //首先判断该产品的数量是否大于1，大于1就往下自减，否则不进行任何操作
                        if (tmplItem.data.ProductCount > 1)
                        {
                            tmplItem.data.ProductCount--;

                            //从模板中取得当前行内的目标元素，并修改他的显示内容（小计金额，产品数量）
                            $(tmplItem.nodes).eq(0).find('input[name="qty_item_"]').val(tmplItem.data.ProductCount);
                            $(tmplItem.nodes).eq(0).find('.subAmount').text(tmplItem.data.ProductCount * tmplItem.data.Price);

                            //判断当前行是否被选中，如果选中了，则需修改总金额
                            if ($(tmplItem.nodes).eq(0).find('input[name="checkitems"]').is(':checked')) {
                                pageObj.totalAmount -= tmplItem.data.Price;
                                $('#Total_price').text((pageObj.totalAmount).toFixed(2));

                            };

                        }



                    },
                    increase:function (tmplItem) {
                        //首先判断该产品的数量是否大于1，大于1就往下自减，否则不进行任何操作
                        if (tmplItem.data.ProductCount >= 1) {
                            tmplItem.data.ProductCount++;

                            //从模板中取得当前行内的目标元素，并修改他的显示内容（小计金额，产品数量）
                            $(tmplItem.nodes).eq(0).find('input[name="qty_item_"]').val(tmplItem.data.ProductCount);
                            $(tmplItem.nodes).eq(0).find('.subAmount').text(tmplItem.data.ProductCount * tmplItem.data.Price);

                            //判断当前行是否被选中，如果选中了，则需修改总金额
                            if ($(tmplItem.nodes).eq(0).find('input[name="checkitems"]').is(':checked')) {
                                pageObj.totalAmount += tmplItem.data.Price;
                                $('#Total_price').text((pageObj.totalAmount).toFixed(2));

                            };

                        }



                    },
                    //输入数字的方法
                    input: function (obj) {
                        var value = $(obj.nodes).eq(0).find('.number_text').val()
                        if (/^[1-9]\d*$/.test(value))
                        {
                            pageObj.txtbox[obj.key - 1] = value
                            obj.data.ProductCount = pageObj.txtbox[obj.key - 1]
                            $(obj.nodes).eq(0).find(".subAmount").text(value*obj.data.Price)
                        } else {
                            $(obj.nodes).eq(0).find(".number_text").val(pageObj.txtbox[obj.key - 1])
                            $('#Total_price').text((pageObj.totalAmount).toFixed(2));
                        }




                    },
                    //删除单条
                    remove: function (obj) {
                       
                            $.get('/AJAX/Cart_Ajax.ashx',
                              {
                                  type: 'Del',
                                  Id:obj.data.Id
                              },
                              function (result) {
                                  console.log(result)
                                  pageObj.getData()
                              });
                    },
                    //选定删除
                    removeAll: function () {
                        var cartIds = [];
                        $.each($('input[name="checkitems"]'), function (index, item) {
                            if ($(item).is(':checked')) {
                                cartIds.push($(item).val());
                            }

                        });
                        if (cartIds.length==0) {
                            alert('请先选择一个商品');
                        } else {
                            var data = {
                                type: 'Del',
                                Id: cartIds.join(','),

                            }
                            $.ajax({
                                url: '/AJAX/Cart_Ajax.ashx',
                                method: 'get',
                                dataType: 'json',
                                data: data,
                                success: function (result) {
                                    pageObj.getData();
                                  
                                }
                            })
                        
                        }
                    },
                    //修改数据
                    update: function (Id, ProductCount) {
                        var data = {
                            type: 'Upt',
                            Id: Id,
                            ProductCount: ProductCount
                        }
                        $.ajax({
                            url: '/AJAX/Product_AJAX.ashx',
                            method: 'get',
                            dataType: 'json',
                            data: data,
                            success: function (result) {
                                console.log(result)
                            }
                        })
                    },
                    //提交购物车
                    subMitCart:function(){
                        var checktmplItem = $('#cart_list').find('input[name="checkitems"]:checked');
                        console.log(checktmplItem)
                        //判断选中商品是否为0
                        if (checktmplItem.length > 0) {
                            var ids=[];
                            $.each(checktmplItem, function (index, item) { 
                                ids.push($(item).val());
                            });
                            console.log(ids)
                            var confilmInfo = {
                                source: 'cart',
                                cartsId: ids.join(',')
                            }
                            $.cookie('confilmInfo', JSON.stringify(confilmInfo), { path: '/' });
                           
                                window.location.href="/pages/cart/confilm"
                          

                        } else {
                            alert("请选择一个商品");
                        }


                    }
                

                }


              
            </script>
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
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_45.jpg" width="160px"
                                        height="160px" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_5.jpg" width="160px"
                                        height="160px" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_36.jpg" width="160px"
                                        height="160px" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_25.jpg" width="160px"
                                        height="160px" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>

                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_15.jpg" width="160px"
                                        height="160px" /></a>
                                <a href="Product_Detail.html" class="name">光明莫斯利安酸牛奶 巴氏杀菌常温200g*12盒钻石装</a>
                                <h4><span class="Price"><i>RNB</i>123.00</span></h4>
                            </li>
                            <li class="recommend_info">
                                <a href="Product_Detail.html" class="buy_btn">立即购买</a>
                                <a href="Product_Detail.html" class="img">
                                    <img src="/Content/images//p_37.jpg" width="160px"
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
