class Numero{
    var x 
    var property position = game.at(x, 0)
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
                            // primer cero, unidad                            segundo cero, decimal 
    const puntuacion = [new Numero(x=36,numero = 0),new Numero(x=34,numero = 0),new Numero(x=32,numero = 0),new Numero(x=30,numero = 0),new Numero(x=28,numero = 0)]
    var puntos = 0
    method addVisual(){
     puntuacion.forEach({v => game.addVisual(v)})
    }
    method removeVisual(){
    puntuacion.forEach({v => game.removeVisual(v)})
    }

    method reubicar(){
        puntuacion.get(0).reubicar(17,24)
        puntuacion.get(1).reubicar(19,24)
        puntuacion.get(2).reubicar(21,24)
        puntuacion.get(3).reubicar(23,24)
        puntuacion.get(4).reubicar(25,24)
    }

    method sumarPuntaje(unNumero){
        puntos = puntos + unNumero
        var unidad = puntos % 10
        puntuacion.get(0).cambiarNumero(unidad)
        self.sumarDecimal()
        self.sumarCentena()
        self.sumarUnidadMil()
        self.sumarDecenaMil()    
        
        console.println(puntos)       
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

