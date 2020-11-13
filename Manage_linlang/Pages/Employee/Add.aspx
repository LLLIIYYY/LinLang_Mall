<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Manage_linlang.Pages.Employee.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">
            <li><a href="/default.aspx">首页</a></li>
            <li><a href="List.aspx">员工管理</a></li>
            <li class="active">新增员工</li>
        </ol>
    </div>
    <div>
        <form class="form-horizontal" method="post" runat="server">
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">姓名</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Name" placeholder="姓名">
                </div>
            </div>
            <div class="form-group">
                <label for="inputPassword3" class="col-sm-2 control-label">性别</label>
                <div class="col-sm-10">
                    <select class="form-control" id="Gender">
                        <option value="0">保密</option>
                        <option value="1">男</option>
                        <option value="2">女</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Email" placeholder="Email">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">联系电话</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="PhoneNumber" placeholder="联系电话">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">登录ID</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="LoginId" placeholder="登录ID">
                </div>
            </div>
            <div class="form-group">
                <label for="inputEmail3" class="col-sm-2 control-label">登录密码</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="LoginPWD" placeholder="登录密码">
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
                    Name: $('#Name').val(),
                    Gender: $('#Gender').val(),
                    Email: $('#Email').val(),
                    PhoneNumber: $('#PhoneNumber').val(),
                    LoginId: $('#LoginId').val(),
                    LoginPWD: $('#LoginPWD').val(),
                    type: 'Add'
                }
                $.ajax({
                    url: '/Ajax/Employee.ashx',
                    method: 'post',
                    dataType: 'json',
                    data: postData,//要发送到服务器的数据
                    success: function (reslut) {
                        console.log(reslut);
                    }
                });
            });
        });
    </script>

</asp:Content>
