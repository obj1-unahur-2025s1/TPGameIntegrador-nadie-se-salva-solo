import juego.*
import vida.*

object menu {
  method image() = "menuInicial1.png"
  method position() = game.origin()
}

object facil{
    var velCaidaInicial = 1000
    method image() = "modoFacil.png"
    method position() = game.origin()  
    

    method configuracion() {
       if(juego.estaEnMenu()){
          juego.estaEnMenu(false)
          juego.dificultad(self)
          game.removeVisual(menu)
          game.addVisual(self)  
          game.onTick(1000, "nuevaLetra", {juego.generarLetraAleatoria(velCaidaInicial,5)})
          
        //  barraDeVida.addVisual()
         // keyboard.space().onPressDo({barraDeVida.removeVisual()})
          
       }
    }

    method cambiarVelocidad(){
      velCaidaInicial =+ 1000
    }
}

object dificil {    
    method image() = "modoDificil.png"
    method position() = game.origin()    
}

