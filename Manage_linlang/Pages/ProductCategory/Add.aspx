﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Manage_linlang.Pages.ProductCategory.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">
            <li><a href="/default.aspx">首页</a></li>
            <li><a href="List.aspx">分类管理</a></li>
            <li class="active">新增分类</li>
        </ol>
    </div>
    <div>
        <form class="form-horizontal" method="post" runat="server">
            <div class="form-group">
                <label for="ParentId" class="col-sm-2 control-label">上级分类</label>
                <div class="col-sm-10">
                    <select class="form-control" id="ParentId">
                        <option value="0">无</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="Category" class="col-sm-2 control-label">分类名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Category" placeholder="分类名称">
                </div>
            </div>
            
            <div class="form-group">
                <label for="Remark" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Remark" placeholder="简介">
                </div>
            </div>
            <div class="form-group">
                <label for="Summary" class="col-sm-2 control-label">备注</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Summary" placeholder="备注">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <a class="btn btn-default" id="btn_signin">保存</a>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript">
        $(function () {
            $('#btn_signin').on('click', function () {
                //定义即将发送到服务器的数据对象
                var postData = {
                    ParentId: $('#ParentId').val(),
                    Category: $('#Category').val(),
                    Remark: $('#Remark').val(),
                    Summary: $('#Summary').val(),
                    type: 'Add'
                }
                $.ajax({
                    url: '/Ajax/ProductCategory.ashx',
                    method: 'post',
                    dataType: 'json',
                    data: postData,//要发送到服务器的数据
                    success: function (reslut) {
                        alert(reslut.Message);
                    }
                });
            });
            $.ajax({
                url: "/Ajax/ProductCategory.ashx",
                data: {
                    type:"GetAllByPage",
                    pageIndex: 1,
                    pageSize: 999,
                    ParentId:0
                },
                success: r => {
                    console.log(r)
                    r.Data.list.forEach(pc => {
                        $("#ParentId").append("<option value='" + pc.Id + "'>" + pc.Category + "</option>")
                    })
                }
            })
        });
    </script>

</asp:Content>
