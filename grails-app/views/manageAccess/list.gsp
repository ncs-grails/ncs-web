<html>
    <head>
        <title>Manage User Access</title>
        <meta name="layout" content="ncs" />
    </head>
    <body>
		<h1>National Children's Study - Ramsey County Location</h1>
		<div id="identity">
			<g:isLoggedIn>
				<p>Logged in as <g:loggedInUserInfo field="username" /></p>
			</g:isLoggedIn> <g:isNotLoggedIn>
				<p>You are not logged in</p>
			</g:isNotLoggedIn>
		</div>
		<div class="content-box shadow">
			<h2>Manage User Access</h2>

            <p>You may change manage a user's roles that control their access 
            to various portions of the web site</p>

			<br/>
			<div> WARNING:  THIS SHOULD ACTUALLY BE MANAGED THROUGH ACTIVE DIRECTORY GROUPS!!!</div>
			<br/>

            <div id="userInstanceList" class="dialog">
                <h2>Users:</h2>
                <ul>
                    <g:each var="u" in="${userInstanceList}">
                        <li><g:link action="edit" id="${u.id}">${u.userRealName}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
