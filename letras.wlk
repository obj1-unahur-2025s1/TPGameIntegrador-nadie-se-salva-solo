import juego.*
import vida.*
import puntuacion.*
import sonido.*
class Letras{    
    var property position = 0
    var property image
    const property letra 
    var property velocidadCaida = 0
    const property puntaje
    var property esVisible = false
    const ruido = new Sonido(cancion ="explosion2.mp3")

    method moverHaciaAbajo(cantCeldas){
        position = game.at(position.x(),position.y() - cantCeldas)
    }

    method caer(){
        if(esVisible){
            position = position.down(1)            
        }
        if (self.position().y() ==7){            
            self.impactar()           
        }
                     
    }

    method cambiarPosicion(posicionX){
        position = game.at(posicionX, 36)
    }

    method impactar(){
        if(esVisible ){
            barraDeVida.restarCantidad()        
            image = "impacto.png"
            self.explosion()
            game.onTick(500, "boom", {self.removeVisual()})
            game.onTick(600, "reubicar", {self.cambiarPosicion(36)})
            self.ocultar()
        }
        
    }


    method ocultar(){
        esVisible = false
        console.println(letra)
    }
   

    method destruir(){
        if(esVisible and juego.estaJugando()){
         juego.listaLetras().remove(self.letra())
         image = "explosion1.png"
         game.onTick(500, "boom", {self.removeVisual()})
         puntos.sumarPuntaje(puntaje)
         self.explosion()
         self.ocultar()
        }       
    }

    method iniciarCaida(tiempo){
        game.onTick(tiempo, "caida", {self.caer()})
        esVisible = true
    }

    method addVisual(){
        game.addVisual(self)        
    }

    method removeVisual(){
        game.removeVisual(self)
    }

    method explosion(){
        ruido.reproducir()
    }


}

