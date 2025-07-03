class Sonido{
    const cancion
    const property sonido = game.sound(cancion)
    var sonando = false

    method reproducir(){
        if (!sonando){
            sonido.play()
        }
    }

    method parar(){
        sonido.stop()
        sonando = false
    } 
}