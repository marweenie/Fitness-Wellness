document.addEventListener('DOMContentLoaded', function() {
    // Fetch initial user info and display it
    fetch('../backend/get_user_info.php')
        .then(response => response.json())
        .then(data => {
            if (data.user) {
                document.getElementById('userName').innerText = data.user.Name;
                // Populate other user fields if needed
            }
        })
        .catch(error => console.error('Error fetching user info:', error));

    // Fetch workout types and populate the dropdown
    fetch('../backend/get_workout_types.php')
        .then(response => response.json())
        .then(data => {
            if (data.workouts) {
                var workoutSelect = document.querySelector('select[name="type_id"]');
                data.workouts.forEach(workout => {
                    var option = document.createElement('option');
                    option.value = workout.TypeID;
                    option.textContent = workout.ExerciseType;
                    workoutSelect.appendChild(option);
                });
            }
        })
        .catch(error => console.error('Error fetching workout types:', error));
});

document.getElementById('mealForm').addEventListener('submit', function(e) {
    e.preventDefault();

    var formData = new FormData(this);

    fetch('../backend/log_meal.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(text => {
        displayMessage(text);
    })
    .catch(error => {
        console.error('Fetch error:', error);
        displayMessage("Fetch error: " + error);
    });
});

document.getElementById('workoutForm').addEventListener('submit', function(e) {
    e.preventDefault();

    var formData = new FormData(this);

    fetch('../backend/log_workout.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.text())
    .then(text => {
        displayMessage(text);
    })
    .catch(error => {
        console.error('Fetch error:', error);
        displayMessage("Fetch error: " + error);
    });
});

['updateAgeForm', 'updateWeightForm', 'updateHeightForm'].forEach(formId => {
    document.getElementById(formId).addEventListener('submit', function(e) {
        e.preventDefault();

        var formData = new FormData(this);

        fetch('../backend/update_user_info.php', {
            method: 'POST',
            body: formData
        })
        .then(response => response.text())
        .then(text => {
            displayMessage(text);
        })
        .catch(error => {
            console.error('Fetch error:', error);
            displayMessage("Fetch error: " + error);
        });
    });
});

document.getElementById('logoutButton').addEventListener('click', function() {
    window.location.href = '../backend/loggingout.php';
    
});

function displayMessage(message) {
    const messageDiv = document.getElementById('message');
    messageDiv.classList.remove('message-success', 'message-error');
    if (message.startsWith('Error') || message.startsWith('Invalid') || message.includes('error')) {
        messageDiv.classList.add('message-error');
    } else {
        messageDiv.classList.add('message-success');
    }
    messageDiv.innerText = message;
}