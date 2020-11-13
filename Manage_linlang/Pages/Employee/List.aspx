<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Manage_linlang.Pages.Employee.List" %>
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
                <li class="active">员工管理</li>
            </ol>
            <label for="Name" >姓名</label>
            <input class="form-control" id="Name" type="text" />
            <select id="Gender" class="form-control">
                <option value="0">全部</option>
                <option value="1">男</option>
                <option value="2">女</option>
            </select>
            <button class="form-control" onclick="query()">查询</button>
            
        <table class="table">
            <thead>
                <tr>
                    <td>姓名</td>
                    <td>姓名</td>
                    <td>性别</td>
                    <td>Email</td>
                    <td>手机号码</td>
                    <td>操作 <a href="Add.aspx">新增员工</a></td>
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
            <td>{{= Id}}</td>
            <td>{{= Name}}</td>
            <td>{{= GenderText}}</td>
            <td>{{= Email}}</td>
            <td>{{= PhoneNumber}}</td>
            <td><a href="#?Id={{= Id}}">修改</a>
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
                Name: '',
                Gender: '0'
            },
            getData() {
                $.ajax({
                    url: '/Ajax/Employee.ashx?type=GetAllByPage',
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
                        url: '/Ajax/Employee.ashx?type=Delete',
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
                window.location = "/Pages/Employee/Update#" + obj2UrlParam(data);
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
        $("tbody").on("click", ".btn-delete", function(){
            pageObj.remove($.tmplItem(this).data);
        });
        $("tbody").on("click", ".btn-update", function () {
            pageObj.update($.tmplItem(this).data);
        });
    </script>
</asp:Content>
