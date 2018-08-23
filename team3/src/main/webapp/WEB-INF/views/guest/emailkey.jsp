<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>사이트이름</title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/table.css" />

<script src="/medical/resources/djcss/dj.js"></script>
<script type="text/javascript">
	function key() {
		if (!document.findform.key.value) {
			alert('인증번호를 입력하세요.');
			document.findform.key.focus();
			return false;
		}
		var key = document.findform.key.value;
		var url = "emailok?key=" + key;

		window.location = url;
	}
</script>
<body>

	<form action="emailok" onsubmit="return key();" name="findform">
	
		<table  class="responstable">
			<tr>
				<th>인증번호 :</th>
				<td>
					<input class="input" type="text" name="key" maxlength="20" style="width: 150px">
				</td>
			</tr>
			<tr>
				<th colspan="2" style="text-align: center;">
					<input class="btn btn-dark-blue"  type="submit" value="확인">
					<input class="btn btn-dark-blue" type="reset" value="취소" onclick="self.close();">
				</th>
			</tr>
		</table>
	</form>

</body>
</html>