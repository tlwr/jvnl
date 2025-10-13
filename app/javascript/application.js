// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

// ensure that htmx uses CSRFs from rails
import "htmx.org"
document.addEventListener('DOMContentLoaded', () => {
    const token = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    document.body.addEventListener('htmx:configRequest', (event) => {
        event.detail.headers['X-CSRF-Token'] = token;
    });
});
