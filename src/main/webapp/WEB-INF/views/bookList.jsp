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
 	$(document).ready(function(){
 		bookList();
 	});	 
	  function bookList(){
	    	$.ajax({
	    		url : "${cpath}/book",
	    		type : "get",
	    		dataType : "json",
	    		success : callBack,
	    		error : function(){ alert("error");  
	    							console.log("여기 에러");
	    		}
	    	});
	    }    
	    function callBack(data){	    	
		  var bList="<table class='table table-striped table-condensed table-hover table-bordered'>";
	    	bList+="<tr class='info'>";
	    	bList+="<th class='text-center'>번호</th>";
	    	bList+="<th class='text-center'>제목</th>";
	    	bList+="<th class='text-center'>작가</th>";
	    	bList+="<th class='text-center'>출판사</th>";
	    	bList+="<th class='text-center'>ISBN</th>";
	    	bList+="<th class='text-center'>보유도서 수</th>";
	    	bList+="</tr>";
	    	// data에 저장된 JSON데이터를 핸들링...반복문~~ :
	    	// [{"idx":1,"title":"게시판","content":"게시판","writer":"관리자",,,},{    }]
	    	$.each(data,(index,obj)=>{ 
	    		bList+="<tr>";
	        	bList+="<td>"+obj.num+"</td>";
	        	bList+="<td id='t"+obj.num+"'>"+obj.title+"</td>";
	        	bList+="<td id='a"+obj.num+"'>"+obj.author+"</td>";
	        	bList+="<td>"+obj.company+"</td>";
	        	bList+="<td>"+obj.isbn+"</td>";
	        	bList+="<td id='count"+obj.num+"'>"+obj.count+"</td>";
	        	bList+="</tr>";
	        	
	    	});
	    	bList+="<tr>"
	    	bList+="<td class='text-center' colspan='6'>"
	    	bList+="<button class='btn btn-success btn-lg' onclick='goInsert()'>도서목록 추가하기</button>"
			bList+="</tr>"
	    	bList+="</table>";
	    	bList+="<div class='text-center' id='view'></div>"
	    	$("#list").html(bList);
	    }
 	
 	function ajaxUpdate(){
 		var fData=$("#bookup").serialize();
  		$.ajax({
			url : "${cpath}/book",
			type : "post",
			data : fData,
			success : bookList,
			error : function(){
				alert("error");
				console.log(fData);
				console.log("요기에러")
			}
			});
 	}  	
  	function goInsert(data){
  		var bList="<form class='form-horizontal' id='bookup' action='${cpath}/insert.do' method='post'";
  		bList+="<div class='form-group'>";
  		bList+="<tr class='warning'>";
  		bList+="<label class='control-label col-sm-2' for='title'>제목:</label>";
  		bList+="<div class='col-sm-10'><input type='text' class='form-control' id='title' name='title'</div></div>";
  		bList+="<label class='control-label col-sm-2' for='author'>작가:</label>";
  		bList+="<div class='col-sm-10'><input type='text' class='form-control' id='author' name='author'</div></div>";
  		bList+="<label class='control-label col-sm-2' for='company'>출판사:</label>";
  		bList+="<div class='col-sm-10'><input type='text' class='form-control' id='company' name='company'</div></div>";
  		bList+="<label class='control-label col-sm-2' text-uppercase' for='isbn'>isbn:</label>";
  		bList+="<div class='col-sm-10'><input type='text' class='form-control' id='isbn' name='isbn'</div></div>";
  		bList+="<label class='control-label col-sm-2' for='count'>보유도서수:</label>";
  		bList+="<div class='col-sm-10'><input type='text' class='form-control' id='count' name='count'</div></div>";
  		bList+="<div class='form-group'>"
  		bList+="<div class='col-sm-offset-2 col-sm-10'>"
  		bList+="<button type='button' class='btn btn-success' onclick='ajaxUpdate()''>등록</button>"
  			bList+="</form>";
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
		<!-- <table class="table table-striped table-condensed table-hover table-bordered"> -->
<%-- 		<tr class="info">
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
		</c:forEach> --%>
<!-- 			<tr>
				<td class="text-center" colspan="6">
				<button class="btn btn-success btn-lg" onclick="goInsert()">도서목록 추가하기</button>
			</tr>
    	</table>
    	<div class="text-center" id="view">
    	</div> -->
    	</div>
    </div>
    <div class="panel-footer">김민찬</div>
  </div>
</body>
</html>