package edu.umn.ncs

import org.codehaus.groovy.grails.plugins.springsecurity.Secured


class HomeController {

	def authenticateService
	
    def index = {
		if (authenticateService.loggedIn) {
			redirect(controller:"info")
		}
		
	}
}
