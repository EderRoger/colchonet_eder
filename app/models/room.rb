class Room
  include Mongoid::Document

  field :title, type: String
  field :location, type: String
  field :description, type: String

  def complete_name
    "#{title}, #{location}"
  end
end