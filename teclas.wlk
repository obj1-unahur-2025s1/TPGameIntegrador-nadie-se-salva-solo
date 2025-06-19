import wollok.game.*



object teclaE {
    var property position = game.origin()

     method position() = game.center()

     method image() = "teclaE.png"

     method caer(){
        position = game.at(3, position.y()-1)
     }

    method movete() {
       // const x = 0.randomUpTo(game.width()).truncate(0)
      //  const y = 0.randomUpTo(game.height()).truncate(0)
        // otra forma de generar números aleatorios
        const x = (0.. game.width()-1).anyOne()
        const y = (0.. game.height()-1).anyOne()
        position = game.at(x,y)
    }
        


    
}