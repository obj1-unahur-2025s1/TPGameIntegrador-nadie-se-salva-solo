import juego.*

object menu {
  method image() = "menuInicial1.png"
  method position() = game.origin()
}

object facil{
    method image() = "mFacil.png"
    method position() = game.origin()    
}

object dificil {    
    method image() = "Dificil1.png"
    method position() = game.origin()    
}

class Vida{
  const corazon
  var property image = "Co1.png"

  method vidaPerdida(){
    image = "Co2.png"
  }

  method reinicio(){
    image = "Co1.png"
  } 
}

object barraDeVida {
  const corazones = [new Vida(corazon=1),new Vida(corazon=2),new Vida(corazon=3)]
  var property cantidad = 3

  method addVisual(){
    corazones.forEach({c => game.addVisual(c)})
  } 

  method removeVisual(){
    corazones.forEach({c => game.removeVisual(c)})
  }

  method reinicio(){
    corazones.forEach({c => c.reinicio()})
  }

  method restarVida(){
    cantidad = cantidad - 1
  }

  method perderVidas(){
    if(cantidad == 3){
      corazones.get(2).vidaPerdida()
      self.restarVida()
    }
    if(cantidad == 2){
      corazones.get(1).vidaPerdida()
      self.restarVida()
    }
    else{
      self.restarVida()
     // juego.gameOver() falta hacer 
    }
    
    }

}