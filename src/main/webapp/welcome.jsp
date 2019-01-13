<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Check the map</title>
    <link rel="stylesheet" type="text/css" href="resources/css/style_map.css">
    <link href="${contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="resources/js/common.js"></script>
    <script src="resources/js/position.js"></script>
    <script src="https://maps.googleapis.com/maps/api/js"></script>
    <script src="resources/js/map.js"></script>
    <script>
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <c:if test="${pageContext.request.userPrincipal.name != null}">
        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                <%--csrf is disabled(see WebSecurityConfig class--%>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>

        <h2>Welcome ${pageContext.request.userPrincipal.name} | <a onclick="document.forms['logoutForm'].submit()">Logout</a></h2>

    </c:if>
    <h1 align="center">Check Positions on Map</h1>
    <br>
    <div id align="center">
        <table align="center">
            <tr>
                <td><b><em>Device Id</em></b></td>
                <td><input type="text" id="deviceId" size="35" value="SamsungGalaxyJ5" class="regular_input"></td>
            </tr>
            <tr>
                <td><b><em>Start Date</em></b></td>
                <td><input type="text" id="startDate" size="35" value="2018-10-01 23:00:00"></td>
            </tr>
            <tr>
                <td><b><em>End Date</em></b></td>
                <td><input type="text" id="endDate" size="35" value="2019-02-20 23:00:00"
                           onkeydown="if (event.keyCode = 13) getPositions()"></td>
            </tr>
            <tr>
                <td><br></td>
                <td><br></td>
            </tr>
        </table>
        <!--  <input type="button" id="get_positions_button" size="35" value="Get Positions"
                 onclick=getPositions()>-->
        <button class="button" id="get_positions_button" onclick=getPositions()>Get Positions
        </button>

        <br>
        <br>
        <br>
        <br>
        <table align="center">
            <tr>
                <td><b><em><p align="center">The Map Test</p></em></b></td>
                <td><b><em><p align="center">Results will be printed here:</p></em></b></td>
            </tr>
            <tr>
                <td><div align="center" id="map"></div></td>
                <td><div id="result" align="center"></div></td>
            </tr>
        </table>
        <br>
        <br>
        <br>
    </div>
</div>
<!-- /container -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
</body>
</html>
