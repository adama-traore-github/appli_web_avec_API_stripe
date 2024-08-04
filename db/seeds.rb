# Vérifiez si l'utilisateur existe déjà ou créez-le
user = User.find_or_create_by!(email: 'u1@example.com') do |u|
  u.description = 'This is user 1'
  u.first_name = 'User'
  u.last_name = 'One'
  u.password = 'securepassword'
  u.password_confirmation = 'securepassword'
end

# Création des événements associés à cet utilisateur
Event.create!(
  start_date: '2024-08-10 10:00:00',
  duration: 120,
  title: 'Titre de l\'Événement',
  description: 'Description détaillée de l\'événement.',
  price: 50,
  location: 'Lieu de l\'événement',
  user: user
)

Event.create!(
  start_date: '2024-08-15 14:00:00',
  duration: 90,
  title: 'Atelier de Développement',
  description: 'Un atelier interactif sur le développement web.',
  price: 75,
  location: 'Salle de Conférence B',
  user: user
)

Event.create!(
  start_date: '2024-08-20 18:00:00',
  duration: 60,
  title: 'Séminaire de Marketing',
  description: 'Séminaire pour améliorer les compétences en marketing.',
  price: 100,
  location: 'Salle de Réunion 1',
  user: user
)

Event.create!(
  start_date: '2024-08-25 09:00:00',
  duration: 180,
  title: 'Conférence sur l\'Innovation',
  description: 'Conférence sur les dernières tendances en innovation technologique.',
  price: 150,
  location: 'Auditorium Principal',
  user: user
)
