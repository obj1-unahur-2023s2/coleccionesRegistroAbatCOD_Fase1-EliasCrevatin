object regAbatidos {
	const registro = [] 
	
		
	method dia(reg) = reg.get(1)
	method cant(reg) = reg.first()
	method yaEstaElDia(dia) = registro.any({r => self.dia(r) == dia})
	method registroDia(dia) = registro.find({r => self.dia(r) == dia}) 
	
	method agregarAbatidosDia(cantidad, dia){
		if (self.yaEstaElDia(dia)){
			self.error("Ya existe registro para el día indicado")
		}
			registro.add([cantidad,dia] )
	}
	method agregarAbatidosVariosDias(registrosAbatidos){
		if(!registrosAbatidos.all({e => self.yaEstaElDia(e)})){
			registro.addAll(registrosAbatidos)
		}
			self.error("algun dia de la lista ya registro caidos")
	}
	method eliminarElRegistroDelDia(dia){
		if(!self.yaEstaElDia(dia)){
			self.error("el dia no esta en la lista")
			}
			registro.remove(self.registroDia(dia))
		}	
	method eliminarVariosRegistrosDeDias(listasDeDias){
		if(!listasDeDias.all({e => self.yaEstaElDia(e)})){
			listasDeDias.forEach({e => self.eliminarElRegistroDelDia(e)})
		}
			self.error("algun dia De la lista no esta incluido en el registro")
	}
	method cantidadDeDiasRegistrados() = registro.size() + 1
	method estaVacioElRegistro() = registro.isEmpty()
	method algunDiaAbatio(cantidad) = registro.any({a => self.cant(a) == cantidad})
	method ultimoValorDeAbatidos() = self.cant(registro.last())
	method maximoValorDeAbatidos() = registro.max({a => self.cant(a).first()})
	method totalAbatidos() =registro.sum({a => self.cant(a)})
	method cantidadDeAbatidosElDia(dia) = self.cant(self.registroDia(dia))
	method ultimoValorDeAbatidosConSize() = self.cant(registro.get(registro.size(-1)))
	method diasConAbatidosSuperioresA(cuanto) = registro.filter({r => self.cant({r > cuanto}) })
	method valoresDeAbatidosPares() = self.cant({registro.even()})
	method elValorDeAbatidos(cantidad) = registro.find(self.cant(cantidad))
	method abatidosSumando(cantidad) = return(registro.forEach({a => self.cant(a) + cantidad}))
	method abatidosEsAcotada(n1,n2) = self.cant({registro.between(n1,n2)})
	method algunDiaAbatioMasDe(cantidad) = registro.any({a => self.cant(a) > cantidad})
	method todosLosDiasAbatioMasDe(cantidad) = registro.all({a => self.cant(a) > cantidad})
	//method cantidadAbatidosMayorALaPrimera() self.cant()
	method esCrack() = registro.all({a => self.cant(a) > self.ultimoValorDeAbatidos()})
	
}