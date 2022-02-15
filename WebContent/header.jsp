<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>윤원태 - 실습30 - </title>
	<style>
		*{
			margin: 0; padding: 0;
		}html,body{
			width: 100%; height: 100%;
		}a{
			text-decoration: none;
		}table{
			border: 3px solid black;
			border-collapse: collapse;
			margin: 0 auto;
		}tr,th,td{
			border: 1px solid black;
		}th{
			background-color: #EEEEEE;
		}
		
		header{
			width: 100%; height: 10%;
			color: black; background-color: lightgray;
			text-align: center; display: table;
		}header > h1{
			display: table-cell;
			vertical-align: middle;
			font-size: 3vw;
		}
		
		nav{
			width: 100%; height: 5%;
			color: white; background-color: black;
			text-align: left; display: table;
		}nav > ul{
			display: table-cell;
			vertical-align: middle;
			list-style: none;
		}nav > ul li{
			display: inline-block;
			margin: 0 10px;
			font-size: 1vw;
		}nav > ul li > a{
			color: white;
			font-weight: bold;
		}nav > ul li > a:HOVER{
			color: red;
			font-weight: bold;
		}
		
		section{
			width: 100%; height: 80%;
			color: black; background-color: white;
		}section > h2{
			text-align: center;
			padding: 20px 0;
		}section > p{
			padding-left: 40px;
			font-weight: bold;
		}section > ol{
			padding-left: 40px;
		}
		
		footer{	
			width: 100%; height: 5%;
			color: white; background-color: gray;
			text-align: center; display: table;
		}footer > h3{
			display: table-cell;
			vertical-align: middle;
			font-size: 1vw;
		}		
		
	</style>
	<style>
		#iu_table tr{
			height: 30px;
		}#iu_table th{
			width: 200px;
		}#iu_table td{
			width: 600px;
		}
		
		#iu_table input[type="text"]{
			height: 25px;
			width: 400px;
		}#iu_table select{
			height: 25px;
			width: 300px;
		}#iu_table input[type="number"]{
			height: 25px;
			width: 300px;
		}#iu_table input[type="date"]{
			height: 25px;
			width: 300px;
		}
		#iu_table .text_s{
			width: 100px !important;
		}#iu_table .text_m{
			width: 200px !important;
		}
		
		#btntd{
			text-align: center;	
		}#btntd button{
			height: 25px;
			width: 150px;
		}
	</style>
</head>
<body>
	<header>
		<h1>DM 발송 시스템에 오신 것을 환영합니다.</h1>
	</header>
</body>
</html>