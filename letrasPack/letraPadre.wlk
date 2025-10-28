import sonido.*
import vida.*

class LetraPadre{

    const property letra   
    const property puntaje
     
    var esVisible = false
    var property image = ""      
    var property position = game.at(15, 15)
    

    method doComportamiento(posicionX){             
        self.aparecer(posicionX)        
        self.doCaer()
        image = letra+ ".png"
        console.println(letra+".png")                          
    }

    method aparecer(posicionX){
        position = game.at(posicionX, 36)
        game.addVisual(self) 
    }

    method doCaer(){
        esVisible = true
        game.onTick(100, "caer"+letra, {self.caer()})        
    }   

    method caer(){
        if(esVisible){
            position = position.down(1)            
        }
        self.impactar()
                                       
    }

    method impactar(){  
        if(position.y() < 7){
            game.removeVisual(self)                                               
        }    
    }

    method doExplosion()

    method explotar(unaImagen,unSonido){
        image = unaImagen
        game.removeTickEvent("caer"+letra)
        game.removeTickEvent("rotar"+letra)        
        self.reproducirSonido(unSonido)        
        game.schedule(500, {game.removeVisual(self)})
    }    
  
    method reproducirSonido(unSonido){        
        unSonido.reproducir(false)
        unSonido.cambiarVolumen(0.5)
        game.schedule(1500, {unSonido.parar()})
    }

           
     
}