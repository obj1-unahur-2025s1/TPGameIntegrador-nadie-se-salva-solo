class Sonido{
    const cancion
    const property sonido = game.sound(cancion)
    

    method reproducir(loop){
        /*
            reproduce sonido. Si loop es true la musica suena en loop y si es falso solo se reproduce una vez
        */        
            sonido.play()
            sonido.shouldLoop(loop)        
    }

    method parar(){
        /*
            para el sonido
        */
        sonido.stop() 
        
    }
    method cambiarVolumen(unNumero){
        /*
            para manejar el sonido con el que se reproduce el sonido
        */
        sonido.volume(unNumero)
    } 
}