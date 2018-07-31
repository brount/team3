
function setCookie(name,value,expireday){
	var todayDate = new Date();
	
	todayDate.setDate(todayDate.getDate()+ expireday);
	
	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
}
function setCookie(name,value,expireday, domain){
	var todayDate = new Date();
	
	todayDate.setDate(todayDate.getDate()+ expireday);
	if (domain != null) document.cookie = name + "=" + value + "; domain=" + domain + "; path=/; expires=" + todayDate.toGMTString() + ";";
    else 	document.cookie = name + "=" + value + "; path=/; expires=" + todayDate.toGMTString() + ";";
}
function getCookie(name){
	
	cookie = document.cookie;
	
	if(cookie.length > 0){

		startIndex = cookie.indexOf(name);
		if(startIndex > -1){
			startIndex = startIndex + name.length;
			endIndex = cookie.indexOf(";",startIndex);
			if(endIndex == -1){
				endIndex = cookie.length;
			}

			var value = cookie.substring(startIndex,endIndex);
			
			if(value.length >= 1 && value.substring(0,1) == "="){
				return cookie.substring(startIndex+1,endIndex).split('"').join("");
			}else{
				return cookie.substring(startIndex,endIndex).split('"').join("");
			}
		}
	}
	return "";
}

function changeCookie(name){
	var expireday = new Date();
	
	expireday.setDate(expireday.getDate() - 1);
	
	document.cookie = name + "=" + "; expires = "+ expireday.toGMTString() + "; path=/";
}

function delCookie(name){
	var expireday = new Date();
	
	expireday.setDate(expireday.getDate() - 1);
	
	document.cookie = name + "=" + "; expires = "+ expireday.toGMTString() + "; path=/";
}