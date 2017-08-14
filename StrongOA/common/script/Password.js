/*
* @ auth	network
* desc:校验密码的强度
*
*/
(function($){
	var options={
		passwordInput:'',
		checkInput:'',
		strengthInfoText:'',
		strengthInfoBar:'',
		checkInfoText:'',
		verdects:["弱","中","强"],
		colors:["#f00","#f93","#3c0"],
		scores:[10,25],
		common:["123456","12345678"],
		minLength:6
	}
	$.fn.password=function(params){
		//1. 获得参数
		$.getOptions(params);
		//2.判断参数是否正确
		if(!$.checkParams()){
			alert("参数不正确");
			return;
		}
		//4.密码强度事件
		$.passwordStrength();
		//5.核对事件
		$("#"+options.checkInput).bind("keyup",$.checkPassword);
		$("#"+options.passwordInput).bind("keyup",$.checkPassword);
	}
	$.passwordStrength=function(){
		if(document.getElementById(options.passwordInput)==null)
			return;
		$("#"+options.passwordInput).bind("keyup",$.checkStrength);
	}
	$.checkPassword=function(){
		var passwordInput = $("#"+options.passwordInput);
		var passwordInput = $("#"+options.passwordInput);
		return true;
	}
	$.checkStrength=function(){
		var value = $('#'+options.passwordInput).attr("value");
		var score=$.getValue(value);
		var text=null;
		var color=null;
		var barLength=null;
		if(score==-2){
			text="";
			color="gray";
			barLength='0%';
		}else if(score>=-1 && score<options.scores[0]){
			text=options.verdects[0];
			color=options.colors[0];
			barLength='33%';
		}else if(score>=options.scores[0] && score<options.scores[1]){
			text=options.verdects[1];
			color=options.colors[1];
			barLength='66%';
		}else if(score>=options.scores[1]){
			text=options.verdects[2];
			color=options.colors[2];
			barLength='100%';
		}
		if(options.strengthInfoText!="")
			$("#"+options.strengthInfoText).html(text).css({
				color:color
			});
		if(options.strengthInfoBar!="")
			$("#"+options.strengthInfoBar).css({
				width:barLength,
				backgroundColor:color
			});
	}
	$.getValue=function(_value){
		var score = 0;
		var num=$.countCharNum(_value);
		// 如果是普通密码则设置为0
		for(var i=0;i<options.common.length;i++){
			if(_value==options.common[i])
				return 0;
		}
		if(_value.length==0)
			return -2;
		else if(_value.length<options.minLength)
			return -1;
		else
			score+=(_value.length-options.minLength)*2;
		score+=num*2;
		// 有小写字母有数字
		if(_value.match(/[a-z]/) && _value.match(/\d+/)){score+=5}
		// 有大写字母有数字
		if(_value.match(/[A-Z]/) && _value.match(/\d+/)){score+=7}
		// 有小写字母和大写字母
		if(_value.match(/[A-Z]/) && _value.match(/[a-z]/)){score+=7}
		if(_value.match(/[a-z]/) && _value.match(/\d+/) && _value.match(/[A-Z]/)){score+=10}
		// 一个特殊字符
		if(_value.match(/.[!,@,#,$,%,^,&,*,?,_,~]/)){score+=5}
		// 两个以上特殊符号
		if(_value.match(/(.*[!,@,#,$,%,^,&,*,?,_,~].*[!,@,#,$,%,^,&,*,?,_,~])/)){score+=15}
		return score;
	}
	$.countCharNum=function(_value){
		var charValue=[];
		for(var i=0;i<_value.length;i++){
			if(charValue.join().indexOf(_value.charAt(i))!=-1)
				continue;
			charValue.push(_value.charAt(i));
		}
		return charValue.length;
	}
	$.checkParams=function(){
		if(document.getElementById(options.checkInput)==null || 
			document.getElementById(options.passwordInput)==null)
			return false;
		return true;
	}
	$.getOptions=function(params){
		for(var property in params){
			options[property]=params[property];
		}
	}
})(jQuery)