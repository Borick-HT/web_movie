<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-3 ">
	<div class="card text-center mt-3 ">
		<div class="card-body">
			
			<div class="row">
				<img src="${videos.poster}" alt="" class="img-fluid">
			</div>
			<div class="row p-2">
				<b>${videos.title }</b>
			</div>
			
		</div>
		
	</div>

	
</div>
<div class="col-5">
	<div class="row  mt-3 mb-3">
		<div class="row p-2">
				<b>${videos.description }</b>
			</div>

	</div>
	
	</div>
</div>