# == Schema Information
#
# Table name: items
#
#  id             :integer          not null, primary key
#  item_name      :string
#  price          :string
#  quantity       :string
#  quantity_value :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  list_id        :integer
#  pantry_id      :integer
#
class Item < ApplicationRecord
  belongs_to(:list, { :required => false, :class_name => "List", :foreign_key => "list_id", :counter_cache => true })

  has_many(:lists, { :class_name => "List", :foreign_key => "item_id", :dependent => :destroy })

  has_one(:pantry, { :class_name => "Pantry", :foreign_key => "item_id", :dependent => :nullify })

  has_many(:user, { :through => :list, :source => :user })

  validates(:item_name, { :uniqueness => true, :presence => { :message => "Please enter a unique name for your item"} } )
end
