<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>사이트이름</title>
<link href="/medical/resources/djcss/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/bootstrap-theme.min.css" rel="stylesheet" type="text/css" />
<link href="/medical/resources/djcss/css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/default.css" />
<link rel="stylesheet" type="text/css" href="/medical/resources/css/css/table.css" />

<script src="/medical/resources/djcss/dj.js"></script>
<script type="text/javascript">
function confirmCheck() {
	if (!document.confirmForm.id.value) {
		alert(msg_id);
		document.confirmForm.id.focus();
		return false;
	}
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body onload="comfirmIdFocus();">

	<section>
		<div class="inbox-head">
		
			<form action="confirmId" method="post" name="confirmForm" onsubmit="confirmCheck();">

				<c:if test="${selectCnt!=0 }">
					<table class="responstable">
						<tbody>
							<tr>
								<th colspan="2">ID 중복확인 </th>
							</tr>
						
							<tr class="unread">
								<td colspan="2" style="text-align: center;"><span>${strId}</span>는 사용할 수 없습니다.</td>
							</tr>
							<tr>
								<th>아이디 :</th>
								<td>
									<input class="input" type="text" name="id" maxlength="20" style="width: 150px;">
								</td>
							</tr>
							<tr>
								<td colspan="2" style="text-align: center;">
									<input class="btn btn-dark-blue"  type="submit" value="확인">
									<input class="btn btn-dark-blue" type="reset" value="취소" onclick="self.close();">
								</td>
							</tr>
						</tbody>
					</table>

				</c:if>

				<c:if test="${selectCnt==0 }">
					<table style="width:100%" class="responstable">
							<tr>
								<th colspan="2">ID 중복확인 </th>
							</tr>
						<tr>
							<td align="center" style="font-size: 20px;"><span>${strId}</span>는 사용할 수 있습니다.</td>
						</tr>
						<tr style="margin: 10px auto; display: table;">
							<td>
								<!-- 부모쪽으로 넘길 id를 set  -->
								<input  class="btn btn-dark-blue"  type="button" value="확인" onclick="setId('${strId}');">
								<!-- 중복확인창에서 사용할수 있는 아이디면 값을 회원가입창으로 넘긴다. -->
							</td>
						</tr>
					</table>
				</c:if>
			</form>
		</div>
	</section>
	
</body>
</html>