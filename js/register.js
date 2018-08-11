$(document).ready(function(){ 
        $("#username").blur(function(){   
            var aSex=document.getElementsByName("sex");
            var aGrade=document.getElementsByName("grade");
            var sexselect=null;
            var gradeselect=null;
            for(var i=0;i<aSex.length;i++){
              if(aSex[i].checked==true) {
                  sexselect=aSex[i].value;
                  break;
                }
            };
            for(var j=0;j<aGrade.length;j++){
              if(aGrade[j].checked==true) {
                  gradeselect=aGrade[j].value;
                  break;
                }
            };
            var usn = $("#username").val().toString(); 
            var usm = document.getElementById('usnImg');
            var usp = document.getElementById('usnPrompt');
            var usc = $("#usnContent");     
            $.ajax({ 
                type: "POST",    
                url: "http://localhost:8080/MyFirstProject/registServlet",
                data:{
                    username:$("#username").val().toString(),
                    password:$("#password").val().toString(),
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
                    sex:sexselect,
                    grade:gradeselect,
                    tel:$("#tel").val().toString() 
                    //因为后台写的是不管请求哪个数据，都会返回所有数据，所以每一个异步请求的时候，我都得把全部请求发过去才行。而且必须是从上到下一个一个写，不然第一个请求报了错误以后，后面的请求就没有办法正常进行了  
                },
                dataType: "json",
                success: function(data) {
                    if(data.message=='username1'){
                        usp.style.display='block';
                        usc.html('该学号已经存在!');
                        usm.style.display='block';
                        usm.src='img/error.png';
                    }else if(data.message=='username2'){
                        usp.style.display='block';
                        usc.html('学号不能为空!');
                        usm.style.display='block';
                        usm.src='img/error.png';
                    }else if(data.message=='username3'){
                        usp.style.display='block';
                        usc.html('学号中不能含有空格！');
                        usm.style.display='block';
                        usm.src='img/error.png';
                    }else if(data.message=='username4'){
                        usp.style.display='block';
                        usc.html('学号为10位纯数字！');
                        usm.style.display='block';
                        usm.src='img/error.png';
                    }else{
                        usp.style.display='none';
                        usm.style.display='block';
                        usm.src='img/success.png';
                    }
                    
                },
                error: function(jqXHR){     
                   alert("发生错误：" + jqXHR.status);   
                },     
            });
        });


       $("#password").blur(function(){ 
            var aSex=document.getElementsByName("sex");
            var aGrade=document.getElementsByName("grade");
            var sexselect=null;
            var gradeselect=null;
            for(var i=0;i<aSex.length;i++){
              if(aSex[i].checked==true) {
                  sexselect=aSex[i].value;
                  break;
                }
            };
            for(var j=0;j<aGrade.length;j++){
              if(aGrade[j].checked==true) {
                  gradeselect=aGrade[j].value;
                  break;
                }
            };
           var pas = $("#password").val().toString(); 
           var pam = document.getElementById('pasImg');
           var pap = document.getElementById('pasPrompt');
           var pac = $("#pasContent");     
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                    username:$("#username").val().toString(),
                    password:$("#password").val().toString(),
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
                    sex:sexselect,
                    grade:gradeselect,
                    tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
                   if(data.message=='password1'){
                       pap.style.display='block';
                       pac.html('密码中不能含有空格！');
                       pam.style.display='block';
                       pam.src='img/error.png';
                   }else if(data.message=='password2'){
                       pap.style.display='block';
                       pac.html('密码不能为空！');
                       pam.style.display='block';
                       pam.src='img/error.png';
                   }else if(data.message=='password3'){
                       pap.style.display='block';
                       pac.html('密码位数应小于5位或大于10位！');
                       pam.style.display='block';
                       pam.src='img/error.png';
                   }else{
                       pap.style.display='none';
                       pam.style.display='block';
                       pam.src='img/success.png';
                   }
                   
               },
               error: function(jqXHR){     
                  alert("发生错误：" + jqXHR.status);   
               },     
           });
       });



       $("#name").blur(function(){     
            var aSex=document.getElementsByName("sex");
            var aGrade=document.getElementsByName("grade");
            var sexselect=null;
            var gradeselect=null;
            for(var i=0;i<aSex.length;i++){
              if(aSex[i].checked==true) {
                  sexselect=aSex[i].value;
                  break;
                }
            };
            for(var j=0;j<aGrade.length;j++){
              if(aGrade[j].checked==true) {
                  gradeselect=aGrade[j].value;
                  break;
                }
            };
           var namem = document.getElementById('nameImg');
           var namep = document.getElementById('namePrompt');
           var namec = $("#nameContent");     
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                    username:$("#username").val().toString(),
                    password:$("#password").val().toString(),
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
                    sex:sexselect,
                    grade:gradeselect,
                    tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
                   if(data.message=='name1'){
                       namep.style.display='block';
                       namec.html('名字不能为空！');
                       namem.style.display='block';
                       namem.src='img/error.png';
                   }else{
                       namep.style.display='none';
                       namem.style.display='block';
                       namem.src='img/success.png';
                   }
                   
               },
               error: function(jqXHR){     
                  alert("发生错误：" + jqXHR.status);   
               },     
           });
       });


       $("#major").blur(function(){ 
            var aSex=document.getElementsByName("sex");
            var aGrade=document.getElementsByName("grade");
            var sexselect=null;
            var gradeselect=null;
            for(var i=0;i<aSex.length;i++){
              if(aSex[i].checked==true) {
                  sexselect=aSex[i].value;
                  break;
                }
            };
            for(var j=0;j<aGrade.length;j++){
              if(aGrade[j].checked==true) {
                  gradeselect=aGrade[j].value;
                  break;
                }
            };
           var majorm = document.getElementById('majImg');
           var majorp = document.getElementById('majPrompt');
           var majorc = $("#majContent");     
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                    username:$("#username").val().toString(),
                    password:$("#password").val().toString(),
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
                    sex:sexselect,
                    grade:gradeselect,
                    tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
                   if(data.message=='major1'){
                       majorp.style.display='block';
                       majorc.html('专业不能为空！');
                       majorm.style.display='block';
                       majorm.src='img/error.png';
                   }else{
                       majorp.style.display='none';
                       majorm.style.display='block';
                       majorm.src='img/success.png';
                   }
                   
               },
               error: function(jqXHR){     
                  alert("发生错误：" + jqXHR.status);   
               },     
           });
       });
       
       
      $("#tel").blur(function(){   
           var aSex=document.getElementsByName("sex");
           var aGrade=document.getElementsByName("grade");
           var sexselect=null;
           var gradeselect=null;
           for(var i=0;i<aSex.length;i++){
             if(aSex[i].checked==true) {
                 sexselect=aSex[i].value;
                 break;
               }
           };
           for(var j=0;j<aGrade.length;j++){
             if(aGrade[j].checked==true) {
                 gradeselect=aGrade[j].value;
                 break;
               }
           };
          var telm = document.getElementById('telImg');
          var telp = document.getElementById('telPrompt');
          var telc = $("#telContent");     
          $.ajax({ 
              type: "POST",    
              url: "http://localhost:8080/MyFirstProject/registServlet",
              data:{
                   username:$("#username").val().toString(),
                   password:$("#password").val().toString(),
                   name:$("#name").val().toString(),
                   major:$("#major").val().toString(),
                   // sex:sexselect,
                   // 少发送一个性别，看能不能阻止自动注册
                   // 当时一直报错的原因，是因为到了手机号这一步以后，所有请求都成功了(都有了相对应的值),后台写的逻辑是当全部成功时,会自动提交.
                   grade:gradeselect,
                   tel:$("#tel").val().toString()
              },
              dataType: "json",
              success: function(data) {
               if(data.message=='tel2'){
                      telp.style.display='block';
                      telc.html('电话号码中不能含有空格！');
                      telm.style.display='block';
                      telm.src='img/error.png';
                  }else if(data.message=='tel1'){
                      telp.style.display='block';
                      telc.html('电话号码不能为空！');
                      telm.style.display='block';
                      telm.src='img/error.png';
                  }else if(data.message=='tel3'){
                      telp.style.display='block';
                      telc.html('电话号码必须为11位纯数字!');
                      telm.style.display='block';
                      telm.src='img/error.png';
                  }else{
                      telp.style.display='none';
                      telm.style.display='block';
                      telm.src='img/success.png';
                  }
                  
              },
              error: function(jqXHR){     
                 alert("发生错误：" + jqXHR.status);   
              },     
          });
      });

       $("#submit").click(function(){               
           var aSex=document.getElementsByName("sex");
           var aGrade=document.getElementsByName("grade");
           var sexselect=null;
           var gradeselect=null;
           for(var i=0;i<aSex.length;i++){
            if(aSex[i].checked==true) {
                sexselect=aSex[i].value;
                break;
              }
           };
           for(var j=0;j<aGrade.length;j++){
            if(aGrade[j].checked==true) {
                gradeselect=aGrade[j].value;
                break;
              }
           };   
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                   username:$("#username").val().toString(),
                   password:$("#password").val().toString(),
                   name:$("#name").val().toString(),
                   major:$("#major").val().toString(),
                   sex:sexselect,
                   grade:gradeselect,
                   tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
//            	   || data.message=='username2' || data.message=='username3' || data.message=='username4'
                   if (data.message=='username1' || data.message=='username2' || data.message=='username3' || data.message=='username4' ) {
                       alert('请输出正确格式的学号！');
                       $("#username").focus();
                   }else if(data.message=='password1' || data.message=='password2' || data.message=='password3'){
                       alert('请输出正确格式的密码！');
                       $("#password").focus();
                   }else if(data.message=='name1'){
                       alert('请输出正确格式的姓名！');
                       $("#name").focus();
                   }else if(data.message=='major1'){
                       alert('请输出正确格式的专业！');
                       $("#major").focus();
                   }else if(data.message=='tel1' || data.message=='tel2' || data.message=='tel3'){
                       alert('请输出正确格式的电话号码！');
                       $("#tel").focus();
                   }
                   else if (data.message=='null' && data.code=='200') {
                       alert('注册成功！请点击右上角快速登录吧！');
                   }
                   
               },
               error: function(jqXHR){     
                  alert("发生错误：" + jqXHR.status);   
               },     
           });
       });
        
});