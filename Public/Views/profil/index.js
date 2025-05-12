import {USER_ID} from "../../js/config.js";
import Profile from "../../js/modules/Profile.js";

export async function init() {
    if (!Number.isInteger(USER_ID)) {
        window.location.hash = '#login';
    }

    document.getElementById("edit-btn").addEventListener("click", () => {
        Profile.unlock();
    });

    document.getElementById("profileForm").addEventListener("submit", async e => {
        e.preventDefault();
        await Profile.send();
    });

    await Profile.setProfileValues();
}
