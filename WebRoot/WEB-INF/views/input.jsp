<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'input.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <!-- 
    	1.WHY使用form标签？
    	可以更快速的开发出表单页面，而且可以更方便的进行表单值的回显
    	2.注意：可以通过modelAttribute属性指定绑定绑定的模型属性，
    	若没有指定该属性，则默认从request域对象中读取command的表单bean
    	如果该属性值也不存在，则会发生错误。
    	
     -->
     <form:form action="${pageContext.request.contextPath }/emp" method="POST" modelAttribute="employee">
     	<c:if test="${employee.id ==null }">
	     	<!-- path属性对应html表单标签的name属性值 -->
	     	LastName:<form:input path="lastName"/>
	     	<form:errors path="lastName"></form:errors>
     	</c:if>
     	<c:if test="${employee.id!=null }">
     		<form:hidden path="id"/>
     		<input type="hidden" name="_method" value="PUT"/>
     		<%-- 
     		对于_method不能使用form：hidden标签，因为modelAttribute对应的bean中没有_method这个属性
     		 --%>
     		 <%-- 
     		<form:hidden path="_method" value="PUT"/> 
     		  --%>
     	</c:if>
     	<br>
     	Email:<form:input path="email"/>
     	<br>
     	<%
     		Map<String,String> genders=new HashMap();
     		genders.put("1","Male");
     		genders.put("0","Female");
     		
     		request.setAttribute("genders",genders);
     	 %>
     	Gender:
     	<br>
     	<form:radiobuttons path="gender" items="${genders }" delimiter="<br>"/>
     	<br>
     	Department:<form:select path="department.id"
     		items="${departments }" itemLabel="departmentName" itemValue="id"></form:select>
     	<br>
     	<input type="submit" value="Submit"/>
     </form:form> 
  </body>
</html>
