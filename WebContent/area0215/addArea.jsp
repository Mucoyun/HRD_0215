<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<script>
		function gotry() {
			if(document.iu_form.areacode.value == ""){
				alert("거주지 코드를 입력하세요.");
				document.iu_form.areacode.focus();
			}else if(document.iu_form.areaname.value == ""){
				alert("거주지 이름을 입력하세요.");
				document.iu_form.areaname.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			document.iu_form.reset();
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>거주지 정보 등록 화면</h2><hr>
		<form name="iu_form" method="post" action="addArea_process.jsp">
			<table id="iu_table">
				<tr>
					<th>거주지 코드</th>
					<td><input type="text" name="areacode"></td>
				</tr>
				<tr>
					<th>거주지 이름</th>
					<td><input type="text" name="areaname"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form><hr>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>