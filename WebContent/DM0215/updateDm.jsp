<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<style>
		#iu_table td{
			width: 300px !important;
		}#iu_table input[type="text"]{
			width: 200px !important;
		}#iu_table select{
			width: 200px !important;
		}#iu_table input[type="number"]{
			width: 200px !important;
		}#iu_table input[type="date"]{
			width: 200px !important;
		}
	</style>
	<script>
		function gotry() {
			if(document.iu_form.custid.value == ""){
				alert("고객아이디를 입력하세요.");
				document.iu_form.custid.focus();
			}else if(document.iu_form.author.value == ""){
				alert("고객이름을 입력하세요.");
				document.iu_form.author.focus();
			}else{
				document.iu_form.action = "updateDm_process.jsp";
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0215/DM0215/dmSelect.jsp";
		}
		function custidChk() {
			document.iu_form.submit();
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_dmno = request.getParameter("send_dmno");
	
		String custid = request.getParameter("custid");
		String author = "";
		
		String maildate = request.getParameter("maildate");
		String contents = request.getParameter("contents");
		String dept = request.getParameter("dept");
		String grade = request.getParameter("grade");
		String campain = request.getParameter("campain");
				
		String dmno = request.getParameter("dmno");
		try{
			String sql = "select dmno,custid,to_char(maildate,'yyyy-mm-dd'),contents,dept,grade,campain from dm0215 where dmno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_dmno);
			rs = pstmt.executeQuery();
			if(rs.next()){
				dmno = rs.getString(1);
				custid = rs.getString(2);
				maildate = rs.getString(3);
				contents = rs.getString(4);
				dept = rs.getString(5);
				grade = rs.getString(6);
				campain = rs.getString(7);
			}
			
			sql = "select author from customer0215 where custid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				author = rs.getString(1);
			}else if(custid == null){
				custid = "";
			}else{
				custid = "";
				%><script>
					alert("등록되지않은 고객 아이디 입니다.");
					custidChk();
				</script><%
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		
		if(maildate == null){ maildate = "2022-01-01"; }
		if(contents == null){ contents = ""; }
		if(dept == null){ dept = ""; }
		if(grade == null){ grade = "1"; }
		if(campain == null){ campain = ""; }
		
	%>
	<section>
		<h2>dm 정보 수정 화면</h2><hr>
		<form name="iu_form" method="post" action="updateDm.jsp">
			<table id="iu_table">
				<tr>
					<th>dm 발송번호</th>
					<td colspan="3"><input class="text_l" type="text" name="dmno" value="<%=dmno %>" readonly></td>
				</tr>
				<tr>
					<th>고객아이디</th>
					<td><input type="text" name="custid" value="<%=custid %>" onchange="custidChk()"></td>
					<th>고객명</th>
					<td><input type="text" name="author" value="<%=author %>" readonly></td>
				</tr>
				<tr>
					<th>발송일자</th>
					<td><input type="date" name="maildate" value="<%=maildate %>"></td>
					<th>dm내용</th>
					<td><input type="text" name="contents" value="<%=contents %>"></td>
				</tr>
				<tr>
					<th>발송부서</th>
					<td><input type="text" name="dept" value="<%=dept %>" maxlength="2"></td>
					<th>고객등급</th>
					<td>
						<select name="grade">
							<option value="1" <%if(grade.equals("1")){%> selected <%} %>>1</option>
							<option value="2" <%if(grade.equals("2")){%> selected <%} %>>2</option>
							<option value="3" <%if(grade.equals("3")){%> selected <%} %>>3</option>
							<option value="4" <%if(grade.equals("4")){%> selected <%} %>>4</option>
							<option value="5" <%if(grade.equals("5")){%> selected <%} %>>5</option>
							<option value="V" <%if(grade.equals("V")){%> selected <%} %>>V</option>
							<option value="W" <%if(grade.equals("W")){%> selected <%} %>>W</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>캠페인 구분</th>
					<td colspan="3"><input class="text_l" type="text" name="campain" value="<%=campain %>" maxlength="2"></td>
				</tr>
				<tr>
					<td id="btntd" colspan="4">
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