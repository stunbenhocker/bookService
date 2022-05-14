<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="cpath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>도서관리 시스템</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	function goJSON(){
  		$.ajax({
			url : "${cpath}/bookListAjax.do",
			type : "get",
			dataType : "json",
			success : ajaxHtml,
			error : function(){
				alert("error");
			}
			});
  	}
  	
  	function ajaxHtml(data){
  		var bList="<table class='table table-bordered table-striped table-hover table-condensed'>";
  		bList+="<tr class='warning'>";
  		bList+="<th class='text-center'>번호</th>";
  		bList+="<th class='text-center'>제목</th>";
  		bList+="<th class='text-center'>작가</th>";
  		bList+="<th class='text-center'>출판사</th>";
  		bList+="<th class='text-center text-uppercase'>isbn</th>";
  		bList+="<th class='text-center'>보유도서 수</th>";
  		bList+="</tr>";
  		
  		$.each(data, function(index,obj){
  	  		bList+="<tr>";
  	  		bList+="<td class='text-center'>"+obj.num+"</td>";
  	  		bList+="<td class='text-center'>"+obj.title+"</td>";
  	  		bList+="<td class='text-center'>"+obj.author+"</td>";
  	  		bList+="<td class='text-center'>"+obj.company+"</td>";
  	  		bList+="<td class='text-center'>"+obj.isbn+"</td>";
  	  		bList+="<td class='text-center'>"+obj.count+"</td>";
  	  		bList+="</tr>";
  		});
  			bList+="</table>";
	  		$("#view").html(bList);
  	}
  </script>
</head>
<body> 

<div class="container">
  <h2>도서관리 시스템</h2>
  <div class="panel panel-default">
    <div class="panel-heading">BOOK</div>
    <div class="panel-body" id="list">
    	<table class="table table-striped table-condensed table-hover table-bordered">
		<tr class="info">
			<th class="text-center">번호</th>
			<th class="text-center">제목</th>
			<th class="text-center">작가</th>
			<th class="text-center">출판사</th>
			<th class="text-center">ISBN</th>
			<th class="text-center">보유도서 수</th>
		</tr>
		<c:forEach var="vo" items="${list}">
		<tr>
			<td class="text-center">${vo.num}</td>
			<td class="text-center">${vo.title}</td>
			<td class="text-center">${vo.author}</td>
			<td class="text-center">${vo.company}</td>
			<td class="text-center">${vo.isbn}</td>
			<td class="text-center">${vo.count}</td>
		</tr>
		</c:forEach>
			<tr>
				<td class="text-center" colspan="6">
					<button class="btn btn-success btn-lg" onclick="goJSON()">도서목록 가져오기</button>
			</tr>
    	</table>
    	<div class="text-center" id="view">
    		여기에 도서목록이 출력됩니다.
    	</div>
    	</div>
    </div>
    <div class="panel-footer">김민찬</div>
  </div>
</body>
</html>