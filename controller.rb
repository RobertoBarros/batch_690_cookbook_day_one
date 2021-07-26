require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    # 1. Recuperar todas as receitas do cookbook
    recipes = @cookbook.all
    # 2. Mandar as receitas para a view exibir
    @view.display(recipes)
  end

  def create
    # 1. Pegar o nome da receita
    name = @view.ask_name
    # 2. Pegar a descrição da receita
    description = @view.ask_description

    # 3. Instanciar uma nova receita
    new_recipe = Recipe.new(name, description)

    # 4. Adicionar a receita ao cookbook
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    # 1. Mostrar todas as receitas
    list
    # 2. Pegar qual o índice da receita a ser excluída
    index = @view.ask_index

    # 3. Passar para o cookbook excluir a receita
    @cookbook.remove_recipe(index)
  end
end