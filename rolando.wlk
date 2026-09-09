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
      return self.artefactosEnPosecion().contains(artefacto)//contains = contiene, pregunta si en la mochila dada, esta contenido el elemento dado sea en la mochila o castillo
    }

    method historiaDeEncuentro() {
      return historiaDeEncuentro
    }

    method mochila() {
      return mochila
    }

    method poderDePelea() {
      return poderBase + self.poderDeArtefactos()
    }

    method poderDeArtefactos() {
      return mochila.sum{artefacto => artefacto.poderDeArma()}
    }

    method poderBase(_poderBase) {
      poderBase = _poderBase
    }

    method poderBase() {
      return poderBase
    }

    method pelearBatalla() {
      mochila.forEach({artefacto => artefacto.utilizacion()})
      poderBase = poderBase + 1
    }

    method morada() {
      return castilloDePiedra
    }
}

object erethia {
  var enemigos = #{caterina, archibaldo, astra}
  
  method enemigos(_enemigos) {
    enemigos = _enemigos
  }

  method esPoderoso(personaje) {
    return enemigos.all({enemigo => personaje.poderDePelea() > enemigo.poderDePelea()})
  }

  method enemigosVencidosDe(personaje) {
    return enemigos.filter({enemigo => personaje.poderDePelea() > enemigo.poderDePelea()})
    }

  method moradasConquistadas(){
    return self.enemigosVencidosDe(rolando).map({enemigo => enemigo.morada()})
    }
}

object espadaDelDestino {
  var personaje = rolando
  var fueUtilizado = false
  
  method poderDeArma() {
    if (not fueUtilizado){
      return personaje.poderBase()
    }
    else {
      return personaje.poderBase() / 2
    }
  }

  method utilizacion() {
    fueUtilizado = true
  }
}

object libroHechizos {
  var hechizos = []
  method poderDeArma() {
    if (self.hayHechizos()){
      return hechizos.first().poderHechizo()
    } else {
      return 0
    }
  }

  method hayHechizos() {
    return not hechizos.isEmpty()
  }

  method utilizacion() {
    return hechizos.remove(hechizos.first())
  }

  method hechizos(_hechizos) {
    hechizos = _hechizos
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
    if(personaje.poderBase() > 6){
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

  method utilizacion() {
    return 0
  }
}

object castilloDePiedra {
  var artefactosDeCastillo = []

  method llegarACastillo(personaje) {
    self.dejarArtefactosEnCastillo(personaje)
  }

  method dejarArtefactosEnCastillo(personaje) {
    artefactosDeCastillo.addAll(personaje.mochila()) //agrego todos los artefactos de la mochila a los artefactosd el castillo
    personaje.mochila().clear() //limpio la mochila del dueño
  }

  method artefactosDeCastillo() {
    return artefactosDeCastillo
  }
}

object bendicion {
  method poderHechizo(personaje) {
    return 4
  }
}

object invisibilidad {
  method poderHechizo(personaje) {
    return personaje.poderBase()
  }
}

object invocacion {
  method poderHechizo(personaje) {
    return personaje.morada().artefactosDeCastillo().map({artefacto => artefacto.poderDeArma()}).max()
  }
}

//2.3 Enemigos
object caterina {

  method poderDePelea() {
    return 28
  }

  method morada() {
    return fortalezaDeAcero
  }
}

object archibaldo {

  method poderDePelea() {
    return 16
  }

  method morada() {
    return palacioDeMarmol
  }
}

object astra {

  method poderDePelea() {
    return 14
  }

  method morada() {
    return torreDeMarfil
  }
}

object fortalezaDeAcero{
  
}

object palacioDeMarmol{
  
}

object torreDeMarfil{

}
