$(document).ready(function(){ 
        $("#login1").click(function(){ 
            var usn = $("#username1").val().toString();     
            var pas = $("#password1").val().toString();
            var oGoreg = document.getElementById('goReg');
            var oShu = document.getElementById('shu');
            var oGolog = document.getElementById('goLog');
            var oMyself = document.getElementById('myself');
            var oNewshu = document.getElementById('newshu');
            var oMyname = document.getElementById('myname');
            var oExit = document.getElementById('exit');
            $.ajax({ 
                type: "POST",    
                url: "http://localhost:8080/MyFirstProject/loginServlet",
                data:{
                	username:usn,
                	password:pas
                },
                dataType: "json",
                success: function(data) {
                    if(data.message!='username'){
                        if(data.message=='null' && data.code==200){
                            alert("登录成功！");
                            
                            window.location.href='http://localhost:8080/MyFirstProject/index.html';

                            /*方法一：两者混合写，但是互不关联
                            $.ajax({ 
                                type: "POST",    
                                url: "http://localhost:8080/MyFirstProject/loginServlet",
                                data:{
                                    username:$("#username1").val().toString(),
                                    tel:$("#tel").val().toString()
                                },
                                dataType: "json",
                                success: function(data) {
                                    if(data.message==''){
                                       var oMyname = document.getElementById('myname');
                                       oMyname.innerHTML='<span class="glyphicon glyphicon-user">'+'</span>'+data.name;
                                    }
                                },
                                error: function(jqXHR){     
                                   alert("发生错误：" + jqXHR.status);  
                                },     
                            });
                            */
                           
                            /*
                            方法二：
                            var usn = $("#username1").val().toString();
                            if(usn.length == 11){
                                $.ajax({ 
                                    type: "POST",    
                                    url: "http://localhost:8080/MyFirstProject/loginServlet",
                                    data:{
                                        tel:$("#tel").val().toString()
                                    },
                                    dataType: "json",
                                    success: function(data) {
                                        if(data.message==''){
                                           var oMyname = document.getElementById('myname');
                                           oMyname.innerHTML='<span class="glyphicon glyphicon-user">'+'</span>'+data.name;
                                        }
                                    },
                                    error: function(jqXHR){     
                                       alert("发生错误：" + jqXHR.status);  
                                    },     
                                });
                            }else{
                                $.ajax({ 
                                    type: "POST",    
                                    url: "http://localhost:8080/MyFirstProject/loginServlet",
                                    data:{
                                        username:$("#username1").val().toString()
                                    },
                                    dataType: "json",
                                    success: function(data) {
                                        if(data.message==''){
                                           var oMyname = document.getElementById('myname');
                                           oMyname.innerHTML='<span class="glyphicon glyphicon-user">'+'</span>'+data.name;
                                        }
                                    },
                                    error: function(jqXHR){     
                                       alert("发生错误：" + jqXHR.status);  
                                    },     
                                });
                            }
                             */
                            if (data.cookie=='exit=true') {
                                oGoreg.style.display='none';
                                oGolog.style.display='none';
                                oShu.style.display='none';
                                oMyself.style.display='block';
                                oMyname.style.display='block';
                                oNewshu.style.display='block';
                                oExit.style.display='block';
                            }
                        }else{
                            alert("密码错误！");
                            // console.log(data);
                        }
                    }else{
                        alert("账号错误！");
                        // console.log(data);
                    }
                },
                error: function(jqXHR){     
                   alert("发生错误：" + jqXHR.status);  
                },     
            });
        });
        
        
    });