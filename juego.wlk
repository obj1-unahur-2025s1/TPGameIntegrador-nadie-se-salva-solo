import wollok.game.*
import letras.*
import pantallas.*


    

object juego{
	var estaEnMEnu = true
	var estaJugando = false
	var dificultad = null
	const abecedario = ["E","A","F"]
	const posicionesX = #{0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27}
	
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
			game.onTick(2000, "nuevaLetra", {self.generarLetraAleatoria()})

		}
			
	}

	method modoDificil(){
		if (estaEnMEnu){
			estaEnMEnu = false
			dificultad = dificil
			game.removeVisual(menu)
			game.addVisual(dificil)
		}		
	}

	method menuInicial(){
		if(!estaJugando){
			if(dificultad == facil){
				game.removeVisual(facil)
			}else{
				game.removeVisual(dificil)
			}			
	  		game.addVisual(menu)
	 	 	estaEnMEnu = true
		}
       
    }

		method generarLetraAleatoria(){		
		//const nuevaLetra = new Letras(position= game.at(16, 36), image = "E1.png")
		const nuevaLetra = new Letras(position= game.at(posicionesX.anyOne(), 36), image = abecedario.anyOne()+".png")
		game.addVisual(nuevaLetra)
		nuevaLetra.iniciarCaida(200)

	}

	

}

