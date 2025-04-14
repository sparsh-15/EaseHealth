<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!DOCTYPE html>
  <html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>EaseHealth - Your Healthcare Partner</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
    <link rel="stylesheet" href="static/css/nav.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">

    <style>
      /* ~~~~ */
      .hover-lift {
        transition: transform 0.2s ease;
      }

      .hover-lift:hover {
        transform: translateY(-5px);
      }

      .shadow {
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1) !important;
      }

      /* pic designn ~ start */

      /* From Uiverse.io by Lakshay-art */
      .face {
        position: relative;
        width: 300px;
        height: 350px;
        background-color: #6C757D;
        background: linear-gradient(180deg, #452824 184px, #f2bbad 34px);
        /* transform: translateX(0px); */
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        border-bottom-left-radius: 250px 250px;
        border-bottom-right-radius: 250px 250px;
        border: 5px solid black;
      }

      .hairs {
        height: 180px;
        background-color: #f2bbad;
        position: absolute;
        width: 290px;
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        top: 25px;
      }

      .snow {
        transform: translateX(150px);
        transform-origin: right;
      }

      .mountain-cap-1,
      .mountain-cap-2,
      .mountain-cap-3,
      .mountain-cap-4 {
        position: absolute;
        top: 20px;
        border-left: 20px solid transparent;
        border-right: 20px solid transparent;
        border-top: 40px solid #452824;
      }

      .mountain-cap-1 {
        left: -65px;
      }

      .mountain-cap-2 {
        left: -35px;
      }

      .mountain-cap-3 {
        left: -5px;
      }

      .mountain-cap-4 {
        left: 25px;
      }

      .earL {
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        border-bottom-left-radius: 250px 250px;
        border-bottom-right-radius: 250px 250px;
        height: 70px;
        width: 50px;
        background-color: #f2bbad;
        position: absolute;
        left: -30px;
        top: 150px;
        z-index: -1;
        border: 5px solid black;
      }

      .earR {
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        border-bottom-left-radius: 250px 250px;
        border-bottom-right-radius: 250px 250px;
        height: 70px;
        width: 50px;
        background-color: #f2bbad;
        position: absolute;
        right: -30px;
        top: 150px;
        z-index: -4;
        border: 5px solid black;
      }

      .eyeR {
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        border-bottom-left-radius: 250px 250px;
        border-bottom-right-radius: 250px 250px;
        height: 10px;
        width: 10px;
        background-color: black;
        position: absolute;
        left: 128px;
        top: 120px;
        z-index: 2;
        animation: blinkR 5s infinite linear;
      }

      .eyeL {
        border-top-right-radius: 250px 350px;
        border-top-left-radius: 250px 350px;
        border-bottom-left-radius: 250px 250px;
        border-bottom-right-radius: 250px 250px;
        height: 10px;
        width: 10px;
        background-color: black;
        position: absolute;
        right: 128px;
        top: 120px;
        z-index: 2;
        animation: blinkL 5s infinite linear;
      }

      .nose {
        background: #fefefe;
        width: 20px;
        height: 20px;
        border-radius: 50%;
        color: #0F0;
        position: absolute;
        top: 220px;
        left: 140px;
        scale: 1 1;
        transition: all ease-in-out .3s;
        z-index: 100;
      }

      .nose:hover {
        scale: 1 1.25;
        top: 236px;
      }

      .nose:active {
        animation: propeller .5s infinite linear;
        transform-origin: 50% -55px;
        scale: 1 1.25;
        top: 220px;
        animation-delay: .5s;
      }

      @keyframes propeller {
        to {
          transform: rotateZ(360deg);
        }
      }

      @keyframes blinkL {
        98% {
          height: 10px;
          width: 10px;
          right: 128px;
          top: 120px;
        }

        100% {
          height: 3px;
          width: 11px;
          right: 126px;
          top: 123px;
        }
      }

      @keyframes blinkR {
        98% {
          height: 10px;
          width: 10px;
          left: 128px;
          top: 120px;
        }

        100% {
          height: 3px;
          width: 11px;
          left: 126px;
          top: 123px;
        }
      }

      .nose:before {
        content: "";
        position: absolute;
        top: -64px;
        left: 50%;
        border: 10px solid transparent;
        border-bottom: 62px solid #fefefe;
        transform: translateX(-50%);
      }

      .mouth {
        position: absolute;
        top: 300px;
        left: 140px;
        background: #a36655;
        width: 25px;
        height: 18px;
        border: 5px solid black;
        border-radius: 50%;
        transition: all .3s linear;
      }

      .face:active .mouth {
        top: 290px;
        width: 60px;
        height: 25px;
        left: 123px;
        border-radius: 7px 7px 130px 130px;
      }

      .face:active .smileL {
        height: 30px;
        width: 30px;
      }

      .face:active .smileR {
        height: 30px;
        width: 30px;
      }

      .bo {
        z-index: 10;
        zoom: 0.8;
      }

      .smileL {
        position: absolute;
        height: 0px;
        width: 0px;
        rotate: 310deg;
        top: 180px;
        left: 70px;
        transition: all .1s linear;
      }

      .smileR {
        position: absolute;
        height: 0px;
        width: 0px;
        rotate: 310deg;
        top: 180px;
        right: 70px;
        transition: all .1s linear;
      }



      .quiz-card {
        text-align: center;
        padding: 20px;
      }

      .quiz-option {
        display: inline-block;
        margin: 10px;
        padding: 15px;
        border-radius: 15px;
        background: var(--light-bg);
        cursor: pointer;
        transition: var(--transition);
        width: 110px;
      }

      .quiz-option:hover {
        background: var(--primary-light);
        transform: translateY(-5px);
      }

      .quiz-option i {
        font-size: 1.8rem;
        color: var(--primary);
        margin-bottom: 10px;
      }

      /* Virtual pet */
      .virtual-pet {
        position: relative;
        text-align: center;
        padding: 20px;
      }

      .pet-status {
        display: flex;
        justify-content: center;
        gap: 15px;
        margin-top: 15px;
      }

      .pet-stat {
        font-size: 0.85rem;
        display: flex;
        align-items: center;
        gap: 5px;
      }

      .pet-stat i {
        color: var(--primary);
      }


      /*~~~~~~~~~~~~~~~~~~~~~~~~~~ pic designn ~ end */

      :root {
        --primary-color: #4285F4;
        --primary-dark: #1a73e8;
        --secondary-color: #34A853;
        --accent-color: #FBBC05;
        --danger-color: #EA4335;
        --light-bg: #f8f9fa;
        --dark-bg: #212529;
        --gradient-primary: linear-gradient(135deg, #4285F4 0%, #1a73e8 100%);
        --gradient-secondary: linear-gradient(135deg, #34A853 0%, #1e8e3e 100%);
        --gradient-accent: linear-gradient(135deg, #FBBC05 0%, #f29900 100%);
        --gradient-light: linear-gradient(135deg, #e0f7fa 0%, #bbdefb 100%);
        --gradient-dark: linear-gradient(135deg, #3949AB 0%, #303F9F 100%);
        --shadow-sm: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        --shadow-md: 0 0.5rem 1rem rgba(0, 0, 0, 0.1);
        --shadow-lg: 0 1rem 3rem rgba(0, 0, 0, 0.15);
        --radius-sm: 0.5rem;
        --radius-md: 0.75rem;
        --radius-lg: 1rem;
      }

      body {
        font-family: 'Segoe UI', Roboto, 'Helvetica Neue', Arial, sans-serif;
        background-color: #f5f7fa;
        color: #333;
      }

      .service-card {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-radius: var(--radius-md);
        overflow: hidden;
        height: 100%;
        background: white;
      }

      .service-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
      }

      .service-card .card {
        border: none;
        height: 100%;
      }

      .service-card .card-title {
        color: var(--primary-dark);
      }

      .btn-primary {
        background: var(--gradient-primary);
        border: none;
        border-radius: var(--radius-sm);
        transition: all 0.3s ease;
      }

      .btn-primary:hover {
        transform: translateY(-2px);
        box-shadow: var(--shadow-sm);
      }

      .btn-outline-primary {
        color: var(--primary-color);
        border-color: var(--primary-color);
        border-radius: var(--radius-sm);
        transition: all 0.3s ease;
      }

      .btn-outline-primary:hover {
        background: var(--gradient-primary);
        border-color: transparent;
        color: white;
        transform: translateY(-2px);
      }

      .hover-lift {
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        border-radius: var(--radius-md);
      }

      .hover-lift:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
      }

      .doctor-card {
        border-radius: var(--radius-md);
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: white;
      }

      .doctor-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
      }

      .doctor-img {
        height: 200px;
        object-fit: cover;
      }

      .article-card {
        border-radius: var(--radius-md);
        overflow: hidden;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        background: white;
      }

      .article-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
      }

      .article-date {
        background-color: var(--primary-color);
        border-radius: var(--radius-sm);
        padding: 5px 10px;
      }

      .badge-specialty {
        background-color: rgba(66, 133, 244, 0.1);
        color: var(--primary-color);
        font-weight: normal;
        border-radius: var(--radius-sm);
      }

      .section-title {
        position: relative;
        padding-bottom: 15px;
        margin-bottom: 30px;
        color: var(--dark-bg);
      }

      .section-title:after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 50%;
        transform: translateX(-50%);
        width: 50px;
        height: 3px;
        background: var(--gradient-primary);
      }

      .gradient-section {
        background: var(--gradient-light);
        color: #333;
        border-radius: var(--radius-lg);
        overflow: hidden;
      }

      .app-download {
        background: var(--gradient-dark);
        border-radius: var(--radius-lg);
      }

      .location-map {
        border-radius: var(--radius-md);
        overflow: hidden;
        box-shadow: var(--shadow-sm);
      }

      .text-primary {
        color: var(--primary-color) !important;
      }

      .bg-primary {
        background: var(--gradient-primary) !important;
      }

      .rounded-icon {
        display: flex;
        align-items: center;
        justify-content: center;
        background: rgba(66, 133, 244, 0.1);
        color: var(--primary-color);
        border-radius: 50%;
        width: 80px;
        height: 80px;
        margin: 0 auto 20px;
        transition: all 0.3s ease;
      }

      .hover-lift:hover .rounded-icon {
        background: var(--gradient-primary);
        color: white;
        transform: scale(1.1);
      }

      .stats-card {
        background: white;
        border-radius: var(--radius-md);
        padding: 20px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
      }

      .stats-card:hover {
        transform: translateY(-5px);
        box-shadow: var(--shadow-md);
      }

      .footer-links a {
        color: #dee2e6;
        text-decoration: none;
        transition: color 0.3s ease;
      }

      .footer-links a:hover {
        color: #fff;
      }

      .testimonial-card {
        border-radius: var(--radius-md);
        overflow: hidden;
        background: white;
      }

      .testimonial-img {
        width: 80px;
        height: 80px;
        object-fit: cover;
        border-radius: 50%;
        border: 3px solid #fff;
        box-shadow: var(--shadow-sm);
      }

      /* Custom gradient backgrounds */
      .bg-gradient-light {
        background: var(--gradient-light);
      }

      .bg-gradient-primary {
        background: var(--gradient-primary);
      }

      .bg-gradient-secondary {
        background: var(--gradient-secondary);
      }

      .bg-gradient-accent {
        background: var(--gradient-accent);
      }

      .text-gradient {
        background: var(--gradient-primary);
        background-clip: text;
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        display: inline-block;
      }

      /* Improved button styles */
      .btn {
        border-radius: var(--radius-sm);
        padding: 0.5rem 1.25rem;
        font-weight: 500;
        transition: all 0.3s ease;
      }

      .btn-lg {
        padding: 0.75rem 1.5rem;
        font-weight: 600;
      }

      .btn-light {
        background: white;
        color: var(--primary-dark);
        border: none;
      }

      .btn-light:hover {
        background: #f8f9fa;
        box-shadow: var(--shadow-sm);
        transform: translateY(-2px);
      }

      /* Enhanced cards */
      .card {
        border: none;
        border-radius: var(--radius-md);
        overflow: hidden;
      }

      .card-footer {
        background: transparent;
      }

      /* Subtle animations */
      @keyframes pulse {
        0% {
          transform: scale(1);
        }

        50% {
          transform: scale(1.05);
        }

        100% {
          transform: scale(1);
        }
      }

      .pulse-animation {
        animation: pulse 2s infinite ease-in-out;
      }

      /* Responsive adjustments */
      @media (max-width: 768px) {

        .doctor-img,
        .service-card img {
          height: 180px;
        }
      }
    </style>
  </head>

  <body>
    <!-- nav bar start -->
    <div class="container-fluid">
      <c:import url="nav.jsp" />
    </div>
    <!-- nav bar end -->
    <div class="container-fluid py-4 gradient-section ">
      <div class="container">
        <!-- Top Navigation Bar -->
        <div class="row align-items-center mb-4">
          <div class="col-md-4">
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb mb-0">
                <li class="breadcrumb-item">
                  <a href="index.do" class="text-decoration-none text-white">
                    <p class="fw-bold section-title"><i class="fas fa-home me-1 "></i>Home</p>
                  </a>
                </li>
              </ol>
            </nav>
          </div>

          <div class="col-md-4 d-flex justify-content-center">
            <div class="position-relative w-100">
              <input class="form-control form-control-lg rounded-pill pe-5" type="search"
                placeholder="Search for services, doctors..." aria-label="Search">
              <button class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-2" type="submit"
                style="z-index: 5;">
                <i class="fa fa-search text-primary"></i>
              </button>
            </div>
          </div>

          <div class="col-md-4 d-flex justify-content-end">
            <button class="btn btn-light me-2">
              <i class="fas fa-user-md me-1 text-primary"></i>For Doctors
            </button>
            <button class="btn btn-warning">
              <i class="fas fa-calendar-check me-1"></i>Book Appointment
            </button>
          </div>
        </div>

        <!-- Welcome Section -->
        <div class="row align-items-center">
          <div class="col-md-8">
            <h1 class="display-4 fw-bold  fw-bold section-title mb-3">Welcome to EaseHealth</h1>
            <p class="lead fw-bold section-title">Your trusted partner in convenient and accessible healthcare services
            </p>
          </div>
          <div class="col-md-4">
            <div class="d-flex justify-content-end gap-3">
              <div class="text-center">
                <div class="bg-white rounded-circle p-3 shadow mb-2 hover-lift">
                  <i class="fas fa-stethoscope fa-2x text-primary"></i>
                </div>
                <small class="fw-bold section-title">Find Doctors</small>
              </div>
              <div class="text-center">
                <div class="bg-white rounded-circle p-3 shadow mb-2 hover-lift">
                  <i class="fas fa-pills fa-2x text-primary"></i>
                </div>
                <small class="fw-bold section-title">Medicines</small>
              </div>
              <div class="text-center">
                <div class="bg-white rounded-circle p-3 shadow mb-2 hover-lift">
                  <i class="fas fa-flask fa-2x text-primary"></i>
                </div>
                <small class="fw-bold section-title">Lab Tests</small>
              </div>
            </div>
          </div>
        </div>
        <div class="container my-3">
          <div class="row align-items-center">
            <div class="col-md-5 text-center d-flex flex-column justify-content-center">
              <div class="character-box p-3  bg-light rounded shadow d-flex align-items-center">
                <!-- From Uiverse.io by Lakshay-art -->
                <div class="bo m-4">
                  <div class="face">
                    <div class="earL"></div>
                    <div class="earR"></div>
                    <div class="eyeL"></div>
                    <div class="eyeR"></div>
                    <div class="hairs"></div>
                    <div class="nose"></div>
                    <div class="mouth"></div>
                    <div class="smileL">
                      <svg xml:space="preserve" viewBox="0 0 65 65" xmlns="http://www.w3.org/2000/svg">
                        <filter id="blurMe">
                          <feGaussianBlur in="SourceGraphic" stdDeviation="2"></feGaussianBlur>
                        </filter>
                        <path
                          d="M25 19c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                        <path
                          d="M35 35c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                        <path
                          d="M45 50c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                      </svg>
                    </div>
                    <div class="smileR">
                      <svg xml:space="preserve" viewBox="0 0 65 65" xmlns="http://www.w3.org/2000/svg">
                        <filter id="blurMe">
                          <feGaussianBlur in="SourceGraphic" stdDeviation="2"></feGaussianBlur>
                        </filter>
                        <path
                          d="M25 19c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                        <path
                          d="M35 35c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                        <path
                          d="M45 50c-6 2-12 4-18 5-2 0-4-2-6-3 1-1 2-3 3-4 11-3 22-7 32-10 2-1 4 1 6 2-1 1-2 4-3 4-4 2-9 4-14 6z"
                          fill="#EF7F71" filter="url(#blurMe)"></path>
                      </svg>
                    </div>

                    <div class="snow">
                      <div class="mountain-cap-1"></div>
                      <div class="mountain-cap-2"></div>
                      <div class="mountain-cap-3"></div>
                      <div class="mountain-cap-4"></div>
                      <div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="p-3">
                  <h5 class="fw-bold mb-1 text-gradient" style="font-size: 1.3rem; display: flex; align-items: center; justify-content: center;">
                    <i class="fas fa-heartbeat me-2" style="color: #f94c66;"></i> Your Health Buddy
                  </h5>
                  <p class="text-muted small mb-0" style="font-size: 0.9rem; font-style: italic;">
                    Tap, hold, or hover to explore my healthy moods!
                  </p>
                </div>
                
              </div>
            </div>
            <div class="col-md-7 mt-2">
              <div class="row g-3">
                <!-- Mood Card 1 -->
                <div class="col-md-6">
                  <div class="card text-center p-3 h-100 shadow-sm">
                    <i class="fa-regular fa-face-smile fa-2x mb-2 text-primary"></i>
                    <h5>Smile Boost</h5>
                    <p class="text-muted small">Hold my cheeks to make me smile - it's good for mental health!</p>
                  </div>
                </div>

                <!-- Mood Card 2 -->
                <div class="col-md-6">
                  <div class="card text-center p-3 h-100 shadow-sm">
                    <i class="fa-solid fa-wind fa-2x mb-2 text-info"></i>
                    <h5>Nose Stretch</h5>
                    <p class="text-muted small">Hover over my nose to stretch it - deep breathing helps, y'know?</p>
                  </div>
                </div>

                <!-- Mood Card 3 -->
                <div class="col-md-6">
                  <div class="card text-center p-3 h-100 shadow-sm">
                    <i class="fa-solid fa-circle-notch fa-spin fa-2x mb-2 text-danger"></i>
                    <h5>Dizzy Drill</h5>
                    <p class="text-muted small">Hold my nose to feel the dizziness - like a spinning BP check!</p>
                  </div>
                </div>

                <!-- Mood Card 4 -->
                <div class="col-md-6">
                  <div class="card text-center p-3 h-100 shadow-sm">
                    <i class="fa-solid fa-handshake fa-2x mb-2 text-success"></i>
                    <h5>Friendly Shake</h5>
                    <p class="text-muted small">Pull my hand to shake - doctor's handshake style!</p>
                  </div>
                </div>
              </div>
            </div>
          </div>




        </div>

      </div>

      <div class="container py-5">
        <!-- Services Section -->
        <div class="row mb-5">
          <div class="col-12 text-center mb-4">
            <h2 class="fw-bold section-title">Our Healthcare Services</h2>
            <p class="text-muted">Comprehensive care for you and your family</p>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="service-card shadow">
              <div class="card h-100">
                <div class="position-relative">
                  <img src="static/media/images/ConsultDoctor.png" class="card-img-top" alt="Doctor Consultation">
                  <div
                    class="position-absolute top-0 end-0 bg-gradient-primary text-white px-3 py-2 rounded-bottom-start">
                    Popular
                  </div>
                </div>
                <div class="card-body">
                  <h5 class="card-title fw-bold">Doctor Consultation</h5>
                  <p class="card-text">Connect with top specialists and general physicians through video, phone, or
                    in-person appointments.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                  <div class="d-flex justify-content-between align-items-center">
                    <span class="text-primary fw-bold">Starting at 299rs</span>
                    <button class="btn btn-outline-primary">Book Now</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="service-card shadow">
              <div class="card h-100">
                <img src="static/media/images/LabTest.png" class="card-img-top" alt="Lab Tests">
                <div class="card-body">
                  <h5 class="card-title fw-bold">Lab Tests & Diagnostics</h5>
                  <p class="card-text">Book home sample collection for tests or schedule appointments at our partner
                    labs.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                  <div class="d-flex justify-content-between align-items-center">
                    <span class="text-primary fw-bold">20% Off</span>
                    <button class="btn btn-outline-primary">Book Test</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="service-card shadow">
              <div class="card h-100">
                <img src="static/media/images/MedicineDelivery.png" class="card-img-top" alt="Medicine Delivery">
                <div class="card-body">
                  <h5 class="card-title fw-bold">Medicine Delivery</h5>
                  <p class="card-text">Order prescription and OTC medicines with doorstep delivery within 2 hours.</p>
                </div>
                <div class="card-footer bg-transparent border-0">
                  <div class="d-flex justify-content-between align-items-center">
                    <span class="text-primary fw-bold">Free Delivery</span>
                    <button class="btn btn-outline-primary">Order Now</button>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="service-card shadow">
              <div class="card h-100">
                <img src="static/media/images/HealthPackages.png" class="card-img-top" alt="Health Packages">
                <div class="card-body">
                  <h5 class="card-title fw-bold">Health Packages</h5>
                  <p class="card-text">Comprehensive health checkups and preventive care packages for all age groups.
                  </p>
                </div>
                <div class="card-footer bg-transparent border-0">
                  <div class="d-flex justify-content-between align-items-center">
                    <span class="text-primary fw-bold">30% Off</span>
                    <button class="btn btn-outline-primary">View Plans</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Featured Doctors Section -->
        <div class="row mb-5">
          <div class="col-12 text-center mb-4">
            <h2 class="fw-bold section-title">Meet Our Top Doctors</h2>
            <p class="text-muted">Experienced specialists ready to provide quality care</p>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="doctor-card shadow">
              <img src="static/media/images/doctorLogo.png" class="doctor-img w-100" alt="Dr. Emma Wilson">
              <div class="p-3">
                <h5 class="fw-bold mb-1">Dr. LN Sharma </h5>
                <p class="text-primary mb-2">Cardiologist</p>
                <div class="mb-2">
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star-half-alt text-warning"></i>
                  <span class="ms-1">(120+)</span>
                </div>
                <p class="small mb-2">
                  <i class="fas fa-graduation-cap me-1"></i> MD, FACC
                  <br>
                  <i class="fas fa-hospital me-1"></i> City Heart Center
                </p>
                <button class="btn btn-primary w-100">Book Appointment</button>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="doctor-card shadow">
              <img src="static/media/images/doctorLogo.png" class="doctor-img w-100" alt="Dr. James Chen">
              <div class="p-3">
                <h5 class="fw-bold mb-1">Dr. Anand eknoriya</h5>
                <p class="text-primary mb-2">Neurologist</p>
                <div class="mb-2">
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <span class="ms-1">(98+)</span>
                </div>
                <p class="small mb-2">
                  <i class="fas fa-graduation-cap me-1"></i> MD, PhD
                  <br>
                  <i class="fas fa-hospital me-1"></i> Neuroscience Institute
                </p>
                <button class="btn btn-primary w-100">Book Appointment</button>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="doctor-card shadow">
              <img src="static/media/images/doctorLogo.png" class="doctor-img w-100" alt="Dr. Sarah Johnson">
              <div class="p-3">
                <h5 class="fw-bold mb-1">Dr. Sarah Johnson</h5>
                <p class="text-primary mb-2">Pediatrician</p>
                <div class="mb-2">
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <span class="ms-1">(145+)</span>
                </div>
                <p class="small mb-2">
                  <i class="fas fa-graduation-cap me-1"></i> MD, FAAP
                  <br>
                  <i class="fas fa-hospital me-1"></i> Children's Hospital
                </p>
                <button class="btn btn-primary w-100">Book Appointment</button>
              </div>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="doctor-card shadow">
              <img src="static/media/images/doctorLogo.png" class="doctor-img w-100" alt="Dr. Michael Grant">
              <div class="p-3">
                <h5 class="fw-bold mb-1">Dr. michelle goyal</h5>
                <p class="text-primary mb-2">Dermatologist</p>
                <div class="mb-2">
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star text-warning"></i>
                  <i class="fas fa-star-half-alt text-warning"></i>
                  <span class="ms-1">(87+)</span>
                </div>
                <p class="small mb-2">
                  <i class="fas fa-graduation-cap me-1"></i> MD, FAAD
                  <br>
                  <i class="fas fa-hospital me-1"></i> Skin Care Center
                </p>
                <button class="btn btn-primary w-100">Book Appointment</button>
              </div>
            </div>
          </div>

          <div class="col-12 text-center mt-3">
            <a href="#" class="btn btn-outline-primary btn-lg">View All Doctors <i
                class="fas fa-arrow-right ms-2"></i></a>
          </div>
        </div>

        <!-- Location Map Section -->
        <div class="row mb-5">
          <div class="col-12">
            <div class="gradient-section p-4 p-md-5 shadow">
              <div class="row align-items-center">
                <div class="col-lg-6 mb-4 mb-lg-0">
                  <h2 class="fw-bold mb-3">Find Us Near You</h2>
                  <p class="lead mb-4">With over 100+ locations across the country, quality healthcare is just around
                    the corner</p>

                  <div class="row g-3 mb-4">
                    <div class="col-md-6">
                      <div class="d-flex align-items-center bg-white p-3 rounded shadow-sm">
                        <i class="fas fa-clinic-medical fa-2x text-primary me-3"></i>
                        <div>
                          <h6 class="fw-bold mb-0">50+ Clinics</h6>
                          <small class="text-muted">Across major cities</small>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="d-flex align-items-center bg-white p-3 rounded shadow-sm">
                        <i class="fas fa-hospital-alt fa-2x text-primary me-3"></i>
                        <div>
                          <h6 class="fw-bold mb-0">25+ Hospitals</h6>
                          <small class="text-muted">Partner facilities</small>
                        </div>
                      </div>
                    </div>
                  </div>

                  <div class="mb-4">
                    <div class="input-group">
                      <input type="text" class="form-control form-control-lg" placeholder="Enter your zip code">
                      <button class="btn btn-primary btn-lg">
                        <i class="fas fa-search me-2"></i>Find Locations
                      </button>
                    </div>
                  </div>

                  <div class="d-flex flex-wrap gap-2">
                    <span class="badge bg-white text-dark p-2 fs-6">Indore</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Bhopal</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Gwalior</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Jabalpur</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Ujjain</span>
                    <span class="badge bg-white text-dark p-2 fs-6">+ 95 more</span>
                  </div>
                </div>

                <div class="col-lg-6">
                  <div class="location-map bg-white p-2 h-100">
                    <img src="static/media/images/map.png" alt="Location Map" class="img-fluid w-100 rounded">
                    <div class="p-3 bg-light rounded mt-2">
                      <h6 class="fw-bold">Legend:</h6>
                      <div class="d-flex flex-wrap gap-3">
                        <div class="d-flex align-items-center">
                          <span class="d-inline-block bg-primary rounded-circle me-2"
                            style="width: 12px; height: 12px;"></span>
                          <small>Clinics</small>
                        </div>
                        <div class="d-flex align-items-center">
                          <span class="d-inline-block bg-success rounded-circle me-2"
                            style="width: 12px; height: 12px;"></span>
                          <small>Hospitals</small>
                        </div>
                        <div class="d-flex align-items-center">
                          <span class="d-inline-block bg-warning rounded-circle me-2"
                            style="width: 12px; height: 12px;"></span>
                          <small>Pharmacies</small>
                        </div>
                        <div class="d-flex align-items-center">
                          <span class="d-inline-block bg-info rounded-circle me-2"
                            style="width: 12px; height: 12px;"></span>
                          <small>Labs</small>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        <!-- Health Articles Section -->
        <div class="row mb-5">
          <div class="col-12 text-center mb-4">
            <h2 class="fw-bold section-title">Health & Wellness Articles</h2>
            <p class="text-muted">Stay informed with the latest health tips and medical news</p>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="article-card shadow h-100">
              <div class="position-relative">
                <img src="static/media/images/HealthArticle1.png" class="w-100" alt="Health Article">
                <div class="position-absolute bottom-0 start-0 p-3">
                  <span class="article-date text-white small">March 10, 2025</span>
                </div>
              </div>
              <div class="p-4">
                <div class="d-flex gap-2 mb-3">
                  <span class="badge badge-specialty">Wellness</span>
                  <span class="badge badge-specialty">Nutrition</span>
                </div>
                <h5 class="fw-bold mb-3">10 Superfoods to Boost Your Immune System Naturally</h5>
                <p class="text-muted mb-3">Discover natural foods that can help strengthen your body's defenses against
                  illness and infection.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="d-flex align-items-center">
                    <small class="text-muted">Dr. Lisa Chen</small>
                  </div>
                  <a href="#" class="text-primary">Read More</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="article-card shadow h-100">
              <div class="position-relative">
                <img src="static/media/images/HealthArticle2.png" class="w-100" alt="Health Article">
                <div class="position-absolute bottom-0 start-0 p-3">
                  <span class="article-date text-white small">March 12, 2025</span>
                </div>
              </div>
              <div class="p-4">
                <div class="d-flex gap-2 mb-3">
                  <span class="badge badge-specialty">Mental Health</span>
                  <span class="badge badge-specialty">Stress</span>
                </div>
                <h5 class="fw-bold mb-3">5 Mindfulness Techniques to Reduce Anxiety and Stress</h5>
                <p class="text-muted mb-3">Learn practical mindfulness exercises you can incorporate into your daily
                  routine for better mental health.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="d-flex align-items-center">
                    <img src="/api/placeholder/40/40" class="rounded-circle me-2" alt="Author">
                    <small class="text-muted">Dr. Robert Wilson</small>
                  </div>
                  <a href="#" class="text-primary">Read More</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-4">
            <div class="article-card shadow h-100">
              <div class="position-relative">
                <img src="static/media/images/HealthArticle3.png" class="w-100" alt="Health Article">
                <div class="position-absolute bottom-0 start-0 p-3">
                  <span class="article-date text-white small">March 14, 2025</span>
                </div>
              </div>
              <div class="p-4">
                <div class="d-flex gap-2 mb-3">
                  <span class="badge badge-specialty">Fitness</span>
                  <span class="badge badge-specialty">Heart Health</span>
                </div>
                <h5 class="fw-bold mb-3">The Ultimate Guide to Heart-Healthy Exercise Routines</h5>
                <p class="text-muted mb-3">Expert-recommended workout plans designed to improve cardiovascular health
                  for all fitness levels.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="d-flex align-items-center">
                    <small class="text-muted">Dr. Michael Brown</small>
                  </div>
                  <a href="#" class="text-primary">Read More</a>
                </div>
              </div>
            </div>
          </div>

          <div class="col-12 text-center mt-3">
            <a href="#" class="btn btn-outline-primary btn-lg">View All Articles <i
                class="fas fa-arrow-right ms-2"></i></a>
          </div>
        </div>

        <!-- Specialty Services Section -->
        <div class="row mb-5">
          <div class="col-12 text-center mb-4">
            <h2 class="fw-bold section-title">Specialized Healthcare Services</h2>
            <p class="text-muted">Comprehensive specialized care for specific health needs</p>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-heartbeat fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Cardiology</h5>
              <p class="text-muted mb-3">Complete heart care from diagnostic tests to advanced treatments.</p>
              <a href="#" class="btn btn-sm btn-outline-primary">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-baby fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Pediatrics</h5>
              <p class="text-muted mb-3">Specialized care for infants, children, and adolescents.</p>
              <a href="#" class="btn btn-sm btn-outline-primary">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-brain fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Neurology</h5>
              <p class="text-muted mb-3">Expert diagnosis and treatment of disorders of the nervous system.</p>
              <a href="#" class="btn btn-sm btn-outline-primary">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-bone fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Orthopedics</h5>
              <p class="text-muted mb-3">Treatment for bones, joints, ligaments, tendons, and muscles.</p>
              <a href="#" class="btn btn-sm btn-outline-primary">Learn More</a>
            </div>
          </div>
        </div>

        <!-- App Download Section -->
        <div class="row mb-5">
          <div class="col-12">
            <div class="app-download p-4 p-md-5 text-white shadow">
              <div class="row align-items-center">
                <div class="col-md-7">
                  <h2 class="fw-bold mb-3">Get EaseHealth Mobile App</h2>
                  <p class="lead mb-4">Access healthcare services anytime, anywhere with just a few taps</p>

                  <div class="row mb-4">
                    <div class="col-md-6 mb-3">
                      <div class="d-flex align-items-center">
                        <div class="bg-white rounded-circle p-2 me-3">
                          <i class="fas fa-calendar-check text-primary fa-lg"></i>
                        </div>
                        <span>Book appointments instantly</span>
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <div class="d-flex align-items-center">
                        <div class="bg-white rounded-circle p-2 me-3">
                          <i class="fas fa-video text-primary fa-lg"></i>
                        </div>
                        <span>Video consultations</span>
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <div class="d-flex align-items-center">
                        <div class="bg-white rounded-circle p-2 me-3">
                          <i class="fas fa-prescription-bottle-alt text-primary fa-lg"></i>
                        </div>
                        <span>Medicine reminders</span>
                      </div>
                    </div>
                    <div class="col-md-6 mb-3">
                      <div class="d-flex align-items-center">
                        <div class="bg-white rounded-circle p-2 me-3">
                          <i class="fas fa-file-medical text-primary fa-lg"></i>
                        </div>
                        <span>Digital health records</span>
                      </div>
                    </div>
                  </div>

                  <div class="d-flex flex-wrap gap-3">
                    <button class="btn btn-light btn-lg shadow">
                      <i class="fab fa-apple me-2"></i>App Store
                    </button>
                    <button class="btn btn-light btn-lg shadow">
                      <i class="fab fa-google-play me-2"></i>Google Play
                    </button>
                  </div>
                </div>
                <div class="col-md-5 mt-4 mt-md-0 text-center">
                  <img src="/api/placeholder/300/500" alt="Mobile App" class="img-fluid shadow-lg"
                    style="max-height: 400px; border-radius: 20px;">
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Call to Action Section -->
      <div class="bg-gradient-primary text-white py-5 mb-5">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-lg-8 mb-4 mb-lg-0">
              <h2 class="fw-bold mb-3">Ready to prioritize your health?</h2>
              <p class="lead mb-0">Join thousands of satisfied patients who trust EaseHealth for their healthcare needs.
              </p>
            </div>
            <div class="col-lg-4 text-lg-end">
              <a href="#" class="btn btn-light btn-lg pulse-animation">Get Started Today</a>
            </div>
          </div>
        </div>
      </div>

      <!-- Footer -->
      <footer class="bg-dark text-light py-5">
        <div class="container">
          <div class="row g-4">
            <div class="col-lg-4 col-md-6">
              <h5 class="fw-bold mb-3">EaseHealth</h5>
              <p class="mb-3">Making quality healthcare accessible for everyone, everywhere.</p>
              <div class="d-flex gap-3 mb-3">
                <a href="#" class="text-light"><i class="fab fa-facebook-f fa-lg"></i></a>
                <a href="#" class="text-light"><i class="fab fa-twitter fa-lg"></i></a>
                <a href="#" class="text-light"><i class="fab fa-instagram fa-lg"></i></a>
                <a href="#" class="text-light"><i class="fab fa-linkedin-in fa-lg"></i></a>
              </div>
              <p class="small text-muted">© 2025 EaseHealth. All rights reserved.</p>
            </div>

            <div class="col-lg-2 col-md-6">
              <h6 class="fw-bold mb-3">Services</h6>
              <ul class="list-unstyled footer-links">
                <li class="mb-2"><a href="#">Doctor Consultation</a></li>
                <li class="mb-2"><a href="#">Lab Tests</a></li>
                <li class="mb-2"><a href="#">Medicine Delivery</a></li>
                <li class="mb-2"><a href="#">Health Packages</a></li>
                <li><a href="#">All Services</a></li>
              </ul>
            </div>

            <div class="col-lg-2 col-md-6">
              <h6 class="fw-bold mb-3">Resources</h6>
              <ul class="list-unstyled footer-links">
                <li class="mb-2"><a href="#">Health Articles</a></li>
                <li class="mb-2"><a href="#">Find a Doctor</a></li>
                <li class="mb-2"><a href="#">Find a Location</a></li>
                <li class="mb-2"><a href="#">Health Tools</a></li>
                <li><a href="#">FAQs</a></li>
              </ul>
            </div>

            <div class="col-lg-2 col-md-6">
              <h6 class="fw-bold mb-3">Company</h6>
              <ul class="list-unstyled footer-links">
                <li class="mb-2"><a href="#">About Us</a></li>
                <li class="mb-2"><a href="#">Careers</a></li>
                <li class="mb-2"><a href="#">Press</a></li>
                <li class="mb-2"><a href="#">Contact Us</a></li>
                <li><a href="#">Terms & Privacy</a></li>
              </ul>
            </div>

            <div class="col-lg-2 col-md-6">
              <h6 class="fw-bold mb-3">Download App</h6>
              <div class="mb-2">
                <a href="#" class="btn btn-outline-light btn-sm mb-2 w-100">
                  <i class="fab fa-apple me-2"></i>App Store
                </a>
              </div>
              <div>
                <a href="#" class="btn btn-outline-light btn-sm w-100">
                  <i class="fab fa-google-play me-2"></i>Google Play
                </a>
              </div>
            </div>
          </div>
        </div>
      </footer>




      <script src=" https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

      <script src="static/js/nav.js"></script>



  </body>

  </html>


  <!-- style="background: linear-gradient(135deg, #2c3e50 0%, #3498db 100%);" -->