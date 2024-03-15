<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>WeatherVue: Your Forecast Portal</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Libre+Baskerville:wght@700&family=Open+Sans:wght@400;500;600&display=swap" rel="stylesheet">   

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/animate/animate.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner-border text-primary" role="status" style="width: 3rem; height: 3rem;"></div>
    </div>
    <!-- Spinner End -->



<!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-white navbar-light sticky-top px-4 px-lg-5">
        <a href="index.html" class="navbar-brand d-flex align-items-center">
            <h1 class="m-0">WeatherVue</h1>
        </a>
        <button type="button" class="navbar-toggler me-0" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto p-4 p-lg-0">
                <a href="/WeatherAPISDPProject" class="nav-item nav-link active">Home</a>
                <a href="about" class="nav-item nav-link">About</a>
                <a href="service" class="nav-item nav-link">Services</a>
                <a href="weather" class="nav-item nav-link">Weather</a>
                <a href="userreg" class="nav-item nav-link">login</a>
                
                <a href="contact" class="nav-item nav-link">Contact</a>
            </div>
           
        </div>
    </nav>
    <!-- Navbar End -->

    <!-- Bootstrap Static Header -->
<div style="background: url(https://bootstrapious.com/i/snippets/sn-static-header/background.jpg)" class="jumbotron bg-cover text-white">
  <div class="container py-5 text-center">
      <h1 class="display-1 text-white mb-5 animated slideInRight">Sunny Summer Delights</h1>
      <p class="font-italic mb-0">Paris, known as the "City of Love," is famous for its iconic landmarks and rich culinary and cultural experiences. Bali offers a tropical escape with lush landscapes and vibrant traditions. Cape Town boasts diverse landscapes and outdoor adventures, while Las Vegas is synonymous with extravagant entertainment.</p>
      <p class="font-italic">Snippe by
          <a href="https://bootstrapious.com" class="text-white">
              <u>Bootstrapious</u>
          </a>
      </p>
      <a href="#" role="button" class="btn btn-primary px-5">See All Features</a>
  </div>
</div>

