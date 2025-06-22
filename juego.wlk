import vida.*
import wollok.game.*
import letras.*
import pantallas.*


    

object juego{
	var property estaEnMenu = true
	var estaJugando = false
	var property dificultad = null
	const abecedario = self.abc()
	const posicionesX = self.posicionesPosibles() //
	var property letrasEnPantalla = 0
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
		keyboard.enter().onPressDo({self.menuInicial()})				
		game.start()   		
	}

	method modoFacil(){
		facil.configuracion()			
	}


	

	method modoDificil(){
		if (estaEnMenu){
			estaEnMenu = false
			dificultad = dificil
			game.removeVisual(menu)
			game.addVisual(dificil)	
		}		
	}

	method menuInicial(){
		if(!estaJugando){
			if(dificultad == facil){
				game.removeVisual(facil)
				barraDeVida.removeVisual()
				self.reiniciar()
				
			}else{
				game.removeVisual(dificil)
			}			
			game.removeTickEvent("nuevaLetra")
	  		game.addVisual(menu)
	 	 	estaEnMenu = true
		}
       
    }

	method reiniciar(){
		letrasEnPantalla = 0
	}

		method generarLetraAleatoria(velocidad){
		const letra = abecedario.anyOne()
		const nuevaLetra = new Letras(position= game.at(posicionesX.anyOne(), 36), image = letra+"u.png", letra = letra)
		self.agregarLetraSiEsPosible(nuevaLetra, velocidad)
		keyboard.letter(letra).onPressDo({nuevaLetra.destruir(letra)})
		
	}

	method abc(){
		return ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	}

	method posicionesPosibles(){
		return #{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34}
	}

	method sumarLetra(){
		letrasEnPantalla += 1
	}

	method restarLetra(){
		letrasEnPantalla = (letrasEnPantalla -  1).max(0)
	}

	method agregarLetraSiEsPosible(unaLetra,velocidad){		
		if(letrasEnPantalla <= 5){
	    console.println(letrasEnPantalla)
		self.sumarLetra()		
		unaLetra.addVisual()
		unaLetra.iniciarCaida(velocidad)
		}
	}


}

