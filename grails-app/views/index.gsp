<html>
<head>
<title>National Children's Study - University of Minnesota</title>
<meta name="layout" content="ncs" />
<style type="text/css" media="screen">
#nav {
	margin-top: 5px;
	margin-left: 5px;
	width: 181px;
	float: left;
}

div.ncsLogoPanelBorder {
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	background-color: #CCC;
	padding: 4px;
	text-align: center;
	width: 173px;
}

div.ncsLogoPanel {
	border: 3px solid white;
	-moz-border-radius: 0.5em;
	-webkit-border-radius: 0.5em;
	width: 159px; background-color : #CCC;
	text-align: center;
	min-height: 128px;
	background-color: #CCC; text-align : center; min-height : 128px;
	padding: 4px;
}

h2 {
	margin-top: 15px;
	margin-bottom: 15px;
	font-size: 1.2em;
}

#pageBody {
	margin-left: 190px;
	margin-right: 5px;
}
</style>
</head>
<body>

<g:include controller="navBar" action="html" params="" />

<div id="nav">
<div class="ncsLogoPanelBorder">
<div class="ncsLogoPanel"><img
	src="${resource(dir:'images', file:'ncs_logo_145.png')}"
	alt="National Children's Study Logo" /></div>
</div>
</div>
<div id="pageBody">
<h1>Welcome to the National Children's Study</h1>

<g:isLoggedIn>
	<p>You appear to be: <g:loggedInUserInfo field="username" /></p>
</g:isLoggedIn> <g:isNotLoggedIn>
	<p>You are not logged in</p>
</g:isNotLoggedIn>

<div id="controllerList" class="dialog">
<h2>Stuff:</h2>
<ul>
	<li class="controller"><g:link controller="info">Information</g:link></li>
	<g:ifAllGranted role="ROLE_BROWSE_FILES">
		<li class="controller"><g:link controller="fileBrowser">File Browser</g:link></li>
	</g:ifAllGranted>
	<li class="controller"><g:link controller="instructions">Instructions</g:link></li>

	<g:ifAllGranted role="ROLE_ADMIN">
		<li class="controller"><g:link controller="manageAccess">Manage Access</g:link></li>
	</g:ifAllGranted>

	<g:ifAnyGranted
		role="ROLE_ASSIGN_LIST_AUTH,ROLE_ADD_MEMBER,ROLE_REMOVE_MEMBER,ROLE_EDIT_MEMBER,ROLE_VIEW_MAILMAN_ADMIN_PAGE">
		<li class="controller"><g:link controller="manageLists">Manage Lists</g:link></li>
	</g:ifAnyGranted>

	<li class="controller"><g:link controller="login">Login</g:link></li>
	

</ul>
</div>
</div>
</body>
</html>
