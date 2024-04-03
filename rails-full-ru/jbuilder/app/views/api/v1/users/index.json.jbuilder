# frozen_string_literal: true

# [
#   {
#   "id": 113629430,
#   "email": "three@test.io",
#   "address": "three",
#   "full_name": "three three",
#   "posts": [
#       {
#         "id": 298486374,
#         "title": "MyString"
#       }, {
#         "id": 980190962,
#         "title": "MyString"
#       }
#     ]
#   },
#   // ... и другие пользователи
# ]
json.array! @users do |user|
  json.partial! 'user', user: user
end
