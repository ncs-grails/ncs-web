import edu.umn.auth.User
import edu.umn.auth.Role

class BootStrap {

    def init = { servletContext ->

		environments {
			development {
				println "Bootstrapping..."

				//	Manage application
				def admins = new Role(authority:'ROLE_ADMIN', description: 'Administrators')
				def browseFiles = new Role(authority:'ROLE_BROWSE_FILES', description: 'View NCS Shared Files')
				def tester = new Role(authority:'ROLE_LIST_TESTER', description: 'View NCS TEST Lists')
				def assignListAuthority = new Role(authority:'ROLE_ASSIGN_LIST_AUTH', description: 'Assign List Authority')
				def addMemberToList = new Role(authority:'ROLE_ADD_MEMBER', description: 'Add Member to a List')
				def removeMemberFromList = new Role(authority:'ROLE_REMOVE_MEMBER', description: 'Remove Member from a List')
				def editMemberEmailAttr = new Role(authority:'ROLE_EDIT_MEMBER', description: 'Edit Member Email Attributes')
				def viewMailmanAdminPage = new Role(authority:'ROLE_VIEW_MAILMAN_ADMIN_PAGE', description: 'View MAILMAN ADMIN PAGE')
				def viewNcsEmailLists = new Role(authority:'ROLE_VIEW_NCS_EMAIL_LISTS', description: 'View NCS Email Lists')

				admins.save(flush:true)
				browseFiles.save(flush:true)
				tester.save(flush:true)
				assignListAuthority.save(flush:true)
				addMemberToList.save(flush:true)
				removeMemberFromList.save(flush:true)
				editMemberEmailAttr.save(flush:true)
				viewMailmanAdminPage.save(flush:true)
				viewNcsEmailLists.save(flush:true)
				
				//if (!admins.save(flush:true)) {
				//	println "Error saving role"
				//	admins.errors.each{ err ->
				//		println "	${err}"
				//	}
				//}

				def ajz = new User(username: 'ajz', userRealName: 'Aaron',
					enabled:true, email:'ajz@umn.edu', emailShow: true, passwd: '*')
					.addToAuthorities(admins)
					.addToAuthorities(assignListAuthority)
					.addToAuthorities(addMemberToList)
					.addToAuthorities(removeMemberFromList)

				def ngp = new User(username: 'ngp', userRealName: 'Natalya',
					enabled:true, email:'ngp@umn.edu', emailShow: true, passwd: '*')
					.addToAuthorities(admins)

				if (!ajz.save(flush:true)) {
					println "Error saving user"
					ajz.errors.each{ err ->
						println "	${err}"
					}
				}
				if (!ngp.save(flush:true)) {
					println "Error saving user"
					ngp.errors.each{ err ->
						println "	${err}"
					}
				}
			}
		}

    }
    def destroy = {
    }
}
