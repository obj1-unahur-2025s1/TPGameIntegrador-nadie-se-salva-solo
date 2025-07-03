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
         //juego.dificultad().resetearVelocidades()         
         game.removeTickEvent("letra")
			game.removeTickEvent("caida")
         game.removeTickEvent("musica")
         juego.dificultad().pararMusica()       
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
   const property atributos=[velCaida,cantLetras,velAparicion] //velocidadCaida,cantidadLetras,velocidadAparicion 
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
            
      if(puntajeActual - ultimoPuntaje.ultimoPuntaje() >= 25){
         atributos.anyOne().aumentarValor()
         ultimoPuntaje.actualizarUltimoPuntaje()
         console.println(puntos.numero())
         console.println("velocidad" +atributos.get(0).valorInicial() +"cantidad"+ atributos.get(1).valorInicial() +"velocidad"+ atributos.get(2).valorInicial())

                  
      }      
   }

   
   
   
    method resetearVelocidades(){
      
   }
}




class Facil inherits Dificultad{
    
   

   
   
}

class Dificil inherits Dificultad{
  
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

   method ultimoPuntaje(){
      return ultimoPuntaje
   }

   method actualizarUltimoPuntaje(){
      ultimoPuntaje = puntos.numero()
   }
}


class Velocidad inherits Atributo{
   override method aumentarValor(){
      valorInicial -= 100
   }
}

class Cantidad inherits Atributo{
   override method aumentarValor(){
      valorInicial += 1
   }
}