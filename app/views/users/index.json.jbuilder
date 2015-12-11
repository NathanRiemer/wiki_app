json.array!(@users) do |user|
  json.extract! user, :id, :username, :password_digest, :email, :first_name, :last_name, :avatar_image_url, :city, :state, :country, :is_admin
  json.url user_url(user, format: :json)
end
