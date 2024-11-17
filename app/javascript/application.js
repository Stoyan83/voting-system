
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
})

$(document).on('turbo:load', function () {
    // Navbar: React Route
    $('#switch-view-toggle').on('change', function () {
        window.location.href = $(this).prop('checked') ? '/modern/home' : '/';
    });

    // Flash messages
    const flashMessage = $('#flash-message');
    if (flashMessage.length) {
        setTimeout(function () {
            flashMessage.fadeOut();
        }, 3000);
    }
});

// Add fields to Poll
$(document).on('click', '.add_fields', function (event) {
    event.preventDefault();

    const time = new Date().getTime();
    const regexp = new RegExp($(this).data('id'), 'g');
    const newFields = $(this).data('fields').replace(regexp, time);

    $(this).before(newFields);

    $(this).closest('form').find('.new-choice').each(function () {
        $(this).find('.remove_fields').on('click', function (event) {
            event.preventDefault();
            $(this).closest('.choice-field').remove();
        });
    });
});

// Remove fields on click
$(document).on('click', '.remove_fields', function (event) {
    event.preventDefault();

    if ($(this).closest('.choice-field').hasClass('new-choice')) {
        $(this).closest('.choice-field').remove();
    }
});
