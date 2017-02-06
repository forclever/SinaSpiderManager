<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>微博爬虫--登录</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/dest/css/weibo.css">
    <script src="<%=request.getContextPath()%>/dest/js/jquery.min.js"></script>
</head>
<body>
<div class="mod-login">
    <div class="login-hd">实时微博数据采集系统<br/>Real-time Weibo Data Collection System</div>
    <div class="login-bd">
        <form action="">
            <ul>
                <li><label for=""><i class="ico ico-user"></i></label><input type="text" class="ipt" placeholder="请输入账户"></li>
                <li><label for=""><i class="ico ico-pwd"></i></label><input type="text" class="ipt" placeholder="请输入密码"></li>
                <li class="login-err"></li>
            </ul>
            <a href="javascript:;" class="btn btn-login">登录</a>
        </form>
    </div>
</div>
<script src="<%=request.getContextPath()%>/dest/js/weibo.js"></script>
<script>
    (function(){
        wb.login.init();
    })();
</script>
</body>
</html>
