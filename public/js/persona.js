
    navigator.id.watch({
        loggedInUser: currentUser,
        onlogin: function(assertion){
          $.post('/login', {assertion:assertion}, function(data){
           window.location.reload(); 
          }).fail(function(xhr, status, err){
            console.log(status);
          });
        },
        onlogout: function(){
          $.post('/logout', {}, function(data){
            window.location.reload();
          }).fail(function(xhr, status, err){
            console.log(status);
          });
        }
    });

    var loginBtn = document.getElementById('login-btn'),
        logoutBtn = document.getElementById('logout-btn');
    if (loginBtn){
      loginBtn.onclick = function(){
        navigator.id.request();
      };
    } else if (logoutBtn){
      logoutBtn.onclick = function(){
        navigator.id.logout();
      };
    }
