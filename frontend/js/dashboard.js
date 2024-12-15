document.addEventListener('DOMContentLoaded', function() {
    // fetch user info to display
    fetch('../backend/get_user_info.php')
        .then(response => response.json())
        .then(data => {
            if (data.user) {
                document.getElementById('userName').innerText = data.user.Name;
                // Populate other user fields if needed
                document.getElementById('userInfo').style.display = 'block';
                document.getElementById('name').innerText = data.user.Name;
                document.getElementById('userID').innerText = data.user.UserID;
                document.getElementById('userName').innerText = data.user.Name;
                document.getElementById('userAge').innerText = data.user.Age;
                document.getElementById('userGender').innerText = data.user.Gender;
                document.getElementById('userHeight').innerText = data.user.Height;
                document.getElementById('userWeight').innerText = data.user.Weight;
            }
        })
        .catch(error => console.error('Error fetching user info:', error));

    // fetch workout types for the dropdown
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

    // listen to tab links
    var tabLinks = document.querySelectorAll('.tab-link');
    tabLinks.forEach(function(link) {
        link.addEventListener('click', switchTab);
    });

    // listen to logout button(s)
    var logoutButtons = document.querySelectorAll('.logout-btn');
    logoutButtons.forEach(function(button) {
        button.addEventListener('click', logout);
    });

    // listen to form submissions 
    document.getElementById('mealForm').addEventListener('submit', handleSubmit('../backend/log_meal.php'));
    document.getElementById('workoutForm').addEventListener('submit', handleSubmit('../backend/log_workout.php'));
    ['updateAgeForm', 'updateWeightForm', 'updateHeightForm'].forEach(formId => {
        document.getElementById(formId).addEventListener('submit', handleSubmit('../backend/update_user_info.php'));
    });
});

function switchTab(e) {
    e.preventDefault();
    var tabLinks = document.querySelectorAll('.tab-link');
    var tabPanes = document.querySelectorAll('.tab-pane');

    // remove active class
    tabLinks.forEach(function(link) {
        link.classList.remove('active'); // the actual tab
    });
    tabPanes.forEach(function(pane) { // holds content 
        pane.classList.remove('active');
    });
//put active class
    this.classList.add('active');
    var targetPane = document.getElementById(this.getAttribute('data-target'));
    targetPane.classList.add('active');
}

function logout() {
    window.location.href = '../backend/loggingout.php';
}

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

function handleSubmit(url) {
    return function(e) {
        e.preventDefault();
        var formData = new FormData(e.target);
        fetch(url, {
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
    };
}