import me.rafaelvargas.urgentes.User
import me.rafaelvargas.urgentes.Role
import me.rafaelvargas.urgentes.UserRole

class BootStrap {

    def init = { servletContext ->
		if(!User.count()){
			def adminRole = new Role(authority: 'ROLE_ADMIN').save(flush: true)
			def testUser = new User(username: 'rv', enabled: true, password: '')
			testUser.save(flush: true)
			
			UserRole.create testUser, adminRole, true
	  
			assert User.count() == 1
			assert Role.count() == 1
			assert UserRole.count() == 1
		}
    }
    def destroy = {
    }
}
