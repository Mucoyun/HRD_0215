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
			document.iu_form.reset();
		}
	</script>
</head>
<body>
	<%@ include file="/header.jsp" %>
	<%@ include file="/nav.jsp" %>
	<section>
		<h2>고객 정보 등록 화면</h2><hr>
		<form name="iu_form" method="post" action="addCustomer_process.jsp">
			<table id="iu_table">
				<tr>
					<th>고객 아이디</th>
					<td><input type="text" name="custid"></td>
				</tr>
				<tr>
					<th>고 객 성 명</th>
					<td><input type="text" name="author"></td>
				</tr>
				<tr>
					<th>관심사품</th>
					<td>
						<input type="checkbox" name="goods" value="의류"> 의류
						<input type="checkbox" name="goods" value="식료품"> 식료품
						<input type="checkbox" name="goods" value="컴퓨터"> 컴퓨터
						<input type="checkbox" name="goods" value="공산품"> 공산품
						<input type="checkbox" name="goods" value="관광"> 관광
						<input type="checkbox" name="goods" value="전자제품"> 전자제품
						<input type="checkbox" name="goods" value="건강제품"> 건강제품
						<input type="checkbox" name="goods" value="운동기구"> 운동기구
					</td>
				</tr>
				<tr>
					<th>전화</th>
					<td>
						<input class="text_s" type="text" name="phone1" maxlength="3">
						<span>-</span>
						<input class="text_s" type="text" name="phone2" maxlength="4">
						<span>-</span>
						<input class="text_s" type="text" name="phone3" maxlength="4">
					</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td>
						<input class="text_m" type="text" name="email1">
						<span>@</span>
						<input class="text_m" type="text" name="email2">
					</td>
				</tr>
				<tr>
					<th>거주지</th>
					<td>
						<select name="areacode">
							<option value="101">서울</option>
							<option value="102">경기</option>
							<option value="103">대전</option>
							<option value="104">부산</option>
							<option value="105">광주</option>
							<option value="106">울산</option>
							<option value="107">대구</option>
							<option value="108">강원</option>
							<option value="109">경상</option>
							<option value="110">충청</option>
							<option value="111">제주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td id="btntd" colspan="2">
						<button type="button" onclick="gotry()">등록</button>
						<button type="button" onclick="notry()">취소</button>
					</td>
				</tr>
			</table>
		</form><hr>
	</section>
	<%@ include file="/footer.jsp" %>
</body>
</html>