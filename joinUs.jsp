<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>加入我们</title>
	<link href="css/loginBox.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="http://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link rel="stylesheet" href="css/backgroundStyle.css">
	<script src="http://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
	<script src="http://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.navbar-nav a{
		color: white !important;
	}
	.nav a{
		color: white !important;
	}
	.dropdown-menu{
		background: black;
	}
	.dropdown-menu a:hover{
		color: red !important;
		background: black !important;
	}
	.row .hidden-sm{
		border-right: 1px solid #736F6F;
	}
</style>
<script type="text/javascript">
	window.onload=function () {
		var oGoreg = document.getElementById('goReg');
        var oShu = document.getElementById('shu');
        var oGolog = document.getElementById('goLog');
        var oMyself = document.getElementById('myself');
        var oNewshu = document.getElementById('newshu');
        var oMyname = document.getElementById('myname');
        var oExit = document.getElementById('exit');
        
		function getCookie(key) {
			var arr1=document.cookie.split('; ');	//将cookie值进行第一次拆分
			for(var i=0;i<arr1.length;i++){
				var arr2=arr1[i].split('=');	//将每个arr1中的值进行第二次拆分
				if (arr2[0]==key) {
					return decodeURI(arr2[1]);
				}
			}
		}

		function removeCooke(key) {
			setCookie(key,'',-1);
		}

		if (getCookie('exit')=='true') {
			oGoreg.style.display='none';
            oGolog.style.display='none';
            oShu.style.display='none';
            oMyself.style.display='block';
            oMyname.style.display='block';
            oNewshu.style.display='block';
            oExit.style.display='block';
		}
		
		oExit.onclick=function () {
			removeCooke('exit');
			var nowUrl=location.pathname;
            window.location.href=nowUrl;
            oGoreg.style.display='block';
            oGolog.style.display='block';
            oShu.style.display='block';
            oMyself.style.display='none';
            oMyname.style.display='none';
            oNewshu.style.display='none';
            oExit.style.display='none';
		}
	}
