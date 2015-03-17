<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<jsp:useBean id="menus" class="ctrls.MenusCtrl"></jsp:useBean>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="css/master.css" media="screen" title="no title" charset="utf-8">
<link rel="stylesheet" href="css/base.css" />
<title>Menu</title>
</head>
<body>

  <nav class="navbar navbar-default">
    <div class="container">
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="#"><strong>foo</strong><i>display</i></a>
      </div>

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li><a href="#">Connexion</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
  </nav>
  
  <div class="container">
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

</body>
</html>
