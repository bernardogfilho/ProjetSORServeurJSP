<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="menus" class="ctrls.MenusCtrl"></jsp:useBean>
<jsp:include page="/shared/header.jsp"></jsp:include>
  
  <div class="container">
  	<c:if test="${notice != null}">
	  	<div class="row">
	  		<div class="col-md-12">
	  			<div class="alert alert-${notice.type}">
	  				${notice.content}
	  			</div>
	  		</div>
	  	</div>
  	</c:if>
  	<div class="row">
  		<div class="col-md-12">
			<h1>Les Menus Disponibles <small>Pour ajourd'hui.</small></h1>
  		</div>
  	</div>
  	<div class="row">
  		<c:forEach items="${menus.getMenus()}" var="menu">
	  		<div class="col-md-3">
	  			<div class="panel panel-default">
	  				<div class="panel-body">
	  					<h4>${menu.nom}</h4>
	  					<ul class="list-unstyled">
	  						<c:forEach items="${menu.getElements()}" var="element">
	  							<li>
	  								<img class="img-responsive" src="/ProjetSORServeurJSP/images/${element.id}">
	  								<strong>${element.getType()}</strong> <i>${element.getNom()}</i>
	  							</li>
	  						</c:forEach>
	  					</ul>
	  				</div>
	  			</div>
	  		</div>
  		</c:forEach>
  	</div>
  </div>

<jsp:include page="/shared/footer.jsp"></jsp:include>
