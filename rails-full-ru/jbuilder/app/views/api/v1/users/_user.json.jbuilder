# frozen_string_literal: true

# {
#   "id": 113629430,
#   "email": "three@test.io",
#   "address": "three",
#   "full_name": "three three",
#   "posts": [
#     {
#       "id": 298486374,
#       "title": "MyString"
#     },
#     {
#       "id": 980190962,
#       "title": "MyString"
#     }
#   ]
# }

json.extract! user, :id, :email, :address
json.full_name "#{user.first_name} #{user.last_name}"
json.posts user.posts do |post|
  json.partial!('post', post: post)
end
