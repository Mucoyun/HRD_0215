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
		String send_custid = request.getParameter("send_custid");
		
		try{
			String sql = "delete from customer0215 where custid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_custid);
			pstmt.executeUpdate();
			%><script>
				alert("삭제가완료되었습니다");
				location.href = "/HRD_0215/customer0215/customerSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>