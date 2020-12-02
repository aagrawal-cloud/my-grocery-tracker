# == Schema Information
#
# Table name: pantries
#
#  id             :integer          not null, primary key
#  quantity       :string
#  quantity_value :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_id        :integer
#  list_id        :integer
#  user_id        :integer
#
class Pantry < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  belongs_to(:item, { :required => false, :class_name => "Item", :foreign_key => "item_id" })
  
  has_many(:lists, { :class_name => "List", :foreign_key => "pantry_id" })
end
