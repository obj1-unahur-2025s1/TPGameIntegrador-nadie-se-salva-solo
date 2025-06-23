import vida.*
import wollok.game.*
import letras.*
import pantallas.*
import puntuacion.*


    

object juego{
	var property estaEnMenu = true
	const estaJugando = false
	var property dificultad = facil
	const abecedario = self.abc()
	//const posicionesX = 
	var posicionesPosibles = [] //	
	var property listaLetras = []
	var posiciones = [[13,14,15,16],[25,26,27,28],[0,1,2,3],[30,31,32,33,34,35],[19,20,21,22],[7,8,9,10]]
	// 36 es el limite maximo de X e Y
	// 12 es el limite de Y donde la tecla impacta con usuario
	
	
	method iniciar(){
		game.cellSize(15)
		game.width(40)
		game.height(40)	
  		game.title("bombardeo de letras")
		game.addVisual(menu)  	
		keyboard.f().onPressDo({self.modoFacil()})
		keyboard.d().onPressDo({self.modoDificil()})
		keyboard.enter().onPressDo({self.reiniciar()})				
		game.start()   		
	}

	method modoFacil(){
		facil.configuracion()
			// deberia ir aca		
	}
	
	method modoDificil(){
		dificil.configuracion()		
	}

	method reiniciar(){
		if(!estaJugando){
			listaLetras.clear()
			self.quitarEscenaJuego()
			game.removeTickEvent("nuevaLetra")
	  		game.addVisual(menu)
			barraDeVida.removeVisual()
			barraDeVida.reiniciar()
			puntos.removeVisual()
	 		estaEnMenu = true			
		}
       
    }


	method quitarEscenaJuego(){
			if(dificultad == facil){
				game.removeVisual(facil)
				//barraDeVida.removeVisual()					
			}else{
				game.removeVisual(dificil)
			}
	}



	method generarLetraAleatoria(velocidad,unaCantidad){
		const letra = abecedario.anyOne()
		const nuevaLetra = new Letras(position= game.at(self.algunaPosicion(), 36), image = letra+"u.png", letra = letra)
		
		self.agregarLetraSiEsPosible(nuevaLetra, velocidad,unaCantidad)
		keyboard.letter(letra).onPressDo({nuevaLetra.destruir()}) // tiene que estar afuera, pero como?
		
	}

	method abc(){
		return ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	}

	method algunaPosicion(){		
		self.reiniciarPosiciones()		
		posicionesPosibles.add(posiciones.first())
		posiciones.remove(posiciones.first())
		return posicionesPosibles.last().anyOne()
	}

	method reiniciarPosiciones(){
		if(posiciones.isEmpty()){
		  posiciones = [[13,14,15,16],[25,26,27,28],[0,1,2,3],[30,31,32,33,34,35],[19,20,21,22],[7,8,9,10]]
		  posicionesPosibles.clear()
		}
	}

	

	

	method agregarLetraSiEsPosible(unaLetra,velocidad,unaCantidad){		
		if(listaLetras.size() <= unaCantidad and not self.hayLetraRepetida(unaLetra.letra())){
			unaLetra.addVisual()
			unaLetra.iniciarCaida(velocidad)
			listaLetras.add(unaLetra.letra())		
		}
	}

	method hayLetraRepetida(unaLetra){		
		return listaLetras.contains(unaLetra)
	}

	


}

