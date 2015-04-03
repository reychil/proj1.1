class PokemonsController < ApplicationController
    def capture
        #grab id of Pokemon from parameters and 
        #set that trainer to be current logged in trainer
        @x = Pokemon.find(params[:id])
        @x.trainer = current_trainer
        @x.save
        #redirect to home page 
        redirect_to root_path
        
    end

  def damage
	#subtract 10 from health of pokemon
	@x = Pokemon.find(params[:id])

	#if health <= 0, then destroy the pokemon
	if @x.health <= 0
		@x.destroy
	else 
		@x.health = @x.health - 10
		@x.save
	end
	#redirect back to trainer's page
	redirect_to trainer_path current_trainer
   end

   def new
   	#show the form in new.html.erb
   	@pokemon = Pokemon.new
   end

   def create
   	#set default values
   	@x = Pokemon.last
   	@x.level = 1
   	@x.health = 100
   	#set trainer to current_trainer
   	@x.trainer = current_trainer
   	@x.save
   	#redirect back to trainer's page
   	redirect_to trainer_path current_trainer
   end
end