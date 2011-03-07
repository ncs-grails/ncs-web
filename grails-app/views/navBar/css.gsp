<%@ page contentType="text/css" %>
/* 
    Document   : ncs_images
    Created on : Apr 26, 2010, 2:35:12 PM
    Author     : ajz
    Description:
        All images references in the UMN CSS Templates
*/


#header_sub {
	height: 100%;
	line-height: 30px;
	font-size: 0.9em;
	color: white;
	text-align: right;
	background-image: url( ${resource(dir:'images',plugin:'ncs-web-template',file:'bg_header_sub.gif')} );
	background-color: #7A0019;
	background-repeat:repeat-x;
	background-position-x: 0%;
	background-position-y: 0%;
	border-top: 1px solid #5B0013;
	border-bottom: 1px solid #5B0013;
}

#header_sub ul#header_sub_nav li.tl_menu a {
	font-size: 9pt;
}

ul.mailingList li {
	background-image: url( ${resource(dir:'images',file:'maillist_24.png')} );
}
ul.recipientList li {
	background-image: url( ${resource(dir:'images',file:'at_symbol_24.png')} );
}
