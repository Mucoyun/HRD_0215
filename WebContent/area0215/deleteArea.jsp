<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%
		String send_areacode = request.getParameter("send_areacode");
		
		
		try{
			String sql = "delete from area0215 where areacode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_areacode);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다");
				location.href = "/HRD_0215/area0215/areaSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>