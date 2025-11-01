import pantallas.*
import juego.*


class Vida{
  const corazon
  var x
  var property image = "Co1.png"
  var property position = game.at(x, 0)


  method vidaPerdida(){
    /*
      cambia la imagen a vida perdida
    */
    image = "Co2.png"
  }

  method reinicio(){
    /*
      cambia la imagen a vida llena
    */
    image = "Co1.png"
  } 
}

object barraDeVida{

    /*
      esta compuesto por 3 instancias de la clase vida
    */
    const barra = [new Vida(corazon = 1, x =0),new Vida(corazon = 2, x =5),new Vida(corazon = 3, x =10)]
    var cantidad = 3
    var posiciones = 0

    method addVisual(){
      /*
        muestra en pantalla las 3 vidas
      */
      barra.forEach({v => game.addVisual(v)})
    }
    method removeVisual(){
       /*
        elimina de pantalla las 3 vidas
      */
      barra.forEach({v => game.removeVisual(v)})
    }    

    method reiniciar(){
      /*
        reinicia la barra de vida
      */
      barra.forEach({c => c.reinicio()})
      posiciones = 0
      cantidad = 3
    }

    method cantidadVidas(){
      /*
        getter de cantidad de vidas disponibles
      */
      return cantidad
    }
    method restarCantidad(){
      /*
        resta una vida
      */
      barra.get(posiciones).vidaPerdida()
      cantidad -= 1
      posiciones += 1
      self.perder()  
    }
    method aumentarCantidad(){
      /*
        aumenta una vida
      */
      if(cantidad < 3){
        cantidad += 1
        posiciones -= 1
        barra.get(posiciones).reinicio()
      }
      
    }       

    method perder(){
      /*
        indica cuando el jugador se queda sin vidas y termina el juego
      */
      if(cantidad==0){       
        juego.rendirse()
      }  
    }

}

