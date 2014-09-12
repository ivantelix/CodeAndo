class ApplicationController < ActionController::Base
  protect_from_forgery

	def verifica_login(parametros = {})
		unless session[:usuario_id]
    		redirect_to parametros[:ruta], :notice => parametros[:mensaje]
    	else
    		redirect_to parametros[:ruta], :notice => parametros[:mensaje]
    	end
    end
end

