class Vida{
  const corazon
  var x
  var property image = "Co1.png"
  var property position = game.at(x, 0)


  method vidaPerdida(){
    image = "Co2.png"
  }

  method reinicio(){
    image = "Co1.png"
  } 
}

object barraDeVida{
    const barra = [new Vida(corazon = 1, x =0),new Vida(corazon = 2, x =5),new Vida(corazon = 3, x =10)]
    method addVisual(){
     barra.forEach({v => game.addVisual(v)})
  }
  method removeVisual(){
    //barra.forEach({v => game.removeVisual(v)})
           barra.forEach({v => v.vidaPerdida()})

  }
}