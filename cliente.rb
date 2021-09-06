class Cliente

    #Metodos acesores
    attr_accessor :nombre, :apellido, :email, :telefono
    attr_reader :id
    
    #Constructor
    def initialize(id, nombre, apellido, email, telefono)
      @id = id
      @nombre = nombre
      @apellido = apellido
      @email = email
      @telefono = telefono
    end

    def self.fake_data
      data = []
      id = Faker::IDNumber.unique.south_african_id_number
      nombre = Faker::Name.unique.first_name 
      apellido = Faker::Name.unique.last_name
      email = Faker::Internet.email
      telefono = Faker::PhoneNumber.cell_phone_in_e164
      data.push(id)
      data.push(nombre)
      data.push(email)
      data.push(telefono)
      data
    end
  end