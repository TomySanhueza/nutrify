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

puts "🌱 Creando usuario de ejemplo..."

user = User.create!(
  email: "newtest@example.com",
  password: "password123",
  password_confirmation: "password123"
)

puts "Usuario creado: #{user.email}"

patients_data = [
  { first_name: "Juan", last_name: "Pérez", birthday: Date.new(1990, 5, 12), height: 1.75, weight: 72,
    nutrition_plan: <<~PLAN,
      Objetivo: Pérdida de peso gradual (-0,5 kg/semana)
      Calorías diarias: 1.680 kcal
      Macros: 168 g proteínas / 75 g grasas / 84 g carbohidratos

      Distribución de comidas:
      • Desayuno (25%): Proteína + carbohidrato complejo + grasa saludable + fruta.
        Ejemplo: 4 claras + 1 huevo con espinaca y tomate, 40 g pan integral, 10 g mantequilla de almendra, 1 mandarina.
      • Media mañana (10%): Snack proteico + fruta.
        Ejemplo: Yogurt griego natural 150 g + 15 g almendras + ½ manzana.
      • Almuerzo (30%): Proteína magra + verduras + carbohidrato complejo + grasa saludable.
        Ejemplo: 150 g pollo a la plancha, 80 g quinoa, ensalada de hojas verdes y tomate con 10 ml aceite de oliva.
      • Merienda (10%): Snack proteico + fibra.
        Ejemplo: Batido de proteína con leche de almendra + 1 puñado de moras.
      • Cena (25%): Proteína magra + verduras al vapor + grasas buenas.
        Ejemplo: 200 g merluza al horno, brócoli y espárragos al vapor, ½ aguacate.
    PLAN
    clinical_history: <<~HISTORIA
      Motivo de consulta: Paciente busca pérdida de peso y mejora de hábitos alimenticios.
      Antecedentes: Sin patologías crónicas. IMC 29 (sobrepeso). No alergias conocidas.
      Estado actual: Alimentación irregular, consumo frecuente de ultraprocesados en la tarde, baja ingesta de agua (1 L/día). Actividad física baja.
      Observaciones: Priorizar horarios de comida, aumentar agua a 2 L/día, reemplazar snacks ultraprocesados por fruta o yogurt.
      Plan de seguimiento: Revisión de peso y medidas en próxima cita, ajustar carbohidratos según evolución.
    HISTORIA
  },
  { first_name: "María", last_name: "García", birthday: Date.new(1985, 8, 23), height: 1.62, weight: 58,
    nutrition_plan: <<~PLAN,
      Objetivo: Mantener peso y mejorar rendimiento deportivo.
      Calorías diarias: 1.950 kcal
      Macros: 145 g proteínas / 70 g grasas / 180 g carbohidratos

      Distribución de comidas:
      • Desayuno: Omelette de 2 huevos + avena cocida con frutos rojos.
      • Media mañana: Batido de proteína + plátano.
      • Almuerzo: Salmón al horno 150 g + boniato 100 g + ensalada verde.
      • Merienda: Yogurt griego + 20 g nueces + miel.
      • Cena: Pechuga de pollo + brócoli al vapor + aguacate.
    PLAN
    clinical_history: <<~HISTORIA
      Motivo de consulta: Optimizar dieta para entrenamientos de CrossFit.
      Antecedentes: IMC 22, sin alergias. Medicación: ninguna.
      Estado actual: Entrena 4 veces por semana, reporta ocasional fatiga post-entrenamiento.
      Observaciones: Aumentar proteína en merienda y asegurar hidratación 2.5L/día.
      Plan de seguimiento: Evaluar respuesta en 14 días y ajustar carbohidratos según rendimiento.
    HISTORIA
  },
  { first_name: "Elena", last_name: "Martínez", birthday: Date.new(1987, 4, 14), height: 1.65, weight: 65,
    nutrition_plan: <<~PLAN,
      Objetivo: Ganancia de masa muscular (+0,3 kg/semana)
      Calorías diarias: 2.200 kcal
      Macros: 160 g proteínas / 80 g grasas / 200 g carbohidratos

      Distribución de comidas:
      • Desayuno: Avena con proteína en polvo + frutos secos + plátano.
      • Media mañana: Yogurt griego + granola sin azúcar.
      • Almuerzo: 200 g ternera magra + 100 g arroz integral + ensalada variada.
      • Merienda: Batido de proteína + pan integral con aguacate.
      • Cena: Salmón al horno + verduras salteadas en aceite de oliva.
    PLAN
    clinical_history: <<~HISTORIA
      Motivo de consulta: Mejorar composición corporal.
      Antecedentes: Sin enfermedades relevantes. IMC 24.
      Estado actual: Actividad física moderada (3 entrenamientos/semana).
      Observaciones: Iniciar entrenamiento de fuerza estructurado y aumentar carbohidratos en días de entrenamiento.
      Plan de seguimiento: Reevaluar en 4 semanas y ajustar macros según progreso.
    HISTORIA
  },
  { first_name: "Diego", last_name: "Castro", birthday: Date.new(1993, 6, 27), height: 1.78, weight: 80,
    nutrition_plan: <<~PLAN,
      Objetivo: Mejorar composición corporal y reducir grasa abdominal.
      Calorías diarias: 1.900 kcal
      Macros: 170 g proteínas / 70 g grasas / 150 g carbohidratos

      Distribución de comidas:
      • Desayuno: Huevos revueltos con champiñones + pan integral.
      • Media mañana: Batido proteico + fruta.
      • Almuerzo: Pollo a la plancha + quinoa + ensalada.
      • Merienda: Yogurt griego + almendras.
      • Cena: Merluza + espárragos al vapor + ensalada de tomate y aguacate.
    PLAN
    clinical_history: <<~HISTORIA
      Motivo de consulta: Reducción de grasa visceral.
      Antecedentes: Recuperación de cirugía menor sin complicaciones.
      Estado actual: Trabajo sedentario, poca actividad física. IMC 26.
      Observaciones: Implementar caminatas diarias de 30 min y limitar alcohol.
      Plan de seguimiento: Revisión de grasa corporal en 8 semanas.
    HISTORIA
  },
  { first_name: "Sofía", last_name: "Rojas", birthday: Date.new(1999, 12, 9), height: 1.60, weight: 55,
    nutrition_plan: <<~PLAN,
      Objetivo: Mantener peso y optimizar recuperación muscular.
      Calorías diarias: 1.850 kcal
      Macros: 140 g proteínas / 65 g grasas / 170 g carbohidratos

      Distribución de comidas:
      • Desayuno: Tostadas integrales + aguacate + huevo pochado.
      • Media mañana: Yogurt griego + frutos rojos.
      • Almuerzo: Pechuga de pavo + arroz integral + ensalada variada.
      • Merienda: Batido de proteína + fruta.
      • Cena: Salmón + espinacas salteadas + aceite de oliva.
    PLAN
    clinical_history: <<~HISTORIA
      Motivo de consulta: Ajuste nutricional para mejorar rendimiento deportivo recreativo.
      Antecedentes: Deportista aficionada, sin enfermedades crónicas.
      Estado actual: Buena condición física, entrena 5 días a la semana.
      Observaciones: Mantener ingesta de proteína adecuada y priorizar sueño reparador.
      Plan de seguimiento: Control en 6 semanas para ajuste de macros si aumenta carga de entrenamiento.
    HISTORIA
  }
]

patients_data.each do |data|
  Patient.create!(data.merge(user: user))
end

puts "Pacientes creados: #{Patient.count}"
