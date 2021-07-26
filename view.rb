require 'colored'

class View
  def ask_name
    puts 'Enter recipe name:'.green
    gets.chomp
  end

  def ask_description
    puts 'Enter recipe description'.green
    gets.chomp
  end

  def ask_index
    puts 'Enter index of recipe to destroy:'
    gets.chomp.to_i - 1
  end

  def display(recipes)
    puts '-' * 80
    puts ' RECIPES LIST'.red_on_blue
    puts '-' * 80

    recipes.each_with_index do |recipe, index|
      index = (index + 1).to_s.bold.white
      name = recipe.name.green
      description = recipe.description.cyan
      puts "  #{index} - #{name}: #{description}"
    end

    puts '-' * 80
  end
end