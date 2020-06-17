import wollok.game.*
import configuracion.*
import buffs.*
import logica.timer.*
import suplementarios.list.*
import logica.buffTracker.*
import logica.detector.*

object personaje {
	
	//Atributos
	
	var property position = game.at(2,0)
	
	var property tipoDeAuto = autoComun
	
	//Atributos
	
	//Metodos
	
	
	method image() {
		return tipoDeAuto.image()
	}
	
	method iniciar(){
		position = game.at(2,0)
		game.addVisual(self)
	}
	
	method moverHacia(x){
		position = game.at((position.x() + x).max(0).min(configuracion.trackWidth() - 1) , position.y())
	}
	
	method chocar(otro){
		tipoDeAuto.chocar()
	}
	//Metodos
}

object autoComun {
	const property image = "auto_rojo2.png"
	
	method chocar() {
		detector.cambiarEstado()
	}
}

object autoConEscudo {
	const property image = "autoRojoConEscudo.png"
	
	method chocar() {
		buffTracker.removeBuff(buffEscudo)
	}
}