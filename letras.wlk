import juego.*
import vida.*
class Letras{
    
    var property position = game.center()
    var property image
    const property letra 
    var property velocidadCaida = 0
    const property puntaje
    var property esVisible = false

    method caer(){
        if(esVisible and self.position().y() != 15){
            position = position.down(1)
            console.println(self.position())
        }else{
           // Vida.restarCantidad()
        }
                     
    }

    method cambiarPosicion(posicionX){
        position = game.at(posicionX, 36)
    }
   

    method destruir(){
       juego.listaLetras().remove(self.letra())
       image = "explosion1.png"
       game.onTick(500, "boom", {self.removeVisual()})
       esVisible = false

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


}

