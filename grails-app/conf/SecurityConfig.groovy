security {

	// see DefaultSecurityConfig.groovy for all settable/overridable properties
	active = true

	loginUserDomainClass = "edu.umn.auth.User"
	authorityDomainClass = "edu.umn.auth.Role"

	useRequestMapDomainClass = false
	useControllerAnnotations = true

	forceHttps = true
	channelConfig.secure = ['/**']

	// Used for UMN Cookie Auth
	useUmnCookie = true
	umn {
		authServer = 'www.umn.edu'
		validationServer = 'x500.umn.edu'
		moduleName = 'WEBCOOKIE'
		requiredvalidationLevel = 30
		insufficientValidationLevelMessage = 4
		validCookieTimeInSeconds = 60 * 60
	}
}
