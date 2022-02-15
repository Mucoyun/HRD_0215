<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<script>
		function gotry() {
			if(document.iu_form.custid.value == ""){
				alert("고객아이디를 입력하세요.");
				document.iu_form.custid.focus();
			}else if(document.iu_form.author.value == ""){
				alert("고객이름을 입력하세요.");
				document.iu_form.author.focus();
			}else{
				document.iu_form.submit();
			}
		}
		function notry() {
			location.href = "/HRD_0215/customer0215/customerSelect.jsp";
		}
	</script>
</head>
<body>
	<%@ include file="/DBConn.jsp" %>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<%
		String send_custid = request.getParameter("send_custid");
		
		String custid = "";
		String author = "";
		String goods = "";
		String phone = "";
		String email = "";
		String areacode = "";
		
		String[] good = {};
		String[] phones = {};
		String[] emails = {};
		
		try{
			String sql = "select custid,author,goods,phone,email,areacode from customer0215 where custid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, send_custid);
			rs = pstmt.executeQuery();
			if(rs.next()){
				custid = rs.getString(1);
				author = rs.getString(2);
				goods = rs.getString(3);
				phone = rs.getString(4);
				email = rs.getString(5);
				areacode = rs.getString(6);
				
				good = goods.split(",");
				phones = phone.split("-");
				emails = email.split("@");
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
	%>
	<section>
		<h2>백화점 DM 수정 시스템</h2><hr>
		<form name="iu_form" method="post" action="updateCustomer_process.jsp">
			<table id="iu_table">
				<tr>
					<th>고객 아이디</th>
					<td><input type="text" name="custid" value="<%=custid %>" readonly></td>
				</tr>
				<tr>
					<th>고 객 성 명</th>
					<td><input type="text" name="author" value="<%=author %>"></td>
				</tr>
				<tr>
					<th>관심사품</th>
					<td>
						<input type="checkbox" name="goods" value="의류" <%for(String g:good){if(g.equals("의류")){ %> checked <% }} %> > 의류
						<input type="checkbox" name="goods" value="식료품" <%for(String g:good){if(g.equals("식료품")){ %> checked <% }} %> > 식료품
						<input type="checkbox" name="goods" value="컴퓨터" <%for(String g:good){if(g.equals("컴퓨터")){ %> checked <% }} %> > 컴퓨터
						<input type="checkbox" name="goods" value="공산품" <%for(String g:good){if(g.equals("공산품")){ %> checked <% }} %> > 공산품
						<input type="checkbox" name="goods" value="관광" <%for(String g:good){if(g.equals("관광")){ %> checked <% }} %> > 관광
						<input type="checkbox" name="goods" value="전자제품" <%for(String g:good){if(g.equals("전자제품")){ %> checked <% }} %> > 전자제품
						<input type="checkbox" name="goods" value="건강제품" <%for(String g:good){if(g.equals("건강제품")){ %> checked <% }} %> > 건강제품
						<input type="checkbox" name="goods" value="운동기구" <%for(String g:good){if(g.equals("운동기구")){ %> checked <% }} %> > 운동기구
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td>
						<input class="text_s" type="text" name="phone1" value="<%=phones[0]%>" maxlength="3">
						<span>-</span>
						<input class="text_s" type="text" name="phone2" value="<%=phones[1]%>" maxlength="4">
						<span>-</span>
						<input class="text_s" type="text" name="phone3" value="<%=phones[2]%>" maxlength="4">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input class="text_m" type="text" name="email1" value="<%=emails[0] %>">
						<span>@</span>
						<input class="text_m" type="text" name="email2" value="<%=emails[1] %>">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td>
						<select name="areacode">
							<option value="101" <%if(areacode.equals("101")){ %> selected <% } %> >서울</option>
							<option value="102" <%if(areacode.equals("102")){ %> selected <% } %> >경기</option>
							<option value="103" <%if(areacode.equals("103")){ %> selected <% } %> >대전</option>
							<option value="104" <%if(areacode.equals("104")){ %> selected <% } %> >부산</option>
							<option value="105" <%if(areacode.equals("105")){ %> selected <% } %> >광주</option>
							<option value="106" <%if(areacode.equals("106")){ %> selected <% } %> >울산</option>
							<option value="107" <%if(areacode.equals("107")){ %> selected <% } %> >대구</option>
							<option value="108" <%if(areacode.equals("108")){ %> selected <% } %> >강원</option>
							<option value="109" <%if(areacode.equals("109")){ %> selected <% } %> >경상</option>
							<option value="110" <%if(areacode.equals("110")){ %> selected <% } %> >충청</option>
							<option value="111" <%if(areacode.equals("111")){ %> selected <% } %> >제주</option>
						</select>
					</td>
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