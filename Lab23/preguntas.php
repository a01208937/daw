<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="styles/main.css">
        <title>Preguntas L23</title>

        <meta name="google-signin-scope" content="profile email">
        <meta name="google-signin-client_id" content="553653766130-peesigbi2vt1f81vl05v314rk4lqtr99.apps.googleusercontent.com">
        <script src="https://apis.google.com/js/platform.js" async defer></script>
    </head>
    <body>
        <div id="main_container">
            <div class="card" style="width: 50%; align-self: center; margin: 5% auto; padding: 3% 1%;">
                <script>
                    function signOut() {
                    var auth2 = gapi.auth2.getAuthInstance();
                    auth2.signOut().then(function () {
                        alert('User signed out.');
                    });
                    }

                    function onLoad() {
                    gapi.load('auth2', function() {
                        gapi.auth2.init();
                    });
                    }
                </script>
                <a href="#" onclick="signOut();">Sign out</a>
            </div>
        </div>

        <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
    </body>
</html>