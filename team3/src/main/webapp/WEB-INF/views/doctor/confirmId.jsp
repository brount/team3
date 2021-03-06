<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp"%>
<html>
<body onload="confirmIdFocus();">
	<h2 style="text-align: center;">중복확인 페이지</h2>

	<form action="doctorconfirmId" method="post" name="confirmform"
		onsubmit="return confirmIdCheck();" style="margin: 0 auto; display: table;">

		<c:if test="${selectCnt==1}">
			<table>
				<tr>
					<th colspan="2"><span>${id}</span>
						는 사용할 수 없습니다</th>
				</tr>
				<tr>
					<th> 아이디 : </th>
					<td>
						<input type="text" name="id" maxlength="50" style="width: 150px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align: center;">
						<input class="btn btn-dark-blue" type="submit" value="확인">
						<input class="btn btn-dark-blue" type="button" value="취소"
							onclick="self.close();">
					</td>
				</tr>
			</table>
		</c:if>
		<c:if test="${selectCnt != 1}">
			<table>
				<tr>
					<td align="center"><span>${id}</span> 는 사용할 수 있습니다</td>
				</tr>
				<tr style="margin: 10px auto; display: table;">
					<th>
						<input class="inputButton" type="button" value="확인"
							onclick="setId('${id}');">
					</th>
				</tr>
			</table>
		</c:if>
	</form>
</body>
</html>