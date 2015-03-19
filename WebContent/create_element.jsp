<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="menus" class="ctrls.MenusCtrl"></jsp:useBean>
<jsp:include page="/shared/header.jsp"></jsp:include>

<div class="container">
	<div class="row">
		<div class="col-md-6">
			<c:if test="${notice != null}">
			  	<div class="row">
			  		<div class="col-md-12">
			  			<div class="alert alert-${notice.type}">
			  				${notice.content}
			  			</div>
			  		</div>
			  	</div>
		  	</c:if>
			<div class="well bs-component">
				<form action="createElement" method="post" class="form-horizontal" enctype="multipart/form-data">
					<fieldset>
						<legend>Enregistrer element</legend>
					</fieldset>
					<div class="form-group">
						<label for="nomElement" class="control-label col-lg-2">Nom</label>
						<div class="col-lg-10">
							<input type="text" name="nomElement" class="form-control " id="nomElement" />
						</div>
					</div>
					<div class="form-group">
						<label for="typeElement" class="control-label col-lg-2">Type</label>
						<div class="col-lg-10">
							<select name="typeElement" class="form-control" id="typeElement">
								<option value="Entree">Entrée</option>
								<option value="Plat">Plat</option>
								<option value="Dessert">Dessert</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="imgElement" class="control-label col-lg-2">Image</label>
						<div class="col-lg-10">
							<input type="file" name="image" class="form-control" id="imgElement" />
						</div>
					</div>
					<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<input type="submit" class="btn btn-primary btn-block" value="Enregistrer"/>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

<jsp:include page="/shared/footer.jsp"></jsp:include>
