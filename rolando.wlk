object rolando {
    var mochila = []
    var capacidadMochila = 2
    var historiaDeEncuentro = []
    var poderBase = 0 

    method encontrarArtefacto(artefacto) {
      historiaDeEncuentro.add(artefacto)
      self.recolectarArtefacto(artefacto)
    }

    method recolectarArtefacto(artefacto) {
      if(mochila.size() < capacidadMochila){ //si la longitud de la mochila, es menor a la capacidad de la misma, guardo el artefacto, en caso contrario nada.
      mochila.add(artefacto)
      }
    }
    method capacidadMochila(_capacidadMochila) {
      capacidadMochila = _capacidadMochila
    }

    method artefactosEnPosecion() {
      return castilloDePiedra.artefactosDeCastillo() + self.mochila() 
    }

    method poseeArtefacto(artefacto) {
      return self.mochila().contains(artefacto) //contains = contiene, pregunta si en la mochila dada, esta contenido el elemento dado
    }

    method historiaDeEncuentro() {
      return historiaDeEncuentro
    }

    method mochila() {
      return mochila
    }

    method poderDePelea() {
      return poderBase + mochila.sum{artefacto => artefacto.poderDeArma()}
    }

    method poderBase(_poderBase) {
      poderBase = _poderBase
    }

    method poderBase() {
      return poderBase
    }
}

object espadaDelDestino {
  var personaje = rolando
  var utilizacion = false
  
  method poderDeArma() {
    if (not utilizacion){
      return personaje.poderBase()
    }
    else {
      return personaje.poderBase() / 2
    }
  }

  method fueUtilizado() {
    utilizacion = true
  }
}

object libroHechizos {
  method poderDeArma() {
    
  }
}

object collarDivino {
  var personaje = rolando
  var poderBaseArma = 3
  var utilizacion = 0

  method utilizacion() {
    utilizacion = utilizacion + 1
  }
  
  method poderDeArma() {
    if(rolando.poderBase() > 6){
      return poderBaseArma + utilizacion
    } else {
      return poderBaseArma
    }
  }

  method utilizacion(_utilizacion) {
    utilizacion = _utilizacion
  }

  method poderBaseArma() {
    return poderBaseArma
  }
}

object armaduraAceroValyrio {
  method poderDeArma() {
    return 6
  }
}

object castilloDePiedra {
  var artefactosDeCastillo = []

  method dejarArtefactosEnCastillo(dueño) {
    artefactosDeCastillo.addAll(dueño.mochila()) //agrego todos los artefactos de la mochila a los artefactosd el castillo
    dueño.mochila().clear() //limpio la mochila del dueño
  }

  method artefactosDeCastillo() {
    return artefactosDeCastillo
  }
}

