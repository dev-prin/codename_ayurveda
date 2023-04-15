<!-- Auth System -->
<%

    //Checking Session

    if(session.getAttribute("username") == null ) 
    {
        response.sendRedirect("admin.jsp");
    }
    
    HttpSession session_ = request.getSession(false);
    if (session_ == null || session_.equals("null")) {
        session_ = request.getSession();
        if( session_ == null || session_.equals("null"))
        {
            response.sendRedirect("admin.jsp");
        }
    }

%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&family=Lora&family=Montserrat&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="style.css">
    <link rel="shortcut icon" href="images/ggu-logo.png" type="image/x-icon">
    <title>Modify Plant Details</title>
    <style>
        *{
            box-sizing: border-box;
        }
    </style>
</head>
<body>
    <div>
        <!-- mobile and tablet header -->
        <section class="lg:hidden flex flex-col w-full bg-white border-b gap-y-4 items-center">
            <header class=" w-full px-10 flex justify-between items-center md:flex-row flex-col gap-y-4">
                <div onclick="blankRedirect('https://www.ggu.ac.in/')" class="cursor-pointer"><img
                        class="max-h-[70px] object-cover" src="images/ggu-image.png"></div>
                <div onclick="blankRedirect('https://aiia.gov.in/')" class="cursor-pointer"><img
                        class="max-h-[60px] object-cover" src="images/aiia-image.png"></div>
            </header>
    
            <!-- Logo and navigation -->
            <div class="flex justify-end bg-white items-end">
                <nav class=" flex w-min items-center self-end justify-end gap-x-7 py-1 pl-14 px-10">
                    <div
                        class="nav-font-size cursor-pointer px-2 py-1 font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        Home</div>
                    <div
                        class="nav-font-size cursor-pointer px-2 py-1 font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        About</div>
                    <div
                        class="nav-font-size cursor-pointer px-2 py-1 font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        Academic</div>
                    <div
                        class="nav-font-size cursor-pointer px-2 py-1 font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        Administration</div>
                </nav>
            </div>
    
        </section>
    
        <!-- header -->
        <section class="hidden header-section h-[160px] lg:flex flex-col justify-between">
    
            <header class="w-full h-[90px] px-10 flex justify-between items-center ">
                <div onclick="blankRedirect('https://www.ggu.ac.in/')" class="cursor-pointer"><img
                        class="2xl:h-[90px] max-h-[90px] object-cover" src="images/ggu-image.png"></div>
                <img class="h-28 object-cover cursor-pointer" onclick="redirectHome()" src="images/gg.png">
                <div onclick="blankRedirect('https://aiia.gov.in/')" class="cursor-pointer"><img
                        class="2xl:h-[90px] max-h-[90px] object-cover" src="images/aiia-image.png"></div>
            </header>
            <!-- Logo and navigation -->
            <div class="flex justify-between items-end">
                <span class="xl:ml-[12%]">
                    <img class="filter invert" src="images/ayurveda-logo.png" alt="Ayurveda Logo" width="250"
                        height="60">
                </span>
                <nav class=" flex w-min items-center self-end justify-end gap-x-7 py-1 pl-14 px-10">
                    <div onclick="redirectHome()"
                        class="cursor-pointer px-2 py-1 text-xl font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        Home</div>
                    <div>
                        <button id="menu-about"
                            class="peer nav-font-size cursor-pointer px-2 py-1 text-xl font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                            About
                        </button>
                        <!-- the menu here -->
                        <div id="menu-item-about" class="hidden peer-hover:grid hover:grid grid-flow-row
                     bg-white drop-shadow-lg absolute z-10">
                            <a class="px-5 py-3 hover:bg-gray-200" href="nav-pages/about-ggu.html">About GGU</a>
                            <a class="px-5 py-3 hover:bg-gray-200" href="https://aiia.gov.in/about/">About AIIA</a>
                        </div>
                    </div>
                    <div
                        class="cursor-pointer px-2 py-1 text-xl font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                        Academic</div>
                    <div>
                        <button id="menu-administration"
                            class="peer nav-font-size cursor-pointer px-2 py-1 text-xl font-medium tracking-wide hover:bg-gray-300 rounded ease-in duration-200">
                            Administration
                        </button>
                        <!-- the menu here -->
                        <div id="menu-item-administration" class="hidden peer-hover:grid hover:grid grid-flow-row
                 bg-white drop-shadow-lg absolute z-10">
                            <a class="px-5 py-3 hover:bg-gray-200" href="nav-pages/visitor.html">Visitor</a>
                            <a class="px-5 py-3 hover:bg-gray-200" href="nav-pages/chancellor.html">Chancellor</a>
                            <a class="px-5 py-3 hover:bg-gray-200" href="nav-pages/vice-chancellor.html">Vice
                                Chancellor</a>
                            <a class="px-5 py-3 hover:bg-gray-200" href="nav-pages/registrar.html">Registrar</a>
                        </div>
                    </div>
                </nav>
            </div>
    
        </section>
    </div>
    <!-- header end -->
    <div id="UpdateSection">
        <h1 class="text-2xl my-5" style="text-align: center;">Delete plant details</h1>

    <h1 id="loadingIcon" style="display: none;">Lodinggg.......</h1>

    <diV class="flex gap-x-5 mb-10">
        <div style="width: 40%; display: inline-block; text-align: center;">
            <img src="images/white.png" id="myImg" style="margin-left: auto; width: 150px; height: 200px; border: 5px solid black; border-radius: 5px;" />
        </div>
        
        <div style="width: 40%; display: inline-block;">

            <form id="delete-form" method="post" enctype="multipart/form-data">
                <input type="hidden" id="id" name="id" value="-1" />

                <label for="com_name"><b>Comman Name : </b></label>
                <span id="com_name" name="com_name" ></span><br>


                <label for="sci_name">Scientific Name : </label>
                <span id="sci_name" name="sci_name" ></span><br>

                <label for="family_name">Family Name : </label>
                <span id="family_name" name="family_name" ></span><br>

            
                <label for="deletePdf">PDF : </label>
                <a href="#" target="_blank"  id="deletePdf" name="deletePdf">PDF LOGO</a><br> <br><br>       
                
                <input class="text-center text-lg inline-block mb-5 px-7 py-3 bg-red-600 text-white font-medium leading-snug rounded shadow-md hover:bg-blue-700 hover:shadow-lg focus:bg-blue-700 focus:shadow-lg focus:outline-none focus:ring-0 active:bg-blue-800 active:shadow-lg transition duration-150 ease-in-out"
                data-mdb-ripple="true" data-mdb-ripple-color="light" type="submit" value="Delete" id="deleteButton" disabled required/>
            </form>
        </div>
    </diV>

    </div>
    <hr/>
    <table style="margin: auto; width: 80%;">
        <thead>
            <tr>
                <th colspan="6">
                    <input class="block px-4 py-2 text-xl font-normal text-gray-700 bg-white bg-clip-padding border border-solid border-gray-300 rounded transition ease-in-out m-0 focus:text-gray-700 focus:bg-white focus:border-blue-600 focus:outline-none" type="text" id="search_query" style="width: 90%;" placeholder="Search Plants" autocomplete="search_item();" onkeyup="search_item();" oninput="search_item()"/>
                </th>
            </tr>
            <tr>
                <th>Image</th>
                <th>Comman Name</th>
                <th>Scientic Name</th>
                <th>family</th>
                <th>Pdf File</th>
                <th>Select</th>
            </tr>
        </thead>
        <tbody id="results">

        </tbody>
    </table>
    <style>
        tr{
            height: 50px;
        }
        table, tr, th, td{
            border: 2px solid black;
        }

        table, tr, th, td{
            border-collapse: collapse;
        }

        tr:nth-child(even){
            background-color:lightgrey;
        }
    </style>
    
        <!-- footer -->
        <footer class="h-[30vh] mt-10 bg-gray-200 py-4 flex flex-col justify-end items-center self-stretch">
            <div class="w-full mb-auto grid grid-cols-2 justify-between">
                <div><img class="invert" src="images/ayurveda-logo.png" alt="Ayurveda logo"></div>
                <ul class="justify-self-end mx-5 md:mx-10 lg:mx-40">
                    <li>More Links</li>
                    <li><a href="https://www.ggu.ac.in/" class="underline text-blue-500" target="_blank"
                            rel="noopener noreferrer">GGU</a></li>
                    <li><a href="https://aiia.gov.in/" class="underline text-blue-500" target="_blank"
                            rel="noopener noreferrer">AIIA</a></li>
                </ul>
            </div>
            <hr width="100%" style="height:1px;border-width:0;color:gray;background-color:gray;">
            <p class="text-center text-lg">Copyright &#169; 2022-2023</p>
        </footer>
    <script src="scripts/deleteData.js"></script>
    <script>loadTabs();</script>
</body>
</html>