def menu
  puts `clear`
  puts "*** HappiTails Animal Shelter ***\n\n"
  puts '1 : List Animals'
  puts '2 : List Clients'
  puts '3 : Create Animal'
  puts '4 : Create Client'
  puts '5 : Adopt Animal'
  puts '6 : Return Animal'
  puts "Q : Quit\n\n"
  print '--> '.color('#ff3300')
  gets.chomp
end

def create_animal
  print "Name: "
  name = gets.chomp
  print "Age: "
  age = gets.to_i
  print "Gender: "
  gender = gets.chomp
  print "Species: "
  species = gets.chomp
  print "Toys: "
  toys = gets.chomp.split
  $shelter.animals[name] = Animal.new(name, age, gender, species)
  $shelter.animals[name].toys = toys
end

def create_client
  print "Name: "
  name = gets.chomp
  print "Age: "
  age = gets.to_i
  print "Gender: "
  gender = gets.chomp
  print "Kids: "
  kids = gets.to_i
  $shelter.clients[name] = Person.new(name, age, gender, kids)
end

def adopt_animal
  puts $shelter.display_animals
  print "\nWhich animail do you want to adopt? "
  animal = gets.chomp
  puts "\n#{$shelter.display_clients}"
  print "\nWhat is your name? "
  client = gets.chomp
  $shelter.clients[client].pets[animal] = $shelter.animals[animal]
  $shelter.animals.delete(animal)
end

def return_animal
  puts $shelter.display_clients
  print "\nWhat is your name? "
  client = gets.chomp
  puts "\n#{$shelter.clients[client].display_pets}"
  print "\nWhich animal do you want to return? "
  animal = gets.chomp
  $shelter.animals[animal] = $shelter.clients[client].pets[animal]
  $shelter.clients[client].pets.delete(animal)
end
