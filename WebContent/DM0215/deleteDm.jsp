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
		String send_dmno = request.getParameter("send_dmno");	
		
		try{
			String sql = "delete from dm0215 where dmno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dmno);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가 완료되었습니다");
				location.href = "/HRD_0215/DM0215/dmSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>