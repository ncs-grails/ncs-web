import edu.umn.auth.User
import edu.umn.auth.Role

class BootStrap {

    def init = { servletContext ->

		environments {
			development {
				println "Bootstrapping..."

			}
		}

    }
    def destroy = {
    }
}
