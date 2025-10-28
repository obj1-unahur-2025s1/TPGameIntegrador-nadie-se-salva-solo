import letrasPack.letraSimple.*
import vida.*
import wollok.game.*
import letras.*
import pantallas.*
import puntuacion.*
import sonido.*
import modoDeJuego.modoDificil.*
import letrasPack.letraPadre.*
import letrasPack.letraNegra.*
import letrasPack.letraRoja.*
import letrasPack.letraVerde.*
import letrasPack.letraAmarilla.*
    

object juego{
	var property estaEnMenu = true
	var property estaJugando = false
	var property perdio = false	
	var property dificultad = null
	const posicionesPosibles = [] 	
	const property listaLetras = []
	var posiciones = [[13,14,15,16],[25,26,27,28],[0,1,2,3],[30,31,32,33,34,35],[19,20,21,22],[7,8,9,10]]	
	const property musica = new Sonido(cancion = "musicaMenu2.mp3")


	//prueba	
	
	method iniciar(){		
			game.cellSize(15)
			game.width(40)
			game.height(40)	
  			game.title("bombardeo de letras")
			game.addVisual(menu)  	
			keyboard.num1().onPressDo({self.modoFacil()})
			keyboard.num2().onPressDo({self.modoDificil()})
			self.configuracion()
		
			

			game.start()			   		
	}

	method configuracion(){
		musica.reproducir(true)	
	}
	

	method modoFacil(){
		dificultad = new Facil(vel = 1500, cant = 5, image = "modoFacil2.png",musica =new Sonido( cancion ="musicaFacil.mp3"))
		dificultad.configuracion()			
	}
	
	method modoDificil(){
		dificultad = new Dificil(vel = 200, cant = 99 , image = "modoDificil2.png",musica = new Sonido(cancion ="musicaDificil.mp3"))		
		
		dificultad.configuracion()
	}

	method cambiarDificultad(unaDificultad){
		dificultad = unaDificultad
	}

	method reiniciar(){
		if(perdio){			
	  		game.removeVisual(gameOver)
			game.addVisual(menu)			
			puntos.removeVisual()
			puntos.resetearPuntuacion()
			controlPuntaje.resetarControlPuntaje()
			controlPuntaje.resetearLimiteMasLetras()
			controlPuntaje.resetearLimiteColores()
			gameOver.musica().parar()
			self.configuracion()
	
	 		estaEnMenu = true
			perdio = false			
		}       
    }

	method rendirse(){
		gameOver.configuracion()
	}	

	method agregarLetraSiEsPosible(unaCantidad,velocidad){	

		const letra = self.abc().anyOne()

		if(listaLetras.size() <= unaCantidad and not self.hayLetraRepetida(letra.letra())){
			letra.cambiarPosicion(self.algunaPosicion())
			letra.addVisual()
			letra.iniciarCaida(velocidad)			
			listaLetras.add(letra.letra())
			keyboard.letter(letra.letra()).onPressDo({letra.destruir()})
			dificultad.checkRotar(letra)	
		}
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
	
	method hayLetraRepetida(unaLetra){		
		return listaLetras.contains(unaLetra)
	}

	

	method abc(){
		const a = new Letras(image = "A0.png",letra = "A",puntaje = 1)
		const b = new Letras(image = "B0.png",letra = "B",puntaje = 3)
		const c = new Letras(image = "C0.png",letra = "C",puntaje = 1)
		const d = new Letras(image = "D0.png",letra = "D",puntaje = 1)
		const e = new Letras(image = "E0.png",letra = "E",puntaje = 1)
		const f = new Letras(image = "F0.png",letra = "F",puntaje = 1)
		const g = new Letras(image = "G0.png",letra = "G",puntaje = 2)
		const h = new Letras(image = "H0.png",letra = "H",puntaje = 2)
		const i = new Letras(image = "I0.png",letra = "I",puntaje = 2)
		const j = new Letras(image = "J0.png",letra = "J",puntaje = 2)
		const k = new Letras(image = "K0.png",letra = "K",puntaje = 2)
		const l = new Letras(image = "L0.png",letra = "L",puntaje = 2)
		const m = new Letras(image = "M0.png",letra = "M",puntaje = 2)
		const n = new Letras(image = "N0.png",letra = "N",puntaje = 2)
		const o = new Letras(image = "O0.png",letra = "O",puntaje = 3)
		const p = new Letras(image = "P0.png",letra = "P",puntaje = 3)
		const q = new Letras(image = "Q0.png",letra = "Q",puntaje = 3)
		const r = new Letras(image = "R0.png",letra = "R",puntaje = 1)
		const s = new Letras(image = "S0.png",letra = "S",puntaje = 1)
		const t = new Letras(image = "T0.png",letra = "T",puntaje = 1)
		const u = new Letras(image = "U0.png",letra = "U",puntaje = 2)
		const v = new Letras(image = "V0.png",letra = "V",puntaje = 2)
		const w = new Letras(image = "W0.png",letra = "W",puntaje = 3)
		const x = new Letras(image = "X0.png",letra = "X",puntaje = 3)
		const y = new Letras(image = "Y0.png",letra = "Y",puntaje = 3)
		const z = new Letras(image = "Z0.png",letra = "Z",puntaje = 3)		
		const letras =[a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z]
		return letras
	}

	
}

