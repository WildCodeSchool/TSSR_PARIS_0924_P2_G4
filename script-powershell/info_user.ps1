# Afficher le titre du script
function Show-Title {
    Write-Host "==========================================================="
    Write-Host "       MENU D'INFORMATIONS SUR L'UTILISATEUR WINDOWS"
    Write-Host "==========================================================="
}

# Fonction pour demander le nom d'utilisateur
function Get-Username {
    while ($true) {
        $USERNAME = Read-Host "Entrez le nom de l'utilisateur"
        
        # Vérification si l'utilisateur existe (en s'assurant que le nom n'est pas vide)
        if (-not [string]::IsNullOrWhiteSpace($USERNAME)) {
            try {
                $user = Get-LocalUser -Name $USERNAME -ErrorAction Stop
                break
            } catch {
                Write-Host "L'utilisateur '$USERNAME' n'existe pas. Veuillez entrer un utilisateur valide."
            }
        } else {
            Write-Host "Le nom d'utilisateur ne peut pas être vide. Veuillez réessayer."
        }
    }
}

# 1. Dernière connexion
function Last-Login {
    Get-Username
    $lastLogin = (Get-WinEvent -LogName Security | Where-Object {$_.Message -like "*$USERNAME*"} | Select-Object -First 1).TimeCreated
    if ($lastLogin) {
        Write-Host "Dernière connexion de $USERNAME : $lastLogin"
    } else {
        Write-Host "Aucune information de connexion trouvée pour $USERNAME ou l'utilisateur n'a jamais ouvert de session."
    }
}

# 2. Date de dernière modification du mot de passe
function Password-Last-Change {
    Get-Username
    try {
        $user = Get-LocalUser -Name $USERNAME
        Write-Host "Date de dernière modification du mot de passe de $USERNAME : $($user.PasswordLastSet)"
    } catch {
        Write-Host "Impossible de récupérer les informations pour $USERNAME."
    }
}

# 3. Liste des sessions ouvertes par l'utilisateur
function User-Sessions {
    Get-Username
    try {
        $sessions = query user $USERNAME 2>&1
        if ($sessions -contains "Aucune session n'a été trouvée") {
            Write-Host "Aucune session ouverte trouvée pour $USERNAME."
        } else {
            Write-Host "Liste des sessions ouvertes par $USERNAME :"
            Write-Host $sessions
        }
    } catch {
        Write-Host "Impossible de récupérer les sessions pour $USERNAME."
    }
}

# 4. Groupes d'appartenance d'un utilisateur
function User-Groups {
    Get-Username
    try {
        $user = Get-LocalUser -Name $USERNAME
        $groups = $user.GroupMembership
        if ($groups) {
            Write-Host "Groupes d'appartenance de $USERNAME : $groups"
        } else {
            Write-Host "Aucun groupe d'appartenance trouvé pour $USERNAME."
        }
    } catch {
        Write-Host "Impossible de récupérer les groupes pour $USERNAME."
    }
}

# 5. Historique des commandes exécutées par l'utilisateur
function User-History {
    Get-Username
    $historyFile = "C:\Users\$USERNAME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadline\ConsoleHost_history.txt"
    if (Test-Path $historyFile) {
        $history = Get-Content $historyFile | Select-Object -Last 10
        Write-Host "Historique des commandes exécutées par $USERNAME (dernières 10 commandes) :"
        $history
    } else {
        Write-Host "Aucun historique trouvé pour $USERNAME."
    }
}

# 6. Droits/permissions de l'utilisateur sur un dossier
function Folder-Permissions {
    Get-Username
    $DIRECTORY = Read-Host "Entrez le chemin du dossier"
    if (Test-Path $DIRECTORY) {
        try {
            $acl = Get-Acl $DIRECTORY
            Write-Host "Permissions de $USERNAME sur le dossier $DIRECTORY :"
            $acl.Access | Where-Object {$_.IdentityReference -like "*$USERNAME*"}
        } catch {
            Write-Host "Impossible de récupérer les permissions pour le dossier $DIRECTORY."
        }
    } else {
        Write-Host "Le dossier $DIRECTORY n'existe pas."
    }
}

# 7. Droits/permissions de l'utilisateur sur un fichier
function File-Permissions {
    Get-Username
    $FILE = Read-Host "Entrez le chemin du fichier"
    if (Test-Path $FILE) {
        try {
            $acl = Get-Acl $FILE
            Write-Host "Permissions de $USERNAME sur le fichier $FILE :"
            $acl.Access | Where-Object {$_.IdentityReference -like "*$USERNAME*"}
        } catch {
            Write-Host "Impossible de récupérer les permissions pour le fichier $FILE."
        }
    } else {
        Write-Host "Le fichier $FILE n'existe pas."
    }
}

# 8. Quitter le script
function Quit-Script {
    Write-Host "Au revoir !"
    exit
}

# Fonction pour afficher le menu et gérer les choix
function Show-Menu {
    $options = @(
        "Afficher la date de dernière connexion (A)",
        "Afficher la date de dernière modification du mot de passe (B)",
        "Afficher les sessions ouvertes de l'utilisateur (C)",
        "Afficher les groupes d'appartenance de l'utilisateur (D)",
        "Afficher l'historique des commandes de l'utilisateur (E)",
        "Afficher les permissions sur un dossier (F)",
        "Afficher les permissions sur un fichier (G)",
        "Quitter le script (H)"
    )
    
    $choice = $null
    while ($choice -ne 'H') {
        Show-Title
        $options | ForEach-Object { Write-Host $_ }
        $choice = Read-Host "Choisissez une option (A-H)"
        switch ($choice) {
            'A' { Last-Login }
            'B' { Password-Last-Change }
            'C' { User-Sessions }
            'D' { User-Groups }
            'E' { User-History }
            'F' { Folder-Permissions }
            'G' { File-Permissions }
            'H' { Quit-Script }
            default { Write-Host "Option invalide, veuillez réessayer." }
        }
        Write-Host "Appuyez sur Entrée pour continuer..."
        Read-Host
    }
}

# Lancer le titre et le menu
Show-Title
Show-Menu