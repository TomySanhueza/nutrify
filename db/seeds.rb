# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb


# db/seeds.rb

puts "🧹 Limpiando datos antiguos..."
Patient.destroy_all

user = User.create!(
  email: "tomy@example.com",
  password: "password123",
  password_confirmation: "password123"
)


patients_data = [
  { first_name: "Juan", last_name: "Pérez", birthday: Date.new(1990, 5, 12), height: 175, weight: 72, nutrition_plan: "Balanceado", clinical_history: "Sin antecedentes graves." },
  { first_name: "María", last_name: "García", birthday: Date.new(1985, 8, 23), height: 162, weight: 58, nutrition_plan: "Vegano", clinical_history: "Historial de alergia estacional." },
  { first_name: "Elena",   last_name: "Martínez",  birthday: Date.new(1987, 4, 14), height: 165, weight: 65, nutrition_plan: "Balanceado",    clinical_history: "Chequeos normales. Dieta recomendada por nutricionista." },
  { first_name: "Diego",   last_name: "Castro",    birthday: Date.new(1993, 6, 27), height: 178, weight: 80, nutrition_plan: "Vegano",        clinical_history: "Recuperación exitosa de cirugía menor." },
  { first_name: "Sofía",   last_name: "Rojas",     birthday: Date.new(1999, 12, 9), height: 160, weight: 55, nutrition_plan: "Alta proteína", clinical_history: "Buen estado general. Deportista aficionada." }
]

patients_data.each do |data|
  Patient.create!(data.merge(user: user))
end


