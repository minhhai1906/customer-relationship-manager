<%--
  Created by IntelliJ IDEA.
  User: t460s
  Date: 10/02/2022
  Time: 20:42
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>List Customer</title>
    <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
    <div id="wrapper">
        <div id="header">
            <h2>CRM - Customer Relationship Manager</h2>
        </div>
    </div>
    <div id="container">
        <div id="content">
<%--            <input type="button"
                        value="Add Customer"
                        onclick="window.location.href='showFormForAdd'; return false;"
                        class="add-button"/>--%>
            <button type="submit"
                    onclick="window.location.href='showFormForAdd'; return false;"
                    class="add-button">
                Add Customer
            </button>
<%--            add html table--%>
            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email Name</th>
                    <th>Action</th>
                </tr>
<%--                loop and print customers--%>
                <c:forEach var="tempCustomer" items="${customers}">
                    <c:url var="updateLink" value="/customer/showFormForUpdate">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>
                    <c:url var="deleteLink" value="/customer/delete">
                        <c:param name="customerId" value="${tempCustomer.id}" />
                    </c:url>

                    <tr>
                        <td>${tempCustomer.firstName}</td>
                        <td>${tempCustomer.lastName}</td>
                        <td>${tempCustomer.email}</td>
                        <td>
                            <a href="${updateLink}">Update</a>
                            <span>|</span>
                            <a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this customer'))) return false">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
