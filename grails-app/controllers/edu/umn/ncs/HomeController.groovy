package edu.umn.ncs

class HomeController {

	def springSecurityService
	
    def index = {
		if (springSecurityService.loggedIn) {
			redirect(controller:"info")
		}
		
	}
}
