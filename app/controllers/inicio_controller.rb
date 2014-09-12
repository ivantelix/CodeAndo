class InicioController < ApplicationController
  
  before_filter do |controlador|
    controlador.verifica_login :ruta => "/logueo", :existe_usuario => session[:usuario_id], :mensaje => "no has iniciado sesion aun mijo 'view inicio'"
  end

  def index
  	if session["usuario_id"]
  		@usuario = Usuario.find(session["usuario_id"])
  	end
  end
end