<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Mall_linlang.Pages.Register" %>

<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="/Content/css/common.css" rel="stylesheet" type="text/css" />
	<link href="/Content/fonts/iconfont.css" rel="stylesheet" type="text/css" />
	<link href="/Content/css/style.css" rel="stylesheet" type="text/css" />
	<link href="/Content/css/Orders.css" rel="stylesheet" type="text/css" />
	<link href="/Content/css/purebox-metro.css" rel="stylesheet" id="skin" />
	<script src="/Content/js/jquery.min.1.8.2.js" type="text/javascript"></script>
	<script src="/Content/js/jquery.reveal.js" type="text/javascript"></script>
	<script src="/Content/js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
	<script src="/Content/js/common_js.js" type="text/javascript"></script>
	<script src="/Content/js/footer.js" type="text/javascript"></script>
	<script src="/Content/js/validator.js"></script>
	<script src="/Content/js/layer/layer.js"></script>
	<title>用户注册</title>
</head>

<body>
	<div class="Reg_log_style">
		<div class="logo">
			<a href="index.html"><img src="/Content/images/logo.png" /></a>
		</div>
		<div class="regist_style">
			<div class="left_img"><img src="/Content/images/bg_name_03.png" /></div>
			<div class="right_img"><img src="/Content/images/bg_name_05.png" /></div>
			<form id="myform" class="sign_area" autocomplete="off" method="post" runat="server">
				<div class="title_name"><span>注册</span></div>
				<div class="regist_m_1">
					<div class="add_regist">
						<ul>
							<li class="frame_style">
								<label class="user_icon"></label>
								<input placeholder="用户名/邮箱" name="userName" type="text" id="user_text" />
							</li>
							<li class="frame_style">
								<label class="password_icon"></label>
								<input name="Password" type="password" id="tbPassword" class="ywz_zhuce_kuangwenzi1 text_Password" placeholder="6-16位，由字母（区分大小写）、数字、符号组成" />
							</li>
							<div class="ywz_zhuce_xiaoxiaobao">
								<div class="ywz_zhuce_huixian" id="pwdLevel_1">弱</div>
								<div class="ywz_zhuce_huixian" id="pwdLevel_2">中</div>
								<div class="ywz_zhuce_huixian" id="pwdLevel_3">强</div>
							</div>
							<li class="frame_style">
								<label class="password_icon"></label><input placeholder="确认密码" name="Password_cfm" type="password" id="confirm_pwd_text" />
							</li>
							<li class="frame_style">
								<label class="Codes_icon"></label>
								<input placeholder="验证码" name="captcha" type="text" id="Codes_text" />
								<div class="Codes_region">
									<img id="captcha" src="/AJAX/Captcha.ashx" style="width:150px;height:50px;" />
								</div>
							</li>
						</ul>
						<div class="auto_login clearfix">
							<p class="clearfix">
								<a id="check_agreement" href="#" class="check_agreement">我已阅读相关规定</a>
								<input id="autoLoginCheck" type="hidden" />
								<span id="agreement_tips" class="auto_tips" style=""></span>
							</p>
							<a href="#" target="_blank" class="forget_pswd" tabindex="-1">《商城用户协议》</a>
						</div>
						<div class="center clearfix">
							<!-- <a class="btn_pink" id="btn_signin" href="javascript:void(0)">立即注册</a> -->
							<a class="btn_pink" style="width:40%;float:left;cursor:pointer" id="btn_signin">立即注册
							</a>
							<a class="btn_register" id="btn_signin" href="Login">登录
							</a>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		$(function () {
            var validator = new Validator('myform', [
                {
                    name: "userName",
                    display: "必填字段不能为空|字数小于6个字符|大于12个字符",
                    rules: 'required|min_length(6)|max_length(12)'
                }, {
                    name: "Password",
                    display: "必填字段不能为空|字数小于6个字符|大于12个字符",
                    rules: 'required|min_length(6)|max_length(12)'
                }, {
                    name: "Password_cfm",
                    display: "必填字段不能为空|两次密码不相同",
                    rules: 'required|equalTo("#Password")'
                }
            ],
                function (obj, evt) {
                    if (obj.errors.length > 0) {
                        var errorobj = obj.errors[0];
                        layer.tips(errorobj.message, '#' + errorobj.id, {
                            tips: [2, '#ff6600'],
                            time: 4000
						})
						console.log(errorobj);
                        return;
					}
                    if ($('#tbPassword').val() != $('#confirm_pwd_text').val()) {
                        layer.tips("两次密码不同", '#confirm_pwd_text', {
							tips: [2, '#ff6600'],
							time: 4000
						});
						return;
                    }

                    //定义即将发送到服务器的数据对象
                    var userName = $('#user_text').val();
                    var userPWD = $('#tbPassword').val();
                    var userPWD_cfm = $('#confirm_pwd_text').val();
                    var captcha = $('#Codes_text').val();

                    var postData = {
                        loginId: userName,
                        loginPWD: userPWD,
                        loginPWD_cfm: userPWD_cfm,
                        captcha: captcha,
                        type: 'Register',
                    }


                    //$('#myform').submit();
                    $.ajax({
                        url: '/AJAX/User.ashx',
                        method: 'post',
                        dataType: 'json',
                        data: postData,//要发送到服务器的数据
                        success: function (reslut) {
                            alert(reslut.Message);
                        }
                    });
                });


			$('#btn_signin').on('click', function () {
				validator.validate();
			});
		});
    </script>
</body>

</html>v
