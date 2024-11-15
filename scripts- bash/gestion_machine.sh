#!/bin/bash


function arreter
{
# Afficher les options à l'utilisateur


echo "Que souhaites-tu faire ?"
echo "A - Arrêter l'ordinateur"
echo "P - Retourner au menu précédent"
echo "X - Quitter le script"
echo "Toute autre touche pour annuler"


# Demander à l'utilisateur de faire un choix

read -p "Choix : " choix

#le choix de l'utilisateur



if [[ "$choix" == "A" || "$choix" == "a" ]]; then
    echo "Arrêt de l'ordinateur..."
    sudo shutdown -h now
elif [[ "$choix" == "P" || "$choix" == "p" ]]; then
    echo "Retour au menu précédent."
   
   
   
   
   # revenir au menu précédent
   
   
elif [[ "$choix" == "X" || "$choix" == "x" ]]; then
    echo "Quitter le script."
    exit 0
else
    echo "Action annulée."
fi
chmod +x menu_shutdown.sh
}

function redemarrer
{
# Afficher les options à l'utilisateur
echo "Que souhaites-tu faire ?"
echo "R - Redémarrer l'ordinateur"
echo "P - Retourner au menu précédent"
echo "X - Quitter le script"
echo "Toute autre touche pour annuler"

# Demander à l'utilisateur de faire un choix
read -p "Choix : " choix

# Traiter le choix de l'utilisateur
if [[ "$choix" == "R" || "$choix" == "r" ]]; then
    echo "Redémarrage de l'ordinateur..."
    sudo reboot
elif [[ "$choix" == "P" || "$choix" == "p" ]]; then
    echo "Retour au menu précédent."
    # Ici, tu peux ajouter des commandes pour revenir au menu précédent, si nécessaire
elif [[ "$choix" == "X" || "$choix" == "x" ]]; then
    echo "Quitter le script."
    exit 0
else
    echo "Action annulée."
fi
chmod +x menu_reboot.sh
}


function verrouiller
{
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
}

echo ""
        echo "Votre action sur Ordinateur client concerne : 

        --------> l'arrêt de la machine             ( tapez A )

        --------> le redémarrage de la machine      ( tapez R )

        --------> le verrouillage de la  machine    ( tapez V )

        --------> retour au menu précédent          ( tapez P )

        --------> quitter                           ( tapez X )"

        echo ""
        read -p "Sélectionnez votre choix : " action_machine
        clear

case $action_machine in
    a|A)
        arreter
        ;;
    r|R)
        redemarrer
        ;;
    v|V)
        verrouiller
        ;;
    p|P)
        action_ordinateur
        ;;
    x|X)
        quitter
        ;;
esac
