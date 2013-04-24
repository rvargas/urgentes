package me.rafaelvargas.urgentes

import grails.plugins.springsecurity.Secured

class HomeController {
	
    def index() {
		
		def dias = 0
		def urgentes = Urgente.list([sort:"dateCreated",order:"desc"])
		def ultimaOcurrencia
		
		if(urgentes.empty)	ultimaOcurrencia = new Date().parse("dd-MM-yyyy","24-04-2013")
		else	ultimaOcurrencia = urgentes?.first()?.dateCreated?.clearTime() 
		
		dias = new Date().clearTime() - ultimaOcurrencia
		
		[dias:dias,urgentes:urgentes]
	}
	
	@Secured(['ROLE_ADMIN'])
	def createUrgente(){
		def urgenteInstance = new Urgente()
		
		bindData(urgenteInstance, params, [include: ['motivo','cliente']])
		
		urgenteInstance.save(flush: true)

		redirect action: 'index'
	}
}
