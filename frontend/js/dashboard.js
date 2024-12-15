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

     // fetch logged sessions
    fetch('../backend/get_logged_sessions.php')
        .then(response => response.json())
        .then(data => {
            if (data.sessions) {
                displaySessions(data.sessions);
            }
        })
        .catch(error => console.error('Error fetching sessions:', error));

    // fetch logged meals
    fetch('../backend/get_logged_meals.php')
        .then(response => response.json())
        .then(data => {
            if (data.meals) {
                displayMeals(data.meals);
            }
        })
        .catch(error => console.error('Error fetching meals:', error));
        
    // fetch  net caloric intake / day
    fetch('../backend/get_daily_net_calories.php')
    .then(response => response.json())
    .then(data => {
        if (data.netCalories !== undefined) {
            document.getElementById('calories-consumed').innerText = data.totalConsumed;
            document.getElementById('calories-burned').innerText = data.totalBurned;
            document.getElementById('net-calories').innerText = data.netCalories;
        }
    })
    .catch(error => console.error('Error fetching daily net calories:', error));


    // fetch  past caloric intake / day
    fetch('../backend/get_past_net_calories.php')
    .then(response => response.json())
    .then(data => {
        if (data.netCalories) {
            displayPastNetCalories(data.netCalories);
        }
    })
    .catch(error => console.error('Error fetching past net calories:', error));


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
    const messageMealsDiv = document.getElementById('messageMeals');
    const messageSessionsDiv = document.getElementById('messageSessions');
    const messagePersonalDiv = document.getElementById('messagePersonal');
    messageDiv.classList.remove('message-success', 'message-error');
    messageMealsDiv.classList.remove('message-success', 'message-error');
    messageSessionsDiv.classList.remove('message-success', 'message-error');
    messagePersonalDiv.classList.remove('message-success', 'message-error');
    
    if (message.startsWith('Error') || message.startsWith('Invalid') || message.includes('error')) {
        messageDiv.classList.add('message-error');
        messageMealsDiv.classList.add('message-error');
        messageSessionsDiv.classList.add('message-error');
        messagePersonalDiv.classList.add('message-error');
    } else {
        messageDiv.classList.add('message-success');
        messageMealsDiv.classList.add('message-success');
        messageSessionsDiv.classList.add('message-success');
        messagePersonalDiv.classList.add('message-success');
    }
    messageDiv.innerText = message;
    messageMealsDiv.innerText = message;
    messageSessionsDiv.innerText = message;
    messagePersonalDiv.innerText = message;
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

function displaySessions(sessions) {
    var sessionList = document.createElement('ul');
    sessions.forEach(session => {
        var listItem = document.createElement('li');
        listItem.innerText = `${session.Date}: ${session.ExerciseType}, Duration: ${session.Duration} mins, Calories Burned: ${session.TotalCaloriesBurned.toFixed(2)}`;
        sessionList.appendChild(listItem);
    });
    document.getElementById('log-sessions-tab').appendChild(sessionList);
}

function displayMeals(meals) {
    var mealList = document.createElement('ul');
    meals.forEach(meal => {
        var listItem = document.createElement('li');
        listItem.innerText = `${meal.Date}: ${meal.Food}, Calories: ${meal.Calories}`;
        mealList.appendChild(listItem);
    });
    document.getElementById('log-meals-tab').appendChild(mealList);
}

function displayPastNetCalories(netCalories) {
    if (netCalories.length === 0) {
        // Handle no net calorie data case
        console.log('No past net calorie data available.');
        return;
    }

    var pastCaloriesList = document.createElement('ul');
    netCalories.forEach(entry => {
        var totalBurned = parseFloat(entry.TotalBurned) || 0; // make totalBurned is a number
        var totalConsumed = parseFloat(entry.TotalConsumed) || 0; // make totalConsumed is a number
        var netCalories = parseFloat(entry.NetCalories) || 0; // make netCalories is a number

        var listItem = document.createElement('li');
        listItem.innerText = `${entry.Date}: Consumed: ${totalConsumed} cal, Burned: ${totalBurned.toFixed(2)} cal, Net: ${netCalories.toFixed(2)} cal`;
        pastCaloriesList.appendChild(listItem);
    });

    var pastCaloriesDiv = document.getElementById('past-calories-list');
    pastCaloriesDiv.innerHTML = ''; // Clear any existing content
    pastCaloriesDiv.appendChild(pastCaloriesList);
}