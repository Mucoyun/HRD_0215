<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<style>
		#s_table tr{
			height: 30px;
		}#s_table td{
			text-align: center;
		}#s_table a{
			color: blue;
			font-weight: bold;
		}#s_table a:HOVER{
			color: red;
			font-weight: bold;
		}
		p{
			padding: 0 !important;
			display: block;
			margin: 0 auto;
			width: 1400px;
		}
		#btntd{
			display: block;
			width: 150px;
			height: 30px;
			background-color: black;
			color: white;
			margin: 20px auto;
		}
		
	</style>
	<script>
		function notry() {
			location.href = "addCustomer.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		int no = 0;
		try{
			String sql = "select count(*) from customer0215";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()){
				no = rs.getInt(1);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>고객 정보 목록</h2>
		<p>총 <%=no %>명의 고객이 있습니다.</p>
		<hr>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">고객아이디</th>
				<th width="100">고객성명</th>
				<th width="300">관심상품</th>
				<th width="200">전화</th>
				<th width="300">이메일</th>
				<th width="100">거주지코드</th>
				<th width="100">거주지</th>
				<th width="100">구분</th>
			</tr>
			<% 
				no = 0;
				try{
					String sql = "select a.custid,a.author,a.goods,a.phone,a.email,a.areacode,b.areaname from customer0215 a,area0215 b where a.areacode=b.areacode order by custid asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String custid = rs.getString(1);
						String author = rs.getString(2);
						String goods = rs.getString(3);
						String phone = rs.getString(4);
						String email = rs.getString(5);
						String areacode = rs.getString(6);
						String areaname = rs.getString(7);
						%>
						<tr>
							<td><%=no %></td>
							<td><a href="updateCustomer.jsp?send_custid=<%=custid%>"><%=custid %></a></td>
							<td><%=author %></td>
							<td><%=goods %></td>
							<td><%=phone %></td>
							<td><%=email %></td>
							<td><%=areacode %></td>
							<td><%=areaname %></td>
							<td>
								<a href="deleteCustomer.jsp?send_custid=<%=custid%>"
								onclick="if(!confirm('정말로 삭제하시겠습니까?')){return fasle;}">삭제</a>
							</td>
						</tr>
						<%
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
			%>
		</table>
		<button id="btntd" type="button" onclick="notry()">작성</button>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>