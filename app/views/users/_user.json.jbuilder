json.extract! user, :id, :name, :cpf, :address, :birthday, :email, :fone, :created_at, :updated_at
json.url user_url(user, format: :json)
