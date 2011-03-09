import edu.umn.ncs.MailingListAuthority

class BootStrap {

    def init = { servletContext ->

		environments {
			development {
				println "Bootstrapping..."
				def la = new MailingListAuthority(listName:"NCS_UMN_SiteAdmin",
					address:"ajz@umn.edu", display:"Aaron J. Zirbes").save(flush:true)
			}
		}
    }
    def destroy = {
    }
}
