class Numero{
    var x 
    var property position = game.at(x, 0)
    var numero
    var property image 

    method numero(unNumero){
        numero = unNumero
    }

    method reubicar(posX,posY){
        position = game.at(posX,posY)
    }
    
}

object puntos{
                            // primer cero, unidad                            segundo cero, decimal 
    const puntuacion = [new Numero(x=36,numero = 0,image = "0.png"),new Numero(x=34,numero = 0,image = "0.png"),new Numero(x=32,numero = 0,image = "0.png"),new Numero(x=30,numero = 0,image = "0.png"),new Numero(x=28,numero = 0,image = "0.png")]
    var puntos = 10
    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
    }
    method removeVisual(){
    puntuacion.forEach({v => game.removeVisual(v)})
    }

    method reubicar(){
        puntuacion.get(0).reubicar(17,24)
        puntuacion.get(1).reubicar(19,24)
        puntuacion.get(2).reubicar(21,24)
        puntuacion.get(3).reubicar(23,24)
        puntuacion.get(4).reubicar(25,24)
    }
}

