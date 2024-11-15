#!/bin/bash

while true; do
    # Demande le nom d'utilisateur
    read -p "Entrez le nom d'utilisateur à vérifier (ou tapez 'exit' pour quitter) : " username

    # Permet à l'utilisateur de quitter
    if [[ "$username" == "exit" ]]; then
        echo "Sortie du programme."
        exit 0
    fi

    # Vérifie si l'utilisateur existe
    if id "$username" &>/dev/null; then
        echo "L'utilisateur $username existe."

        # Demande si l'utilisateur souhaite changer le mot de passe
        read -p "Voulez-vous changer le mot de passe de $username ? (o/n) : " choix

        if [[ "$choix" == "o" ]]; then
            # Changement du mot de passe
            passwd "$username"
        else
            echo "Aucune modification effectuée."
        fi
        break # Sort de la boucle après avoir traité l'utilisateur
    else
        echo "L'utilisateur $username n'existe pas. Veuillez réessayer."
    fi
done
