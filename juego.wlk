import wollok.game.*
import teclas.*
import pantallas.*

    

object juego{

	method configurar(){
		game.width(12)
  		game.height(12)
  		game.cellSize(90)		
  		game.title("Guerra de palabras")
		game.addVisualCharacter(menu)  	
		keyboard.a().onPressDo({self.CambiarPantalla()})
	}

	method CambiarPantalla(){
		game.removeVisual(menu)
		game.addVisual(facil)	
	}
}

