import wollok.game.*
import letras.*
import pantallas.*


    

object juego{
	var estaEnMEnu = true
	var estaJugando = false
	var dificultad = null
	const abecedario = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","Ñ","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
	const posicionesX = #{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35}
	var velFacil = 400
	var velDificil = 200
	// 36 es el limite maximo de X e Y
	// 12 es el limite de Y donde la tecla impacta con usuario
	
	
	method configurar(){
		game.cellSize(15)
		game.width(40)
		game.height(40)	
  		game.title("bombardeo de letras") // me gusta mas
		game.addVisual(menu)  	
		keyboard.f().onPressDo({self.modoFacil()})
		keyboard.d().onPressDo({self.modoDificil()})
		keyboard.enter().onPressDo({self.menuInicial()})
		
		// game.addVisual(e) // instanciando un objeto con la clase Letra no me aparece
		game.start()
   		
	}
	method modoFacil(){
		if (estaEnMEnu){
			estaEnMEnu = false
			dificultad = facil
			game.removeVisual(menu)
			game.addVisual(facil)
			//game.addVisual(e) //llamando al objeto LetraE me aparece la imagen
			//e.iniciarCaida(500)
			game.onTick(3000, "nuevaLetra", {self.generarLetraAleatoria()})
			

		}
			
	}

	method modoDificil(){
		if (estaEnMEnu){
			estaEnMEnu = false
			dificultad = dificil
			game.removeVisual(menu)
			game.addVisual(dificil)
			game.onTick(1000, "nuevaLetra", {self.generarLetraAleatoria()})

		}		
	}

	method menuInicial(){
		if(!estaJugando){
			if(dificultad == facil){
				game.removeVisual(facil)
				
			}else{
				game.removeVisual(dificil)
			}			
			game.removeTickEvent("nuevaLetra")
	  		game.addVisual(menu)
	 	 	estaEnMEnu = true
		}
       
    }

		method generarLetraAleatoria(){		
		var letra = abecedario.anyOne()
		const nuevaLetra = new Letras(position= game.at(posicionesX.anyOne(), 36), image = letra+".png", letra = letra)
		game.addVisual(nuevaLetra)
		if(dificultad == facil){
			nuevaLetra.iniciarCaida(velFacil)
		}else{
			nuevaLetra.iniciarCaida(velDificil)
		}
		keyboard.letter(letra).onPressDo({ game.removeVisual(nuevaLetra)})

		console.println(nuevaLetra.image())

	}

	

}

