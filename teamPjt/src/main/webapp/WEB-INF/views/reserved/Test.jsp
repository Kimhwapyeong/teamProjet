<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="/resources/js/reserved/jquery-3.7.0.js"></script>
<body>
	
	<img id="reduvia" src="<spring:url value='/image/Reduvia.png'/>" style="width:100px; height:100px" data-value="10010"/>
	<input id="show1" type="text" value="" readonly> <br>
	<img id="darkMoon" src="<spring:url value='/image/DarkMoon.png'/>" style="width:100px; height:100px" data-value="20000"/>
	<input id="show2" type="text" value="" readonly> <br><br>
	
	
	첫번째 무기의 강화 : <input type="text" id="first" value="" readonly><br>
	두번째 무기의 강화 : <input type="text" id="second" value="" readonly><br><br>
	<input id="transfer" type="button" value="이전하기"/>
	<input type="button" value="다시하기" onclick="location.reload()"/>
	
	<script>
	
		$(function(){
			
			changeValue();
			
			$('#reduvia').click(function(){
				
				let value = $('#reduvia').attr("data-value");
				
				if(value.slice(-2).startsWith('0')){
					
					value = value.slice(-1);
					
				}
				
				$('#first').val(value.slice(-2)+'강');
				
			});
			
			$('#darkMoon').click(function(){
				
				let value = $('#darkMoon').attr("data-value");
				
				if(value.slice(-2).startsWith('0')){
					
					value = value.slice(-1);
					
				}
				
				$('#second').val(value.slice(-2)+'강');
				
			});
			
			$('#transfer').click(function(){
				
				first.value = '';
				second.value = '';
				
				// 첫 무기 0강으로
				let change = $('#reduvia').attr("data-value").slice(0,-2);
				let value = $('#reduvia').attr("data-value").slice(-2);
				$('#reduvia').attr("data-value", change+'00');
				
				// 대상 무기에게 강화 값 이전
				let change2 = $('#darkMoon').attr("data-value").slice(0, -2);
				$('#darkMoon').attr("data-value", change2+value);
				
				$('#transfer').attr('type', 'hidden');
				
				changeValue();
			});
				
			
		
		
		
			
		});
		
		function changeValue(){
			
			$('#show1').val($('#reduvia').attr("data-value"));
			$('#show2').val($('#darkMoon').attr("data-value"));
			
			$('#reduvia').change(function(){
				
				$('#show1').val($('#reduvia').attr("data-value"));
				$('#show2').val($('#darkMoon').attr("data-value"));

			});

			
		}
		
	</script>
</body>
</html>