
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}

//새창띄우기
function NewWin(url, l, t, w, h, s, r)
{
	opt = "left=" + l + ", top=" + t + ", width=" + w + ", height=" + h;
	opt = opt + ", toolbar=no,location=no,directories=no,status=no,menubar=no";
	opt = opt + ",scrollbars=" + s;
	opt = opt + ",resizable=" + r;
	window.open(url, "_blank", opt);
}

function NewWin_name(url, name, l, t, w, h, s, r)
{
	opt = "left=" + l + ", top=" + t + ", width=" + w + ", height=" + h;
	opt = opt + ", toolbar=no,location=no,directories=no,status=no,menubar=no";
	opt = opt + ",scrollbars=" + s;
	opt = opt + ",resizable=" + r;
	window.open(url, name, opt);
	return false;
}

// 쿠키 저장하기
function setCookie( name, value, expiredays )
{
	var todayDate = new Date();
	todayDate.setDate( todayDate.getDate() + expiredays );
	document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + todayDate.toGMTString() + ";"
}

// 쿠키 가져오기
function getCookie(name) {

        var nameOfCookie = name + "=";
        var x = 0
        while ( x <= document.cookie.length ) {
        var y = (x+nameOfCookie.length);
        if ( document.cookie.substring( x, y ) == nameOfCookie ) {
                if ( (endOfCookie=document.cookie.indexOf( ";",y )) == -1 )
                endOfCookie = document.cookie.length;
                return unescape( document.cookie.substring(y, endOfCookie ) );
        }
                x = document.cookie.indexOf( " ", x ) + 1;
                if ( x == 0 )
                        break;
        }

        return "";
}

//숫자나 영문자 인지 체크
alpha_numeric = new String("0123456789abcdefghijklmnopqrstuvwxyz")

function check_alphanumber(str)
{
        for(j = 0 ; j < str.length; j++)
        {
                rtn = is_alpha_numeric(str.charAt(j))
                if(rtn == false)
                {
                        return rtn;
                }
        }
        return rtn;
}

function is_alpha_numeric(cha1)
{
        for(i=0;i<alpha_numeric.length;i++)
        {
                if(alpha_numeric.charAt(i) == cha1)
                        return true;
        }
        return false;
}

//숫자인지 체크
numeric = new String("0123456789")

function check_number(str)
{
        for(j = 0 ; j < str.length; j++)
        {
                rtn = is_numeric(str.charAt(j))
                if(rtn == false)
                {
                        return rtn;
                }
        }
        return rtn;
}

function is_numeric(cha1)
{
        for(k=0;k<numeric.length;k++)
        {
                if(numeric.charAt(k) == cha1)
                        return true;
        }
        return false;
}

function change_bgcolor (element, color) {
	element.bgColor = color;
}

function toggle_hide(id)
{
	if (document.getElementById(id).style.display="none") { 
		document.getElementById(id).style.display="block";
	} else { 
		document.getElementById(id).style.display="none";
	} 

}