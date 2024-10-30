#! /bin/bash

# Si choix de quitter (fin)
function quitter
{
    if
        [ $operation = X ]
    then
        echo "Opération terminée !" 
        exit 1
    fi
}

# détermination de l'opération souhaitée : action ou information
read -p "Vous souhaitez : 

--------> réaliser une Action       ( tapez A ) 

--------> obtenir une Information   ( tapez I ) 

--------> quitter (fin)             ( tapez X )

Sélectionnez votre choix : " operation 

quitter

# Si réponse invalide
while
    [ "$operation" != "A" ] && [ "$operation" != "I" ] 
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Vous souhaitez : 

--------> réaliser une Action       ( tapez A ) 

--------> obtenir une Information   ( tapez I ) 

--------> quitter (fin)             ( tapez X )

Sélectionnez votre choix : " operation 
done

quitter

# Si réponse A pour 'Action'
if  
    [ "$operation" = "A" ]
then
    read -p "Votre action concerne :
    
    --------> un Utilisateur        ( tapez U )  

    --------> un Ordinateur client  ( tapez O ) 

    --------> quitter (fin)         ( tapez X )

    Sélectionnez votre choix : " operation
fi

quitter 

# Si réponse invalide
while
    [ "$operation" != "U" ] && [ "$operation" != "O" ] 
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> un Utilisateur        ( tapez U )  

    --------> un Ordinateur client  ( tapez O ) 

    --------> quitter (fin)         ( tapez X )
    
    Sélectionnez votre choix : " operation
done

quitter 

# Si réponse U pour 'Utilisateur'
if  
    [ "$operation" = "U" ]
then
    read -p "Votre action concerne :
    
    --------> la gestion du Compte utiliateur   ( tapez C )

    --------> la gestion de Groupe              ( tapez G )

    --------> le changement du Mot de passe     ( tapez M ) 

    --------> quitter (fin)                     ( tapez X )

    Sélectionnez votre choix : " operation
fi

quitter

# Si réponse invalide
while 
    [ "$operation" != "C" ] && [ "$operation" != "G" ] && [ "$operation" != "M" ]
do 
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> la gestion du Compte utiliateur   ( tapez C )

    --------> la gestion de Groupe              ( tapez G )

    --------> le changement du Mot de passe     ( tapez M ) 

    --------> quitter (fin)                     ( tapez X )

    Sélectionnez votre choix : " operation
done

quitter

# Si réponse G pour 'gestion de Groupe'
if 
    [ "$operation" = "G" ]
then
    read -p "Vous souhaitez :

    --------> Ajouter un utilisateur à un groupe d'administration   ( tapez AA ) 

    --------> Ajouter un utilisateur à un groupe local              ( tapez AL ) 

    --------> Sortir un utilisateur d'un groupe local               ( tapez SL ) 

    --------> quitter (fin)                                         ( tapez X )
    
    Sélectionnez votre choix : " operation
fi

quitter 


