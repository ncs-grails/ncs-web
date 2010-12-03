import org.grails.plugins.springsecurity.service.AuthenticateService
import edu.umn.auth.UmnCookieAuthenticationProvider

/**
 * Logout Controller (Example).
 */
class LogoutController {

    /**
     * Dependency injection for the authentication service.
     */
    def authenticateService

    /**
     * Dependency injection for UmnCookieAuthenticationProvider.
     */
    def umnCookieAuthenticationProvider

    /**
     * Index action. Redirects to the Spring security logout uri.
     */
    def index = {

        def config = authenticateService.securityConfig.security
        
        if (config.useUmnCookie) {
            def returnUrl = "${request.requestURL}"

            if (authenticateService.isLoggedIn()) {
                request.getSession()?.invalidate()
                redirect url:umnCookieAuthenticationProvider.logoutUrl(returnUrl)
            } else {
                redirect uri:'/'
            }
        } else {
            // TODO  put any pre-logout code here
            redirect uri:'/j_spring_security_logout'
        }
    }
}
