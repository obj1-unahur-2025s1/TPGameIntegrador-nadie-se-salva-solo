import puntuacion.*
import juego.*
import vida.*

object menu {
  method image() = "menuInicial1.png"
  method position() = game.origin()
}

class Dificultad{
   var velCaidaInicial
   var cantidadLetras
   var velocidadAparicion 
   const property image
   method position() = game.origin()

   method configuracion(){
      if(juego.estaEnMenu()){
         juego.estaEnMenu(false)
         juego.cambiarDificultad(self)
         self.resetearVelocidades()
         game.removeVisual(menu)
         game.addVisual(self)
       //  self.empezar()
         barraDeVida.addVisual()
         puntos.addVisual()
         keyboard.enter().onPressDo({juego.reiniciar()})		
         //limite.addVisual()
       //  game.addVisual(limite)  
      }
   }

   method empezar(){
     // game.onTick(velocidadAparicion, self.identity().toString(), {juego.generarLetraAleatoria(velCaidaInicial,cantidadLetras)})
   }

   method detener(){
      game.removeTickEvent(self.identity().toString())
   }   
   
   method aumentarVelocidad(unaVelocidad){
      velCaidaInicial = velCaidaInicial + unaVelocidad
   }

   method aumentarvelocidadAparicion(unaVelocidad){
      velocidadAparicion = velocidadAparicion + unaVelocidad
   }

   method resetearVelocidades(){
      
   }

   method cambiarCantLetras(unaCantidad){
      cantidadLetras = unaCantidad
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
