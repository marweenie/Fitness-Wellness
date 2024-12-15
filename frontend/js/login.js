document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    var formData = new FormData(this);

    fetch('../backend/login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.message && data.message === 'Login successful') {
            document.getElementById('message').innerText = data.message;
            // document.getElementById('userInfo').style.display = 'block';
            // document.getElementById('userID').innerText = data.user.UserID;
            // document.getElementById('userName').innerText = data.user.Name;
            // document.getElementById('userAge').innerText = data.user.Age;
            // document.getElementById('userGender').innerText = data.userGender;
            // document.getElementById('userHeight').innerText = data.user.Height;
            // document.getElementById('userWeight').innerText = data.user.Weight;

            setTimeout(redirectUser, 1000);
        } else {
            document.getElementById('message').innerHTML = "Error: " + data.error;
            document.getElementById('userInfo').style.display = 'none';
        }
    })
    .catch(error => {
        document.getElementById('message').innerHTML = "Fetch error: " + error;
    });
});

document.getElementById('loginButton').addEventListener('click', function() {
    setTimeout(redirectUser, 1000);
});

function redirectUser() {
    window.location.href = "dashboard.html";
}