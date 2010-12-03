<html>
    <head>
        <title>Mailing Lists</title>
        <meta name="layout" content="umn" />
    </head>
    <body>
        <div id="pageBody">
	    	<!-- Breadcrumbs -->
	    	<g:link url="/ncs" >Home</g:link> &gt; Mailing Lists

            <h1>Mailing Lists</h1>
            <p>Mailing lists for the National Children's Study at the University of Minnesota</p>

            <div id="mailingListInstanceList" class="dialog">
                <h2>Lists:</h2>
                <ul>
                    <g:each var="l" in="${mailingListInstanceList}">
                        <li><g:link action="show" id="${l.name}">${l.name}</g:link></li>
                    </g:each>
                </ul>
            </div>
        </div>
    </body>
</html>
