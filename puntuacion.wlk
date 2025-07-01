class Numero{
    var x 
    const property position = game.at(x, 0)
    var numero
    var property image = "0.png"

    method numero(unNumero){
        numero = unNumero
    }
    
}

object puntos{
    const puntuacion = [new Numero(x=36,numero = 0),new Numero(x=34,numero = 0),new Numero(x=32,numero = 0),new Numero(x=30,numero = 0),new Numero(x=28,numero = 0)]

    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
  }
  method removeVisual(){
    puntuacion.forEach({v => game.removeVisual(v)})
  }
}

