class Vida{
  const corazon
  var x
  var property image = "Co1.png"
  var property position = game.at(x, 0)


  method vidaPerdida(){
    image = "Co2.png"
  }

  method reinicio(){
    image = "Co1.png"
  } 
}

object barraDeVida{
    const barra = [new Vida(corazon = 1, x =0),new Vida(corazon = 2, x =5),new Vida(corazon = 3, x =10)]
    var cantidad = 3

    method addVisual(){
     barra.forEach({v => game.addVisual(v)})
  }
  method removeVisual(){
    barra.forEach({v => game.removeVisual(v)})
  }

  method reiniciar(){
    barra.forEach({c => c.reinicio()})
    cantidad = 3
  }
  method restarCantidad(){
    cantidad -= 1
    console.println("aprete")
  }
  method perderVidas(){
    if(cantidad == 3){
      barra.get(2).vidaPerdida()
      self.restarCantidad()
    }
    if(cantidad == 2){
      barra.get(1).vidaPerdida()
      self.restarCantidad()
    }
    else{
      self.restarCantidad()
     // juego.gameOver() falta hacer 
    }
    
    }

}

object limite{
  const property image = "pruebaLimite.png"
//  const width = 50
//  const height = 50
  const property position = game.at(0, 0)
  
  method addVisual(){
    game.addVisual(self)
  }

  method chocar(objeto,unaAccion){
    game.whenCollideDo(objeto, unaAccion)
  }
}