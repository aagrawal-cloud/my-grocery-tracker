# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  first_name      :string
#  last_name       :string
#  lists_count     :integer
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password

  has_many(:lists, { :class_name => "List", :foreign_key => "user_id", :dependent => :destroy })

  has_one(:pantry, { :class_name => "Pantry", :foreign_key => "user_id", :dependent => :destroy })

  has_many(:items, { :through => :lists, :source => :items })
end
