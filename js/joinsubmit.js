$(document).ready(function(){ 

       $("#name").blur(function(){     
           var namem = document.getElementById('nameImg');
           var namep = document.getElementById('namePrompt');
           var namec = $("#nameContent");     
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
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
           var majorm = document.getElementById('majImg');
           var majorp = document.getElementById('majPrompt');
           var majorc = $("#majContent");     
           $.ajax({ 
               type: "POST",    
               url: "http://localhost:8080/MyFirstProject/registServlet",
               data:{
                    name:$("#name").val().toString(),
                    major:$("#major").val().toString(),
                    tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
                   if(data.message=='major1'){
                       majorp.style.display='block';
                       majorc.html('方向不能为空！');
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
          var telm = document.getElementById('telImg');
          var telp = document.getElementById('telPrompt');
          var telc = $("#telContent");     
          $.ajax({ 
              type: "POST",    
              url: "http://localhost:8080/MyFirstProject/registServlet",
              data:{
                   name:$("#name").val().toString(),
                   major:$("#major").val().toString(),
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

       $("#submitBtn").click(function(){               
           var aGrade=document.getElementsByName("grade");
           var gradeselect=null;
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
                   name:$("#name").val().toString(),
                   major:$("#major").val().toString(),
                   grade:gradeselect,
                   tel:$("#tel").val().toString()
               },
               dataType: "json",
               success: function(data) {
                   if(data.message=='name1'){
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
                       alert('提交成功！我们会在第一时间答复您！');
                   }
                   
               },
               error: function(jqXHR){     
                  alert("发生错误：" + jqXHR.status);   
               },     
           });
       });
        
});