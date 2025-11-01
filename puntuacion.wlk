import juego.*
class Numero{
     
    var property position = game.at(0, 0)
    var numero = 0
    var image = "0.png"

    method cambiarNumero(unNumero){
        /*
            setter de numero
        */
        numero = unNumero
    }    

    method image() = ""+ numero + ".png"

    method numero(){
        /*
            getter de numero
        */
        return numero
    }

    method reubicar(posX,posY){
        /*
            ubica el numero en una posicion de la pantalla
        */
        position = game.at(posX,posY)
    }
    
}

object puntos{    
    /*
        es el puntaje que se ve en pantalla, esta compuesto por 5 instancias de la clase numero
    */ 
    const property puntuacion = [new Numero(),new Numero(),new Numero(),new Numero(),new Numero()]
    var numero = 0 // es la puntuacion que va a acumulando el jugador

    method addVisual(){
        /*
            agrega a pantalla los 5 numeros
        */
     puntuacion.forEach({v => game.addVisual(v)})
    }

    method numero(){
        /*
            getter de la puntuacion
        */
        return numero
    }

    method removeVisual(){
        /*
            quitar de pantalla los 5 numeros
        */
    puntuacion.forEach({v => game.removeVisual(v)})
    }

    

    method resetearPuntuacion(){
        /*
            resetea la puntuacion del jugador y la imagen de todos los numeros a 0
        */
        numero = 0
        puntuacion.forEach({p => p.cambiarNumero(0)})        
    }

    method ubicar(){
        /*
            posiciona los 5 numeros en pantalla durante el juego
        */
        puntuacion.get(0).reubicar(36,0)
        puntuacion.get(1).reubicar(34,0)
        puntuacion.get(2).reubicar(32,0)
        puntuacion.get(3).reubicar(30,0)
        puntuacion.get(4).reubicar(28,0)
    }

    method reubicar(){
        /*
            posiciona los 5 numeros en pantalla durante la escena game over
        */
        self.addVisual()
        puntuacion.get(0).reubicar(25,24)
        puntuacion.get(1).reubicar(23,24)
        puntuacion.get(2).reubicar(21,24)
        puntuacion.get(3).reubicar(19,24)
        puntuacion.get(4).reubicar(17,24)
    }

    method restarPuntaje(unNumero){
        /*
            resta unNumero al puntaje actual y modifica al mostrado en pantalla
        */
        numero = (numero - unNumero).max(0)
        self.cambiarPuntaje()
    }
   
    
    method sumarPuntaje(unNumero){
        /*
            aumenta unNumero al puntaje actual y modifica al mostrado en pantalla
        */
        numero = numero + unNumero        
        self.cambiarPuntaje()           
    }

    method cambiarPuntaje(){
        /*
            se encarga la cambiar la imagen de cada numero del puntaje basandose en la puntuacion actual
            del jugador
        */
        puntuacion.get(0).cambiarNumero(numero % 10) // unidad
        puntuacion.get(1).cambiarNumero(((numero/10).truncate(0))%10)// decimal
        puntuacion.get(2).cambiarNumero(((numero/100).truncate(0)%10)) // unidad del 100
        puntuacion.get(3).cambiarNumero(((numero/1000).truncate(0)%10))
        puntuacion.get(4).cambiarNumero(((numero/10000).truncate(0)%10))
    }
   
}

