// パスワード表示
  $(function() {
      var password  = '#js-password';
      var passcheck = '#js-passcheck';
      var password_confirmation  = '#js-password_confirmation';
  	
      changeInputtype(password, password_confirmation, passcheck);
  });
  
  function changeInputtype(password, password_confirmation, passcheck) {
      $(passcheck).change(function() {       
          if ($(this).prop('checked')) {
              $(password).attr('type','text');
          } else {
              $(password).attr('type','password');
          }
          
          if ($(this).prop('checked')) {
              $(password_confirmation).attr('type','text');
          } else {
              $(password_confirmation).attr('type','password');
          }
      });
  }
  
