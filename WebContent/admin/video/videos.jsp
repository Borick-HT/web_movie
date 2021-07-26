<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="col mt-4">
<jsp:include page="/common/inform.jsp"></jsp:include>
	<ul class="nav nav-tabs" id="myTab" role="tablist">
		<li class="nav-item" role="presentation"><a
			class="nav-link active" id="videoEditing-tab" data-toggle="tab"
			href="#videoEditing" role="tab" aria-controls="videoEditing"
			aria-selected="true">Video editing</a></li>
		<li class="nav-item" role="presentation"><a class="nav-link"
			id="videoList-tab" data-toggle="tab" href="#videoList" role="tab"
			aria-controls="videoList" aria-selected="false">Video List</a></li>

	</ul>
	<div class="tab-content" id="myTabContent">
		<div class="tab-pane fade show active" id="videoEditing"
			role="tabpanel" aria-labelledby="videoEditing-tab">
			<form action="" method="post" enctype="multipart/form-data">
				<div class="card">

					<div class="card-body">
						<div class="row">
							<div class="col-3">
								<div class="border p-3">
									<img src="${video.poster !=null?video.poster: 'images/desktop.png' }" alt="" class="img-fluid">
									<div class="input-group mb-3 mt-3">
										<div class="input-group-prepend">
											<span class="input-group-text">Upload</span>
										</div>
										<div class="custom-file">
											<input type="file" class="custom-file-input" id ="cover" name="cover"/>
											<label for="cover">Choose file</label>
										</div>
									</div>
								</div>

							</div>
							<div class="col-9">
								<div class="form-group">
									<label for="youtubeid">Video id</label> <input type="text"
										class="form-control" name="videoId" id="youtubeid" value="${video.videoId }"
										aria-describedby="youtubeidHid" placeholder="videoId">
									<small id="youtubeidHid" class="form-text text-muted">YoutubeId
										is required</small>
								</div>
								<div class="form-group">
									<label for="videotitle">Video title</label> <input type="text"
										class="form-control" name="title" id="videotitle" value="${video.title }"
										aria-describedby="videotitleHid" placeholder="Video title">
									<small id="videotitleHid" class="form-text text-muted">video
										title is required</small>
								</div>
								<div class="form-group">
									<label for="viewcount">View count</label> <input type="text"
										class="form-control" name="views" id="viewcount" value="${video.views }"
										aria-describedby="viewcountHid" placeholder="View count">
									<small id="viewcountHid" class="form-text text-muted">View
										count is required </small>
								</div>
								<div class="form-check form-check-inline">
									<label><input type="radio" class="form-check-input"
										value="true" name="active" id="status" ${video.active?'check':'' }>Active</label> <label><input
										type="radio" class="form-check-input" value="false"
										name="active" id="status"${!video.active?'check':'' }>Inactive</label>

								</div>
							</div>
						</div>
						<div class="row">
							<div class="col">
								<label for="description">description</label>
								<textarea name="description" id="description" ${video.description } cols="30"
									rows="10" class="form-control"></textarea>
							</div>
						</div>
					</div>
					<div class="card-footer text-muted">
						<button class="btn btn-primary" formaction="Admin/VideoManagement/create">Create</button>
						<button class="btn btn-warning"formaction="Admin/VideoManagement/update">Update</button>
						<button class="btn btn-danger"formaction="Admin/VideoManagement/delete">Delete</button>
						<button class="btn btn-info"formaction="Admin/VideoManagement/reset">Reset</button>

					</div>
				</div>
			</form>
		</div>
		<div class="tab-pane fade" id="videoList" role="tabpanel"
			aria-labelledby="videoList-tab">
			<table class="table table-stripe">
				<tr>
					<td>youtube id</td>
					<td>video title</td>
					<td>view count</td>
					<td>status</td>
					<td>&nbsp;</td>
				</tr>
				<c:forEach var="item" items="${videos }">
				
				<tr>
					<td>${item.videoId }</td>
					<td>${item.title }</td>
					<td>${item.views }</td>
					<td>${item.active?'Active':'Deactive' }</td>
					<td><a href="Admin/VideoManagement/edit?videoId=${item.videoId }"><i class="fa fa-edit" aria-hidden="true"></i>
							Edit</a> 
							<a href="Admin/VideoManagement/delete?videoId=${item.videoId }"><i class="fa fa-trash" aria-hidden="true"></i>Delete</a>
					</td>

				</tr>
				</c:forEach>
		
			</table>


		</div>

	</div>
</div>