class InventoriesController < ApplicationController
  def index
    if params[:search].presence
      @inventory = search_inventory.where(meal_plan_id: nil)
    else
      @inventory = Inventory.where(deleted_at: nil, meal_plan_id: nil)
    end
  end

  def show
    @inventory = Inventory.find(params[:id])
  end

  def new
    @inventory = Inventory.new
  end

  def create
    @inventory = Inventory.new
    # @recipe.update(cuisine_id: cuisine.id) if cuisine.presence
    if @inventory.update(quantity: quantity,
                      unit: inventory_params[:unit],
                      food_item_id: inventory_params[:food_item_id])
      redirect_to action: "index", alert: "Item added!"
    else
      render :new
    end
  end    

  def destroy_multiple
    Inventory.where(id: params[:inventory_ids]).destroy_all
    redirect_to inventories_path, alert: 'Selected items were successfully deleted'
  end

  def consolidate
    
    redirect_to action: "index"
  end

  private

  def food_item
    if inventory_params[:food_item].presence
      FoodItem.find_by(name: inventory_params[:food_item].downcase)
    end
  end

  def quantity
    fraction = Inventory::ALLOWED_FRACTIONS.key(inventory_params[:quantity])
    return fraction if fraction.presence

    if Inventory::ALLOWED_WHOLE_NUMBERS.include?(inventory_params[:quantity].to_i)
      inventory_params[:quantity].to_i
    end
  end

  def search_inventory
    search = Inventory.search do 
      fulltext (params[:search])
      with(:updated_at).less_than(Time.zone.now)
    end
    puts "there are #{search.total} results"
    search.results 
  end

  def inventory_params
    params.require(:inventory).permit(
      :search, 
      :inventory_id, 
      :quantity, 
      :unit, 
      :food_item_name, 
      :food_item_id,
      :inventory_ids
    )
  end 

end
