<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<style>
		#s_table tr{
			height: 20px;
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
			width: 600px;
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
			location.href = "addArea.jsp";
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
			String sql = "select count(*) from area0215";
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
		<h2>거주지 정보 목록</h2>
		<p>총 <%=no %>개의 거주지가 있습니다.</p>
		<hr>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="200">거주지 코드</th>
				<th width="200">거주지 이름</th>
				<th width="100">구분</th>
			</tr>
			<% 
				no = 0;
				try{
					String sql = "select areacode,areaname from area0215 order by areacode asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String areacode = rs.getString(1);
						String areaname = rs.getString(2);
						%>
						<tr>
							<td><%=no %></td>
							<td><%=areacode %></td>
							<td><%=areaname %></td>
							<td>
								<a href="updateArea.jsp?send_areacode=<%=areacode%>">수정</a>
								<span>/</span>
								<a href="deleteArea.jsp?send_areacode=<%=areacode%>"
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