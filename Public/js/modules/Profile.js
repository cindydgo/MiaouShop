import Routers from "../services/UserService.js";
import { USER_ID } from "../config.js";

function unlock() {
    const fields = ["profile-username", "profile-email", "profile-address"];
    fields.forEach(id => document.getElementById(id).disabled = false);

    document.getElementById("edit-btn").classList.add("d-none");
    document.getElementById("save-btn").classList.remove("d-none");
}

async function send() {
    const username = document.getElementById("profile-username").value.trim();
    const email = document.getElementById("profile-email").value.trim();
    const address = document.getElementById("profile-address").value.trim();
    const alertBox = document.getElementById("profile-alert");

    const showAlert = (message, type = "error") => {
        alertBox.className = "alert-box";
        alertBox.classList.add(type === "success" ? "alert-success" : "alert-error");
        alertBox.textContent = message;
        alertBox.classList.remove("d-none");
    };

    const hideAlert = () => alertBox.classList.add("d-none");
    hideAlert();

    if (!username || !email || !address) {
        showAlert("Tous les champs doivent être remplis.");
        return;
    }

    const patchResult = Routers.user.patch(USER_ID, {
        username: username,
        //address: address,
        mail: email
    });

    if (patchResult) {
        showAlert("Modifications enregistrées avec succès !", "success");
        await setProfileValues({username: username, mail: email});
    } else {
        showAlert("Une erreur est survenue durant l'enregistrement des modifications.", "error");
    }

    ["profile-username", "profile-email", "profile-address"].forEach(id => {
        document.getElementById(id).disabled = true;
    });

    document.getElementById("save-btn").classList.add("d-none");
    document.getElementById("edit-btn").classList.remove("d-none");
}

async function setProfileValues(data) {
    if (!data) data = await Routers.user.getOne(USER_ID);
    document.getElementById("profile-username").value = data.username;
    document.getElementById("profile-email").value = data.mail;
    //document.getElementById("profile-address").innerText = data.address;
}

const Profile = { unlock, send, setProfileValues };
export default Profile;