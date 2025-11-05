class Sonido{
    var cancion
    const property sonido = game.sound(cancion)
    var estado = false
    

    method reproducir(loop){
        /*
            reproduce sonido. Si loop es true la musica suena en loop y si es falso solo se reproduce una vez
        */  
            if(!estado){
                sonido.play()
                sonido.shouldLoop(loop)
                estado = true 
            }
                   
                               
    }

    

    method parar(){
        /*
            para el sonido
        */
            if(estado){
                sonido.stop()
                estado = false
            }
            
        
         
        
    }
    method cambiarVolumen(unNumero){
        /*
            para manejar el sonido con el que se reproduce el sonido
        */
        sonido.volume(unNumero)
    } 
}

