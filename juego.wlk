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


	

	method dicABC(){
		/*
			Pruebas diccionario con letras
		*/
		const dic = new Dictionary()

		const LetraA = new LetraSimple(letra = "A",puntaje = 2)
		const LetraB = new LetraSimple(letra = "B",puntaje = 2)

		dic.put("A", LetraA)
		dic.put("B", LetraB)
		
	}

	const abece = #{"A","B","C","D"}

	method explosionSiErrorSino(unaLetra){
		/*
			Prueba metodo explosion cuando hay letra en pantalla (conjunto abece) 
			o sonido de error cuando no estan en pantalla
		*/

		if(abece.contains(unaLetra)){

			self.explo()
			abece.remove("A")
			console.println("si")

		}else{
			
			console.println("no")
			self.error()

		}

	}
	

	method explo(){
		/*
			metodo que reproduce sonido de explosion
		*/
		const explo = new Sonido(cancion="explosion2.mp3")
		explo.reproducir(false)
	}

	method error(){
		/*
			metodo que reproduce sonido de explosion
		*/
		const explo = new Sonido(cancion="error.mp3")
		explo.reproducir(false)
		explo.cambiarVolumen(0.2)
	}

	method asiEh(){
		/*
			Metodo de prueba para implementar metodo explosionSiErrorSino() y setearlo a letras
			del teclado
		*/

		keyboard.a().onPressDo({self.explosionSiErrorSino("A")})
		keyboard.b().onPressDo({self.explosionSiErrorSino("B")})
		keyboard.c().onPressDo({self.explosionSiErrorSino("C")})
		keyboard.d().onPressDo({self.explosionSiErrorSino("D")})

		

		keyboard.p().onPressDo({self.explosionSiErrorSino("P")})		
		keyboard.o().onPressDo({self.explosionSiErrorSino("O")})
		keyboard.l().onPressDo({self.explosionSiErrorSino("L")})
		keyboard.k().onPressDo({self.explosionSiErrorSino("K")})
		
	}

	/////////////////////////
	method iniciar(){
			/*
				configura y ejecuta el juego
			*/		
			game.cellSize(15)
			game.width(40)
			game.height(40)	
  			game.title("bombardeo de letras")
			game.addVisual(menu)  	
			keyboard.num1().onPressDo({self.modoFacil()})
			keyboard.num2().onPressDo({self.modoDificil()})
			self.configuracion()
		
			self.asiEh()

			keyboard.f().onPressDo({abece.add("A")})

			game.start()			   		
	}

	method configuracion(){
		musica.reproducir(true)	
	}
	

	method modoFacil(){
		/*instancia un objeto modo facil, lo muestra en pantalla y lo ejecuta*/
		dificultad = new Facil(vel = 1500, cant = 5, image = "modoFacil2.png",musica =new Sonido( cancion ="musicaFacil.mp3"))
		dificultad.configuracion()			
	}
	
	method modoDificil(){
		/*instancia un objeto modo dificil, lo muestra en pantalla y lo ejecuta*/
		dificultad = new Dificil(vel = 200, cant = 99 , image = "modoDificil2.png",musica = new Sonido(cancion ="musicaDificil.mp3"))		
		
		dificultad.configuracion()
	}

	method cambiarDificultad(unaDificultad){
		/*
			Cambia la dificultad actual por unaDificultad
		*/
		dificultad = unaDificultad
	}

	method reiniciar(){
		/*
			remueve la escena de gameOver y muestra la del menu. Resetea muchas cosas
			anda a saber que son
		*/
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
		/*
			Cambia la escena de juego en progreso por la de gameOver
		*/
		gameOver.configuracion()
	}	

	method agregarLetraSiEsPosible(unaCantidad,velocidad){
		/*
			El metodo que se encarga de poner letras en pantalla y hacer que 
			hagan su comportamiento
		*/	

		const letra = self.abc().anyOne()

		if(listaLetras.size() <= unaCantidad and not self.hayLetraRepetida(letra.letra())){ //las muestra en pantalla
		// si no esta en pantalla y si la cantidad en pantalla no supera a la posible

			letra.cambiarPosicion(self.algunaPosicion()) 
			letra.addVisual()
			letra.iniciarCaida(velocidad)	

			listaLetras.add(letra.letra())
			keyboard.letter(letra.letra()).onPressDo({letra.destruir()})
			dificultad.checkRotar(letra)	

		}
	}

	method algunaPosicion(){		

		/*
			agrega la primera lista de la lista posiciones a posicionesPosibles
			elimina la primer lista de la lista posiciones
			devuelve una posicion de la ultima lista de posiciones de la lista posicionesPosibles
		*/

		self.reiniciarPosiciones()		
		posicionesPosibles.add(posiciones.first())
		posiciones.remove(posiciones.first())
		return posicionesPosibles.last().anyOne()
	}

	method reiniciarPosiciones(){
		/*
			cuando la lista posiciones queda vacia, la reinicia y vacia la lista posicionesPosibles
		*/

		if(posiciones.isEmpty()){
		  posiciones = [[13,14,15,16],[25,26,27,28],[0,1,2,3],[30,31,32,33,34,35],[19,20,21,22],[7,8,9,10]]
		  posicionesPosibles.clear()
		}
	}
	
	method hayLetraRepetida(unaLetra){		
		/*
			Indica si la letra unaLetra existe en la lista listaLetras
		*/
		return listaLetras.contains(unaLetra)
	}

	

	method abc(){
		/*
			Instancia todas las letras del abecedario, las mete en una lsita y devuelve la lsita
		*/
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

