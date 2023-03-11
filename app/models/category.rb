class Category < ApplicationRecord
    belongs_to :major_category
    has_many :products, dependent: :destroy
    
    # PER = 15
    
    # scope :display_list, -> (page) { page(page).per(PER) }
    extend DisplayList
    scope :major_categories, -> { pluck(:major_category_name).uniq }
    scope :request_category, -> (category) {
        if category != "none"
          find(category.to_i)
        else
          ""
        end
    }
    
    # scope :request_category, -> (category) { find(category.to_i) }
end
