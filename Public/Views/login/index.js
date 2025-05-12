import {USER_ID} from "../../js/config.js";
import authentication from "../../js/modules/Auth.js";

export async function init() {
    if (Number.isInteger(USER_ID)) {
        window.location.hash = "#profil";
    }

    document.getElementById('login-form').addEventListener('submit', e => {
        e.preventDefault();
        authentication();
    });
}