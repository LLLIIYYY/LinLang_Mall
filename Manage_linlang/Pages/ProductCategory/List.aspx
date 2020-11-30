<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Manage_linlang.Pages.ProductCategory.List" %>
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
            <li class="active">分类管理</li>
        </ol>

        <div class="form-row">
            <div class="form-group col-md-6">
                <label for="Category" class="">类别名称</label>
                <input class="form-control" type="text" Id="Category" />
            </div>
            <div class="form-group col-md-6">
                <label for="ParentId" class="">一级分类</label>
                <select class="form-control" id="ParentId">
                        <option value="-1">全部</option>
                        <option value="0">无</option>
                    </select>
            </div>
            <div class="form-group "> <button onclick="pageObj.getData()" class="form-control col-sm-6 btn btn-primary" style="margin-top:5px">查询</button></div>
        </div>
        
        <table class="table">
            <thead>
                <tr>
                    <td>一级分类</td>
                    <td>二级分类</td>
                    <td>简介</td>
                    <td>备注</td>
                    <td>操作 <a class="btn btn-sm btn-primary" href="Add.aspx">新增类别</a></td>
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
    <script type="text/x-jquery-tmpl" id="list_tmpl">
        <tr>
            <td>{{= ParentCategory}}</td>
            <td>{{= Category}}</td>
            <td>{{= Summary}}</td>
            <td>{{= Remark}}</td>
            <td>
                <button class="btn-warm btn-update">修改</button>
                <button class="btn-danger btn-delete">删除</button>
            </td>
        </tr>
    </script>
    <script src="../../Content/util.js" type="text/javascript"></script>
    <script>
        var pageObj = {
            option: {
                type:'get',
                pageIndex:1,
                pageSize: 10,
                Category:"",
                ParentId:-1,
            },
            getData() {
                this.option.ParentId = $("#ParentId").val();
                this.option.Category = $("#Category").val();
                $.ajax({
                    url: '/Ajax/ProductCategory.ashx?type=GetAllByPage',
                    method: 'post',
                    dataType: 'json',
                    data: pageObj.option,
                    success: function (res) {
                        renderList(res.Data.list);
                        renderPager(res.Data.pageCount, pageObj.option.pageIndex);
                    }
                })
            },
            remove(data) {
                console.log(data)
                if (confirm("你确认删除吗?"))
                    $.ajax({
                        url: '/Ajax/ProductCategory.ashx?type=Delete',
                        method: 'post',
                        dataType: 'json',
                        data: data,
                        success: function (res) {
                            alert(res.Message);
                            window.location.reload();
                    }
                })
            },
            update(data) {
                window.location = "/Pages/ProductCategory/Update#" + util.obj2UrlParam(data);
            }
        }
        pageObj.getData();
        function renderList(list) {
            let t_html = $('#list_tmpl').tmpl(list);
            $("tbody").html(t_html);
            let s_html = "<option value='-1'>全部</option><option value='0'>无</option>";
            list.forEach(pc => {
                s_html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
            })
            $("#ParentId").html(s_html);
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
        $("tbody").on("click", ".btn-delete", function(){
            pageObj.remove($.tmplItem(this).data);
        });
        $("tbody").on("click", ".btn-update", function () {
            pageObj.update($.tmplItem(this).data);
        });
    </script>
</asp:Content>
