object rolando {
    var mochila = []
    var capacidadMochila = 2
    var historiaDeEncuentro = []

    method recolectarArtefacto(artefacto) {
      if (mochila.size() < capacidadMochila){ //si la longitud de la mochila, es menor a la capidad de la mochila, agrega el elemento, caso contrario no
        mochila.add(artefacto)
      }
      historiaDeEncuentro.add(artefacto)
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
}

object espadaDelDestino {
  
}

object libroHechizos {
  
}

object collarDivino {

}

object armaduraAceroValyrio {

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