#Generador de texto principal, solo puede generar parrafos de 28 lineas.
def generador_parrafos(arrayInput_input, arrIndex, poc_x,poc_y)

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
  

#A partir de ahora, los parametros de esta funcion serán descriptivos-
#Del archivo al que hacen referencia

#Ha sido creada la función de generador de texto para Titulos
def generador_texto(input, index, poc_x = 0, poc_y = 0)

texto_load = input[index].join('')
titulador = texto_load.capitalize
tamano_texto = 60

Text.new(
    titulador,
    x: poc_x, y: poc_y,
    style: 'bold',
    size: tamano_texto,
    color: 'white'
)

end