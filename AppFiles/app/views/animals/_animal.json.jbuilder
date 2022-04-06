json.extract! animal, :id, :AnimalId, :Species, :Gender, :IsAlive, :Name, :created_at, :updated_at
json.url animal_url(animal, format: :json)
