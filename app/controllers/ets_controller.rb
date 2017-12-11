class EtsController < ApplicationController
  skip_before_action :authenticate_user!, except: [:index]
  before_action :find_et, only: [:show, :edit, :update, :destroy]
  
    def index
    @ets = Et.all
    @ets = @ets.order(created_at: :desc)
        #@et = @et.paginate(:page => params[:page], :per_page => 10 )
    end
    
    def show
    end
    
    def new
    @et = Et.new  
    end    
    
    def create
    @et = Et.new(et_params)
    @et.user = current_user
      if @et.save
        redirect_to ets_path
      else
        render :new
      end
    end
    
    def edit             #Ne pas oublier la view edit
    end
    
    def update
    if @et.user == current_user && @et.update(et_params)
      redirect_to ets_path
    else
      flash[:alert] = "Impossible de modifier"
      render :edit
    end
    end

    def destroy
    if @et.user == current_user
      @et.destroy                      # on le supprime
      redirect_to ets_path             # on redirige vers index
    else
      flash[:alert] = "Action impossible, Vous n'avez pas créé cet événement. Mais vous pouvez en créer un autre dans le formulaire ci-dessous :"
        redirect_to ets_path   
    end  
    end
   
    private
    
    def find_et
    @et = Et.find(params[:id])
    end
    
    def et_params 
      params.require(:et).permit( :name, :adresse, :zip, :city, :phone, :email, :chemise, :cinqchemise)
    end

end
    

