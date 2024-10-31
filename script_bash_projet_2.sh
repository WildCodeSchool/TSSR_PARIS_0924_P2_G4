#! /bin/bash

# Si choix de quitter (fin)
function quitter
{
    if
        [ "$operation" = "X" ]
    then
        echo "Vous avez sélectionné 'quitter' : opération terminée !" 
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
    [ "$operation" != "A" ] && [ "$operation" != "I" ] && [ "$operation" != "X" ]
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
    [ "$operation" = "A" ] && [ "$operation" != "I" ] && [ "$operation" != "X" ]
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
    [ "$operation" != "U" ] && [ "$operation" != "O" ] && [ "$operation" != "X" ] && [ "$operation" != "I" ]
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> un Utilisateur        ( tapez U )  

    --------> un Ordinateur client  ( tapez O ) 

    --------> quitter (fin)         ( tapez X )
    
    Sélectionnez votre choix : " operation
done

quitter 

# Si réponse U pour 'Utilisateur' (A + U)
if  
    [ "$operation" = "U" ] && [ "$operation" != "O" ]
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
    [ "$operation" != "C" ] && [ "$operation" != "G" ] && [ "$operation" != "M" ] && [ "$operation" != "X" ]
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
    [ "$operation" = "G" ] && [ "$operation" != "C" ] && [ "$operation" != "M" ]
then
    read -p "Vous souhaitez :

    --------> Ajouter un utilisateur à un groupe d'administration   ( tapez AA ) 

    --------> Ajouter un utilisateur à un groupe local              ( tapez AL ) 

    --------> Sortir un utilisateur d'un groupe local               ( tapez SL ) 

    --------> quitter (fin)                                         ( tapez X )
    
    Sélectionnez votre choix : " operation
fi

quitter 

# Si réponse invalide
while
    [ "$operation" != "AA" ] && [ "$operation" != "AL" ] && [ "$operation != "SL" ] && [ "$operation" != "X" ]
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Vous souhaitez :

    --------> Ajouter un utilisateur à un groupe d'administration   ( tapez AA ) 

    --------> Ajouter un utilisateur à un groupe local              ( tapez AL ) 

    --------> Sortir un utilisateur d'un groupe local               ( tapez SL ) 

    --------> quitter (fin)                                         ( tapez X )
    
    Sélectionnez votre choix : " operation
done 

# Si réponse O pour 'Ordinateur client' (A + O)
if  
    [ "$operation" = "O" ]
then
    read -p "Votre action concerne :
    
    --------> la gestion de la machine  ( tapez M )  

    --------> la gestion du système     ( tapez S ) 

    --------> la gestion du répertoire  ( tapez R )

    --------> quitter (fin)             ( tapez X )

    Sélectionnez votre choix : " operation
fi

quitter 

# Si réponse invalide
while
    [ "$operation" != "M" ] && [ "$operation" != "S" ] && [ "$operation != "R" ] && [ "$operation" != "X" ]
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> la gestion de la machine  ( tapez M )  

    --------> la gestion du système     ( tapez S ) 

    --------> la gestion du répertoire  ( tapez R )

    --------> quitter (fin)             ( tapez X )

    Sélectionnez votre choix : " operation
done 

quitter