<!-- For Demo Purpose -->

    <!-- Navbar End -->
    
    <!-- Copyright Start -->
    
  <!-- Copyright End -->

    <style>
        /* Encapsulated CSS */
        .my-card-container {
          --card-height: 410px;
          --card-width: calc(var(--card-height) / 1.5);
          width: calc(20% - 20px); /* Adjust the width for 5 cards per row */
          margin: 10px; /* Add margin to create space between cards */
        }
      
        .my-card-container * {
          box-sizing: border-box;
        }
      
        .my-card-container body {
          width: 100vw;
          height: 100vh;
          margin: 0;
          display: flex;
          justify-content: center;
          align-items: center;
          background: #191c29;
        }
      
        .my-card-container .card {
          width: var(--card-width);
          height: var(--card-height);
          position: relative;
          display: flex;
          justify-content: center;
          align-items: flex-end;
          padding: 0 36px;
          perspective: 2500px;
          margin: 0 50px;
        }
      
        .my-card-container .cover-image {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
      
        .my-card-container .wrapper {
          transition: all 0.5s;
          position: absolute;
          width: 100%;
          z-index: -1;
        }
      
        .my-card-container .card:hover .wrapper {
          transform: perspective(900px) translateY(-5%) rotateX(25deg) translateZ(0);
          box-shadow: 2px 35px 32px -8px rgba(0, 0, 0, 0.75);
          -webkit-box-shadow: 2px 35px 32px -8px rgba(0, 0, 0, 0.75);
          -moz-box-shadow: 2px 35px 32px -8px rgba(0, 0, 0, 0.75);
        }
      
        .my-card-container .wrapper::before,
        .my-card-container .wrapper::after {
          content: "";
          opacity: 0;
          width: 100%;
          height: 80px;
          transition: all 0.5s;
          position: absolute;
          left: 0;
        }
      
        .my-card-container .wrapper::before {
          top: 0;
          height: 100%;
          background-image: linear-gradient(
            to top,
            transparent 46%,
            rgba(12, 13, 19, 0.5) 68%,
            rgba(12, 13, 19) 97%
          );
        }
      
        .my-card-container .wrapper::after {
          bottom: 0;
          opacity: 1;
          background-image: linear-gradient(
            to bottom,
            transparent 46%,
            rgba(12, 13, 19, 0.5) 68%,
            rgba(12, 13, 19) 97%
          );
        }
      
        .my-card-container .card:hover .wrapper::before,
        .my-card-container .wrapper::after {
          opacity: 1;
        }
      
        .my-card-container .card:hover .wrapper::after {
          height: 120px;
        }
      
        .my-card-container .title {
          width: 100%;
          transition: transform 0.5s;
        }
      
        .my-card-container .card:hover .title {
          transform: translate3d(0%, -50px, 100px);
        }
      
        .my-card-container .character {
          width: 100%;
          opacity: 0;
          transition: all 0.5s;
          position: absolute;
          z-index: -1;
        }
      
        .my-card-container .card:hover .character {
          opacity: 1;
          transform: translate3d(0%, -30%, 100px);
        }
        
        .my-card-grid {
          display: flex;
          flex-wrap: wrap;
          justify-content: space-evenly;
        }
      </style>
      
      <div class="my-card-grid">
        <a href="https://www.tripadvisor.in/Tourism-g187147-Paris_Ile_de_France-Vacations.html" alt="Mythrill" target="_blank" class="my-card-container">
          <div class="card">
            <div class="wrapper">
              <img src="img/ebg.jpg" class="cover-image" />
            </div>
            <img src="img/paris-title.png" class="title" />
            <img src="img/eifel.png" class="character" />
          </div>
        </a>
        <a href="https://www.tripadvisor.in/Tourism-g294226-Bali-Vacations.html" alt="Mythrill" target="_blank" class="my-card-container">
            <div class="card">
              <div class="wrapper">
                <img src="img/summer/balibg.jpg" class="cover-image" />
              </div>
              <img src="img/summer/balitxt.png" class="title" />
              <img src="img/summer/bali.png" class="character" />
            </div>
          </a>
          <a href="https://www.tripadvisor.in/Tourism-g1722390-Cape_Town_Western_Cape-Vacations.html" alt="Mythrill" target="_blank" class="my-card-container">
            <div class="card">
              <div class="wrapper">
                <img src="img/summer/capbg.jpeg" class="cover-image" />
              </div>
              <img src="img/summer/captxt.png" class="title" />
              <img src="img/summer/cap.png" class="character" />
            </div>
          </a>
          <a href="https://www.tripadvisor.in/Tourism-g1722390-Cape_Town_Western_Cape-Vacations.html" alt="Mythrill" target="_blank" class="my-card-container">
            <div class="card">
              <div class="wrapper">
                <img src="img/summer/vegasbg.jpg" class="cover-image" />
              </div>
              <img src="img/summer/vtxt.png" class="title" />
              <!-- <img src="img/summer/vegas.png" class="character" /> -->
            </div>
          </a>
          <a href="https://www.cometoparis.com/paris-guide/what-to-do-in-paris-s938" alt="Mythrill" target="_blank" class="my-card-container">
            <div class="card">
              <div class="wrapper">
                <img src="img/summer/safari.jpg" class="cover-image" />
              </div>
              <img src="img/summer/safaritxt.png" class="title" />
              <img src="img/summer/logosafari.png" class="character" />
            </div>
          </a>

          

      </div>
      


   



    


    


    


   


    <!-- Copyright Start -->
    <div class="container-fluid bg-secondary text-body copyright py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="fw-semi-bold" href="#">WeatherVue</a>, All Right Reserved.
                </div>
                
            </div>
        </div>
    </div>
    <!-- Copyright End -->





    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/parallax/parallax.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>