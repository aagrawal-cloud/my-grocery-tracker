# == Schema Information
#
# Table name: lists
#
#  id          :integer          not null, primary key
#  date        :datetime
#  items_count :integer
#  list_name   :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer
#  pantry_id   :integer
#  user_id     :integer
#
class List < ApplicationRecord
  belongs_to(:user, { :required => false, :class_name => "User", :foreign_key => "user_id" })

  has_many(:items, { :class_name => "Item", :foreign_key => "list_id", :dependent => :nullify })

  belongs_to(:item, { :required => false, :class_name => "Item", :foreign_key => "item_id" })

  belongs_to(:household, { :required => false, :class_name => "Pantry", :foreign_key => "pantry_id" })

  validates(:list_name, { :presence => { :message => "Please enter a unique name for your list" } })

  validates(:list_name, { :uniqueness => { :scope => ["user_id"] } })
  end
