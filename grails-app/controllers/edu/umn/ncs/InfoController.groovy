package edu.umn.ncs

import org.codehaus.groovy.grails.plugins.springsecurity.Secured

@Secured(['ROLE_ALL'])

class InfoController {
	
	def authenticateService
	
    def index = {
		def me = authenticateService.principal()
		
		def roles = me?.getAuthorities()
		
		def rolesList = ""
		roles.each {
			rolesList += "${it}".replace("ROLE_", "") + ", "
		}
		
		[ roles: roles, rolesList: rolesList ]
	}

	def background = {
	
		def breadCrumb = [ [ name:'Background' ] ]	
		[ breadCrumb: breadCrumb ]
	}

	def cab = {
	
		def breadCrumb = [ [ name:'C.A.B.' ] ]	
		[ breadCrumb: breadCrumb ]
		
	}

	def faq = {
	
		def breadCrumb = [ [ name:'F.A.Q.' ] ]	
		[ breadCrumb: breadCrumb ]
		
	}

	def contact = {
	
		def breadCrumb = [ [ name:'Contact' ] ]	
		[ breadCrumb: breadCrumb ]
		
	}
	
}
