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
		<div class="col-md-6">
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
		<div class="col-md-6">
			<div class="well bs-component">
				<form action="/ProjetSORServeurJSP/createMenu" method="post" class="form-horizontal">
					<fieldset>
						<legend>Enregistrer un menu</legend>
						<div class="form-group">
							<label for="nomMenu" class="control-label col-lg-2">Nom</label>
							<div class="col-lg-10">
								<input type="text" name="nomMenu" id="nomMenu" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="expiration" class="control-label col-lg-2">Expiration</label>
							<div class="col-lg-10">
								<input type="date" name="expiration" id="expiration" class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="entree" class="control-label col-lg-2">Entrée</label>
							<div class="col-lg-10">
								<input name="entree" class="form-control" id="entree" type="text" />
							</div>
						</div>
						<div class="form-group">
							<label for="plat" class="control-label col-lg-2">Plat</label>
							<div class="col-lg-10">
								<input name="plat" data-type="plat" class="autocomplete form-control" id="plat" type="text" />
							</div>
						</div>
						<div class="form-group">
							<label for="dessert" class="control-label col-lg-2">Dessert</label>
							<div class="col-lg-10">
								<input name="dessert" class="form-control" id="dessert" type="text" />
							</div>
						</div>
						<div class="form-group">
						<div class="col-lg-10 col-lg-offset-2">
							<input type="submit" class="btn btn-primary btn-block" value="Enregistrer"/>
						</div>
					</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>
</div>

<script>

/* Yes, all code below needs some refactoring...  */

$(function() {
	function log( message ) {
      $( "<div>" ).text( message ).prependTo( "#log" );
      $( "#log" ).scrollTop( 0 );
    }
    $("#plat").autocomplete({
      source: function( request, response ) {
        $.ajax({
       		url: "/ProjetSORServeurJSP/findElements?type=plat",
       		type: "POST",
            data: {term: request.term},
       		dataType: "json",
       		success: function(data){
            	response(data);
       		}
        });
      },
      select: function( event, ui ) {
        log( ui.item ?
          "Selected: " + ui.item.label :
          "Nothing selected, input was " + this.value);
      },
      open: function() {
        $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
      },
      close: function() {
        $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
      }
    });
    $("#entree").autocomplete({
        source: function( request, response ) {
          $.ajax({
         		url: "/ProjetSORServeurJSP/findElements?type=entree",
         		type: "POST",
              data: {term: request.term},
         		dataType: "json",
         		success: function(data){
              	response(data);
         		}
          });
        },
        select: function( event, ui ) {
          log( ui.item ?
            "Selected: " + ui.item.label :
            "Nothing selected, input was " + this.value);
        },
        open: function() {
          $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
        },
        close: function() {
          $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
        }
      });
    $("#dessert").autocomplete({
        source: function( request, response ) {
          $.ajax({
         		url: "/ProjetSORServeurJSP/findElements?type=dessert",
         		type: "POST",
              data: {term: request.term},
         		dataType: "json",
         		success: function(data){
              	response(data);
         		}
          });
        },
        select: function( event, ui ) {
          log( ui.item ?
            "Selected: " + ui.item.label :
            "Nothing selected, input was " + this.value);
        },
        open: function() {
          $( this ).removeClass( "ui-corner-all" ).addClass( "ui-corner-top" );
        },
        close: function() {
          $( this ).removeClass( "ui-corner-top" ).addClass( "ui-corner-all" );
        }
      });
  });
</script>

<jsp:include page="/shared/footer.jsp"></jsp:include>
