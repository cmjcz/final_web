class CategoriesController < ApplicationController

    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
  
  def new
    end

    def create
        @categorie = Categorie.new(categorie_params)

        if @categorie.save
            redirect_to @categorie
        else
            render 'new'
        end
    end

    def edit
        @categorie = Categorie.find(params[:id])
    end

    def update
        @categorie = Categorie.find(params[:id])
        if @categorie.update(categorie_params)
          redirect_to @categorie
        else
          render 'edit'
        end
      end

    def show
        @categorie = Categorie.find(params[:id])
    end

    def index
        @categorie = Categorie.all
    end

    def destroy
      @categorie = Categorie.find(params[:id])
      @categorie.destroy

      redirect_to categories_path
    end

    private
  def categorie_params
    params.require(:categorie).permit(:title, :description)
  end

end
