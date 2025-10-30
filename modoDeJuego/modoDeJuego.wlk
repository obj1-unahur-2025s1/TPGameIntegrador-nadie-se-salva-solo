import sonido.*

class ModoDeJuego {
    
     
    var velocidadCaida = 0
    var cantidadLetras = 0
    var velocidadAparacion = 0
    var musica = new Sonido( cancion= ".mp3")
    

    method image() = ".png"

    

  /*  
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

    */

    method configurar(){
        
        self.playMusica()
        game.addVisual(self) 
    }
    
    method playMusica(){
        musica.reproducir(true)
        musica.cambiarVolumen(0.2)
    }

    method aumentarDificultad(){
       const metodos = [{self.aumentarCantidadLetras()}, {self.aumentarVelocidadAparacion()}, {self.aumentarVelocidadCaida()}]

        metodos.anyOne().apply()

        console.println("a" + velocidadCaida + "a"  + cantidadLetras + "a"  + velocidadAparacion)
    }

    method aumentarCantidadLetras()
    method aumentarVelocidadCaida()
    method aumentarVelocidadAparacion()
    
    
    method salir(){
        game.removeVisual(self)
        musica.parar()        
    }

    

      

}