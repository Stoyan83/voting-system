
import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import "../frontend/index.js"


// Modal
$(document).ready(function () {
    const voteModalElement = $('#voteModal')[0];
    if (voteModalElement) {
        const voteModal = new bootstrap.Modal(voteModalElement);
        voteModal.show();
    }
})

// Navbar: React Route
$(document).on('turbo:load', function () {
    const $toggle = $('#switch-view-toggle');
    const $label = $('label[for="switch-view-toggle"]');
    const isModernView = window.location.pathname === '/modern/home';

    $toggle.prop('checked', isModernView);
    $label.text(isModernView ? 'Old View' : 'Modern View');

    $toggle.on('change', function () {
        const isChecked = $toggle.prop('checked');
        $label.text(isChecked ? 'Old View' : 'Modern View');
        window.location.href = isChecked ? '/modern/home' : '/';
    });
});


// Flash messages
$(document).on('turbo:load', function () {
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
