<html>
<head>
	<meta charset="utf-8">
	<title>管理员中心</title>
</head>
<style type="text/css">
	html,body{
		margin: 0;
		padding: 0;
	}
	#head{
		width: 100%;
		height: 15%;
		background: gray;
		text-align: center;
	}
	#box{
		width: 100%;
		height: 75%;
		background: green;
	}
	#nav{
		width: 20%;
		height: 100%;
		background: pink;
		float: left;

	}
	#content{
		width: 80%;
		height: 100%;
		background: #F5F5DC;
		float: left;
	}
	#foot{
		width: 100%;
		height: 10%;
		background:#F0FFF0;

	}
</style>
<body>
	<div id="head">
		欢迎来到管理后台
		<div>{{.name}}</div>
		<div>{{.logintime}}</div>
		<div onclick="quit()">注销</div>
	</div>
	<div id="box">
		<!--管理菜单-->
		<div id="nav">
			<ul type="none">
				<li><a href="/Admin/list">用户列表</a></li>
				<li><a href="/Admin/todayincome">今日收入</a></li>
				<li><a href="/Admin/todayrecharge">今日充值</a></li>
				<li><a href="/Admin/todaydownload">今日下载</a></li>
				<li><a href="/Admin/totalincome">总计收入</a></li>
			</ul>
		</div>
		<!--内容-->
		<div id="content">
			<div style="text-align: center;font-size: 2em;margin-bottom: 10px;margin-top: 10px; ">今日下载</div>
			<table  border="1" align="center">
				<tr><th>Id</th><th>文件名</th><th>用户</th><th>下载地址</th><th>下载时间</th></tr>
				{{range .downloadrecord}}
				<tr><td>{{.Id}}</td><td>{{.FileName}}</td><td>{{.UserName}}</td><td>{{.Ip}}</td><td>{{.DownLoadTime}}</td></tr>
				{{end}}
			</table>		
		</div>
	</div>
	<div id="foot">页脚</div>
	<script type="text/javascript">
		function quit(){
			//注销
			$.ajax({
				type: "POST",
				url: "/Admin/center",
				data: {quit:1},
				dataType: "json",
				success: function(data){
					document.location.reload();
				}
			});
		}
	</script>
</body>
</html>