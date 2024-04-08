class UserSerializer < ActiveModel::Serializer
  attributes :id, :email, :address, :full_name
  has_many :posts

  class PostSerializer < ActiveModel::Serializer
    attributes :id, :title
  end

  def full_name
    "#{object.first_name} #{object.last_name}"
  end
end
