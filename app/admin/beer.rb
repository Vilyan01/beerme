ActiveAdmin.register Beer do
  permit_params do
    permitted = [:name, :description, :og, :fg, :abv, :color, :instructions]
    permitted
  end 

  index do 
    column :name
    column :abv
    column :color do |beer|
      div :class => "color" do
        beer.color
      end
    end
    actions
  end 

  show :title => :name do |beer|
    attributes_table do
      row :name
      row :description
      row :og
      row :fg
      row :abv
      row :color
      row :instructions
      row :ingredients do
        if beer.ingredients && beer.ingredients.count > 0
          ul
          beer.ingredients.each do |ingredient|
            li "#{ingredient.qty} #{ingredient.measurement} #{ingredient.name}"
          end
        end
      end
    end
  end

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end


end
