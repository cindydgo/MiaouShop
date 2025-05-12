import { USER_ID } from "../../js/config.js";
import Routers from "../../js/services/UserService.js";

export async function init() {
    if (Number.isInteger(USER_ID)) {
        window.location.hash = '#home';
    }

    document.getElementById("registerForm").addEventListener("submit", e => {
        e.preventDefault();

        const username = document.getElementById("username").value.trim();
        const email = document.getElementById("email").value.trim();
        const address = document.getElementById("address").value.trim();
        const password = document.getElementById("password").value;
        const confirmPassword = document.getElementById("confirmPassword").value;

        const alertBox = document.getElementById("register-alert");
        const showAlert = message => {
            alertBox.innerText = message;
            alertBox.style.display = 'block';
        }

        if (!username || !email || !address || !password || !confirmPassword) {
            showAlert("Merci de remplir tous les champs obligatoires.");
            return;
        }

        if (password !== confirmPassword) {
            showAlert("Les mots de passe ne correspondent pas.");
            return;
        }

        Routers.user.post({
            username: username,
            password: password,
            //address: address,
            mail: email
        });
        window.location.hash = '#login';
    });

}