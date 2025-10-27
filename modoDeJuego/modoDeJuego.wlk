import sonido.*

class ModoDeJuego {


    // hacer que funcione como un objeto completo con imagen y musica 
    var velocidadCaida = 0
    var cantidadLetras = 0
    var velocidadAparacion = 0
    var musica = new Sonido( cancion= ".mp3")
    

    method image() = ".png"
    


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