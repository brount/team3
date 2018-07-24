<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../common/setting.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<body onload="confirmIdFocus();">
	<h2> 중복확인 페이지</h2>
	
	<form action="confirmId" method="post" name="confirmform"
			onsubmit="return confirmIdCheck();">
	
	
	<c:if test="${selectCnt==1}">
		<table>
			<tr>
				<th colspan="2">
				<span>${id}</span>
				는 사용할 수 없습니다
				</th>
			</tr>
			<tr>
				<th>아이디 : </th>
				<td>
					<input type ="text" name="id" maxlength="50" style="width:100px">
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input class="inputButton" type="submit" value="확인">
					<input class="inputButton" type="button" value="취소" onclick="self.close();">
				</td>					
			</tr>
		
		</table>
	</c:if>
	<c:if test="${selectCnt != 1 }">
	
			<table>
			<tr>
				<td align="center">
					<span>${id}</span>
					는 사용할 수 있습니다
				</td>
			</tr>
			<tr>
				<th>
				
				<input class="inputButton" type="button" value="확인" onclick="setId('${id}');">
				</th>
			</tr>
		</table>
	</c:if>
	</form>
</body>
</html>