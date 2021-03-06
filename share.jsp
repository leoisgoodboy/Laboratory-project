<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<title>心得分享</title>
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
	.tip1{
		width: 300px;
		height: 400px;
		background: #C6EEDB;
	}
	.tip2{
		width: 50px;
		height: 200px;
		background: blue;
		/*right: 0;*/
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
<div class="container-fluid background-5">	
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
	
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="thumbnail">
					<img src="img/qianduan.jpg">
					<div class="caption">
						<h3>前端分享</h3>
						<p>Bootstrap 优站精选频道收集了众多基于 Bootstrap 构建、设计精美的、有创意的网站。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="thumbnail">
					<img src="img/houduan.jpg" style="width: 252px;height: 177px;">
					<div class="caption">
						<h3>后端分享</h3>
						<p>Bootstrap 优站精选频道收集了众多基于 Bootstrap 构建、设计精美的、有创意的网站。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="thumbnail">
					<img src="img/ui.jpg" style="width: 252px;height: 177px;">
					<div class="caption">
						<h3>UI分享</h3>
						<p>Bootstrap 优站精选频道收集了众多基于 Bootstrap 构建、设计精美的、有创意的网站。</p>
					</div>
				</div>
			</div>
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="thumbnail">
					<img src="img/yidongduan.jpg" style="width: 252px;height: 177px;">
					<div class="caption">
						<h3>移动端分享</h3>
						<p>Bootstrap 优站精选频道收集了众多基于 Bootstrap 构建、设计精美的、有创意的网站。</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="fold-area" style="position: relative;left: -60px;">
		<div class="col-lg-8 col-lg-offset-1" style="height: 400px;overflow: auto;"  ata-spy="scroll" data-target="#myNavbar" data-offset="20">
			
			<div class="panel-group" id="accordion">
			    <div class="panel panel-primary" id="one">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" 
			                href="#collapseOne">
			                <!-- 点击我进行展开，再次点击我进行折叠。第 1 部分hide 方法 -->
							前端开发
			                </a>
			            </h4>
			        </div>
			        <div id="collapseOne" class="panel-collapse collapse in">
			            <div class="panel-body">
			            	<div class="row">
			            		<div class="col-lg-8">
			            			jquery/2.1.1/jquery.min文档.txt
			            		</div>
			            		<div class="col-lg-2">
			            			<!-- <a href="#" class="btn btn-info btn-xs">下载</a> -->
			            			<a href = "/ZFile/DownloadServlet?filename=<%=URLEncoder.encode("OCP课件自己整理.txt", "utf-8")%>">文件下载</a>
			            		</div>
			            	</div>
			                
			    
			            </div>
			        </div>
			    </div>
			    <div class="panel panel-primary" id="two">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" 
			                href="#collapseTwo">
			                <!-- 点击我进行展开，再次点击我进行折叠。第 2 部分show 方法 -->
			                后端开发
			                </a>
			            </h4>
			        </div>
			        <div id="collapseTwo" class="panel-collapse collapse">
			            <div class="panel-body">
			                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
			                lomo.
			                eer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			                <input type="button" value="按钮" id="btn">
			            </div>
			        </div>
			    </div>
			    <div class="panel panel-primary" id="three">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" 
			                href="#collapseThree">
			                <!-- 点击我进行展开，再次点击我进行折叠。第 3 部分toggle 方法 -->
			                UI设计
			                </a>
			            </h4>
			        </div>
			        <div id="collapseThree" class="panel-collapse collapse">
			            <div class="panel-body">
			                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
			                lomo.
			                eer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            </div>
			        </div>
			    </div>
			    <div class="panel panel-primary" id="four">
			        <div class="panel-heading">
			            <h4 class="panel-title">
			                <a data-toggle="collapse" data-parent="#accordion" 
			                href="#collapseFour">
			                <!-- 点击我进行展开，再次点击我进行折叠。第 4 部分options 方法 -->
			                移动端开发
			                </a>
			            </h4>
			        </div>
			        <div id="collapseFour" class="panel-collapse collapse">
			            <div class="panel-body">
			                Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			                nesciunt sapiente ea proident. Ad vegan excepteur butcher vice 
			                lomo.
			                eer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            			Nihil anim keffiyeh helvetica, craft beer labore wes anderson cred 
			            </div>
			        </div>
			    </div>
			</div>
		</div>
		<div class="col-lg-3" id="sidebar">
			<div class="tip1 affix-bottom visible-lg-block visible-md-block container-fluid" id="myNavbar">
				<h3>点击快速跳转</h3>
				<p><a href="#one">前端开发</a></p>
				<p><a href="#two">后端开发</a></p>
				<p><a href="#three">UI设计</a></p>
				<p><a href="#four">移动端开发</a></p>
				<p><a href="#">返回顶部</a></p>

				
			</div>
		</div>
	</div>
	<!-- 查一下页尾样式 -->
	<div class="container-fluid" style="margin-top: 50px;" id="footer">
		<div class="row" style="">
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
<script>
	// $("#myScrollspy").scrollspy();
 //    $('#myScrollspy').on('activate.bs.scrollspy', function () {
        // var currentItem = $(".nav li.active > a").text();
        // $("#activeitem").html("目前您正在查看 - " + currentItem);
    //     alert('1');
    // })
	// var oSidebar=document.getElementById('sidebar');
	// var oFooter=document.getElementById('footer');
	// var oFoldarea=document.getElementById('fold-area');
	// window.onscroll=function () {
	// 	console.log(scroll.height)
	// }
	//控制侧边栏固定
	$("#btn").click(function(){
	  // $("#mmm").removeClass("affix");
	  // alert(oSidebar.clientTop);
	  // alert(oFoldarea.offsetHeight);
	  // alert(oFooter.offsetTop);
	});
	// 控制列表折叠
	$(function () { $('#collapseFour').collapse({
        toggle: true
    })});
    $(function () { $('#collapseTwo').collapse('show')});
    $(function () { $('#collapseThree').collapse('toggle')});
    $(function () { $('#collapseOne').collapse('hide')});
</script>
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
</body>

</html>