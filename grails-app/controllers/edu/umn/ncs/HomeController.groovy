package edu.umn.ncs

import grails.plugins.springsecurity.Secured


class HomeController {

	def springSecurityService
	
    def index = {
		if (springSecurityService.loggedIn) {
			redirect(controller:"info")
		}
		
	}
}
