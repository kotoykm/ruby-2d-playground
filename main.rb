require "ruby2d"
require_relative "instances"#Archivo creado por nosotros EL USUARIO !!!!
require_relative "text-generators"
require_relative "my-timer"
require_relative "myapi"

set title: 'Kurosawa 2D', background: 'maroon', width: 1200, height: 900

#-------FUNCIONES---------------

#DEFINIDORES
script = open('.\assets\script').readlines
titles = open('.\assets\titles').readlines
ancho_texto = 275
texto_poc = 70


guion = script.map do |g|
            g.chomp.split("#")
        end

titulos = titles.map do |d|
            d.chomp.split("#")
          end


#-----------------------------------------

#El texto

#Ponedor de columnas.
for limiter in (0..(guion.length-1))
  columnas = texto_poc + (ancho_texto * limiter)

  generador_parrafos(guion, limiter, columnas, 350)
  puts ""
end

#####THE API UPDATE

generador_texto(titulos, 1, 600, 160)

# apinasa = Api.new("https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1&api_key=tBzJ96m7oLRbNXDguPW8LDW2B9hxASiSdSINUAlG")
# apipoke = Api.new("https://pokeapi.co/api/v2/pokemon/ditto")
apiMovie = Api.new("https://www.omdbapi.com/?i=tt18925334&apikey=d089b4eb")
pearl = apiMovie.result()

puts pearl["Title"]
puts pearl["Year"]
puts pearl["Genre"]
puts pearl["Director"]
puts pearl["Actors"]
puts pearl["Plot"]

show()