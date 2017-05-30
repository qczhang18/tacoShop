json.extract! taco, :id, :meat, :rice, :salsa, :notes, :created_at, :updated_at
json.url taco_url(taco, format: :json)
