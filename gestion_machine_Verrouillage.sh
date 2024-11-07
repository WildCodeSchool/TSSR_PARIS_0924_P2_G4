#!/bin/bash

# Afficher les options à l'utilisateur
echo "Que souhaites-tu faire ?"
echo "V - Verrouiller l'ordinateur"
echo "P - Retourner au menu précédent"
echo "X - Quitter le script"
echo "Toute autre touche pour annuler"

# Demander à l'utilisateur de faire un choix
read -p "Choix : " choix

# Traiter le choix de l'utilisateur
if [[ "$choix" == "V" || "$choix" == "v" ]]; then
    echo "Verrouillage de l'ordinateur..."
    # Commande pour verrouiller l'ordinateur, variable selon l'environnement de bureau
    # Par exemple, pour Ubuntu avec gnome-screensaver :
    gnome-screensaver-command -l
elif [[ "$choix" == "P" || "$choix" == "p" ]]; then
    echo "Retour au menu précédent."
    # Ici, tu peux ajouter des commandes pour revenir au menu précédent, si nécessaire
elif [[ "$choix" == "X" || "$choix" == "x" ]]; then
    echo "Quitter le script."
    exit 0
else
    echo "Action annulée."
fi
chmod +x menu_lock.sh
