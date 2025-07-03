import puntuacion.*
import juego.*
import vida.*
import sonido.*


object menu {
  method image() = "menuInicial1.png"
  method position() = game.origin()
}

object gameOver{
   method image() = "gameOver2.png"
   method position() = game.origin()
   

   method configuracion(){
      if(juego.estaJugando()){
         juego.estaJugando(false)
         juego.perdio(true)
         game.removeVisual(juego.dificultad())
         game.addVisual(self)
         puntos.removeVisual()                
         puntos.reubicar()                      
         juego.listaLetras().clear()         
			barraDeVida.removeVisual()
			barraDeVida.reiniciar()
         juego.dificultad().resetearVelocidades()         
         game.removeTickEvent("letra")
			game.removeTickEvent("caida")
         game.removeTickEvent("musica")
         juego.dificultad().pararMusica()       
         keyboard.m().onPressDo({juego.reiniciar()})           
      }  
   }

   
}

class Dificultad{
   var velCaidaInicial
   var cantidadLetras
   var velocidadAparicion 
   const property image
   method position() = game.origin()
   const property musica
   

   method configuracion(){
      if(juego.estaEnMenu()){
         juego.estaEnMenu(false)
         juego.cambiarDificultad(self)
         juego.estaJugando(true)         
         game.removeVisual(menu)
         game.addVisual(self)
         self.empezar()
         barraDeVida.addVisual()
         puntos.addVisual()
         puntos.ubicar()
         keyboard.enter().onPressDo({juego.rendirse()})
         musica.reproducir()
         game.onTick(14500, "musica", {musica.reproducir()})
                  
      }
   }

   method pararMusica() {
      musica.parar()
   }

   method empezar(){
      game.onTick(velocidadAparicion, "letra", {juego.agregarLetraSiEsPosible(velCaidaInicial,cantidadLetras)})      
   }  
   
   method aumentarVelocidad(){
      velCaidaInicial = (velCaidaInicial -  100).max(0)
      console.println(velCaidaInicial)
   }

   method aumentarvelocidadAparicion(){
      velocidadAparicion = (velocidadAparicion -  100).max(0)
   }

   method resetearVelocidades(){
      
   }

   method cambiarCantLetras(){
      cantidadLetras += 1
   }
}

class Facil inherits Dificultad{
    
   override method resetearVelocidades(){
         velCaidaInicial = 2000
         velocidadAparicion = 2000
   }

   
   
}

class Dificil inherits Dificultad{
   override method resetearVelocidades(){
         velCaidaInicial = 2000
         velocidadAparicion = 2000
   }
}
