#!/bin/bash

# Afficher le titre du script
function show_title() {
    echo "==========================================================="
    echo "       MENU D'INFORMATIONS SUR L'UTILISATEUR LINUX         "
    echo "==========================================================="
}

# Fonction pour demander le nom d'utilisateur
function get_username() {
    while true; do
        read -p "Entrez le nom de l'utilisateur : " USERNAME
        # Vérification si l'utilisateur existe
        if id "$USERNAME" &>/dev/null; then
            break
        else
            echo "L'utilisateur $USERNAME n'existe pas. Veuillez entrer un utilisateur valide."
        fi
    done
}

# 1. Date de dernière connexion
function last_login() {
    get_username
    # Vérification de la dernière connexion
    last_login=$(last -n 1 "$USERNAME" | head -n 1 | awk '{print $4, $5, $6, $7}')
    if [ -z "$last_login" ]; then
        echo "Aucune information de connexion trouvée pour $USERNAME ou l'utilisateur n'a jamais ouvert de session."
    else
        echo "Date de dernière connexion de $USERNAME : $last_login"
    fi
}

# 2. Date de dernière modification du mot de passe
function password_last_change() {
    get_username
    # Vérification de la commande chage et récupération de la date de dernier changement du mot de passe
    if command -v chage &>/dev/null; then
        password_last_change=$(chage -l "$USERNAME" | grep "Last password change" | cut -d: -f2)
        if [ -z "$password_last_change" ]; then
            echo "Aucune information sur la dernière modification du mot de passe de $USERNAME."
        else
            echo "Date de dernière modification du mot de passe de $USERNAME : $password_last_change"
        fi
    else
        echo "La commande 'chage' n'est pas disponible ou accessible."
    fi
}

# 3. Liste des sessions ouvertes par l'utilisateur
function user_sessions() {
    get_username
    user_sessions=$(who | grep "$USERNAME")
    if [ -z "$user_sessions" ]; then
        echo "Aucune session ouverte trouvée pour $USERNAME."
    else
        echo "Liste des sessions ouvertes par $USERNAME :"
        echo "$user_sessions"
    fi
}

# 4. Groupe d’appartenance d’un utilisateur
function user_groups() {
    get_username
    user_groups=$(groups "$USERNAME")
    if [ -z "$user_groups" ]; then
        echo "Aucun groupe d'appartenance trouvé pour $USERNAME."
    else
        echo "Groupes d'appartenance de $USERNAME : $user_groups"
    fi
}

# 5. Historique des commandes exécutées par l'utilisateur
function user_history() {
    get_username
    if [ ! -f "/home/$USERNAME/.bash_history" ]; then
        echo "Aucun historique trouvé pour $USERNAME."
    else
        echo "Historique des commandes exécutées par $USERNAME (dernières 10 commandes) :"
        sudo -u "$USERNAME" tail -n 10 /home/"$USERNAME"/.bash_history
    fi
}

# 6. Droits/permissions de l’utilisateur sur un dossier
function folder_permissions() {
    get_username
    read -p "Entrez le chemin du dossier : " DIRECTORY
    if [ -d "$DIRECTORY" ]; then
        echo "Permissions de $USERNAME sur le dossier $DIRECTORY :"
        ls -ld "$DIRECTORY"
    else
        echo "Le dossier $DIRECTORY n'existe pas."
    fi
}

# 7. Droits/permissions de l’utilisateur sur un fichier
function file_permissions() {
    get_username
    read -p "Entrez le chemin du fichier : " FILE
    if [ -f "$FILE" ]; then
        echo "Permissions de $USERNAME sur le fichier $FILE :"
        ls -l "$FILE"
    else
        echo "Le fichier $FILE n'existe pas."
    fi
}

# Fonction pour afficher le menu et gérer les choix
function show_menu() {
    PS3="Choisissez une option (1-8) : "
    options=("Date de dernière connexion"
             "Date de dernière modification du mot de passe"
             "Liste des sessions ouvertes"
             "Groupes d’appartenance"
             "Historique des commandes"
             "Droits sur un dossier"
             "Droits sur un fichier"
             "Quitter")

    select opt in "${options[@]}"; do
        case $REPLY in
            1) last_login ;;
            2) password_last_change ;;
            3) user_sessions ;;
            4) user_groups ;;
            5) user_history ;;
            6) folder_permissions ;;
            7) file_permissions ;;
            8) echo "Au revoir !" ; exit 0 ;;
            *) echo "Option invalide, veuillez réessayer." ;;
        esac

        echo "Appuyez sur Entrée pour continuer..."
        read
        show_title
        show_menu
    done
}

# Lancer le titre et le menu
show_title
show_menu
