<html>
<head>
<title>National Children's Study</title>
<meta name="layout" content="ncs" />
</head>
<body>
<h1>National Children's Study</h1>

<div id="identity">
	<sec:ifLoggedIn>
		<p>Logged in as <sec:username/></p>
	</sec:ifLoggedIn> <sec:ifNotLoggedIn>
		<p>You are not logged in</p>
	</sec:ifNotLoggedIn>
</div>

<div class="content-box">
	<h2>Learn more about the National Children's Study at</h2>
	<div style="display:inline-block; text-align:center; width:288px;">
		<a href="https://www.nationalchildrensstudy.gov/">
		<img src="${resource(dir:'images', file:'ncs_logo_145.png')}"><br/>
	National Institute of Health</a>
	</div>
</div>

</body>
</html>
