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
		String custid = request.getParameter("custid");
		String author = request.getParameter("author");
		String[] goods = request.getParameterValues("goods");
		String good = "";
		for(String g: goods){
			if(g.equals(goods[0])){
				good = g;
			}else{
				good = good + "," + g;
			}
		}
		
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String phone = ""; 
		phone = phone1 + "-" + phone2 + "-" + phone3;
		
		String email1 = request.getParameter("email1");
		String email2 = request.getParameter("email2");
		String email = "";
		email = email1+"@"+email2;
		
		String areacode = request.getParameter("areacode");
		
		try{
			String sql = "update customer0215 set author=?,goods=?,phone=?,email=?,areacode=? where custid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(6, custid);
			pstmt.setString(1, author);
			pstmt.setString(2, good);
			pstmt.setString(3, phone);
			pstmt.setString(4, email);
			pstmt.setString(5, areacode);
			pstmt.executeUpdate();
			%><script>
				alert("수정이완료되었습니다");
				location.href = "/HRD_0215/customer0215/customerSelect.jsp";
			</script><%
		}catch(SQLException e){
			e.printStackTrace();	
		}
	%>
</body>
</html>