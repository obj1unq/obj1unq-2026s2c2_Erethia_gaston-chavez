object rolando {
    var mochila = []
    var capacidadMochila = 2

    method recolectarArtefacto(artefacto) {
      if (mochila.size() < capacidadMochila){
        mochila.add(artefacto)
      }
    }

    method capacidadMochila(_capacidadMochila) {
      capacidadMochila = _capacidadMochila
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

