<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>




	<form action="emailok" onsubmit="return key();" name="findform">



		<table>

			<tr>
				<th>인증번호 :</th>
				<td><input class="input" type="text" name="key"
					maxlength="20" style="width: 150px"></td>
			</tr>
			<tr>
				<th colspan="2"><input class="inputButton" type="submit"
					value="확인"> <input class="inputButton" type="reset"
					value="취소" onclick="self.close();"></th>
			</tr>

		</table>
	</form>


</body>
</html>