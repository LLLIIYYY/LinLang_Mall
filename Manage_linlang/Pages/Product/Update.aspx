<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="Manage_linlang.Pages.Product.Update" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">
            <li><a href="/default.aspx">首页</a></li>
            <li><a href="List.aspx">商品管理</a></li>
            <li class="active">新增商品</li>
        </ol>
    </div>
    <div>
        <form id="data" class="form-horizontal" method="post" runat="server">
            <div class="form-group">
                <label for="CategoryId" class="col-sm-2 control-label">一级类别</label>
                <div class="col-sm-10">
                    <select class="form-control" id="CategoryId" name="CategoryId">
                        <option value="-1">无</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="SubCategoryId" class="col-sm-2 control-label">二级类别</label>
                <div class="col-sm-10">
                    <select class="form-control" id="SubCategoryId" name="SubCategoryId">
                        <option value="0">无</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label for="Name" class="col-sm-2 control-label">商品名称</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Name" name="Name" placeholder="商品名称">
                </div>
            </div>
            <div class="form-group">
                <label for="Picture" class="col-sm-2 control-label">商品名称</label>
                <div class="col-sm-10">
                    <input type="file" class="form-control" id="Picture" name="Picture">
                </div>
            </div>
            <div class="form-group">
                <label for="Summary" class="col-sm-2 control-label">简介</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Summary" name="Summary" placeholder="简介">
                </div>
            </div>
            <div class="form-group">
                <label for="Description" class="col-sm-2 control-label">描述</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="Description" name="Description" placeholder="描述">
                </div>
            </div>
            <div class="form-group">
                <label for="Price	" class="col-sm-2 control-label">单价</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="Price" name="Price" placeholder="单价">
                </div>
            </div>
            <div class="form-group">
                <label for="HoldingStock" class="col-sm-2 control-label">库存</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="HoldingStock" name="HoldingStock" placeholder="库存">
                </div>
            </div>
            <div class="form-group">
                <label for="ActualStock" class="col-sm-2 control-label">实际库存</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="ActualStock" name="ActualStock" placeholder="实际库存">
                </div>
            </div>
            <div class="form-group">
                <label for="AvailableStock" class="col-sm-2 control-label">可用库存</label>
                <div class="col-sm-10">
                    <input type="number" class="form-control" id="AvailableStock" name="AvailableStock" placeholder="可用库存">
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
            function getPC(ParentId, r) {
                $.ajax({
                    url: "/Ajax/ProductCategory.ashx",
                    data: {
                        type: "GetAllByPage",
                        pageIndex: 1,
                        pageSize: 999,
                        ParentId: ParentId
                    },
                    success: r
                });
            }
            var init = true;
            $('#CategoryId').on('change', function () {
                getPC($(this).val(), r => {
                    let p_Html = '<option value="0">无</option>';
                    r.Data.list.forEach(pc => {
                        p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                    });
                    $("#SubCategoryId").html(p_Html);
                    if (init) {
                        $('#SubCategoryId').val(param["SubCategoryId"]);
                        init = null;
                    }
                });
            });

            getPC(-1, r => {
                let p_Html = '<option value="0">无</option>';
                r.Data.list.forEach(pc => {
                    p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                });
                $("#CategoryId").html(p_Html);
                $('input').each((i, inp) => {
                    let name = inp.getAttribute('Name');
                    if (!name.startsWith('_')) inp.setAttribute('value', param[name]);
                });
                $('#CategoryId').val(param["CategoryId"]);
                $('#CategoryId')[0].dispatchEvent(new Event('change'))
            });
            

            let param = {};
            window.location.hash.substr(1).split('&').forEach(d => {
                let s = d.split('=');
                param[s[0]] = s[1];
            });

            

            $('#btn_signin').on('click', function () {
                let data = new FormData(document.getElementById('data'));
                data.append("Id", param['Id']);
                data.append('type', 'Update');
                $.ajax({
                    url: '/Ajax/Product.ashx',
                    method: 'post',
                    dataType: 'json',
                    contentType: false,
                    processData: false,
                    data: data,//要发送到服务器的数据
                    success: function (reslut) {
                        console.log(reslut);
                    }
                });
            });
        });
    </script>

</asp:Content>
