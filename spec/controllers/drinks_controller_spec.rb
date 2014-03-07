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

            @drinks = Drink.all

            drink = JSON.parse(response.body)
            expect(drink['id']).to eq @drink.id
            expect(drink['drink_name']).to eq @drink.drink_name
            expect(drink['drink_price']).to eq @drink.drink_price
            expect(drink['is_fancy']).to eq @drink.is_fancy
          end  
      # Test #3    
      it 'give back one drink in show' do
         drink = JSON.parse(response.body)
         expect(drink.count).to eq(1)
      end

      # Test #4
      it 'renders the correct view information' do
        @drink = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 12)
        get 'show', id: @drink.id, format: 'json'
        drink = JSON.parse(response.body)['drinks']
        expect([drink][0]['id']).to eq @drink.id
        # expect(drink['drink_name']).to eq @drink.drink_name
        # expect(drink['drink_price']).to eq @drink.drink_price
        # expect(drink['alcohol']).to eq @drink.alcohol
        # expect(drink['mixer']).to eq @drink.mixer
        # expect(drink['finish']).to eq @drink.finish
        # expect(drink['over_ice']).to eq @drink.over_ice
        # expect(drink['top_shelf']).to eq @drink.top_shelf
        # expect(drink['is_fancy']).to eq @drink.top_shelf
      end

    end
    context 'when format is HTML' do
          # Test #5
          it 'renders the :index template for index' do
            get :index
            expect(response).to render_template :index
          end

          # Test #6
          it "assigns all things to @drinks" do
            @drinks = Drink.all

            get 'index'

            response.should be_success
            expect(@drinks).to eq Drink.all
          end

          # Test #7
          it 'renders the :new template for new' do
            get :new
            expect(response).to render_template :new
          end

          # Test #8
          it "finds a Drink and sets it to @drink" do
            g = Drink.create(alcohol: "gin", mixer: "tonic", finish: "lime", over_ice: true, top_shelf: true, price: 12)        
            get 'show', id: g.id
            response.should be_success
            expect(@drink).to eq g
          end
    end
  end