<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Manage_linlang.Pages.Product.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .m-style{
            
    display: flex;
    justify-content: center;
        }
    </style>
    <div class="breadcrumb-wrapper">
            <ol class="breadcrumb">
                <li><a href="default.aspx">首页</a></li>
                <li class="active">商品管理</li>
            </ol>
            <label for="Name" >商品名称</label>
            <input class="form-control" id="Name" type="text" />
            <div class="form-group" style="margin-top:5px">
                <label for="CategoryId" class="col-sm-1 control-label">一级类别</label>
                <div class="col-sm-5">
                    <select class="form-control" id="CategoryId" name="CategoryId">
                        <option value="-1">无</option>
                    </select>
                </div>
                <label for="SubCategoryId" class="col-sm-1 control-label">二级类别</label>
                <div class="col-sm-5">
                    <select class="form-control" id="SubCategoryId" name="SubCategoryId">
                        <option value="-1">无</option>
                    </select>
                    </div>
            </div>
            <button class="form-control btn btn-primary" style="margin-top:5px" onclick="query()">查询</button>
            
        <table class="table">
            <thead>
                <tr>
                    <td></td>
                    <td>编号</td>
                    <td>一级分类</td>
                    <td>二级分类</td>
                    <td>商品名</td>
                    <td>商品价格</td>
                    <td>简介</td>
                    <td>库存</td>
                    <td>操作 <a class="btn btn-sm btn-primary" href="Add.aspx">新增商品</a></td>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
        </div>
    <div class="page-content">
        <div id="pager" class="m-style"> </div>
    </div>
    
    <script src="../../Content/Custon/jquery.pagination.js"></script>
    <link type="text/css" href="../../Content/Custon/pagination.css"  rel="stylesheet"/>
    <script src="../../Content/Custon/jquery.tmpl.js"></script>
    <script src="../../Content/util.js"></script>
    <script type="text/x-jquery-tmpl" id="list_tmpl">
        <tr>
            <td><img style="height:60px; object-fit:fill;" src="/upload/{{= Picture}}" /></td>
            <td>{{= Id}}</td>
            <td>{{= ParentCategory}}</td>
            <td>{{= SubCategory}}</td>
            <td>{{= Name}}</td>
            <td>{{= Price}}</td>
            <td>{{= Summary}}</td>
            <td>{{= AvailableStock}}</td>
            <td>
                <button class="btn-warm btn-update">修改</button>
                <button class="btn-danger btn-delete">删除</button>
            </td>
        </tr>
    </script>
    <script src="../../Content/util.js" type="text/javascript"></script>
    <script>
        function getPC(ParentId, r) {
            $.ajax({
                url: "/Ajax/ProductCategory.ashx",
                data: {
                    type: "GetAllByPage",
                    pageIndex: 1,
                    pageSize: 999,
                    ParentId: ParentId,
                    SubCategoryId:null
                },
                success: r
            });
        }

        getPC(-1, r => {
            let p_Html = '<option value="-1">无</option>';
            r.Data.list.forEach(pc => {
                p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                $("#CategoryId").html(p_Html);
            });
        });

        $('#CategoryId').on('change', function () {
            getPC($(this).val(), r => {
                let p_Html = '<option value="-1">无</option>';
                r.Data.list.forEach(pc => {
                    p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                    $("#SubCategoryId").html(p_Html);
                });
            });
        });

        var pageObj = {
            option: {
                type:'get',
                pageIndex:1,
                pageSize: 10,
            },
            getData() {
                pageObj.option.CategoryId = $('#CategoryId').val()
                pageObj.option.SubCategoryId = $('#SubCategoryId').val()
                $.ajax({
                    url: '/Ajax/Product.ashx?type=GetAllByPage',
                    method: 'post',
                    dataType: 'json',
                    data: pageObj.option,
                    success: function (res) {
                        renderList(res.Data.list);
                        renderPager(res.Data.pageCount, pageObj.option.pageIndex);
                    }
                })
            }
        }
        pageObj.getData();
        function query() {
            pageObj.option.Name = $("#Name").val();
            pageObj.option.Gender = $("#Gender").val();
            pageObj.getData();
        }
        function renderList(list) {
            let t_html = $('#list_tmpl').tmpl(list);
            $("tbody").html(t_html);
        }
        function renderPager(pageCount, index) {
            $("#pager").pagination({
                pageCount: pageCount,
                current: index,
                callback(e) {
                    pageObj.option.pageIndex = e.getCurrent();
                    pageObj.getData();
                }
            })
        }
    </script>
</asp:Content>
