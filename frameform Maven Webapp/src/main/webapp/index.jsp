<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>测试页面</title>
    
    <meta charset="utf-8">
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript" src="http://static.jxufehelper.com/FrankSiteAssets/assets/js/jquery-2.1.4.min.js"></script>
	<script type="text/javascript" src="http://static.jxufehelper.com/FrankSiteAssets/assets/js/amazeui.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://static.jxufehelper.com/FrankSiteAssets/assets/css/amazeui.min.css">
  </head>
  
  <body>
  
    <div class="am-contaier am-margin">
    
      <!-- 不跳转form -->
      <form action="submit" method="post" target="frame-submit" class="am-form">
        <label for="username" class="am-form-label">用户名：</label>
        <input type="text" name="username" id="username" placeholder="请输入你的用户名" class="am-form-field">
        <br>
        <label for="username" class="am-form-label">密码：</label>
        <input type="password" name="password" id="password" placeholder="输入你的密码">
        <p>
        <input type="submit" value="提交到服务器" class="am-btn am-btn-primary am-btn-submit am-center">
      </form>
      
      <iframe name="frame-submit" id="frame-submit" style="display: none;"></iframe>
      
      <!-- 跳转form -->
      <form action="submit" method="post" class="am-form">
        <label for="username" class="am-form-label">用户名：</label>
        <input type="text" name="username" id="username" placeholder="请输入你的用户名" class="am-form-field">
        <br>
        <label for="username" class="am-form-label">密码：</label>
        <input type="password" name="password" id="password" placeholder="输入你的密码">
        <p>
        <input type="submit" value="提交到服务器" class="am-btn am-btn-primary am-btn-submit am-center">
      </form>
      
    </div>
  
  </body>
  <script type="text/javascript">
    $(document).ready(function() {
      
      function submitHandler() {
        var frame = $('#frame-submit').get(0)
        
        var body = (frame.contentWindow ? frame.contentWindow : frame.contentDocument).document.body;
        
        var json = body.innerText
        
        json = (typeof JSON.parse !== "undefined") ? JSON.parse(json) : eval("(" + json + ")");
        
        if (json.status) {
          alert(json.message)
        } else {
          alert(json.message)
        }
        
        $(frame).unbind('load')
      }
      
      $('.am-btn-submit').on('click', function() {
        
        $('#frame-submit').on('load', submitHandler)
        
      })
      
    })
  </script>
</html>
