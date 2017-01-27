class RecipesController < ApplicationController
  require 'json'

  def index
    @recipes = Recipe.all
    # @recipe = Recipe.find(params[:id])
    @user = User.find(current_user.id)
    @saved = @user.recipes
  end

  def ingredient_form
    # display form for searching yummly_api
  end

  def yummly_api
    @message = "Yummly API"
    @ingredient = params[:ingredient_of_the_day]
    puts "current_user", current_user.inspect
     if current_user != nil
      @user = User.find(current_user.id)
      @excluded_response = @current_user.allergies

      # @response = HTTParty.get("http://api.yummly.com/v1/api/recipes?_app_id=ENV['YUMMLY_API_ID']&_app_key=ENV['YUMMLY_API_KEY']&q=#{@ingredient}&excludedIngredient[]=#{@excluded_response}")
      @response = HTTParty.get("http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_API_ID']}&_app_key=#{ENV['YUMMLY_API_KEY']}&q=#{@ingredient}&excludedIngredient[]=#{@excluded_response}")

      # render :json => @response
      @search_criteria = @response["criteria"]["q"]
    else
      @ingredient = params[:ingredient_of_the_day]
      @response = HTTParty.get("http://api.yummly.com/v1/api/recipes?_app_id=#{ENV['YUMMLY_API_ID']}&_app_key=#{ENV['YUMMLY_API_KEY']}&q=#{@ingredient}")
    end

  end



  def create
    puts "CREATE ACTION"
    puts params.inspect


    # @new_recipe = Recipe.create(recipe_params)
      @new_recipe = Recipe.new(
      ingredient_of_the_day: params[:ingredient_of_the_day],
      user_id: params[:user_id].to_i,
      imageURLsBySize: params[:imageURLsBySize],
      recipeName: params[:recipeName],
      ingredients: params[:ingredients],
      rating: params[:rating].to_i,
      sourceRecipeUrl: params[:sourceRecipeUrl]
      )
      @new_recipe.save
    puts "New recipe", @new_recipe.inspect


    respond_to do |format|
      # If request is JS (AJAX)
      format.js

      # If request is normal Rails way
      format.html { redirect_to recipes_path }
    end



    # if (@recipe)
    #   redirect_to url_for(:controller => :recipes, :action => :index)
    # else
    #   redirect_to url_for(:controller => :recipes, :action => :new)
    # end
  # end

  # def show
  #   @recipe = Recipe.find(params[:id])
  #
  end



  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    puts "CHECK HERE", params.inspect
    @recipe = Recipe.find(params[:id])
    @recipe.update({
      ingredient_of_the_day: params[:recipe][:ingredient_of_the_day],
      user_id:params[:recipe][:user_id],
      imageURLsBySize: params[:recipe][:imageURLsBySize],
      recipeName: params[:recipe][:recipeName],
      ingredients: params[:recipe][:ingredients],
      rating: params[:recipe][:rating],
      sourceRecipeUrl: params[:recipe][:sourceRecipeUrl]
    })
    if (@recipe)
      redirect_to url_for(:controller => :recipes, :action => :show, :id => params[:id])
    else
      redirect_to url_for(:controller => :recipes, :action => :edit)
    end
  end

  def destroy
    Recipe.delete(params[:id])
      redirect_to url_for(:controller => :recipes, :action => :index)
  end


  private
  def recipe_params
    params.require(:recipe).permit(:ingredient_of_the_day, :user_id, :imageURLsBySize, :recipeName, :ingredients, :rating, :sourceRecipeUrl)

  end


end
