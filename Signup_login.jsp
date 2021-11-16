<%-- 
    Document   : Signup_login
    Created on : Nov 15, 2021, 9:59:28 AM
    Author     : Nandani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Patient addition form</title>

        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <link rel="stylesheet" href="radiobtn.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

    </head>
    <body style="background: url(https://cdn.pixabay.com/photo/2012/11/06/04/15/stestoskop-64276__340.jpg);background-size: cover;background-attachment: fixed">
        <div class="container">
            <div class="row">
                <div class="col m6 offset-m3">
                    <div class="card">
                        <div class="card-content">

                            <h3 style="margin-top: 5px;" class="center-align">New patient addition from!!</h3>
                            
                            <h5 id="msg" class="center-align"></h5>

                            <div class="form center-align">
                                <!--Creating form-->

                                <form action="Register1" method="post" id="myform">
                                    <input type="text" name="Patient_DBId" placeholder="Enter Patient DBID"/>
                                    <input type="text" name="Patient_InternalId" placeholder="Enter Patient Internal Id"/>
                                    <input type="text" name="Patient_Name" placeholder="Enter Patient Name"/>
<!--                                    <p style="text-align: left;"><u> Enter Patient Date Of Birth:</u></p><input type="date" name="Patient_DOB"/>-->
                                    <input type="text" name="Patient_ContactNumber" placeholder="Enter Patient Contact Number"/>
                                    <input type="email" name="Patient_ContactEmail" placeholder="Enter Patient Email"/>
                                    <input type="text" name="Patient_Occupation" placeholder="Enter Patient Occupation"/>
                                    <input type="text" name="Patient_IdNumber" placeholder="Enter Patient Id Number"/>
                                    <p style="text-align: left;"><u> Patient Date Of Birth:</u></p><input type="date" name="pdate"/>
                                    <div class="radio-group">
                                        <label class="radio">
                                            <u>Gender</u> : <input type="radio" value="male" name="gender"/>
                                            male
                                            <span></span>
                                        </label>
                                        <label class="radio">
                                           <input type="radio" value="female" name="gender">
                                            female
                                           <span></span>
                                         </label>
                                    </div>
                                   

                                    <div class="file-field input-field">
                                        <div class="btn">
                                            <span>Patient_IdType(Adhar,PAN)</span>
                                            <input name="image" type="file">
                                        </div>
                                        <div class="file-path-wrapper">
                                            <input class="file-path validate" type="text">
                                        </div>
                                    </div>

                                    <button type="submit" class="btn">Submit</button>

                                </form>

                            </div>

                            <div class="loader center-align" style="margin-top:10px; display: none;">

                                <div class="preloader-wrapper big active">
                                    <div class="spinner-layer spinner-blue-only">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="gap-patch">
                                            <div class="circle"></div>
                                        </div>
                                        <div class="circle-clipper right">
                                            <div class="circle">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="spinner-layer spinner-red">
                                    <div class="circle-clipper left">
                                        <div class="circle"></div>
                                    </div>
                                    <div class="gap-patch">
                                        <div class="circle"></div>
                                    </div><div class="circle-clipper right">
                                        <div class="circle"></div>
                                    </div>

                                    <div class="spinner-layer spinner-yellow">
                                        <div class="circle-clipper left">
                                            <div class="circle"></div>
                                        </div><div class="gap-patch">
                                            <div class="circle"></div>
                                        </div><div class="circle-clipper right">
                                            <div class="circle"></div>
                                        </div>

                                        <div class="spinner-layer spinner-green">
                                            <div class="circle-clipper left">
                                                <div class="circle"></div>
                                            </div><div class="gap-patch">
                                                <div class="circle"></div>
                                            </div><div class="circle-clipper right">
                                                <div class="circle"></div>
                                            </div>
                                        </div>
                                    </div>

                                    <h5>Please wait...</h5>

                                    <div class="preloader-wrapper small active">
                                        <div class="spinner-layer spinner-green-only">
                                            <div class="circle-clipper left">
                                                <div class="circle"></div>
                                            </div><div class="gap-patch">
                                                <div class="circle"></div>
                                            </div><div class="circle-clipper right">
                                                <div class="circle"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <script
                src="https://code.jquery.com/jquery-3.6.0.min.js"
                integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
            crossorigin="anonymous"></script>


            <script>
                $(document).ready(function () {

                    console.log("page is ready....")
                    
                    $("#myform").on('submit',function (event){
                        event.preventDefault();
                        
//                        var f=$(this).serialize();
                        let f=new FormData(this);
                        
                        console.log(f);
                        
                        $(".loader").show();
                        $(".form").hide();
                        
                        $.ajax({
                            url: "Register1",
                            data: f,
                            type: 'POST',
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                console.log("success......")
                                 $(".loader").hide();
                                 $(".form").show();
                                 if (data.trim() === 'done')
                                 {
                                     $('#msg').html("Successfully Registerd !!")
                                     $('#msg').addClass('green-text')
                                 } else
                                 {
                                     $('#msg').html("Something went wrong on server!!")
                                     $('#msg').addClass('red-text')
                                 }
                                 
                                 
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(data);
                                console.log("error.......");
                                $(".loader").hide();
                                $(".form").show();
                                $('#msg').html("Something went wrong on server!!")
                                $('#msg').addClass('red-text')
                            },
                            processData: false,
                            contentType: false
                            
                        })
                        
                    })

                })


            </script>
    </body>
</html>

