<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Manage_linlang.Pages.Employee.Update" %>

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
                <div class="col-sm-offset-2 col-sm-10">
                    <a class="btn btn-default" id="btn_update">保存</a>
                </div>
            </div>
        </form>
    </div>
    <script src="../../Content/util.js"></script>
    <script type="text/javascript">
        $(function () {
            let param = {};
            window.location.hash.substr(1).split('&').forEach(d => {
                let s = d.split('=');
                param[s[0]] = decodeURIComponent(s[1]);
            });

            $('#Name').val(param['Name']);
            $('#Gender').val(param['Gender']);
            $('#Email').val(param['Email']);
            $('#PhoneNumber').val(param['PhoneNumber']);
            $('#btn_update').on('click', function () {
                var postData = {
                    Id: param['Id'],
                    Name: $('#Name').val(),
                    Gender: $('#Gender').val(),
                    Email: $('#Email').val(),
                    PhoneNumber: $('#PhoneNumber').val(),
                    type: 'Update'
                }
                $.ajax({
                    url: '/Ajax/Employee.ashx',
                    method: 'post',
                    dataType: 'json',
                    data: postData,//要发送到服务器的数据
                    success: function (reslut) {
                        alert(reslut.Message)

                    }
                });
            });
        });
    </script>

</asp:Content>
