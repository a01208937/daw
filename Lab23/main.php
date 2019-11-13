<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/main.css">

        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="553653766130-peesigbi2vt1f81vl05v314rk4lqtr99.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
        <title>LAB 23</title>
    </head>
    <body>
        <div id="main_container">
            <div class="card" style="width: 50%; align-self: center; margin: 5% auto; padding: 3% 1%;">
                <h1>Lab 23: Integración con servicios web</h1><br>
                <h5>Inicia sesión con google para acceder a las preguntas</h5>
                <br><br>
                <div class="g-signin2 login_g" data-onsuccess="onSignIn" data-theme="dark"></div>
                    <script>
                    function onSignIn(googleUser) {
                        // Useful data for your client-side scripts:
                        var profile = googleUser.getBasicProfile();
                        console.log("ID: " + profile.getId()); // Don't send this directly to your server!
                        console.log('Full Name: ' + profile.getName());
                        console.log('Given Name: ' + profile.getGivenName());
                        console.log('Family Name: ' + profile.getFamilyName());
                        console.log("Image URL: " + profile.getImageUrl());
                        console.log("Email: " + profile.getEmail());

                        // The ID token you need to pass to your backend:
                        var id_token = googleUser.getAuthResponse().id_token;
                        console.log("ID Token: " + id_token);

                        // send to preguntas.php
                    }
                    </script>

                    <!--<a href="#" onclick="signOut();">Sign out</a>
                    <script>
                    function signOut() {
                        var auth2 = gapi.auth2.getAuthInstance();
                        auth2.signOut().then(function () {
                            alert('User signed out');
                            location.reload();
                        });
                    }
                    </script>-->
            </div>
        </div>
    </body>
</html>