#! /bin/bash

function quitter
{
    echo "Vous avez choisi de quitter : opération terminée !" 
    echo "" 
    exit 0
}
while true; do
    echo "Vous souhaitez : 

    --------> ajouter un utilisateur à un groupe d'administration   ( tapez AA )

    --------> ajouter un utilisateur à un groupe local              ( tapez AL )

    --------> supprimer un utilisateur d'un groupe local            ( tapez SL )

    --------> retour au menu précédent                              ( tapez P )
                
    --------> quitter (fin)                                         ( tapez X )"

    echo ""
    read -p "Sélectionnez votre choix : " groups_choice
    clear

        case $groups_choice in 
            aa|AA)
                read -p "Veuillez indiquer le nom de l'utilisateur à ajouter au groupe d'administration 27 (sudo) : " add_user_sudo
                    while true; do
                        if 
                            grep -q "$add_user_sudo" /etc/passwd && ! groups $add_user_sudo | grep -qw "sudo" 
                        then
                            sudo adduser $add_user_sudo sudo 
                            echo ""
                            echo "L'utilisateur $add_user_sudo a été ajouté avec succès au groupe d'administration 27 (sudo) !" 
                            echo ""
                            id $add_user_sudo
                            echo ""
                            exit 0
                        else
                            echo ""
                            echo "/!\ ECHEC : l'utilisateur n'existe pas ou appattient déjà au groupe 27 (sudo)" 
                            echo ""
                            id $add_user_sudo
                            echo ""
                            exit 1 
                        fi
                    done
                ;;
            al|AL)
                read -p "Veuillez indiquer le nom de l'utilisateur à ajouter à un groupe local : " add_user_local_group
                read -p "Veuillez indiquer le nom du groupe local : " local_group
                    while true; do    
                        if
                            grep -q "$add_user_local_group" /etc/passwd 
                        then 
                            if 
                                ! groups $add_user_local_group | grep -qw *$local_group* 
                            then  
                                sudo adduser $add_user_local_group $local_group 
                                echo ""
                                echo "L'utilisateur $add_user_local_group a été ajouté avec succès au groupe $local_group !" 
                                echo ""
                                id $add_user_local_group
                                echo ""
                                exit 0
                            fi 
                        else     
                            echo ""
                            echo "/!\ ECHEC : l'utilisateur $add_user_local_group appartient déjà au groupe $local_group" 
                            echo ""
                            id $add_user_local_group 
                            echo ""
                            exit 1  
                        fi 
                    done 
                    if
                        ! grep -q "$add_user_local_group" /etc/passwd
                    then 
                        echo "/!\ ECHEC : l'utilisateur n'existe pas, vous devez d'abord créer l'utilisateur pour l'ajouter à un groupe local !"
                        echo ""
                        exit 1
                    fi 
                    ;;
            p|P) echo "Retour au menu précédent !" ; return ;; 
            x|X) quitter ;;
            *) echo "" ; echo "ERREUR : vous devez taper une réponse valide !" ; echo "" ;;
        esac 
done
