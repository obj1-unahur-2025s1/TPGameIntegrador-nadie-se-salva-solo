import puntuacion.*
import juego.*
import vida.*
import sonido.*


object menu {
  method image() = "menuInicial2.png"
  method position() = game.origin()
}

object gameOver{
   const property musica = new Sonido(cancion = "perdiste.mp3")
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
         musica.reproducir(true)       
         keyboard.m().onPressDo({juego.reiniciar()})           
      }  
   }

   
}

class Dificultad{
   var vel 
   var cant
   const velCaida = new Velocidad(valorInicial = vel)
   const cantLetras = new Cantidad(valorInicial = cant)
   const velAparicion =  new Velocidad(valorInicial = vel)
   const property atributos=[velCaida,cantLetras,velAparicion]  
   const property image
   method position() = game.origin()
   const property musica
   var posicion = 0 


   method configuracion(){
      if(juego.estaEnMenu()){
         juego.estaEnMenu(false)
         juego.musica().parar()
         juego.cambiarDificultad(self)
         juego.estaJugando(true)         
         game.removeVisual(menu)
         game.addVisual(self)
         self.empezar()
         barraDeVida.addVisual()
         puntos.addVisual()
         puntos.ubicar()
         keyboard.enter().onPressDo({juego.rendirse()})
         musica.reproducir(true)
         musica.cambiarVolumen(0.2)                       
      }
   }

   method pararMusica() {
      musica.parar()
   }

   method empezar(){
      game.onTick(atributos.get(0).valorInicial(), "letra", {juego.agregarLetraSiEsPosible(atributos.get(1).valorInicial(),atributos.get(2).valorInicial())})
            
   }  
   
   method aumentarDificultad(puntajeActual,ultimoPuntaje){            
      self.masRapidoYmasCantidad(puntajeActual, ultimoPuntaje)
      self.generarMasLetras(puntajeActual,ultimoPuntaje)            
   }

   method masRapidoYmasCantidad(puntajeActual,ultimoPuntaje){
      if(puntajeActual - ultimoPuntaje.ultimoPuntaje() >= 5){
         atributos.get(posicion).aumentarValor()
         ultimoPuntaje.actualizarUltimoPuntaje()
         posicion = posicion + 1
         if(posicion > 2){
            posicion = 0
         }                
      }    
   }

   method generarMasLetras(puntajeActual,ultimoPuntaje){
      if(puntajeActual >= ultimoPuntaje.limiteMasLetras()){
         game.onTick(600, "letra", {juego.agregarLetraSiEsPosible(atributos.get(1).valorInicial(),atributos.get(2).valorInicial())})        
         console.println("oa <:")
         ultimoPuntaje.actualizarLimiteMasLetras()
      }      
   }  
    method resetearVelocidades(){
      
   }
}

class Facil inherits Dificultad{
   
   override method resetearVelocidades(){
      vel = 1500
      cant = 5
   }   
}

class Dificil inherits Dificultad{
   override method resetearVelocidades(){
      vel = 1000
      cant = 8
   }
}

class Atributo{
   var valorInicial  

   method valorInicial(){
      return valorInicial
   }
   method aumentarValor(){
      
   }
   method cambiarValor(unValor){
      valorInicial = unValor
   }  
}
object controlPuntaje{
   var ultimoPuntaje = puntos.numero()
   var limiteMasLetras = 150

   method ultimoPuntaje(){
      return ultimoPuntaje
   }

   method resetarControlPuntaje(){
      ultimoPuntaje = 0
   }

   method actualizarUltimoPuntaje(){
      ultimoPuntaje = puntos.numero()
   }

   method limiteMasLetras(){
      return limiteMasLetras
   }

   method actualizarLimiteMasLetras(){
      limiteMasLetras += 100
   }

   method resetearLimiteMasLetras(){
      limiteMasLetras = 150
   }
   
}


class Velocidad inherits Atributo{
   override method aumentarValor(){
      valorInicial = (valorInicial - 200).max(20)
   }
}

class Cantidad inherits Atributo{
   override method aumentarValor(){
      valorInicial += 1
   }
}