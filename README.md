

# Event Management Application




Dans cette application Rails, nous avons intégré Stripe pour permettre aux utilisateurs de rejoindre des événements en effectuant un paiement en ligne. Nous avons défini des routes spécifiques pour gérer les paiements (`payments#create`) et rejoindre les événements (`events#join`). La vue `show.html.erb` affiche les détails de l'événement et inclut un lien vers la page de paiement. La vue `join.html.erb` contient un formulaire utilisant Stripe Checkout pour traiter les paiements. Le contrôleur `EventsController` inclut une action `join` pour afficher le formulaire de paiement, tandis que le contrôleur `PaymentsController` gère la logique de création des paiements et l'inscription des utilisateurs aux événements après un paiement réussi. Les clés API Stripe sont configurées via Rails credentials pour assurer la sécurité des transactions.
