require 'pry'
require 'rainbow'
require_relative 'data'
require_relative 'functions'

response = menu
while response != 'Q'
  case response
  when '1' then puts $shelter.display_animals; gets
  when '2' then puts $shelter.display_clients; gets
  when '3' then create_animal
  when '4' then create_client
  when '5' then adopt_animal
  when '6' then return_animal
  end

  response = menu
end
