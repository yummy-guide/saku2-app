document.addEventListener('DOMContentLoaded', function() {
    var purchaseButton = document.getElementById('purchase-button');
    var confirmationDialog = document.getElementById('confirmation-dialog');
    var cancelButton = document.getElementById('cancel-button');
    var confirmButton = document.getElementById('confirm-button');
    var confirmationCheckbox = document.getElementById('confirmation-checkbox');

    purchaseButton.addEventListener('click', function(event) {
        event.preventDefault();
        confirmationDialog.classList.remove('hidden');
    });

    cancelButton.addEventListener('click', function() {
        confirmationDialog.classList.add('hidden');
    });

    confirmButton.addEventListener('click', function() {
        if (confirmationCheckbox.checked) {
            var storesPath = purchaseButton.dataset.storesPath;
            window.location.href = storesPath;
        } else {
            alert('確認チェックボックスをオンにしてください。');
        }
    });
});