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
			width: 1300px;
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
			location.href = "addDm.jsp";
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
			String sql = "select count(*) from dm0215";
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
		<h2>DM 발송 내열</h2>
		<p>총 <%=no %>건의 발송내역이 있습니다.</p>
		<hr>
		<table id="s_table">
			<tr>
				<th width="100">no</th>
				<th width="100">DM발송내역</th>
				<th width="100">고객아이디</th>
				<th width="100">고객성명</th>
				<th width="200">발송일자</th>
				<th width="300">DM내용</th>
				<th width="100">발송부서</th>
				<th width="100">고객등급</th>
				<th width="100">캠페인구분</th>
				<th width="100">구분</th>
			</tr>
			<% 
				no = 0;
				try{
					String sql = "select a.dmno,a.custid,b.author,to_char(a.maildate,'yyyy-mm-dd'),a.contents,a.dept,a.grade,a.campain from dm0215 a,customer0215 b where a.custid=b.custid order by a.dmno asc";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					while(rs.next()){
						no++;
						String dmno = rs.getString(1);
						String custid = rs.getString(2);
						String author = rs.getString(3);
						String maildate = rs.getString(4);
						String contents = rs.getString(5);
						String dept = rs.getString(6);
						String grade = rs.getString(7);
						String campain = rs.getString(8);
						%>
						<tr>
							<td><%=no %></td>
							<td><a href="updateDm.jsp?send_dmno=<%=dmno%>"><%=dmno %></a></td>
							<td><%=custid %></td>
							<td><%=author %></td>
							<td><%=maildate %></td>
							<td><%=contents %></td>
							<td><%=dept %></td>
							<td><%=grade %></td>
							<td><%=campain %></td>
							<td>
								<a href="deleteDm.jsp?send_dmno=<%=dmno%>"
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