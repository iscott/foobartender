require 'spec_helper'

describe DrinksController do

    context 'when format is JSON' do
      render_views
          # Test #1
          it 'gives back all drinks' do
          Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 8)

          get 'index', format: 'json'

          drinks = JSON.parse(response.body)
          expect(drinks.count).to eq 1
          end

          # Test #2
          it 'renders the correct information' do
            @drink = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 8)

            get 'index', format: 'json'

            @drinks = Drink.all

            puts "**********************************"
            puts response.body
            puts "**********************************"

            # Use sample JSON to test parser instead of response.body:
            # stuff = "{\"drinks\":[{\"id\":1,\"drink_name\":\"vodka and lime\",\"drink_price\":\"$9.00\",\"is_fancy\":false,\"url\":\"http://localhost:3000/drinks/1.json\"}]}"
            drink = JSON.parse(response.body)['drinks'][0]
          
            puts "**********************************"
            puts drink
            puts "**********************************"
            expect(drink['id']).to eq @drink.id
            expect(drink['drink_name']).to eq @drink.drink_name
            expect(drink['drink_price']).to eq @drink.drink_price
            expect(drink['is_fancy']).to eq @drink.is_fancy
          end  
      # Test #3    
      it 'give back one drink in show' do
          @drink = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 8)

          get 'show', format: 'json', id: @drink.id

          drink = JSON.parse(response.body)
          expect(drink.count).to eq 1
      end

      # Test #4
      it 'renders the correct view information' do
            @drink = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 8)

            get 'show', format: 'json', id: @drink.id

            # Use sample JSON to test parser instead of response.body:
            # stuff = "{\"drinks\":[{\"id\":1,\"drink_name\":\"vodka and lime\",\"drink_price\":\"$9.00\",\"is_fancy\":false,\"url\":\"http://localhost:3000/drinks/1.json\"}]}"
            drink = JSON.parse(response.body)['drink']
            expect(drink['id']).to eq @drink.id
            expect(drink['drink_name']).to eq @drink.drink_name
            expect(drink['drink_price']).to eq @drink.drink_price
            expect(drink['is_fancy']).to eq @drink.is_fancy
      end

    end
    context 'when format is HTML' do
          # Test #5
          it 'renders the :index template for index' do
            get :index
            expect(response).to render_template :index
          end

          # Test #6
          it "render @drinks" do
            @drinks = Drink.all

            get 'index'

            response.should be_success
            expect(assigns[:drinks]).to eq @drinks
          end

          # Test #7
          it 'renders the :new template for new' do
            get :new
            expect(response).to render_template :new
          end

          # Test #8
          it "render :show template for a Drink" do
            @drink = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 9)        
            puts @drink.id
            get 'show', id: @drink.id, format: 'html' 
            response.should be_success
          end
    end
  end