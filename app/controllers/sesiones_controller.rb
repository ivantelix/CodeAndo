class SesionesController < ApplicationController
    
    before_filter :only => [:new, :create] do |controlador|
        #Si existe el usuario lo compruebo
        if session[:usuario_id]  
          redirect_to "/inicio", :mensaje => "bienvenido has iniciado sesion con exito 'view sesiones'"
        end
    end
    
    def new
    end

    def create
        usuario = Usuario.autenticar(params[:usuario], params[:password])
        if usuario
      		session[:usuario_id] = usuario.id
      		redirect_to inicio_index_path, :notice => "Enhorabuena has iniciado sesion con EXITO..!!"
      	else
      		flash.now.alert = "Usuario o Password Invalido"
      		render 'new'
      	end
    end

    def destroy
        if session[:usuario_id]
            session[:usuario_id] = nil
            redirect_to "/logueo", :notice => "Has salido correctamente Vuelve Pronto..!!"
        else
            redirect_to "/logueo", :notice => "No has iniciado una sesion aun"
        end
    end
end
