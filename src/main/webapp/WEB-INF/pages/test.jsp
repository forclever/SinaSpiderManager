<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<html>
<header>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/json2.js"></script>

<script type="text/javascript">
	function testAjax() {
		var sysUsers=Object();
		sysUsers.suid="Admin";
		sysUsers.pwd="1234";
		//alert("JSON String: " + JSON.stringify(sysUsers));
		//alert("JSON Object: " + sysUsers);
		$.ajax({
			type:"GET",
			url: "sinauser.do?pagenum=1",
			//contentType: "application/json;charset=UTF-8",
			//data: '{"suid":"Admin", "pwd":"123"}',
			//dataType:"application/json;charset=UTF-8",
			success: function(data) {
				alert(JSON.stringify(data));
				},
			error: function() {alert("error")}
		}); 
		//$.getJSON("jsonConverterTest.json", function(data) {alert(data)});
	}
</script>

</header>
<body>
<h2>Hello World!</h2>
<input type="button" onclick="testAjax()" value="点我" />
</body>
</html>
