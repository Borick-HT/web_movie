<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="col-9">
	<div class="row p-2">
		<c:forEach var="item" items="${videos }">

			<div class="col-3 mt-2">
				<div class="card text-center">

					<div class="card-body">
						<a href="Detail?videoId=${item.videoId}"><img
							src="${empty item.poster?'images/tom.jpg':item.poster }"
							width="90%" alt="" class="img-fluid"></a>

						<div class="row border-top mt-2">
							<a href="Detail?videoId=${item.videoId}"><b> ${item.title }</b></a>
						</div>
					</div>

					<div class="card-footer pr-2">
						<c:choose>
							<c:when test="${listF != null }">
								<c:set var="init" value="0" />
								<c:forEach items="${listF}" var="videoFavorite">
									<c:if test="${item.videoId == videoFavorite.videoId}">
										<c:set var="init" value="${init+1}" />
									</c:if>
								</c:forEach>
								<c:choose>
									<c:when test="${init == '1'}">
										<a href="Unlike?videoId=${item.videoId }"
											class="btn btn-success">UnLike</a>
										<a href="ShareVideo?videoId=${item.videoId }"
											class="btn btn-info">Share</a>
									</c:when>
									<c:otherwise>
										<a href="LikeServlet?videoId=${item.videoId }"
											class="btn btn-success">Like</a>
										<a href="ShareVideo?videoId=${item.videoId }"
											class="btn btn-info">Share</a>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<a href="LikeServlet?videoId=${item.videoId }"
									class="btn btn-success">Like</a>
								<a href="ShareVideo?videoId=${item.videoId }"
									class="btn btn-info">Share</a>
							</c:otherwise>
						</c:choose>
					</div>


				</div>
			</div>
		</c:forEach>
	</div>
	<div class="row">
		<div class="col">
			<nav aria-label="Page navigation">
				<ul class="pagination justify-content-center">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
					</a></li>
					<li class="page-item active"><a class="page-link" href="#">1</a></li>
					<li class="page-item"><a class="page-link" href="#">2</a></li>
					<li class="page-item"><a class="page-link" href="#"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
							class="sr-only">Next</span>
					</a></li>
				</ul>
			</nav>
		</div>
	</div>
</div>
<div class="col-3">
	<div class="row mt-3 mb-3">
		<col>
		<div class="card">
			<div class="card-header">
				<i class="fa fa-thumbs-up" aria-hidden="true"></i>Favorites
			</div>
			<c:forEach var="item" items="${videos }">

				<ul class="list-group list-group-flush">
					<li class="list-group-item"><a
						href="favorite?videoId=${item.videoId}"><b> ${item.title }</b></a></li>


				</ul>

			</c:forEach>
		</div>
	</div>
</div>