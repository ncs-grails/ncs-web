package edu.umn.ncs

class DocsController {

	def springSecurityService

	// This controller is to ensure old links redirect to home page
    def index = {
		if (springSecurityService.loggedIn) {
			redirect(controller:"info")
		} else {
			redirect(controller:'home') 
		}
	}
}
