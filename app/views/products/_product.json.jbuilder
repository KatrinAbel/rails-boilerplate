json.extract! product, :id, :title, :description, :price, :attachement, :created_at, :updated_at
json.url product_url(product, format: :json)
