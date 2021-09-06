
class HelperFile
  def self.leer(filename)
    data = []
    lineas = File.readlines(filename)
    lineas.each do |line|
      columnas = line.split(',')
      data.push(columnas)
    end
    data
  end
  
  def self.cargar_datos(filename, structure)
    File.open(filename, "a") do |file|
      format = structure.join(",") + "\n"
      file.write(format)
    end
  end
end