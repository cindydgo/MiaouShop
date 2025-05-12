<?php
require __DIR__ . '/config/app.php';
?>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <title>MVC Project</title>
        <meta charset="utf-8">
    </head>
    <body>
        <header>
            <h1>Bienvenue sur le Shop</h1>
            <nav>
                <ul>
                    <li><a href="#" data-view="home">Accueil</a></li>
                    <li><a href="#" data-view="products">Produits</a></li>
                    <li><a href="#" data-view="about">À propos</a></li>
                </ul>
            </nav>
        </header>
    
        <main>

        </main>

        <footer>
            <p>WhiteCat &copy; 2025</p>
        </footer>
        
        <script type="module" src="js/App.js"></script>
    </body>
</html>