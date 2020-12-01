<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="Manage_linlang.Pages.Product.Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="breadcrumb-wrapper">
        <ol class="breadcrumb">
            <li><a href="/default.aspx">首页</a></li>
            <li><a href="List.aspx">商品管理</a></li>
            <li class="active">新增产品</li>
        </ol>
    </div>

    <div>
        <form id="data" class="form-horizontal" method="post" runat="server">
            <div class="form-group">
                <label for="CategoryId" class="col-sm-2 control-label">一级类别</label>
                <div class="col-sm-10">
                    <select class="form-control" id="CategoryId" name="CategoryId">
                        <option value="0">无</option>
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
                <label for="Picture" class="col-sm-2 control-label">商品图片</label>
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
                <div class="col-sm-offset-2 col-sm-10">
                    <a class="btn btn-default" id="btn_signin">保存</a>
                </div>
            </div>
        </form>
    </div>
    <script type="text/javascript" src="../../Content/validator.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="../../Content/layui.all.js" type="text/javascript"></script>
    <script>
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

            getPC(-1, r => {
                let p_Html = '<option value="0">无</option>';
                r.Data.list.forEach(pc => {
                    p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                });
                $("#CategoryId").html(p_Html);
            });

            $('#CategoryId').on('change', function () {
                getPC($(this).val(), r => {
                    let p_Html = '<option value="0">无</option>';
                    r.Data.list.forEach(pc => {
                        p_Html += "<option value='" + pc.Id + "'>" + pc.Category + "</option>";
                    });
                    $("#SubCategoryId").html(p_Html);
                });
            });

            var validator = new Validator('data', [
                {
                    name: "CategoryId",
                    display: '必须选择一个分类',
                    rules: 'required'
                }, {
                    name: "SubCategoryId",
                    display: '必须选择一个分类',
                    rules: 'required'
                }, {
                    name: "Name",
                    display: '商品名称必须填写, 并且长度必须再2-20',
                    rules: 'required|max_length(20)|min_length(2)'
                }, {
                    name: "Price",
                    display: '单价必须填写 并且大于0',
                    rules: 'required|is_money'
                },
            ], (obj, evt) => {
                    if (obj.errors.length > 0) {
                        obj.errors.forEach(e => {
                            layer.tips(e.message, '#'+e.id, {
                                tips: [1, 'red'],
                                time: 3000,
                                tipsMore: true,
                                area: '500px'
                            });
                        })
                        return;
                    }
                    
                    let data = new FormData(document.getElementById('data'));
                    data.append('type', 'Add');
                    $.ajax({
                        url: '/Ajax/Product.ashx',
                        method: 'post',
                        dataType: 'json',
                        contentType: false,
                        processData: false,
                        data: data,//要发送到服务器的数据
                        success: function (reslut) {
                            alert(reslut.Message);
                        }
                    });
            });
            $('#btn_signin').on('click', function () {
                validator.validate()
            });
            
        });
    </script>

</asp:Content>
