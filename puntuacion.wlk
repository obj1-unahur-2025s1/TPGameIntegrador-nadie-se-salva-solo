class Numero{
     
    var property position = game.at(0, 0)
    var numero = 0
    var image = "0.png"

    method cambiarNumero(unNumero){
        numero = unNumero
    }

    

    method image() = ""+ numero + ".png"


    method reubicar(posX,posY){
        position = game.at(posX,posY)
    }
    
}

object puntos{      
    const puntuacion = [new Numero(),new Numero(),new Numero(),new Numero(),new Numero()]
    var puntos = 0
    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
    }
    method removeVisual(){
    puntuacion.forEach({v => game.removeVisual(v)})
    }
    method resetearPuntuacion(){
        puntos = 0
        puntuacion.get(0).cambiarNumero(0)
        puntuacion.get(1).cambiarNumero(0)
        puntuacion.get(2).cambiarNumero(0)
        puntuacion.get(3).cambiarNumero(0)
        puntuacion.get(4).cambiarNumero(0)
    }

    method ubicar(){
        puntuacion.get(0).reubicar(36,0)
        puntuacion.get(1).reubicar(34,0)
        puntuacion.get(2).reubicar(32,0)
        puntuacion.get(3).reubicar(30,0)
        puntuacion.get(4).reubicar(28,0)
    }

    method reubicar(){
        self.addVisual()
        puntuacion.get(0).reubicar(25,24)
        puntuacion.get(1).reubicar(23,24)
        puntuacion.get(2).reubicar(21,24)
        puntuacion.get(3).reubicar(19,24)
        puntuacion.get(4).reubicar(17,24)
    }

    method sumarPuntaje(unNumero){
        puntos = puntos + unNumero
        var unidad = puntos % 10
        puntuacion.get(0).cambiarNumero(unidad)
        self.sumarDecimal()
        self.sumarCentena()
        self.sumarUnidadMil()
        self.sumarDecenaMil()             
    }
    method sumarDecimal(){
        var decimal = ((puntos/10).truncate(0))%10
        puntuacion.get(1).cambiarNumero(decimal)       
    }

    method sumarCentena(){
        var centena = ((puntos/100).truncate(0)%10)
        puntuacion.get(2).cambiarNumero(centena)        
    }

    method sumarUnidadMil(){
        var unidadMil = ((puntos/1000).truncate(0)%10)
        puntuacion.get(3).cambiarNumero(unidadMil)    
    }

    method sumarDecenaMil(){
        var decenaMil =((puntos/10000).truncate(0)%10)
        puntuacion.get(4).cambiarNumero(decenaMil)
    }
}

