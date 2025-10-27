import wollok.vm.*
import modoDeJuego.*
import sonido.*

class ModoFacil inherits ModoDeJuego{

    override
    method configurar(){
        velocidadCaida = 1500
        cantidadLetras = 5
        velocidadAparacion = 1500
        musica = new Sonido(cancion = "musicaFacil.mp3")
        super() 
    }

    override
    method image() = "modoFacil2.png"    
    
    override
    method aumentarCantidadLetras(){
        cantidadLetras = cantidadLetras + 1;
    }

    override   
    method aumentarVelocidadCaida(){
        velocidadCaida = (velocidadCaida - 200).max(0)
    }
    
    override
    method aumentarVelocidadAparacion(){
        velocidadAparacion = (velocidadAparacion - 200).max(0)
    }

}