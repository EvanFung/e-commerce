$(document).ready(function() {
            $('#login_message').hide();
            $('#register_message').hide();
            $('#login').hide();
            $('#btn_login').click(function(event) {
                    var username = $('#username').val();
                    var password = $('#password').val();
                    
                    $.ajax({
                        type: 'POST',
                        url: 'login',
                        data: {
                            "username" : username,
                            "password" : password
                        },
                        success: function(responseText) {
                            if(responseText!='True'){
                                $('#login_message').show();
                                $('#login_message').text(responseText);
                                $('#login_message').effect("shake");
                            }else {
                                $('#login_message').attr('class', 'alert alert-success');
                                $('#login_message').show();
                                $('#login_message').text("Login Successfully.");
                                
                                setTimeout(function(){
                                   $('#login').modal('toggle');
                                   location.reload();
                                }, 500);
                            }
                        }
                    });
            });
            
            $('#btn_register').click(function() {
                alert("gender");
                    var first_name = $('#first_name').val();
                    var last_name = $('#last_name').val();
                    var gender = $('#gender').val();
                    var address = $('#address').val();
                    var password = $('#pass').val();
                    var confirmPassword = $('#confirmPassword').val();
                    var email = $('#email').val();
                    
                    $.ajax({
                        type: "POST",
                        url: 'register',
                        data:{
                            "first_name" : first_name,
                            "last_name" : last_name,
                            "password" : password,
                            "email" : email,
                            "gender" : gender,
                            "address" : address,
                            "confirmPassword":confirmPassword
                        },
                        success: function(responseText) {
                            if(responseText==""){
                                $('#register_message').attr('class', 'alert alert-success');
                                $('#register_message').show();
                                $('.sa-innate-form').hide();
                                $('#register_message').html('Register Successfully. <a href="#" id="test">Press here to Login</a>');
                            }else {
                                $('#register_message').show();
                                $('#register_message').html(responseText);
                                
                            }
                        }
                    });
            });
            
             $('body').on('click', '#test', function () {
                 $('li a[href="#sectionA"]').tab('show');
                 $('.sa-innate-form').show();
             }); 
             
             $('body').on('click', '#link_logout', function () {
                 document.cookie = "username=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                 document.cookie = "password=; expires=Thu, 01 Jan 1970 00:00:00 UTC";
                 location.reload();
             }); 
});