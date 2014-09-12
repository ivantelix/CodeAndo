class UsuariosController < ApplicationController
  
  before_filter do |controlador|
      if session[:usuario_id]
        redirect_to "/inicio", :mensaje => "no haz iniciado sesion 'view usuario'"
      
      end
  end

  def new
    @usuario = Usuario.new
  end

  def create
    @usuario = Usuario.new(params[:usuario])
    if @usuario.save
      redirect_to '/inicio'
    else
      render 'new'
    end
  end

end
