import { PROJECT_PATH } from "../config.js";
import Routers from "../services/UserService.js";

async function authentication() {
    const mail = document.getElementById('email').value.trim();
    const password = document.getElementById('password').value;
    const errorBox = document.getElementById('login-error');

    const showError = message => {
        errorBox.innerText = message;
        errorBox.style.display = 'block';
    };

    if (!mail || !password) {
        showError("Veuillez remplir tous les champs.");
        return;
    }

    try {
        const userData = await Routers.auth.getByUserMail(mail);
        if (!userData || userData.password !== password) {
            showError("Adresse email ou mot de passe invalide.");
            return;
        }

        sessionStorage.setItem('user_id', userData.id.toString());
        window.location.href = PROJECT_PATH;
    } catch (err) {
        console.error("Erreur lors de la connexion :", err);
        showError("Une erreur est survenue. Veuillez réessayer.");
    }
}

export default authentication;