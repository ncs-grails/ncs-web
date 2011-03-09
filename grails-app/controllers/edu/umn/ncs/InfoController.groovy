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

	def background = {}

	def cab = {}

	def faq = {}

	def contact = {}
	
}
