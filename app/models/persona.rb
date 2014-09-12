class Persona < ActiveRecord::Base
  #Relaciones de las bases de datos
  belongs_to :usuario
  has_one :usuario

  #REGEX
  regex_entero = /^(?:\+|-)?\d+$/


  attr_accessible :apellidos, :cedula, :fecha_nacimiento, :nombres, :sexo, :usuario_id


  validates :nombres, :presence => {:message => " no puede estar en blanco"}
  validates :apellidos, :presence => {:message => " no puede estar en blanco"}
  validates :cedula, :presence => {:message => " no puede estar en blanco"}, :format => { :with => regex_entero, :message => " incorrecta solo puede contener numero entero"}, :length => {:is => 8, :message => "debe  contener 8 caracteres"}
  validates :fecha_nacimiento, :presence => {:message => " no puede estar en blanco"}
  validates :sexo, :presence => {:message => " No puede quedar en blanco"}


  before_save :convertir_minuscula

  def convertir_minuscula
    self.nombres = self.nombres.downcase
    self.apellidos = self.apellidos.downcase
    self.sexo = self.sexo.downcase
  end

  def verificar_entero
    unless regex_entero.match(cedula)
      nil 
    end
  end
end
