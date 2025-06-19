import wollok.game.*
import teclas.*
import pantallas.*

    

object juego{
	var estaEnMEnu = true
	var estaJugando = false
	var dificultad = null
	method configurar(){
		game.cellSize(15)
		game.width(40)
		game.height(40)	
  		game.title("Guerra de palabras")
		game.addVisualCharacter(menu)  	
		keyboard.f().onPressDo({self.modoFacil()})
		keyboard.d().onPressDo({self.modoDificil()})
		keyboard.enter().onPressDo({self.menuInicial()})
		game.start()
   		
	}
	method modoFacil(){
		if (estaEnMEnu){
			estaEnMEnu = false
			dificultad = facil
			game.removeVisual(menu)
			game.addVisual(facil)
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
}

