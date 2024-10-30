#! /bin/bash

# détermination de l'opération souhaitée : action ou information
read -p "Vous souhaitez : 

--------> réaliser une Action       ( tapez A ) 

--------> obtenir une Information   ( tapez I ) 

Sélectionnez votre choix : " operation 

# Si réponse invalide
while
    [ "$operation" != "A" ] && [ "$operation" != "I" ] 
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Vous souhaitez : 

--------> réaliser une Action       ( tapez A ) 

--------> obtenir une Information   ( tapez I ) 

Sélectionnez votre choix : " operation 
done

# Si réponse A pour 'Action'
if  
    [ "$operation" = "A" ]
then
    read -p "Votre action concerne :
    
    --------> un Utilisateur        ( tapez U )  

    --------> un Ordinateur client  ( tapez O ) 

    Sélectionnez votre choix : " cible_action
fi

# Si réponse invalide
while
    [ "$cible_action" != "U" ] && [ "$cible_action" != "O" ] 
do  
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> un Utilisateur        ( tapez U )  

    --------> un Ordinateur client  ( tapez O ) 
    
    Sélectionnez votre choix : " cible_action 
done

# Si réponse U pour 'Utilisateur'
if  
    [ "$cible_action" = "U" ]
then
    read -p "Votre action concerne :
    
    --------> la gestion du Compte utiliateur   ( tapez C )

    --------> la gestion de Groupe              ( tapez G )

    --------> le changement du Mot de passe     ( tapez M ) 

    Sélectionnez votre choix : " type_action
fi

# Si réponse invalide
while 
    [ "$type_action" != "C" ] && [ "$type_action" != "G" ] && [ "$type_action" != "M" ]
do 
    echo "/!\ ERREUR : vous devez taper une réponse valide"
    
    read -p "Votre action concerne :
    
    --------> la gestion du Compte utiliateur   ( tapez C )

    --------> la gestion de Groupe              ( tapez G )

    --------> le changement du Mot de passe     ( tapez M ) 

    Sélectionnez votre choix : " type_action
done

# Si réponse G pour 'gestion de Groupe'
if 
    [ "$type_action" = "G" ]
then
    read -p "Vous souhaitez :

    --------> Ajouter un utilisateur à un groupe d'administration   ( tapez AA ) 

    --------> Ajouter un utilisateur à un groupe local              ( tapez AL ) 

    --------> Sortir un utilisateur d'un groupe local               ( tapez SL ) 
    
    Sélectionnez votre choix : "
fi