</script>
</head>
<body>
<div class="container-fluid background-4">
	<div class="row">
		<nav class="nav navbar-transparent" id="navTop1">
			<div class="container-fluid">
				<div class="navbar-header" style="padding: 0;position: relative;z-index: 10;">
					<!-- <a href="#" class="navbar-brand">logo</a> -->
					<img src="img/logo.jpg" class="navbar-brand" style="width: 100px;height: 70px;margin:0;position: absolute;top:-10px">
				</div>


				<a href="register.html" class="navbar-link navbar-text navbar-right" style="position: relative;left: -10px;" id="goReg">[注册]</a>
			
				<p class="navbar-text navbar-right" style="color: white;" id="shu">|</p>
				<a href="javascript:showDialog()" id="goLog" class="navbar-link navbar-text navbar-right" style="position: relative;left: 10px;"><span class="glyphicon glyphicon-user"></span>[登录]</a>
				
				<a href="#" class="navbar-link navbar-text navbar-right" style="position: relative;left: -10px;display: none;" id="exit">[退出登录]</a>
				<a href="register.html" class="navbar-link navbar-text navbar-right" style="position: relative;left: -10px;display: none;" id="myself">个人中心</a>
				<p class="navbar-text navbar-right" style="color: white;display: none;" id="newshu">|</p>
				<a href="javascript:showDialog()" id="myname" class="navbar-link navbar-text navbar-right" style="position: relative;left: 10px;display: none;"><span class="glyphicon glyphicon-user"></span>姓名</a>
				

				<p class="navbar-text navbar-right"><a href="#" class="navbar-link"><span class="glyphicon glyphicon-envelope">邮箱</span></a></p>
				<p class="navbar-text navbar-right" style="color: white"><span class="glyphicon glyphicon-earphone"></span>123456789</p>
				<form class="navbar-form navbar-right">
					<div class="input-group">
						<input type="text" class="form-control" style="" placeholder="搜索">
						<span class="input-group-addon"><a href="#"><span class="glyphicon glyphicon-search" style="color: blue"></span></a></span>
					</div>
				</form>
			</div>
		</nav>
	</div>
	
	    
	<!-- 对话框默认居中 -->
	<div class="ui-mask" id="mask" onselectstart="return false"></div>
	<!-- 对话框 -->
	<div class="login-box" id="dialogMove" onselectstart='return false;'>
		<!-- 登陆界面 -->
		<div class="login-box-title" id="dialogDrag"  onselectstart="return false;" >
			登录通行证
			<a class="login-box-close-button" href="javascript:hideDialog();"></a>
		</div>
		<div class="panel-body">
            <div class="form-group">
                <label><span class="glyphicon glyphicon-user"></span>用户名:</label><input type="text" class="form-control"  id="username" placeholder="教职工号/学生学号/手机号">
                <!-- <div class="alert alert-warning">用户名不能为空！</div> -->
                <label><span class="glyphicon glyphicon-lock"></span>密码:</label><input type="password" class="form-control" id="password" placeholder="密码" >
            </div>
			<div class="login-box-l40">
				<a href="register.html" style="float: left;">注册</a>
				<a href="#">忘记密码</a>
			</div>
			<div>
				<a class="login-box-submit" href="#" id="login">登录</a>
			</div>
			<!-- <div class="ui-dialog-l40">
				<a href="#">立即注册</a>
			</div> -->
		</div>
	</div>
	<!-- 导航栏 -->
	<div class="row">
		<nav class="nav navbar-transparent" id="navTop2">
		<!-- nav 内设置 navbar-transparent属性时不能包含 navbar-default 和 navbar-inverse 属性，会冲突 -->
			<div class="container-fluid">
				<div class="navbar-header">
					<button class="navbar-toggle" data-toggle="collapse" data-target="#myCollapse">
						<!-- 要点击展开谁，设置谁的id，并用data-target对应起来 -->
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<!-- 三条横线 -->
					</button>
					<a href="#" class="navbar-brand"><span class="glyphicon glyphicon-align-justify"></span>全部导航</a>
				</div>
				<div class="collapse navbar-collapse" id="myCollapse">
					<!-- 需要在移动端上折叠谁就给谁加一个div，然后设置这样的class类 -->	
					<ul class="nav navbar-nav navbar-left">
						<li class="dropdown navbarDropdown">
							<a href="index.html" class="dropdown-toggle">主页<span class="caret"></span></a>
							<!-- <ul class="dropdown-menu">
								<li><a href="#">Action</a></li>
							    <li><a href="#">Another action</a></li>
							    <li><a href="#">Something else here</a></li>
							    <li><a href="#">Separated link</a></li>
							</ul> -->
						</li>
						<li class="dropdown navbarDropdown">
							<a href="laboratory.html" class="dropdown-toggle">实验室概况<span class="caret"></span></a>
							<!-- <ul class="dropdown-menu">
								<li><a href="members.html">成员介绍</a></li>
								<li><a href="#">child2</a></li>
								<li><a href="#">child3</a></li>
								<li><a href="#">child4</a></li>
							</ul> -->
						</li>
						<li class="dropdown navbarDropdown">
							<a href="members.html" class="dropdown-toggle">成员介绍<span class="caret"></span></a>
							<!-- 因为有data-toggle="dropdown"的存在，所以a变成了点击展开下拉列表，而不是跳转 -->
							<!-- <ul class="dropdown-menu">
								<li><a href="#">child1</a></li>
								<li><a href="#">child2</a></li>
								<li><a href="#">child3</a></li>
								<li><a href="#">child4</a></li>
							</ul> -->
						</li>
						<li class="dropdown navbarDropdown">
							<a href="share.html" class="dropdown-toggle">学习分享<span class="caret"></span></a>
							<!-- <ul class="dropdown-menu">
								<li><a href="#">child1</a></li>
								<li><a href="#">child2</a></li>
								<li><a href="#">child3</a></li>
								<li><a href="#">child4</a></li>
							</ul> -->
						</li>
						<li class="dropdown navbarDropdown">
							<a href="joinUs.html" class="dropdown-toggle">加入我们<span class="caret"></span></a>
							<!-- <ul class="dropdown-menu">
								<li><a href="#">child1</a></li>
								<li><a href="#">child2</a></li>
								<li><a href="#">child3</a></li>
								<li><a href="#">child4</a></li>
							</ul> -->
						</li>
					</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12" style="">
			<div style="width: 700px;height: 100px;margin: 0 auto;text-align: center;line-height: 100px;font-size: 15px;">
				每年实验室会招收新的同学加入实验室一起学习，希望优秀的你可以加入我们为实验室更为自己而努力！
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 50px;">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-3 hidden-xs" style="position: relative;top: -20px;">
				<span style="font-size: 20px;position: relative;display: inline-block;width: 500px;">听说加入实验室后技术越来越牛批了！</span>
				<img src="img/amazing.jpg" style="width: 300px;height: 200px;">
				<span style="font-size: 20px;position: relative;display: inline-block;width: 500px;">快快填表让我们发现你的光芒吧————————></span>
			</div>
			<div class="col-lg-7  col-md-7  col-sm-7  col-xs-9 col-xs-offset-2" style="">
				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
								<label class="pull-right">姓名:</label>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5">
								<input type="text" class="form-control"  placeholder="请输入姓名" id="name">
							</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<img src="img/success.png" style="width: 25px;height: 25px;display: none;position: relative;top: 5px;" id="nameImg">
							</div>
						</div>
					</div>
				</div>

				<div class="row" id="namePrompt" style="display: none;">
					<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 alert alert-danger" style="height: 20px;text-align: center;line-height: 20px;">
						<span style="position: relative;top: -5px;" id="nameContent">姓名不能为空！</span>
					</div>
				</div>

				<!-- <div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
								<label class="pull-right">专业</label>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5">
								<input type="text" class="form-control"  placeholder="请输入专业">
							</div>
						</div>
					</div>
				</div> -->
				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
								<label class="pull-right">方向:</label>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5">
								<input type="text" class="form-control"  placeholder="请输入想要学习的方向" id="major">
							</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<img src="img/success.png" style="width: 25px;height: 25px;display: none;position: relative;top: 5px;" id="majorImg">
							</div>
						</div>
					</div>
				</div>

				<div class="row" id="majPrompt" style="display: none;">
					<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 alert alert-danger" style="height: 20px;text-align: center;line-height: 20px;">
						<span style="position: relative;top: -5px;" id="majContent">专业不能为空！</span>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
								<label class="pull-right">手机:</label>
							</div>
							<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5">
								<input type="text" class="form-control"  placeholder="请输入手机号" id="tel">
							</div>
							<div class="col-lg-1 col-md-1 col-sm-1 col-xs-1">
								<img src="img/success.png" style="width: 25px;height: 25px;display: none;position: relative;top: 5px;" id="telImg">
							</div>
						</div>
					</div>
				</div>

				<div class="row" id="telPrompt" style="display: none;">
					<div class="col-lg-5 col-md-5 col-sm-7 col-xs-5 col-lg-offset-3 col-md-offset-3 col-sm-offset-3 col-xs-offset-3 alert alert-danger" style="height: 20px;text-align: center;line-height: 20px;">
						<span style="position: relative;top: -5px;" id="telContent">手机号不能为空！</span>
					</div>
				</div>

				<div class="row">
					<div class="form-group">
						<div class="row">
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3" >
								<label class="pull-right">年级:</label>
							</div>
							<div class="col-lg-9">
								<label class="radio-inline col-lg-2">
						        	<input type="radio" name="grade" id="optionsRadios3" value="一年级" checked>一年级
						    	</label>
						    	<label class="radio-inline col-lg-2">
						        	<input type="radio" name="grade" id="optionsRadios4"  value="二年级">二年级
						    	</label>
								<label class="radio-inline col-lg-2">
						        	<input type="radio" name="grade" id="optionsRadios4"  value="三年级">三年级
						    	</label>
						    	<label class="radio-inline col-lg-2">
						        	<input type="radio" name="grade" id="optionsRadios4"  value="四年级">四年级
						    	</label>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>			
	</div>
	<div class="row">
		
			<div class="col-lg-7  col-md-8  col-sm-12 col-xs-12 col-lg-offset-3 col-md-offset-2 col-sm-offset-1 col-xs-offset-1" style="font-size: 15px;font-weight:bold;">
				<label class="pull-left" style="font-size: 25px;position: relative;">如果你之前有做过的东西,我们会优先考虑,请压缩后上传：</label>
			</div>
		
	</div>
	<div class="row">
		<div class="col-lg-7 col-md-11 col-sm-12 col-xs-12  col-md-offset-3 col-sm-offset-2 col-xs-offset-2">
			<form action="UploadServlet" method="post"
				enctype="multipart/form-data" style="position: relative;">
				<div class="row">
					<div class="col-lg-1 col-md-1  col-sm-1 col-xs-1 " style="margin-right: 20px;position: relative;left: -30px;">
					    <div class="file-container" style="display:inline-block;position:relative;overflow: hidden;vertical-align:middle;">
					        <button class="btn btn-success fileinput-button"   type="button"><span class="glyphicon glyphicon-folder-open"></span>选择文件</button>
					        <input type="file" name="myfile" onchange="loadFile(this.files[0])" style="position:absolute;top:0;left:0;font-size:34px; opacity:0">
					       
					    </div>
					</div>
					<div class="col-lg-5 col-md-4 col-sm-5 col-xs-6 ">
					 	 <span id="filename" style="vertical-align: middle;position: relative;" class="form-control">未上传文件</span>
					</div>
					<div class="col-lg-1 col-md-1 col-sm-1 col-xs-2 " style="position: relative;">
						<button type="submit" class="btn btn-primary" /><span class="glyphicon glyphicon-open"></span>上传文件</button>
					</div>
				</div>
			</form>
		</div>
		
	
		<script>
		function loadFile(file){
		    $("#filename").html(file.name);
		}
		</script>
	</div>
	<div class="row" style="margin-top: 30px;">
		<div class="col-lg-3  col-md-3 col-sm-3 col-xs-3 col-lg-offset-5  col-md-offset-5 col-sm-offset-5 col-xs-offset-5">
			<input type="button" value="点击提交" id="submitBtn" class="btn btn-info" style="position: relative;left: 15px;">
		</div>
		
	</div>
	<div class="container-fluid" style="margin-top: 50px;">
		<div class="row">
			<ul class="row">
				<li class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
					<div class="footerWork">
						<h3>技术支持</h3>
							<ul style="position: relative;left: -38px;">
								<li>西安文理学院</li>
								<li>信息工程学院</li>
								<li>教务系统</li>
								<li>关于我们</li>
							</ul>
					</div>
				</li>

				<li class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1">
					<div class="footerPhone">
						<h3>联系我们</h3>
						<ul style="position: relative;left: -38px;">
							<li>电话：18109238856</li>
							<li>邮编：710065</li>
							<li>邮箱：376731363@qq.com</li>
							<li>时间：周一至周五8:00-21:00</li>
						</ul>

					</div>
				</li>
				<li class="col-lg-3 col-md-3 col-sm-3 col-xs-3 col-lg-offset-1 col-md-offset-1 col-sm-offset-1 col-xs-offset-1" style="float: left;">
					<h3>问题交流</h3> <img src="img/mypic.png" style="width: 100px;height: 80px;position: relative;" 
					alt="二维码" />
				</li>
			</ul>
		</div>
	</div>
	<div style="width: 100%;height: 100px;margin:0 auto;text-align: center;line-height: 100px;">
		Copyright &copy; 2018-2019 西安市西安文理学院信息工程学院电子商务实验室
	</div>
