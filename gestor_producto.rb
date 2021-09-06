class GestorProducto
    attr_accessor :productos
	def initialize
		@productos = []
	end

	# config=:page, page=1, total_per_page=10
	def listar(config=:all, page=nil, total_per_page=nil)
		if config == :all
			productos = @productos
		else
			final = total_per_page * page
			inicio = final - total_per_page 
			productos @productos[inicio..final]
		end
		productos
	end
end