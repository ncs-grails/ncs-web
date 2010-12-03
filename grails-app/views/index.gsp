<html>
    <head>
        <title>Welcome to Grails</title>
        <meta name="layout" content="umn" />
        <style type="text/css" media="screen">

        #nav {
            margin-top:20px;
            margin-left:30px;
            width:228px;
            float:left;

        }
        .homePagePanel * {
            margin:0px;
        }
        .homePagePanel .panelBody ul {
            list-style-type:none;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody h1 {
            text-transform:uppercase;
            font-size:1.1em;
            margin-bottom:10px;
        }
        .homePagePanel .panelBody {
            background: url(images/leftnav_midstretch.png) repeat-y top;
            margin:0px;
            padding:15px;
        }
        .homePagePanel .panelBtm {
            background: url(images/leftnav_btm.png) no-repeat top;
            height:20px;
            margin:0px;
        }

        .homePagePanel .panelTop {
            background: url(images/leftnav_top.png) no-repeat top;
            height:11px;
            margin:0px;
        }
        h2 {
            margin-top:15px;
            margin-bottom:15px;
            font-size:1.2em;
        }
        #pageBody {
            margin-left:280px;
            margin-right:20px;
        }
        </style>
    </head>
    <body>
        <div id="nav">
            <div class="homePagePanel">
                <div class="panelTop"></div>
                <div class="panelBody">
                    <h1>Application Status</h1>
                    <ul>
                        <li>App version: <g:meta name="app.version"></g:meta></li>
                        <li>Grails version: <g:meta name="app.grails.version"></g:meta></li>
                        <li>Groovy version: ${org.codehaus.groovy.runtime.InvokerHelper.getVersion()}</li>
                        <li>JVM version: ${System.getProperty('java.version')}</li>
                        <li>Controllers: ${grailsApplication.controllerClasses.size()}</li>
                        <li>Domains: ${grailsApplication.domainClasses.size()}</li>
                        <li>Services: ${grailsApplication.serviceClasses.size()}</li>
                        <li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>
                    </ul>
                    <h1>Installed Plugins</h1>
                    <ul>
                        <g:set var="pluginManager"
                               value="${applicationContext.getBean('pluginManager')}"></g:set>

                        <g:each var="plugin" in="${pluginManager.allPlugins}">
                            <li>${plugin.name} - ${plugin.version}</li>
                        </g:each>

                    </ul>
                </div>
                <div class="panelBtm"></div>
            </div>
        </div>
        <div id="pageBody">
            <h1>Welcome to the National Children's Study</h1>

    	<g:isLoggedIn>
	    	<p>You appear to be: <g:loggedInUserInfo field="username"/></p>
    	</g:isLoggedIn>

    	<g:isNotLoggedIn>
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
                	
                	<g:ifAnyGranted role="ROLE_ASSIGN_LIST_AUTH,ROLE_ADD_MEMBER,ROLE_REMOVE_MEMBER,ROLE_EDIT_MEMBER,ROLE_VIEW_MAILMAN_ADMIN_PAGE">
	                	<li class="controller"><g:link controller="manageLists">Manage Lists</g:link></li>
                	</g:ifAnyGranted>

                	<li class="controller"><g:link controller="login">Login</g:link></li>
                	<li class="controller"><g:link controller="logout">Logout</g:link></li>

                </ul>
            </div>
        </div>
    </body>
</html>
