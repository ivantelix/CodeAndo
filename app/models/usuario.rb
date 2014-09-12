class Usuario < ActiveRecord::Base
  #Relaciones de las bases de datos
  has_one :persona
  belongs_to :persona

  #REGEX 
  regex_email = /^[_a-z0-9-]+(\.[_a-z0-9-]+)*@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$/  
 
 
  attr_accessible :email, :password, :password_confirmation, :usuario, :persona_id 


  validates :usuario, :uniqueness => true,:presence => {:message => "no puede estar en blanco"}, :length => {:in => 5..20, :message => "debe copntener entre 5 y 20 caracteres"}

  validates :email, :uniqueness => true, :presence => { :case_sensitive => false, :message => "es incorrecto"}, :format => { :with => regex_email, :message => "El correo debe seguir el formate 'user@mail.com'" }

  validates :password, :presence => {:message => "no puede estar en blanco"}, :confirmation => {:message => " no coincide"}
  
  before_save :encriptar_password

  def encriptar_password
    if password.present?
      self.llave = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, self.llave)
    end
  end

  def self.autenticar(_usuario, _password)
    user = Usuario.where("usuario = ?", _usuario).first 
    if user && user.password == BCrypt::Engine.hash_secret(_password, user.llave)
      user
    else
      nil
    end
  end

  

end

