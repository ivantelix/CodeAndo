class PersonasController < ApplicationController
 
  before_filter do |controlador|
      controlador.verifica_login :ruta =>"/logueo",:existe_usuario => session[:usuario_id], :mensaje => " no puedes xq no has iniciado sesion 'view personas'"
  end
  
  def new
  	@persona = Persona.new
  end

  def create
  	@persona = Persona.new(params[:persona])
  	if @persona.save
      
      temp = Usuario.find(@persona.usuario_id)
      temp.persona_id = @persona
      temp.save

  		redirect_to inicio_path, :notice => "Los Cambios han sido Guardados con Exito"
  	else
  		render 'new'
  	end
  end
end
