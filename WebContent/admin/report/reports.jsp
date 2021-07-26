<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col mt-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEditing-tab" data-toggle="tab"
			href="#videoEditing" role="tab" aria-controls="videoEditing"
			aria-selected="true"> Favorites</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">Favorite users</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="sharefriends-tab" data-toggle="tab" href="#sharefriends"
			role="tab" aria-controls="sharefriends" aria-selected="false">Share
				friends</a></li>

	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<table class="table table-bordered mt-3">
				<tr>
					<td>Video title</td>
					<td>Favorite count</td>
					<td>lasted date</td>
					<td>oldest date</td>
				</tr>
				<c:forEach var="item" items="${favList }">
				<tr>
					<td>${item.videoTitle }</td>
					<td>${item.favoriteCount }</td>
					<td>${item.newDate }</td>
					<td>${item.oldDate }</td>

				</tr>
				</c:forEach>
				
			</table>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<form action="" method="get">
				<div class="row mt-3">
					<div class="col ">
						<div class="form-inline ">
							<div class="form-group">
								<label>Video title 
								<select name="videoUserId" id="videoUserId"
									class="form-control ml-3">
									<c:forEach var="item" items="${vidList}">
									<option value="${item.videoId }"
									${item.videoId==videoUserId?'selected':''  }>${item.title }</option>
									</c:forEach>
										
								</select>
								</label>
								<button class="btn btn-info ml-2 ">report</button>

							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>username</td>
								<td>fullname</td>
								<td>email</td>
								<td>favorite date</td>
							</tr>
							<c:forEach var="item" items="${favUsers }">
							<tr>
								<td>${item.username }</td>
								<td>${item.fullname }</td>
								<td>${item.email }</td>
								<td>${item.likeDate }</td>
							</tr>
							</c:forEach>
							
						</table>
					</div>
				</div>
			</form>


		</div>
		<div class="tab-pane fade" id="sharefriends" role="tabpanel"
			aria-labelledby="sharefriends-tab">
			<form action="" method="get">
				<div class="row mt-3">
					<div class="col ">
						<div class="form-inline ">
							<div class="form-group">
								<label>Video title <select name="" id=""
									class="form-control ml-3">
										<option value="">java programming</option>
								</select>

								</label>
								<button class="btn btn-info ml-2">report</button>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col mt-3">
						<table class="table table-bordered">
							<tr>
								<td>sender Name</td>
								<td>sender Email</td>
								<td>Recieve email</td>
								<td>sent date</td>
							</tr>
							<tr>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</form>



		</div>
	</div>
</div>