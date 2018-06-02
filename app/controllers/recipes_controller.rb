class RecipesController < ApplicationController
  before_action :current_user_must_be_recipe_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_recipe_user
    recipe = Recipe.find(params[:id])

    unless current_user == recipe.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @recipes = Recipe.all

    render("recipes/index.html.erb")
  end

  def show
    @ingredient = Ingredient.new
    @step = Step.new
    @recipe = Recipe.find(params[:id])

    render("recipes/show.html.erb")
  end

  def new
    @recipe = Recipe.new

    render("recipes/new.html.erb")
  end

  def create
    @recipe = Recipe.new

    @recipe.title = params[:title]
    @recipe.ingredients = params[:ingredients]
    @recipe.directions = params[:directions]
    @recipe.original_source = params[:original_source]
    @recipe.cuisine = params[:cuisine]
    @recipe.type_of_dish = params[:type_of_dish]
    @recipe.photo = params[:photo]
    @recipe.review = params[:review]
    @recipe.suggestions = params[:suggestions]
    @recipe.user_id = params[:user_id]
    @recipe.parent_id = params[:parent_id]

    save_status = @recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recipes/new", "/create_recipe"
        redirect_to("/recipes")
      else
        redirect_back(:fallback_location => "/", :notice => "Recipe created successfully.")
      end
    else
      render("recipes/new.html.erb")
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])

    render("recipes/edit.html.erb")
  end

  def update
    @recipe = Recipe.find(params[:id])

    @recipe.title = params[:title]
    @recipe.ingredients = params[:ingredients]
    @recipe.directions = params[:directions]
    @recipe.original_source = params[:original_source]
    @recipe.cuisine = params[:cuisine]
    @recipe.type_of_dish = params[:type_of_dish]
    @recipe.photo = params[:photo]
    @recipe.review = params[:review]
    @recipe.suggestions = params[:suggestions]
    @recipe.user_id = params[:user_id]
    @recipe.parent_id = params[:parent_id]

    save_status = @recipe.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/recipes/#{@recipe.id}/edit", "/update_recipe"
        redirect_to("/recipes/#{@recipe.id}", :notice => "Recipe updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Recipe updated successfully.")
      end
    else
      render("recipes/edit.html.erb")
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])

    @recipe.destroy

    if URI(request.referer).path == "/recipes/#{@recipe.id}"
      redirect_to("/", :notice => "Recipe deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Recipe deleted.")
    end
  end
end
