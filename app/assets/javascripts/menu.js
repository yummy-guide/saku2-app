document.addEventListener('DOMContentLoaded', () => {
    const menuButton = document.getElementById('menu-button');
    const menu = document.getElementById('menu');

    console.log(menuButton);
    console.log(menu);

    if (menuButton && menu) {
        menuButton.addEventListener('click', () => {
            menu.classList.toggle('hidden');
        });
    }
});