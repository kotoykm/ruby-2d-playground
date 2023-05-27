##IMPORTS
#Master
require "ruby2d"
#Custom
#Archivo creado por nosotros EL USUARIO !!!!
require_relative "instances"

# require_relative "timer" #DESACTIVADO TEMPORALMENTE

set title: 'Kurosawa 2D', background: 'maroon', width: 1200, height: 900

#DEFINIDORES
script = open('.\assets\script').readlines
ancho_texto = 275
texto_poc = 70

#El texto
guion =  script.map do |g|
                g.chomp.split("#")
          end

def generador_textual(arrayInput_input, arrIndex, poc_x,poc_y)

  textoStripe = arrayInput_input[arrIndex][1]
  tamano_texto = 18
  interlineado = tamano_texto * 1.5
  lineas = textoStripe.scan(/.{1,28}(?:\s|\z)/)

  lineas.each_with_index do |lineasCrop, indiceCrop| #Each with index devuelve ambos el valor y el indice de un array.
    puts "#{lineasCrop},#{indiceCrop}"
    Text.new(
    lineasCrop,
    x: poc_x, y: (poc_y + (indiceCrop+1) * interlineado),
    style: 'regular',
    size: tamano_texto,
    color: 'white'
  )
  end
end

#Ponedor de columnas.
for limiter in (0..(guion.length-1))
  columnas = texto_poc + (ancho_texto * limiter)

  generador_textual(guion, limiter, columnas, 350)
  puts ""
end

show()