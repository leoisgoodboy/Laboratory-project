
	var dialogInstace , onMoveStartId;	
	function g(id){return document.getElementById(id);}
	function autoCenter( el ){
		var bodyW = document.documentElement.clientWidth;
		var bodyH = document.documentElement.clientHeight;

		var elW = el.offsetWidth;
		var elH = el.offsetHeight;

		el.style.left = (bodyW-elW)/2 + 'px';
		el.style.top = (bodyH-elH)/2 + 'px';
		
	}
	// 填满
	function fillToBody( el ){
		el.style.width  = document.documentElement.clientWidth  +'px';
		el.style.height = document.documentElement.clientHeight + 'px';
	}
	//对话框
	function Dialog( dragId , moveId ){

		var instace = {} ;

		instace.dragElement  = g(dragId);
		instace.moveElement  = g(moveId);	
		instace.mouseOffsetLeft = 0;
		instace.mouseOffsetTop = 0;	
		instace.dragElement.addEventListener('mousedown',function(e){
			var e = e || window.event;
			dialogInstace = instace;
			instace.mouseOffsetLeft = e.pageX - instace.moveElement.offsetLeft ;
			instace.mouseOffsetTop  = e.pageY - instace.moveElement.offsetTop ;
			
		})

		return instace;
	}

	document.onmouseup = function(e){
		
		dialogInstace = false;
		clearInterval(onMoveStartId);

	}

	document.onmousemove = function(e) {
		var e = e || window.event;
		var instace = dialogInstace;
	    if (instace) {
	    	
	    	var maxX = document.documentElement.clientWidth -  instace.moveElement.offsetWidth;
	    	var maxY = document.documentElement.clientHeight - instace.moveElement.offsetHeight ;

			instace.moveElement.style.left = Math.min( Math.max( ( e.pageX - instace.mouseOffsetLeft) , 0 ) , maxX) + "px";
			instace.moveElement.style.top  = Math.min( Math.max( ( e.pageY - instace.mouseOffsetTop ) , 0 ) , maxY) + "px";
	    }
		if(e.stopPropagation) {
			e.stopPropagation();
		} else {
			e.cancelBubble = true;
		}
	};

	Dialog('dialogDrag','dialogMove');

	function onMoveStart(){

	}
	//登陆框显示
	function showDialog(){
		g('dialogMove').style.display = 'block';
		g('mask').style.display = 'block';
		autoCenter( g('dialogMove') );
		//fillToBody( g('mask') );
	}
	//登陆框隐藏
	function hideDialog(){
		g('dialogMove').style.display = 'none';
		g('mask').style.display = 'none';
	}
	//个人中心框显示
	/*
	function showDialog(){
		g('dialogMove').style.display = 'block';
		g('mask').style.display = 'block';
		autoCenter( g('dialogMove') );

	}
	*/
	//个人中心框隐藏
	/*
	function hideDialog(){
		g('dialogMove').style.display = 'none';
		g('mask').style.display = 'none';
	}
	*/

