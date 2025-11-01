import letras.*
import puntuacion.*
import juego.*
import vida.*
import sonido.*


object menu {
  method image() = "menuInicial3.png"
  method position() = game.origin()
}

object gameOver{
   const property musica = new Sonido(cancion = "perdiste.mp3")
   method image() = "gameOver2.png"
   method position() = game.origin()
   

   method configuracion(){
      /*
         configuracion de escena menu (pantalla inicial)
      */
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
         game.removeTickEvent("colores")
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
      /*
         configuracion de escena dificultad (se aplica a ambas dificultades)
      */
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
      /*
         para la musica que se esta reproduciendo
      */
      musica.parar()
   }

   method empezar(){
      /*
         genera las letras en pantallas en cada tick. atributos.get(0).valorInicial() son los segundos cada cuanto
         se generan las letras
      */
      game.onTick(atributos.get(0).valorInicial(), "letra", {juego.agregarLetraSiEsPosible(atributos.get(1).valorInicial(),atributos.get(2).valorInicial())})
            
   }
   method disminuirVelociad(){
      /*
         Disminuye la velocidad de caida y aparicion
      */
      vel = vel + 300
   }  
   
   method aumentarDificultad(puntajeActual,ultimoPuntaje){  
      /*
         dependiendo de la puntuacion del jugador hace que las letras aparezcan y caigan mas rapido, puedan haber 
         mas letras en pantallas y que empiecen a a aparecer las letras de colores
      */          
      self.masRapidoYmasCantidad(puntajeActual, ultimoPuntaje)
      self.generarMasLetras(puntajeActual,ultimoPuntaje)
      self.generarLetrasColor(puntajeActual,ultimoPuntaje)            
   }

   method checkRotar(unaLetra){
      /*
         se encarga de controlar la puntuacion actual del jugador y hacer
         que la letras empiecen a rotar cuando llega a cierta puntuacion
      */
      if(puntos.numero() > 200){
         unaLetra.empezarARotar()
      }
   }
// puntaje actual 251 
   method masRapidoYmasCantidad(puntajeActual,ultimoPuntaje){
      /*
         se encarga de controlar la puntuacion actual del jugador, hacer que
         aumente la velocidad de caida y aparicion de las letras y la cantidad maxima
         en pantalla  

      */

      if(puntajeActual - ultimoPuntaje.ultimoPuntaje() >= 15){
         atributos.get(posicion).aumentarValor()
         ultimoPuntaje.actualizarUltimoPuntaje()
         posicion = posicion + 1
         if(posicion > 2){
            posicion = 0
         }                
      }    
   }

   method generarMasLetras(puntajeActual,ultimoPuntaje){
      /*
         no se que hace
      */

      if(puntajeActual >= ultimoPuntaje.limiteMasLetras()){
        // game.onTick(600, "letra", {juego.agregarLetraSiEsPosible(atributos.get(1).valorInicial(),atributos.get(2).valorInicial())})        
         juego.agregarLetraSiEsPosible(27,200)
         ultimoPuntaje.actualizarLimiteMasLetras()
      }      
   }

   method generarLetrasColor(puntajeActual,ultimoPuntaje){
      /*
         se encarga de controlar la puntuacion actual del jugador y hacer que
         empiecen a aparecer letras de colores cuando se llega a cierta puntuacion

      */
      if(puntajeActual >= ultimoPuntaje.limiteColores()){
         game.onTick(5000, "colores", {self.generarLetraDeColor()})
         ultimoPuntaje.actualizarLimiteColores()
      }
   }

   method generarLetraDeColor(){
      /*
         genera una letra de color y las muestra en pantalla
      */
      const letra = self.LetrasColores().anyOne()

         letra.cambiarPosicion(juego.algunaPosicion())
			letra.addVisual()
			letra.iniciarCaida(500)			
			juego.listaLetras().add(letra.letra())
			keyboard.letter(letra.letra()).onPressDo({letra.destruir()})
   }

