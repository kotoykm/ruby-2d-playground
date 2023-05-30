require "ruby2d"
require "uri"
require "net/http"
require "json"
require_relative "instances"#Archivo creado por nosotros EL USUARIO !!!!
require_relative "text-generators"


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

#----------------------------------------

url = URI("https://pokeapi.co/api/v2/pokemon/shinx")
https = Net::HTTP.new(url.host, url.port)


https.use_ssl = true

request = Net::HTTP::Get.new(url) 
response = https.request(request)
data = JSON.parse(response.read_body)

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

show()