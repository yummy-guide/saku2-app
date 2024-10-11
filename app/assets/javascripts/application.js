document.addEventListener('DOMContentLoaded', () => {
    const purchaseButton = document.getElementById('purchase-button');
    const confirmationDialog = document.getElementById('confirmation-dialog');
    const confirmButton = document.getElementById('confirm-button');
    const cancelButton = document.getElementById('cancel-button');
    const confirmationCheckbox = document.getElementById('confirmation-checkbox');
    const seatsSelect = document.getElementById('seats-select');

    purchaseButton.addEventListener('click', () => {
        confirmationDialog.classList.remove('hidden');
    });

    cancelButton.addEventListener('click', () => {
        confirmationDialog.classList.add('hidden');
    });

    confirmButton.addEventListener('click', () => {
        if (confirmationCheckbox.checked) {
            fetch(`/stores/${purchaseButton.dataset.storeId}/purchases`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json',
                    'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').content
                },
                body: JSON.stringify({
                    coupon_id: purchaseButton.dataset.couponId,
                    seats: seatsSelect.value
                })
            })
                .then(response => response.json())
                .then(data => {
                    if (data.notice) {
                        alert(data.notice);
                        confirmationDialog.classList.add('hidden');
                    } else if (data.errors) {
                        alert(data.errors.join(', '));
                    }
                });
        } else {
            alert('Please confirm the action.');
        }
    });
});