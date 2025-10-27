class Sonido{
    const cancion
    const property sonido = game.sound(cancion)
    

    method reproducir(loop){        
            sonido.play()
            sonido.shouldLoop(loop)        
    }

    method parar(){
        sonido.stop() 
        
    }
    method cambiarVolumen(unNumero){
        sonido.volume(unNumero)
    } 
}