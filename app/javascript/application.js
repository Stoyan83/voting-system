// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "../frontend/index.js"


$(document).ready(function () {
    // Modal
    const voteModalElement = $('#voteModal')[0];
    if (voteModalElement) {
        const voteModal = new bootstrap.Modal(voteModalElement);
        voteModal.show();
    }

    // Navbar: React Route
    $('#switch-view-toggle').on('change', function () {
        if ($(this).prop('checked')) {
            window.location.href = '/modern/home';
        } else {
            window.location.href = '/';
        }
    });

    // Flash messages
    const flashMessage = $('#flash-message');
    if (flashMessage.length) {
        setTimeout(function () {
            flashMessage.fadeOut();
        }, 3000);
    }
});
