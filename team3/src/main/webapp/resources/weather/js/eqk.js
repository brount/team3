(function($, window, document){
	function getCookie( name ) {
		var nc = name + "="; var x = 0;
		while ( x <= document.cookie.length ) {
			var y = (x+nc.length);
			if ( document.cookie.substring( x, y ) == nc ) {
				if ( (eoc=document.cookie.indexOf( ";", y )) == -1 )
					eoc = document.cookie.length;
				return unescape(document.cookie.substring( y, eoc ));
			}
			x = document.cookie.indexOf( " ", x ) + 1;
			if ( x == 0 ) break;
		}
		return "";
	}

	function setCookie( name, value, eds ){
		var td = new Date();
		td.setTime( td.getTime() + eds*3600*24*1000 );
		document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + td.toGMTString() +";";
	}
	function resizeFrame(obj) {
		var newheight = null;
		if(document.getElementById) {
			newheight = obj.contentWindow.document.body.scrollHeight;
		}
		if(newheight){
			if(newheight < 500) {
				$(obj).attr('height', newheight + "px");
			} else {
				$(obj).attr('height', "500px");
			}
		} else {
			$(obj).attr('height', "550px");
		}
		if($(obj).height() < 450) {
			$(obj).attr('height', "450px");
		}
	}
	function createDialog(lastModified) {
		var $body = $("body");
		var html = '<div class="eqk-report-dialog">\n';
		html += '	<div class="eqk-report-dialog-title"><h2>지진 속보</h2></div>\n';
		html += '	<a class="eqk-report-dialog-close">X</a>\n';
		html += '	<div class="eqk-report-dialog-iframe">\n';
		html += '		<iframe src="/eqk_layer/eqk_report_iframe.jsp" name="iframe_eqk_report" id="iframe_eqk_report" width="598px"  frameborder="0" marginwidth="0" marginheight="0" scrolling="auto" title="방재속보"></iframe>\n';
		html += '	<div/>\n';
		html += '	<div class="eqk-report-dialog-footer">\n';
		html += '		<label for="eqk_do_not_open"><input type="checkbox" id="eqk_do_not_open" data-last-modified="' + lastModified + '"/> 오늘 다시 열지 않기</label>';
		html += '	</div>\n';
		html += '<div/>';
		$body.append(html);
		$('.eqk-report-dialog-close').on('click', function(e) {
			$('.eqk-report-dialog').fadeOut();
		});
		$('.eqk-report-dialog-iframe iframe').on('load', function(e) {
			resizeFrame(this);
		});
		$('#eqk_do_not_open').on('click', function(e) {
			var lastModified = $(this).attr('data-last-modified');
			setCookie(lastModified,'nevermind', 1);
			$('.eqk-report-dialog').fadeOut();
		});
	}
	jQuery.ajax({
		url: '/eqk_layer/eqk_report_exists_json.jsp'
		, cache:false
		, type: 'post'
		, dataType: 'html'
		, success:function(res) {
			var data = JSON.parse(res);
			var lastModified = "EQKRPT";
			
			if(data.lastModified) {
				lastModified += data.lastModified;
			}
			if(data.eqkExists) {
				if(getCookie(lastModified) != 'nevermind') {
					createDialog(lastModified);
				}
			}
		}
		, error: function(data) {
			if(window.console) window.console.log(data);
		}
	});
})(jQuery, window, document);