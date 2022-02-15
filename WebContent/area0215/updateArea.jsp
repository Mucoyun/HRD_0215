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
			location.href = "/HRD_0215/area0215/areaSelect.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<% 
		String send_areacode = request.getParameter("send_areacode");
		String areacode = "";
		String areaname = "";
		
		try{
			String sql = "select areacode,areaname from area0215 where areacode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_areacode);
			rs = pstmt.executeQuery();
			while(rs.next()){
				areacode = rs.getString(1);
				areaname = rs.getString(2);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>거주지 정보 수정 화면</h2><hr>
		<form name="iu_form" method="post" action="updateArea_process.jsp">
			<table id="iu_table">
				<tr>
					<th>거주지 코드</th>
					<td><input type="text" name="areacode" value="<%=areacode %>" readonly></td>
				</tr>
				<tr>
					<th>거주지 이름</th>
					<td><input type="text" name="areaname" value="<%=areaname %>"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="notry()">목록</button>
						<button type="button" onclick="gotry()">수정</button>
					</td>
				</tr>
			</table>
		</form><hr>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>