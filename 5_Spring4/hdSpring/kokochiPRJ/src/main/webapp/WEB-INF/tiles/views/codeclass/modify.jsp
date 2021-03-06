<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> <c:set var="path" value="/resources" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!-- Portfolio cont -->
<section class="page-section portfolio" id="portfolio">
    <div class="container">
        <!-- Portfolio Section Heading-->
        <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">
			<spring:message code="codeclass.list.title" />
		</h2>
        <!-- Icon Divider-->
        <div class="divider-custom">
            <div class="divider-custom-line"></div>
            <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
            <div class="divider-custom-line"></div>
        </div>
        <!-- Portfolio Grid Items-->
        <form:form modelAttribute="codeClass" action="modify" id="registForm">
        	<form:input path="classCode" cssClass="form-control" /> 
        	<font><form:errors path="classCode" /></font><br>
        	<form:input path="className" cssClass="form-control"/>  
        	<font><form:errors path="className" /></font><br>
        </form:form>
        <div class="btn-group" role="group">
		  <button type="button" class="btn btn-danger" id="btnConfirm">Confirm</button>
		  <button type="button" class="btn btn-warning" id="btnCancel">Cancel</button>
		  <button type="button" class="btn btn-success" id="btnList">List</button>
		</div>
    </div>
</section>

<script>
	const btnList = document.querySelector("#btnList"),
			btnConfirm = document.querySelector("#btnConfirm"),
			btnCancel = document.querySelector('#btnCancel'),
			registForm = document.querySelector('#registForm'),
			classCode = document.querySelector('#classCode')
			
	
	btnList.addEventListener("click",() => {
		self.location='list'
	})
	btnConfirm.addEventListener('click', () => {
		registForm.submit()
	})
	btnCancel.addEventListener('click', () => {
		self.location='read?classCode='+ classCode.value
	})
</script>