</div>
<script type="text/javascript">
	if (window.navigator.userAgent.toLowerCase().indexOf('mobile')==-1) {
		// 导航栏的鼠标移入移出显示内容
		var aNavdropdown=document.getElementsByClassName('navbarDropdown');
		for(var i=0;i<aNavdropdown.length;i++){
			aNavdropdown[i].index=i;
			aNavdropdown[i].onmouseover=function () {
				for(var i=0;i<aNavdropdown.length;i++){
					aNavdropdown[i].className='dropdown navbarDropdown';
				}
				this.className='open dropdown navbarDropdown';
			}
			aNavdropdown[i].onmouseout=function () {
				
				this.className='dropdown navbarDropdown';
			}
		}

		// 鼠标移入移出改变导航栏样式
		var navTop1=document.getElementById('navTop1');
		var navTop2=document.getElementById('navTop2');
		navTop1.onmouseover=function () {
			this.className='nav navbar-inverse';
		}
		navTop1.onmouseout=function () {
			this.className='nav navbar-transparent';
		}
		navTop2.onmouseover=function () {
			this.className='nav navbar-inverse';
		}
		navTop2.onmouseout=function () {
			this.className='nav navbar-transparent';
		}

		var aBot=document.getElementsByClassName('Bot');
		for(var j=0;j<aBot.length;j++){
			aBot[j].onmouseover=function () {
				for(var i=0;i<aBot.length;i++){
					aBot[i].style.opacity=1;
				}
				this.style.opacity=0.3;
			}
			aBot[j].onmouseout=function () {
				this.style.opacity=1;

			}
		}

	}
</script>
<!-- 导入登陆框JS -->
<script type="text/javascript" src="js/login.js"></script>
<script type="text/javascript" src="js/loginBox.js"></script>
<script type="text/javascript" src="js/joinsubmit"></script>
</body>
</html>