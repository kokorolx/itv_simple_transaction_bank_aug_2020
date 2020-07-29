json.extract! account, :id, :name, :address, :bank, :user_id, :created_at, :updated_at
json.url account_url(account, format: :json)
