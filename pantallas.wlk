import juego.*
import vida.*

object menu {
  method image() = "menuInicial1.png"
  method position() = game.origin()
}

object facil{
    method image() = "modoFacil.png"
    method position() = game.origin()

    method configuracion() {
       if(juego.estaEnMenu()){
          juego.estaEnMenu(false)
          juego.dificultad(self)
          game.removeVisual(menu)
          game.addVisual(self)  
          barraDeVida.addVisual()
          keyboard.space().onPressDo({barraDeVida.removeVisual()})
         

       }
    }
}

object dificil {    
    method image() = "modoDificil.png"
    method position() = game.origin()    
}

