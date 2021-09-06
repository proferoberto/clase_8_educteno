require 'faker'
require_relative 'cliente'
require_relative 'gestor_cliente'
require_relative 'helper_file'
require_relative 'producto'
# Main
# Interfaces

clientes = GestorCliente.new
productos = GestorProducto.new
loop do
  ui_menu_principal(clientes, productos)  
end

def ui_menu_principal(clientes, productos)
  puts "Opciones elige un numero"
  puts "0) Cargar base de datos"
  puts "1)clientes"
  puts "2)productos"
  puts "3) salir"
  puts "Cual es la opcion"
  opt = gets.chomp
  case opt
  when "0"
    puts "Vas empezar a cargar datos en unos instantes"
    50.times do
      HelperFile.cargar_datos("clientes.csv", Cliente.fake_data)
      HelperFile.cargar_datos("productos.csv", Producto.fake_data)
    end
    puts "Los datos se terminaron de generar"
  when "1"
    puts "Entrando al menu de clientes"
    ui_clientes(clientes)
  when "2"
    ui_productos(productos)
  when "3"
    break
  end
end

def ui_clientes(clientes)
  puts "1) Listar"
  puts "2) Crear"
  puts "3) Actualizar"
  puts "4) Eliminar"
  puts "5) Importar base de datos"
  puts "6) Salir"
  puts "7) atras"
  opt = gets.chomp.to_i
  case opt
  when 1
    puts "ID - Nombre - Apellido - email - Telefono"
    clientes.listar.each{|cliente| puts "#{cliente.id} #{cliente.nombre} #{cliente.apellido} #{cliente.email} #{cliente.telefono}"}
  when 2
    loop do
      puts "Ingrese los datos en el siguiente formato  id,nombre,apellido,email,telefono"
      data = gets.chomp.split(",")
      cliente = clientes.crear(data[0], data[1], data[2], data[3], data[4].to_i)
      puts "El cliente #{cliente.nombre} ha sido agregado correctamente"
      puts "Desea continuar s/n"
      opt = gets.chomp
      break if opt.eql?"n"
    end
  when 3
    puts "Ingrese los datos en el siguiente formato id, nombre,apellido,email,telefono"
    puts "Si algun campo no sea actualizar coloque *"
    entrada = gets.chomp
    data = entrada.split(",")
    data.map!{|item| item == '*'? nil:item}
    cliente = clientes.actualizar(data[0], data[1], data[2], data[3], data[4])
  when 4
    puts "Ingrese el id de la persona a eliminar"
    data = gets.chomp
    cliente = clientes.eliminar(data)
    unless cliente.nil?
      puts "El cliente #{cliente.nombre} ha si do eliminado."
    else
      puts "El id no se encontro por lo tanto no se puedo eliminar un cliente."
    end
  when 5
    puts "Cual es el nombre del archivo"
    nombre_archivo = gets.chomp
    clientes.cargar_datos(nombre_archivo)
    puts "La data se cargo correctamente a tu programa"
  when 6
    break
  end
end

def ui_productos(productos)
  puts "1) Listar"
  puts "2) Crear"
  puts "3) Actualizar"
  puts "4) Eliminar"
  puts "5) Importar base de datos"
  puts "6) Salir"
  puts "7) atras"
  opt = gets.chomp.to_i
  case opt
end