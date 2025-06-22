import juego.*

class Letras{
    
    var property position
    var property image
    var property letra 

    method caer(){
        if (position.y() < game.height() -1){
            position = position.down(1)
        }
        else{
            self.chocar()
            game.removeVisual(self)
        }
    }

    method chocar(){
        // hacer que reste una vida
        game.removeTickEvent("caida")
        
    }

    method destruir(unaLetra){
        
        keyboard.letter(unaLetra).onPressDo({game.removeVisual(self)})
        juego.restarLetra()
       // image = "explosion.png"
    }

    method iniciarCaida(tiempo){
        game.onTick(tiempo, "caida", {self.caer()})
    }

    method addVisual(){
        game.addVisual(self)
        juego.sumarLetra()
    }

    method removeVisual(){
        game.removeVisual(self)
    }

}

