class Socio {
  const property actividades = []
  const property idiomas = #{}
  const maximoActividades
  var property edad
  
  method initialize() {
    actividades.clear() 
  }
  
  method registrarActividad(unaActividad) {
    if (maximoActividades==actividades.size()) {
      self.error("el socio alcanzó el máximo de actividades")
    }
    actividades.add(unaActividad)
  }

  method esAdoradorDelSol() = actividades.all({a=>a.sirveParaBroncearse()})

  method actividadesEsforzadas() = actividades.filter({a=>a.implicaEsfuerzo()})
  
  method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio {
  override method leAtrae(unaActividad) = unaActividad.dias() >= 4
}

class SocioCoherente inherits Socio {
  override method leAtrae(unaActividad) {
    return
    if (self.esAdoradorDelSol()) {unaActividad.sirveParaBroncearse()}
    else {unaActividad.implicaEsfuerzo()}
  }
}

class SocioRelajado inherits Socio {
  override method leAtrae(unaActividad) = !idiomas.intersection(unaActividad.idiomas()).isEmpty()
}