class Actividad {
  const property idiomas = #{}

  method initialize() {
    if (idiomas.isEmpty()) {
      self.error("debe ser una colección que tenga al menos un idioma en formato string")
    }
  }

  method esInteresante() = idiomas.size() > 1

  method sirveParaBroncearse() = true

  method dias()

  method implicaEsfuerzo() = true

  method esRecomendadaPara(unSocio) = self.esInteresante() && unSocio.leAtrae(self) && !unSocio.actividades().contains(self)
}

class ViajeDePlaya inherits Actividad {
  const largo

  override method dias() = largo / 500

  override method implicaEsfuerzo() = largo > 1200 
}

class ExcursionACiudad inherits Actividad {
  const property cantidadAtracciones

  override method esInteresante() = super() || cantidadAtracciones == 5

  override method dias() = cantidadAtracciones / 2

  override method sirveParaBroncearse() = false

  override method implicaEsfuerzo() = cantidadAtracciones.between(5, 8)
}

class ExcursionTropical inherits ExcursionACiudad {
  override method dias() = super() + 1

  override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Actividad {
  const kms
  const diasDeSol

  override method esInteresante() = super() && diasDeSol > 140

  override method dias() = kms / 50

  override method implicaEsfuerzo() = kms > 80

  override method sirveParaBroncearse() = (diasDeSol > 200) || (diasDeSol.between(100, 200) && kms > 120)
}

class ClaseDeGimnasia inherits Actividad {

  method initialize() {
    idiomas.clear()
    idiomas.add("español")
  }

  method validador() {
    if(!idiomas == #{"español"}) {
      self.error("el unico idioma disponible es español")
    }
  }
  
  override method dias() = 1
  
  override method sirveParaBroncearse() = false

  override method esRecomendadaPara(unSocio) = unSocio.edad().between(20, 30)
}

class TallerLiterario inherits Actividad {
  const libros = #{}

  method initialize() {
    idiomas.clear()
    idiomas.addAll(libros.map({l => l.idioma()}))
  }

  override method sirveParaBroncearse() = false

  override method dias() = libros.size() + 1

  override method implicaEsfuerzo() = libros.any({l => l.cantidadPaginas() > 500}) || (libros.size() > 1 && libros.map({l => l.nombreAutor()}).asSet().size() == 1)

  override method esRecomendadaPara(unSocio) = unSocio.idiomas().size() > 1
}

class Libro {
  const property idioma 
  const property cantidadPaginas
  const property nombreAutor    
}

