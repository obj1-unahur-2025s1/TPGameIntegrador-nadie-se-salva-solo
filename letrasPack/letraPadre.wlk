import sonido.*
import vida.*

class LetraPadre{
    const property letra   
    const property puntaje    
    var esVisible = false
    var sonido = new Sonido(cancion="explosion2.mp3")    
    var property position = game.at(15, 15) 

    var property image = letra+"0.png"

     method aparecer(posicionX){
        esVisible = true          
        self.cambiarPosicion(posicionX)        
        self.doComportamiento()        
        
        self.addVisual()               
    }

    method cambiarPosicion(posicionX){
        position = game.at(posicionX, 36)
    }

    method doComportamiento(){
        esVisible = true
        game.onTick(100, "comportamiento"+letra, {self.comportamiento()})
        
    }    

    method comportamiento(){ //todas
        self.caer()
                    
        self.impactar()                       
    }

    method caer(){
        if(esVisible){
            position = position.down(1.1)
            console.println(position)
        }                    
    }

    method impactar(){ // para simple especiales vacio
        if(position.y() < 24){
            game.removeTickEvent("comportamiento"+letra)
            image = "impacto.png"
            sonido.reproducir(false)
            game.schedule(600, game.removeVisual(self))
                        
        }    
    }

     method addVisual(){
        game.addVisual(self)        
    }

           
     
}