
import modoDeJuego.*
import sonido.*

class ModoDificil inherits ModoDeJuego {   

    override
    method configurar(){       
        velocidadCaida = 1200
        cantidadLetras = 8
        velocidadAparacion = 1200
        musica = new Sonido(cancion = "musicaDificil.mp3")
        super()               
    }
    override
    method image() = "modoDificil2.png"  
    
    override
    method aumentarCantidadLetras(){
        cantidadLetras = cantidadLetras + 2;
    }

    override   
    method aumentarVelocidadCaida(){
        velocidadCaida = (velocidadCaida - 100).max(0)
    }
    
    override
    method aumentarVelocidadAparacion(){
        velocidadAparacion = (velocidadAparacion - 100).max(0)
    }
    
}