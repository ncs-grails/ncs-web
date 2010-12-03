<html>
    <head>
        <title>Manage User Access</title>
        <meta name="layout" content="umn" />
    </head>
    <body>
        <div id="pageBody">
	    	<!-- Breadcrumbs -->
	    	<g:link url="/ncs" >Home</g:link> &gt; Manage User Access

            <h1>Manage User Access</h1>
            <p>You may change manage a user's roles that control their access 
            to various portions of the web site</p>

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
