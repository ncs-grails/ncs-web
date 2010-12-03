<html>
    <head>
        <title>Manage User Access</title>
        <meta name="layout" content="umn" />
        <g:javascript library="jquery" plugin="jquery"/>
        <g:javascript src="manage_user.js" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'ncs.css')}" />
    </head>
    <body>
    	<!-- Breadcrumbs -->
    	<g:link url="/ncs" >Home</g:link> &gt; 
    	<g:link action="list" >Manage User Access</g:link> &gt;
    	${userInstance?.userRealName}
    	
        <div id="pageBody">
            <h1>Manage User Access</h1>
            <p>You may change manage a user's roles that control their access 
            to various portions of the web site</p>

			<g:isLoggedIn>
				<p>You appear to be: <g:loggedInUserInfo field="username"/></p>
				
				<p>Note: The user must logout and login again before the 
					changes made here show up for the user</p>
				
			</g:isLoggedIn>

            <div id="userInstanceList" class="dialog round">
                <h2>Users:</h2>
                <ul>
                    <g:each var="u" in="${userInstanceList}">
                        <li><g:link action="edit" id="${u.id}">
                        	${u.userRealName}</g:link></li>
                    </g:each>
                </ul>
            </div>
            
            <div id="userRolesList" class="dialog round">
                <h2>${userInstance?.userRealName}'s Roles:</h2>
                <g:form name="edit" action="addOrRemove">
				<g:hiddenField name="user.id" value="${userInstance.id}" />
                <ul>
                    <g:each var="r" in="${roleInstanceList}">
                        <li>
                        	<label for="role_${r.id}">${r.description}</label>
                        	<g:checkBox name="role_${r.id}" value="${userInstance?.authorities?.contains(r)}" />
                        </li>
                    </g:each>
                </ul>
                </g:form>
            </div>
        </div>
    </body>
</html>
