<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %> <c:set var="path" value="/resources" />
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation-->
<nav class="navbar navbar-expand-lg bg-secondary text-uppercase" id="mainNav">
    <div class="container">
        <a class="navbar-brand" href="/"><spring:message code="common.title"/> </a>
        <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
            Menu
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[0] ? "active" : ""}" href="/codeclass/list"><spring:message code="common.menu1"/></a></li>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[1] ? "active" : ""}" href="/codedetail/list"><spring:message code="common.menu2"/></a></li>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[2] ? "active" : ""}" href="/user/list"><spring:message code="common.menu3"/></a></li>   
                <sec:authorize access="!isAuthenticated()"><li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[3] ? "active" : ""}" href="/auth/login"><spring:message code="common.menu4-1"/></a></li></sec:authorize>
                <sec:authorize access="isAuthenticated()"><li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[3] ? "active" : ""}" href="/auth/logout"><spring:message code="common.menu4-2"/></a></li></sec:authorize>         
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[4] ? "active" : ""}" href="/board/list"><spring:message code="common.menu5"/></a></li>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[5] ? "active" : ""}" href="#contact"><spring:message code="common.menu6"/></a></li>
                <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-1 rounded ${navbar_value[6] ? "active" : ""}" href="#contact"><spring:message code="common.menu7"/></a></li>
            </ul>
        </div>
    </div>
</nav>