   method LetrasColores(){
      /*
         lista de letras de colores posibles
      */
      const bN = new LetraNegra(image = "Bn.png", letra = "B", puntaje = 100)
      const cN = new LetraNegra(image = "Cn2.png", letra = "C", puntaje =100)
      const pN = new LetraNegra(image = "Pn2.png", letra = "P", puntaje = 100)
      const rN = new LetraNegra(image = "Rn.png", letra = "R", puntaje = 100)
      const aN = new LetraNegra(image = "An2.png", letra = "A", puntaje =100)
      const bV = new LetraVerde(image = "Bv.png", letra = "B", puntaje = 50)
      const pV = new LetraVerde(image = "Pv.png", letra = "P", puntaje = 50)
      const dR = new LetraRoja(image = "Dr.png", letra = "D", puntaje = 25)
      const gR = new LetraRoja(image = "Gr.png", letra = "G", puntaje = 25)
      const jR = new LetraRoja(image = "Jr.png", letra = "J", puntaje = 25)
      const mR = new LetraRoja(image = "Mr.png", letra = "M", puntaje = 25)
      const nR = new LetraRoja(image = "Nr.png", letra = "N", puntaje = 25)
      const tR = new LetraRoja(image = "Tr.png", letra = "T", puntaje = 25)
      const xR = new LetraRoja(image = "Xr2.png", letra = "X", puntaje =25)
      const yR = new LetraRoja(image = "Yr.png", letra = "Y", puntaje = 25)
      const fA = new LetraAmarilla(image = "Fa.png", letra = "F",puntaje = 25)
      const oA = new LetraAmarilla(image = "Oa.png", letra = "O",puntaje = 25)
      const wA = new LetraAmarilla(image = "Wa.png", letra = "W",puntaje = 25)
      const zA = new LetraAmarilla(image = "Za.png", letra = "Z",puntaje = 25)
      const lista =[bN,cN,pN,rN,aN,bV,pV,dR,gR,jR,mR,nR,tR,xR,yR,fA,oA,wA,zA]
      return lista      
   }


    method resetearVelocidades()
}

class Facil inherits Dificultad{
   /*
      se encarga de volver a los valores iniciales del modo facil
   */
   override method resetearVelocidades(){
      vel = 1500
      cant = 5
   }   
}

class Dificil inherits Dificultad{
   /*
      se encarga de volver a los valores iniciales del modo difiicl
   */
   override method resetearVelocidades(){
      vel = 1000
      cant = 8
   }
}


object controlPuntaje{
   /*
      es un objeto que sabe cuales son los limites de puntuacion para que empiecen a generarse eventos 
      durante el juego
   */
   var ultimoPuntaje = puntos.numero()
   var limiteMasLetras = 250
   var limiteColores = 150

   method ultimoPuntaje(){
      /* 
         
      */
      return ultimoPuntaje
   }

   method resetarControlPuntaje(){
      /*
         resetea la variable ultimoPuntaje
      */
      ultimoPuntaje = 0
   }

   method actualizarUltimoPuntaje(){
      /*
         actualiza la variable ultimoPuntaje al puntaje actual del jugador
      */
      ultimoPuntaje = puntos.numero()
   }

   method limiteMasLetras(){
      /*
         devuelve el puntaje necesario para que se active el evento que aumenta la cantidad 
         de letras posibles en pantalla
      */
      return limiteMasLetras
   }

   method actualizarLimiteMasLetras(){
      /*
         aumenta el puntaje necesario para que se active el evento que aumenta la cantidad 
         de letras posibles en pantalla
      */
      limiteMasLetras += 100
   }

   method resetearLimiteMasLetras(){
      /*
         resetea el puntaje necesario para que se active el evento que aumenta la cantidad 
         de letras posibles en pantalla
      */
      limiteMasLetras = 150
   }

   method limiteColores(){
      /*
         devuelve el puntaje necesario para que se active el evento que genera letras de colores
      */
      return limiteColores
   }

   method actualizarLimiteColores(){
      /*
         aumenta el puntaje necesario para que se active el evento que genera letras de colores
      */
      limiteColores = 99999999
   }

   method resetearLimiteColores(){
      /*
         resetea el puntaje necesario para que se active el evento que genera letras de colores
      */
      limiteColores = 150
   }
   
}
class Atributo{
   /*
      clase padre para velocidad y cantidad, ambas se usan para manejar la velocidad de aparicion y caida
      de las letras y la cantidad en pantalla
   */
   var valorInicial  

   method valorInicial(){
      /*
         devuelve el valor inicial con el que empieza el atributo
      */
      return valorInicial
   }
   method aumentarValor(){
      
   }
   method cambiarValor(unValor){
      /*
         setter de valorInicial
      */
      valorInicial = unValor
   }  
}

class Velocidad inherits Atributo{

   override method aumentarValor(){
      /*
         aumenta la velocidad con la que aparece o caen las letras
      */
      valorInicial = (valorInicial - 200).max(0)
   }

   method disminuirVelocidad(){
      /*
         disminuye la velocidad con la que aparece o caen las letras
      */
      valorInicial = valorInicial + 200
   }
}

class Cantidad inherits Atributo{
   override method aumentarValor(){
      /*
         aumenta la cantidad de letras posibles en pantalla
      */

      valorInicial += 1
   }
}