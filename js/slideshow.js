window.onload=function () {
	var aDiv=document.getElementsByClassName('Slideshow-box');
	var aBto=document.getElementsByClassName('Bottom');
	var showList=document.getElementById('Slideshow-list');
	var showLi=showList.getElementsByTagName('li');
	var num=0;
	var _num=0;
	var timer=null;
	fn1();
	function fn1() {
		clearInterval(timer);
		setTimeout(function () {	
			timer=setInterval(function () {
				_num++;
				if (_num==showLi.length) {
					_num=0;
				}
				for(var i=0;i<showLi.length;i++){
					showLi[i].style.opacity=0.4;
				}
				showLi[_num].style.opacity=1;
				doMove(aBto[num],'bottom',-50,-100);
				doMove(aDiv[num],'left',-500,-1200);
				num++;
				if (num==aDiv.length) {
					num=0;
				}
				doMove(aDiv[num],'left',-500,0,function () {
					doMove(aBto[num],'bottom',50,0);
					if (num==0) {
						num=aDiv.length;
					}
					aDiv[num-1].style.left=1800+'px';
					if (num==aDiv.length) {
						num=0;
					}
				});
				fn1();	
			},300)
			
		},4000)
	}

	// 需要添加点击下标出现对应图片
}

function doMove(obj,attr,dir,target,endFn) {
		clearInterval(obj.timer);
		obj.timer=setInterval(function () {
			var speed=parseInt(getStyle(obj,attr))+dir;
			if(speed>target && dir>0 || speed<target && dir<0){
				speed=target;
			}
			obj.style[attr]=speed+'px';
			if (speed==target) {
				clearInterval(obj.timer);
				endFn&&endFn();
			}
		},50);
}
function getStyle(obj,attr) {
		return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj)[attr];
}