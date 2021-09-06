class Producto
	attr_accessor :nombre, :cantidad_inventario, :peso, :volumen

	def initialize(id, nombre, cantidad_inventario,codigo)
		@id = id
		@nombre = nombre
		@cantidad_inventario = cantidad_inventario
		@codigo = codigo
	end
	def self.fake_data
		data = []
		data.push(Faker::IDNumber.unique.south_african_id_number)
		data.push(Faker::Beer.brand) 
		data.push(rand(1000..50000))
		data.push(Faker::Barcode.ean)
		data
	end
end  