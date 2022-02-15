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
		String areacode = request.getParameter("areacode");
		String areaname = request.getParameter("areaname");
		
		try{
			String sql = "update area0215 set areaname=? where areacode=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(2, areacode);
			pstmt.setString(1, areaname);
			pstmt.executeUpdate();
			%><script>
				alert("수정이완료되었습니다");
				location.href = "/HRD_0215/area0215/areaSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>