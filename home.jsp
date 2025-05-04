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
        text-align: center;
        padding: 20px;
        height: 100%;
        transition: var(--transition);
      }

      .doctor-info {
        margin: 15px 0;
      }

      .doctor-name {
        font-weight: 600;
        margin-bottom: 5px;
      }

      .doctor-specialty {
        color: var(--light-text);
        font-size: 0.85rem;
      }

      .star-rating {
        color: #FFD700;
        margin-bottom: 10px;
      }

      .selected-city-name {
        margin-right: 5px;
      }

      #selectedCityBadge {
        background-color: #e9f0ff;
        padding: 4px 8px;
        border-radius: 4px;
        margin-left: 8px;
        color: #007bff;
        border: 1px solid #b8daff;
      }

      .clear-city-filter {
        cursor: pointer;
      }

      .clear-city-filter:hover {
        color: #dc3545;
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
                <a href="#top_doctors" style="text-decoration: none;">
                <div class="bg-white rounded-circle p-3 shadow mb-2 hover-lift">
                  <i class="fas fa-stethoscope fa-2x text-primary"></i>
                </div>
               <small class="fw-bold section-title">Find Doctors</small>
              </div></a>
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
                  <h5 class="fw-bold mb-1 text-gradient"
                    style="font-size: 1.3rem; display: flex; align-items: center; justify-content: center;">
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

        <div class="container mt-5 mb-5">
          <div class="row align-items-center justify-content-between gy-3">

            <!-- Search Input -->
            <div class="col-lg-6 col-md-7">
              <div class="position-relative">
                <input class="form-control form-control-lg rounded-pill pe-5" type="search"
                  placeholder="Search for doctors by name or specialization..." aria-label="Search"
                  id="doctorSearchInput">
                <button class="btn btn-link position-absolute end-0 top-50 translate-middle-y me-3" type="submit"
                  style="z-index: 5;">
                  <i class="fa fa-search text-primary"></i>
                </button>
              </div>
            </div>

            <!-- Action Buttons -->
            <div class="col-lg-6 col-md-5 text-md-end text-center">
              <div class="d-flex justify-content-md-end justify-content-center gap-2">
                <div class="dropdown">
                  <button class="btn btn-outline-primary dropdown-toggle" type="button" id="cityFilterButton"
                    data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="fas fa-map-marker-alt me-1"></i> Filter by City
                  </button>
                  <span id="selectedCityBadge" class="d-none">
                    <span class="selected-city-name"></span>
                    <i class="fas fa-times-circle clear-city-filter"></i>
                  </span>
                  <ul class="dropdown-menu city-dropdown overflow-auto" style="height: 450px;"
                    aria-labelledby="cityFilterButton">
                    <c:forEach var="ct" items="${cities}">
                      <li><a class="dropdown-item" href="#" data-city="${ct.city}" data-state="${ct.state.state}">
                          ${ct.city} (${ct.state.state})
                        </a></li>
                    </c:forEach>
                    <!-- Add more cities dynamically or statically -->
                  </ul>
                </div>
                <button class="btn btn-warning">
                  <i class="fas fa-calendar-check me-1"></i> Book Appointment
                </button>
              </div>
            </div>

          </div>
        </div>

        <!-- Featured Doctors Section -->
        <div class="row mb-4 overflow-auto" style="height: 550px;" id="top_doctors">
          <div class="col-12">
            <div class="card">
              <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">Top Rated Doctors Near You</h5>

              </div>
              <div class="card-body">
                <div class="row top_doctors_row">
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card doctor-card h-100">
                      <div class="card-body">
                        <div class="text-center mb-3">
                          <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Doctor" class="rounded-circle"
                            style="width: 100px; height: 100px;">
                          <h5 class="mt-3 mb-1">Dr. Michael Chen</h5>
                          <p class="text-muted mb-1">Cardiologist</p>
                          <div class="text-warning mb-2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="text-muted ms-1">(4.7)</span>
                          </div>
                          <span class="badge-clinic-open">
                            <i class="fas fa-circle me-1"></i>Open Now
                          </span>
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                          <button class="btn btn-sm btn-outline-primary w-100 me-2">View
                            Profile</button>
                          <button class="btn btn-sm btn-primary w-100">Book
                            Now</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="col-md-6 col-lg-3 mb-3">
                    <div class="card doctor-card h-100">
                      <div class="card-body">
                        <div class="text-center mb-3">
                          <img src="https://randomuser.me/api/portraits/women/28.jpg" alt="Doctor"
                            class="rounded-circle" style="width: 100px; height: 100px;">
                          <h5 class="mt-3 mb-1">Dr. Jessica Williams</h5>
                          <p class="text-muted mb-1">Dermatologist</p>
                          <div class="text-warning mb-2">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <span class="text-muted ms-1">(4.9)</span>
                          </div>
                          <span class="badge-clinic-open">
                            <i class="fas fa-circle me-1"></i>Open Now
                          </span>
                        </div>
                        <div class="d-flex justify-content-between mt-3">
                          <button class="btn btn-sm btn-outline-primary w-100 me-2">View
                            Profile</button>
                          <button class="btn btn-sm btn-primary w-100">Book
                            Now</button>
                        </div>
                      </div>
                    </div>
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
                    <button class="btn btn-outline-primary" onclick="promptLogin()">Book Now</button>
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
                    <button class="btn btn-outline-primary" onclick="promptLogin()">Book Test</button>
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
                    <button class="btn btn-outline-primary" onclick="promptLogin()">Order Now</button>
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
                    <button class="btn btn-outline-primary" onclick="promptLogin()">View Plans</button>
                  </div>
                </div>
              </div>
            </div>
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
                    <label for="city" class="form-label fw-semibold">Select Your City</label>
                    <select class="form-select" id="clinic_city_id" name="city_id" required
                      onchange="showClinicsByCity(this.value)">
                      <option value="" disabled>Choose your location</option>
                      <c:forEach var="ct" items="${cities}">
                        <option value="${ct.cityId}" ${ct.city==user.city.city ? 'selected' : '' }>
                          ${ct.city} (${ct.state.state})
                        </option>
                      </c:forEach>
                    </select>
                  </div>
                  <!-- Clinics Container (to be filled dynamically via AJAX) -->


                  <div class="d-flex flex-wrap gap-2">
                    <span class="badge bg-white text-dark p-2 fs-6">Indore</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Bhopal</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Gwalior</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Jabalpur</span>
                    <span class="badge bg-white text-dark p-2 fs-6">Ujjain</span>
                    <span class="badge bg-white text-dark p-2 fs-6">+ 95 more</span>
                  </div>

                  <div class="row mt-3 g-3" id="clinicCardsContainer">
                    <!-- Example Clinic Card Template -->
                    <div class="col-md-6">
                      <div class="card h-100 shadow-sm">
                        <div class="card-body">
                          <h6 class="fw-bold">MediCare+ Primary Care Center</h6>
                          <p class="text-muted small mb-2">
                            <i class="fas fa-map-marker-alt me-2 text-danger"></i>
                            1234 Medical Blvd, Suite 100
                          </p>
                          <div class="d-flex align-items-center mb-2">
                            <span class="badge bg-success me-2">
                              <i class="fas fa-circle me-1"></i> Open Now
                            </span>
                            <span class="text-muted small">Closes at 7:00 PM</span>
                          </div>
                          <div class="text-warning mb-3">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star-half-alt"></i>
                            <span class="text-muted small ms-1">(4.7)</span>
                          </div>
                          <div class="d-flex justify-content-between">
                            <button class="btn btn-outline-primary btn-sm">
                              <i class="fas fa-directions me-1"></i>Directions
                            </button>
                            <button class="btn btn-primary btn-sm ms-2">
                              <i class="fas fa-calendar-plus me-1"></i>Book
                              Appointment
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                    <!-- End Clinic Card -->
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
              <a href="#" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                data-bs-target="#cardiologyModal">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-baby fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Pediatrics</h5>
              <p class="text-muted mb-3">Specialized care for infants, children, and adolescents.</p>
              <a href="#" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                data-bs-target="#pediatricsModal">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-brain fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Neurology</h5>
              <p class="text-muted mb-3">Expert diagnosis and treatment of disorders of the nervous system.</p>
              <a href="#" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                data-bs-target="#neurologyModal">Learn More</a>
            </div>
          </div>

          <div class="col-lg-3 col-md-6 mb-4">
            <div class="p-4 text-center bg-white rounded shadow hover-lift h-100">
              <div class="rounded-icon">
                <i class="fas fa-bone fa-2x text-primary"></i>
              </div>
              <h5 class="fw-bold">Orthopedics</h5>
              <p class="text-muted mb-3">Treatment for bones, joints, ligaments, tendons, and muscles.</p>
              <a href="#" class="btn btn-sm btn-outline-primary" data-bs-toggle="modal"
                data-bs-target="#orthopedicsModal">Learn More</a>
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
      <script src="static/js/home.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


      <!-- Cardiology Modal -->
      <div class="modal fade" id="cardiologyModal" tabindex="-1" aria-labelledby="cardiologyLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-danger text-white">
              <h5 class="modal-title" id="cardiologyLabel">
                <i class="fas fa-heartbeat me-2"></i>Cardiology - Heart Specialization
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                aria-label="Close"></button>
            </div>
            <div class="modal-body overflow-auto" style="max-height: 400px;">
              <div class="row">
                <div class="col-md-4 text-center mb-3">
                  <img
                    src="data:image/jpeg;base64,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"
                    alt="Cardiology illustration" class="img-fluid rounded mb-3">
                  <div class="badge bg-danger p-2 fs-6 mb-3">Specialized Care</div>
                </div>
                <div class="col-md-8">
                  <h4>What We Treat</h4>
                  <p>Cardiologists specialize in diagnosing and treating diseases of the cardiovascular system. This
                    includes heart rhythm disorders, coronary artery disease, heart failure, and more.</p>
                  <h5 class="mt-4">Common Conditions</h5>
                  <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item">Coronary Artery Disease</li>
                    <li class="list-group-item">Heart Rhythm Disorders (Arrhythmias)</li>
                    <li class="list-group-item">Heart Failure</li>
                    <li class="list-group-item">Valvular Heart Disease</li>
                    <li class="list-group-item">Hypertension (High Blood Pressure)</li>
                  </ul>
                  <h5 class="mt-3">Our Approach</h5>
                  <p>We combine cutting-edge diagnostic technology with personalized treatment plans to provide
                    comprehensive cardiac care. Our team works collaboratively to address both acute and chronic heart
                    conditions.</p>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-danger">Schedule Appointment</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Pediatrics Modal -->
      <div class="modal fade" id="pediatricsModal" tabindex="-1" aria-labelledby="pediatricsLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-primary text-white">
              <h5 class="modal-title" id="pediatricsLabel">
                <i class="fas fa-child me-2"></i>Pediatrics - Child Healthcare
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                aria-label="Close"></button>
            </div>
            <div class="modal-body overflow-auto" style="max-height: 400px;">
              <div class="row">
                <div class="col-md-4 text-center mb-3">
                  <img
                    src="data:image/jpeg;base64,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"
                    alt="Pediatrics illustration" class="img-fluid rounded mb-3">
                  <div class="badge bg-primary p-2 fs-6 mb-3">Child-Centered Care</div>
                </div>
                <div class="col-md-8">
                  <h4>What We Do</h4>
                  <p>Pediatricians focus on the physical, emotional, and social health of children from birth to young
                    adulthood. They handle preventive care, development monitoring, and illness treatment.</p>
                  <h5 class="mt-4">Our Services</h5>
                  <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item">Well-Child Visits and Immunizations</li>
                    <li class="list-group-item">Growth and Development Monitoring</li>
                    <li class="list-group-item">Acute Illness Treatment</li>
                    <li class="list-group-item">Chronic Disease Management</li>
                    <li class="list-group-item">Behavioral and Mental Health Screenings</li>
                  </ul>
                  <h5 class="mt-3">Child-Friendly Environment</h5>
                  <p>Our pediatric facilities are designed to be welcoming and comfortable for children of all ages. We
                    strive to create positive healthcare experiences that foster trust and reduce anxiety.</p>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-primary">Schedule Appointment</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Neurology Modal -->
      <div class="modal fade" id="neurologyModal" tabindex="-1" aria-labelledby="neurologyLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-info text-white">
              <h5 class="modal-title" id="neurologyLabel">
                <i class="fas fa-brain me-2"></i>Neurology - Nervous System Disorders
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                aria-label="Close"></button>
            </div>
            <div class="modal-body overflow-auto" style="max-height: 400px;">
              <div class="row">
                <div class="col-md-4 text-center mb-3">
                  <img
                    src="data:image/jpeg;base64,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"
                    alt="Neurology illustration" class="img-fluid rounded mb-3">
                  <div class="badge bg-info p-2 fs-6 mb-3">Advanced Neurological Care</div>
                </div>
                <div class="col-md-8">
                  <h4>Our Expertise</h4>
                  <p>Neurologists diagnose and treat diseases affecting the brain, spinal cord, and peripheral nerves.
                    Conditions include epilepsy, stroke, multiple sclerosis, and migraines.</p>
                  <h5 class="mt-4">Conditions We Treat</h5>
                  <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item">Stroke and Cerebrovascular Diseases</li>
                    <li class="list-group-item">Epilepsy and Seizure Disorders</li>
                    <li class="list-group-item">Multiple Sclerosis</li>
                    <li class="list-group-item">Parkinson's Disease and Movement Disorders</li>
                    <li class="list-group-item">Headaches and Migraines</li>
                  </ul>
                  <h5 class="mt-3">Diagnostic Capabilities</h5>
                  <p>Our department features state-of-the-art diagnostic tools including advanced neuroimaging,
                    electroencephalography (EEG), and electromyography (EMG) to accurately assess neurological
                    conditions.</p>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-info">Schedule Appointment</button>
            </div>
          </div>
        </div>
      </div>

      <!-- Orthopedics Modal -->
      <div class="modal fade" id="orthopedicsModal" tabindex="-1" aria-labelledby="orthopedicsLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header bg-success text-white">
              <h5 class="modal-title" id="orthopedicsLabel">
                <i class="fas fa-bone me-2"></i>Orthopedics - Bone & Joint Care
              </h5>
              <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                aria-label="Close"></button>
            </div>
            <div class="modal-body overflow-auto" style="max-height: 400px;">
              <div class="row">
                <div class="col-md-4 text-center mb-3">
                  <img
                    src="data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAkGBxAQEBUQEBAVEhUVFRUXFRYVDxgVFRUQFhcXFhUVFhUYHSggGBolHxUVIjEhJSkrLi4uGB8zODMtNygtLisBCgoKDg0OGhAQGy0lICUtLS0tLS8tLS0vLy0tLS0tLS8tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tL//AABEIALEBHAMBEQACEQEDEQH/xAAbAAACAwEBAQAAAAAAAAAAAAAAAwIEBQYBB//EADsQAAIBAgQCBwcDAgYDAQAAAAECAAMRBCExQRJRBWFxgZGhsQYTIjLB0fBCUnLh8SNigpKywhUzohT/xAAbAQADAQEBAQEAAAAAAAAAAAAAAQIDBAUGB//EADIRAAICAQMCBAUDBAIDAAAAAAABAhEDBCExEkEiUXHwBRMyYbGBkaFCwdHhFFIGI/H/2gAMAwEAAhEDEQA/APmc9s8gIAEACABAAgAQAIAEACABAAgAAQAkBGIkBGTZMLAVkgsZNjaFBnYKilmOgUEk9whwG74Nyl7I4oi7BKfUz5//ACDI+bAv5UivjPZ7EUhcqHA1KG9u4gHylxknwRKMkZnDKozs94YUFnnDCgs84YUFnhWKh2RKwKsiViHZErEVZAiA7IkRFWRIiGEACABAAgAQAIAEACABAAgAQAIAEACABAAgACAEgIybJgRibJgRk2TCxktmn0H0Q2JqcAPCozZuQ6usyZzUVY4R6mfSejMBRwy8NFAP3Mc2Y/5jv6TilJye51pKKpFfHVCCc/zujSIlIpMx215TQiznfaHo4C1ZRYMbOBs+oPfn3jrnRin1bGGWNboxeGa0YWHDCh2eFYUFkSsVDsiVhRVkCsRSZArEUmQKxDsgREVZEiIogREUEACABAAgAQAIAEACABAAgAQAIAEACAAIASAjETAjJbGARkNk1WMlsYFjIbOw9kyUpXA1Jz69PoB3Tnz8nRhex0HR2K4kAvmde3eczRsmGMYtaw0jiJmeTdh1ZZek0II4yl7ym1P9ym38hmvmBLxOpEzVxZx3DO6jz7PCIUOxZYRUVTC0KA8KxUOxbCIpCGcc4qNUmRY85JXS0RIiAiREUmQIiKRAxFBAAgAQAIAEACABAAgAQAIAEACABACQEYiYEZLGKIyGxiiMlsYqyiGxirGQ2dZ0NU91hQzgEEkr8QuVuVJA11BnLn52OvD9O5sYfBHi46ZsHHFYi4z1InO2bV5HmIrcDcLPdTlktrtzuN9RY+MEIovxgZCw2ubZHTITRJGbYyjUdKdSq1rqhK/zPwg+JE0xwuROSfTE5UUybAC5OQAFyTsAJ3nmJ2zp+g/Z0J/i1wpOyHMLzLDRj1aD087V635fhij6L4Z8JebxSdGninptdSqsNLFARbvnmy1+TtSPpsfwLDXit+/sZGJ9nqFXNG90d7C6n/STl3ETv0uu61UufyeH8T+DfJfVD6fx/r2y1hOjMNTW3ulc7tU+Inu0HcJ0uTZ4/wAuMeETD0KZ+Gki/wAaSjztMZ5VFbs6cGnlN7Kiw2LJA+Lh755mbUSu+KPqNH8Oh001dlesQ4Kt8QOqsAQe4ysOtkpXLdFar4PjePwKn75OK9oOi/cPxIP8NtN+Ft1PmR1dk9lb7o+OywcXRkkQMrFsIi0QIiKRGIYQAIAEACABAAgAQAIAEACABAAEBDAIxMYolEMYojIbGqJRDY1VjRDY1VlGbZv9E02GGqWuONgBf5bDIkj80nPn3aOrTukzpcLjMlRCASAL30Av+d84po7IMq4zBH3iZ5Klsr24wSbjx7YdiHtKiGIUWHDcnTnbYHwtNUqqzJO7E8KMrU2bhDDlpY3BPeBOmE0jPJj6kUqCJh3vcO2obP4UtsD+o3/M5q5da2MYQ+U9+SziemgfgHLPt5Txc+NyUpn2nw7MscseL7Nv36v+Cg+PZjlPMlF9j6vFkjW5cp4zgQkt5febYoNnna3LGjP/APLam1897n+09WPVJU2fIZowg20qE4vpAstxcnf+k0/48nsznhroQd7snhuk+IcJyOx2nHqdBNRck7PoPh/xnE5KElV/saOFqE66bTDTaaOSL33PR1/xF4XHw3F9/wDH++SxXw4ZCrjiRhY/05EfSeppZtL5U+UfLfEYRlL5+PdPn19/ycR0jgmo1DTOe4P7lOh/NwZ1HkPYpsIhoWwklIgREUeQGEACABAAgAQAIAEACABAAgBICMTGKIyGMUSiGNURkNjlEpGbY1VlIhsaqyjNs1ejsTl7tiAMyDbO+tieWR7zM5wtWaYslOmdHgwhZWQbC/K886SZ6kWaeKAJytll95mUzHLlXNsrEzuxxvGrPOyyccjaEvQDb2OZJmcsbXBrjzJ7PYwaIZnfj0sBfkAb+kE3Hg6ElJ7iPc5lgTfs3OZ9ZjOXg6a2u2ejgdZHkveqX2DC4M33/vqe2cs9+3+kvL+56+HO414n3/Vvu/7f/DVxnQhNJbG7G5sTtoD5N4TSE8dxVVXJx5pZf/ZLqbvhX77/AIKlHotqeTMLbi/pOpv5ni8+Dx2/l+G7rll6l0EvzCpdTpYHXlna03xzlLwvlHHkxRT6ovZmP0i6NZUpe74bgkklyf8ANttpbLPWbxi13Mfmriiz0dijkra7HnPPzaf5cvmY/f8Ao97T6/52P5OX9H77r+f3N7BVwRwtnLaWRJo5PmSxScXx+Sh7R9G+8p3XNlzXrU6r9R1i280xZOrZ8ozzYq8UeGcUZqc6FsJJSFkRFIjEUEACABAAgAQAIAEACABAAEAJrGSxqiUQxqiNEMaolGbHIJSM2xyiUZtjlWUjNsciyqIbOw6Dq4cKL1VWw/UwUg9hM83NhyOWyPVw6jF0q2WcdjqLHhpup7Dn4x49M47zQsmqUtoMzsVSuLjWdCOWRWoYgNloRKaM7Kfu+E1A2QJy7+X+4+Ezy00mdWmk02hVBATp/eckkehDIbmBw9NLFviIzNhvynPKLZ1xzJCq1YvULsLbAbBRoB+by/lpRpEPO29xNdAcu8n86o4TcXZhlipqgwtb3ZKtodR+3kZ17PePb+WcibVqXf8AhEMXg6VbIkK+zDRuXEN+3WdUW2rOacVdP9znMRRakxVhYg6ehB+sfJCbiy/g8bff4h5icOSPyna4Z62GS1Ea/qRuUcSrpYnMafnb6znzTeOSyLj3/Y79JhWaEsT59/hnI+0WA923vVHwMc/8rn0B+45TvTTVrg8vJilFtNbrkxiYGRAyS0QMQzyAwgAQAIAEACABAAgAQA9EBE1lEscojIY1BKRmxyCUjNjkEpGbHoJSM2xyCWjJseiykZtjVWMhsaqyqIbLK1nta/kJPyo+RX/Imu57SwT1W4kyI1JyHeZlkiork3xTlkfH6lfHJU4rOLG6jqtnpz1nLm4VHfp1uyODrAEX/kewZD6TBo64m1hqoI7fzLzmNbmvUkiDOOKX2JvcXVQi++mY231/NJDRV2itVG+3Zmfz7zXG2mjHIk0xT3Ujx7J24ZdSfqceZdLQ3HYb39K4+dNOtd1+39Zb2Yl4kcszFTcbSZRUlTLw5HCSlHkv4TG3sy/6hy5/WeNmvCpY57p8M+z0UY6lxz4tpJrqXv7cefqjewta+uY0ItqDzG858GsnCPRyjv1nwrHlk8ibTf7EMb0Hh6o/9SodmpjhzPUMj3id+LVKX1bHzer0Xy34d/ycf0t0RVw7WcErswUgd/IzrTT4PNcWmZhgB5EMIAEACABAAgAQAIAEAPRGIakZDGrKIY5BKRmxyCUjNj0EpGTHoJSM2PQS0ZNjkEpGbY5RKRm2OVZRm2MVYyWx5d+GyjIa23ack95Oz0sW2NJFDG12ccJy4c/Cxv5TDPFdNnVppPq6SgDmFG+fYo0H1nKztNPAVrnqlyj0RruzGMuuV9l+S8FuR4nsmUXW5tJXsSvkSNzYeOcuuE/VmblzJeiPK1K/54TNcGr5oqYllJsRnt6TbHJrh0Y5Ens1Y/AtadakpI5knF7mF09hwlZraN8Q79fMGNcBLaRhsWRuIEjnbcbiZZsSyRcWejodXLBkUov1+6Nzo/FZXubaA30HXPBlp3F0+T7Ra+OSCknszdRyo4nTjQ6MAD5bztwKSjUd/sfP67JCWS5Kvv5jai3XiNNmXUEZ2G4zOh5ek2xunzR52WmvM+d9IYU0qhQ2O4IFgVOYyOnZOgyu9yrEMIAEACABAAgAQAIAEAJCMTGpGiGNWUjNjklIzY9JSMmPSWjNj0lIyY9BKRmx6CWjJj0EpGbHKJSM2NUSiGy30dWvdRznnyW9nsRdKj3pHorjVnX5wM1GhXcfynPmnSUTr02O25HJNmMvLcD8MiMWkpGznFycDQ6HRqjhVyF9z5mOUk02+TNQcWorg28RTKHgPzMfATNRT9F7/wBFuTXq+Pf8gCL9Si3fv+dUN6vuylXUkuEDPaEIdXv36iyT6ffv0EVcOOLi1PP6/aL7Fc7kKG1hbrM6YTVbv9DCUHdJfqJ6XwnvU4lzZL5D9SbgdY+pmyfczlG/0OWqLeNkxZ7gsUaLaAqdQdLTDLijPk7sGqnjVLg63DIvAGovxUnzambHgPMHacqVOpbNdzeeRy3W6fYfjayrSN6hpoQbnj0DZajMZjL8EqMX3SaIc32Z84r1CzFixYndjdjyuZuQJMQwgAQAIAEACABAAgAQAksYmNSNGbHLKRDHJKRkx6S0ZsuYSjxm1wvMk5f1hKSirZMYObpGjU6KdWCr8QO+lu3lFHNGrewpYJXtuKamVNjN4uzlmnF0xqS0YsckpGbHpLRmxqRozZZwC+7VjvfWefJ2z21srGnFELlrr37Tiy+KdL0PQw+DHb9TH6U6JbhNantmw7f1DxzE7UlXSee5b9bMzBYgqwKkg72Nj3Gc8oKFt8e+TrWRzpLn3waWKx3HUFjoLFjmeI6zGKdUu5rNxTt9hqVRwqL2AuTzMpvlv0JSWyXr9yK4u5uTr6DlNYqtl2/LMJPq3b5/CL4B4f5ZjqUZfSZSW/ob43tv349CniDlbrA/PEyotp2imrVMbhnsZunOW/YyqEdu5i9PYPhb3ijImzdT8+w6+Mszku5hvExo9w+LqUjdGK+nhM5RT5NYtrgfjOnKtSmabhc/1cNmte9tbbCQoJcGnVfJjtGUiBiGEBhAAgAQAIAEACABACSxiY1I0ZscspEMcspGTHpLRmzpOgKCmmWLU6bXsHfM26ht65Tlzu2l28jp08ajfD8zdGRYjIG9iQQTpoDvkfWc0ptxpnTGFStGR03SANMjdLf7TYE9f2npaaVxPJ1kakUknUjgY9JaM2OWUjNjVMU5dMWx4odc0h9P5e0zzZS6U2ezCPXJIEF27Jjgjb6jp1M6XSu5bxrcKKvP4j2aD6+U9HTx5keNrZ0lBev+DExGARjxfKd7faaZMSlwZYdTKGz3Kq4Lhck5gAkHS+V7ETiyYMkPoPTxarFl+v3+nHvgrivcW3Ov2ExWOV8ce9zpc4JN3z72I0CS+egnQo9KOeUup2dEjnhBvmPQTFRS2NHN3ZWqqDppeZ01szpUk90NoIu4PUBvKTa4Y6T5R7WpA5VF+FvhYdWzdR6+YE2Uk9kZuLW7Rx/SGFalUam2xyPNdiIENUyk8TLQlpJohTSS0QMQwgMIAEACABAAgAQAIASEYmNSNEMaspGbHJKRmx6S0ZM3fZ+st+A8Fyci637lvkD3Tnzw/qN8E68J0/GWsuewz6rXOR5ziSTO6yj0kUaoVZclyHMW3uOZue+dmBzhHbc5M0cU5VLZlUYFT8r9xF/MfadMdSuJKjinoW94Oz0YF9uE9jAf8rTojkizjnpciJ//AJagz4T3WPpLU4mMsGRdhGIqWW/WAez8tJzfSPTfW/Qu0WHBf8655WeW9HuaWG3UPwKfqOmbHsm+KPhSXc58005OT4X9ivXqlmLHf8AnpxSiqR4M5OcnJiWMYJCmMktFKvTAbjA7fvMZx8jsxZL2kxCVBkeZJ85i0dfCNihVBFpky0QZcjf1y8JnlfBvgXJWTEcJtn3cpnZ0JGlQUOuhUndiPD85TaMn5/wJwXl/JQxuGWuvA/wuuQbkdweYM0oz+zOTxlBqbFHFiPTYg7iQFUVWiLQppJaIGIoIAEACABAAgAQAIAEAPRGJjUjIY1TKIY5DKRmx6GUjJjkMozZtYHpuoluIB7c7g+ImcsEZFx1E4l1elkqEmotiT2jxGflIemr6WWtWn9RYXDo4ujed/OR1ZI7TVmiUJbwdHnBUXr84KWN8OmU3lXKtE0xjDb6+s1XX2aZn1Y+6aGV6/vEzA6/h17TM8mSVVwaQxQfi5FJTuLDsty2nI07o6FSQ7F1Ai+7GpsW7P0r9fCexp4f1P9D5/V5NuhfqUi06jhogzRFJCmMktIUxkstIzao4X6tvtMJKjuhLqiXMBXAbM90ymbRRrOM7mYyTcaOjH4ZJkKmHF7+Q+8wjI7JQo8pVkVvlN+d99sjNVJ1Rm0rsdiUFUFwOFlB3+YAb9ccZOLSFNKUW+5hdKUffUz+9ASvWurL9R19s3ku5jB3scu0yNUKaIpEYiggAQAIAEACABAAgAQA9EYhixksasZDHKZSM2OQykZschlIzY5DLRk0PQykZtFilUINwbR0nyRbXBoUekWHzZ+RmcsMWaR1ElyXqWMRtSB/IfWYS01bpfsdMdXezf7jzQU5jyJPlvObJGa72deKeN9qJqAl6hGSi+Y1bQDxtKw43OasnUZowg63Ml6pJJJuSbntM9hUlSPnXbdsiWjsVEC0VlJHiKzHhUFidABcyW0uTSMHJ0jWwvQF/irPwj9q2Ld50HnOaef8A6nfi0febJ4rA4MCxo36zUe/kcphLK0rkz0MOljKXTCNtmSaOGU2p0ivXxkk+M8+fxKKlSVo+gx/+PSlC26flz7/QZTxFyBLnqYTh4Wc0fhuXDlXWtt9yyOuRFmebHTF1EBFyNMxlNkzikhdatw2C759c2xq3uZzdIqFOCpl1Edhzm92jDhnK9LYcU6zoNA1x/FviXyImZ0FExFIjEMIAEACABAAgAQAIAEAAQAmsZLGqZRDGqZRmxymMzaHIZSIaHIZZm0ORo0ZtDkaUZtDVaVZm0MVpVktD6NdlN1Nomk+QjKUeBtbGO+TNcctBfnYZXhGEY8IU5znyxXFLszo84orHRp4Lod3+Kp8C8v1nu27/AAmM8yWyOvFpW95bfk2KSpSFkHCN+Z7TvOaUnLk7oRjBUkLeoW0mOTKoep1YcEsr8kZ2PIAzzM8nPOeR7/sfW/DsWLBG+PNv/JhFWLchOKUWnR9HjyQcbQ6jUs2QOw7JvjPN1jRoU6t/mM74Hy+pe57Vz+HxmyPOlyU6ik1Oy06cb8Jyz+otYjD/ABD+Iv2/lpSkTJbnK+16cOIHXTQ+bL/1ERuuEYRiKPIDCABAAgAQAIAEACABAAgBIGMTGKYyGNUyiGhqmMhoaplIzaHK0pGbQ1WlENDlaUZtDFaOyGhitHZDRMNHYqJccdk0WMJh3qtwoL8zoAOZMmU1FblwxSm6R0GDwVOjn8z/ALiNP4jbt1nNPI5Hfjwxx79xzYgnITJtRW5qk5OkSp0L5sZhLM3wdEMKX1CcTXVchMY43Lg6vnLGrZm1TfWdMcEYqvMyeuySad8bpe+SnXUnqmEdFjTt7noT+OZ5RpUvue0SBrtuI56X/p+xnH4o5KsnK7/5LyUQQDfLtkRjXJnkydW5LgBNh47DvlWcxOjg+Krfa1ydrAZnymkJ+EzcfEMeogNye7qmlMztXbOL9t866OBkaQA7VZ7+o8ZS2NVujnDAoIAEACABAAgAQAIAEACABAD0QETBjJYxTKJY1TGQ0NUyjNoYrSiGhqtGQ0NVpRDQxWjshoYGjslokHjsmjQ6N6Pesb/Km7W8l5mRPIomuPA5c8G+KqUl4EAAHmeZO5nO25bs7FFRVIiHJ1NhMJZlxE6I6eXMthy1VWYu29zVJRVIVWxhbIZTaGHzOeeevpKbG82pLg57be5BjAaFFYrGQKwsDwKYOnyNWuDS6Lo3b4zZTqS1gDtn5d8xyJVsbY273LfS2IHu+GloPmOhYcuoaGZ4VUtzXNK47GFxXnYchke2NO9Ki/JnXxCkf8TJfJ0Y/pOWiLCABAAgAQAIAEACABAAgAQAIASBjEyamMhjFMZLQxTKIaGq0ZDQxWjIaGK0qyWhgaOyGiYaOyaN3oPoxWHvqw+H9K/vPM/5fXs1yyZK2RviwrmRo47H7DIDIAZADqE5MuaGJXI9bS6HLqZVBbefZFBK9zmZwy1Usm3CPch8JhgV8vz/AMFk4rYazfDBz4PK1koYnT58iPETrO2MFE8XJkc+SanaUQNWiTFZXSOp4BjIci1Az8djsNT+E1Qx3CDit3jLzjSkxtJdzOPTlAHJah7lH/aPpYKj0e0qE8KUM9md75/xA+sXR5sq0uCk/SdV3Bd72NwBkoPUB66zVQSWxi5Ns66iQ632YfnrOKSpnWt0Y7LYkcjOlOznoR01Q97hag3S1Qf6fm/+S0cjXE96OIkmoQAIAEACABAAgAQAIAEACABAAEAJgxksmpjJaJgxktDFaMhoYGlEtDA0dkNEw0dktEuKOxUdnhq6lLLtYWGwAynn58ksfCPX0OCGZ+J1RQxS8RNv6+GnnPEyzlKVs+70WLHCCjFbFMUjpxEHrFjDHJqSbVl6uKcGk6+5fwtIz6PHkjKKcT841WKcJtS5/P3Ly4fnKbOTpHe7CrxMQi/uYhR4mRZooszsX7RUKeVMGsefyp55nwHbGoNjuK+5z/SPTdevk72X9i/CveNW7yZagkS5NmYWlCSIM0RaRAPY3G2ckqi850I7ftNEYyR1/s7iOOkBuv8AecmaO5viex5j0s56848T8IpqmRwhHFY6HIjmDkZr2FF0z59iqHu6j0z+hmX/AGkj6SToYuABAAgAQAIAEACABAAgAQAIAEAAGAEwYyWiYMZLRMNGS0TDRktEw0ZLRMNGTRLijsVGp0fjhaxbhOx/PSZzgpKmXjnLHLqixwxbhrMARzAtOKehxy8z2MHxzNjVNJmzQIZRo3KS9JDtsax+MZmvFv8Ax7/Ycg5XtyvmI443BmWXPHMiLPUGasT1bzrhki/qR5eTG1vEq42jTxP/ALDwuBYOPRhuJv01wZX1bM5jH4R6LcLi3IjNWHMHeKw6aKhaIaRAtEUkQJiKSIExFJF3CNxJbll3aj6+EuDMsq3s2/ZvF8FThO/qPwyMsbVixumdB0gt14uR8j+Cc+N1KjaatWUqet5ujI5X2rpcOLc7MFYd6gHzBiOnsZEACABAAgAQAIAEACABAAgAQAIAEAAGAEgYyaJgxiokGjJomGgKiQaMmiQaOxUe8ULFQ+ji2UW1HI/Q7QE42amA6QtppuOUlxsm3E2qOJDZqc5Lj2ZcZ90PWqG6m8j2TJxaN45L5IVaAbMZH17ZUMjj6EzgnuUsfh/e0zSfJhmjHZus/tOnhynRalujNOtpHJYmk1NijjhI1H16x1yC6EloDogTEVREmIdD8BUs9uYt36j8644vcnJG4mqlwQy6g3mj8jlOxwVVaq25r6zimul2dcXaKKixsdspunZjRzvtqn+NTbnSXxDN94HRHg5+AwgAQAIAEACABAAgAQAIAEACABAAgB6ICJCMTJCMTJCMklARIRiPYCPYAMw3zj82jRMuGb+A+YwkZQL7yEasvnWYI6BGP0Hb95rh+pmWTg5z2q1pfwP/ACM0lyVH6TAMkpETEMiYhk8N86/yX1EaB8G7RmzOJHR9B6J2NOTMdOIlX+du2VD6UTL6mc/7cfPR/gfWPubR4OZEYz//2Q=="
                    alt="Orthopedics illustration" class="img-fluid rounded mb-3">
                  <div class="badge bg-success p-2 fs-6 mb-3">Comprehensive Joint Care</div>
                </div>
                <div class="col-md-8">
                  <h4>What We Treat</h4>
                  <p>Orthopedic specialists treat musculoskeletal system issues: bones, joints, ligaments, tendons, and
                    muscles. They manage fractures, arthritis, sports injuries, and joint replacement surgeries.</p>
                  <h5 class="mt-4">Our Services</h5>
                  <ul class="list-group list-group-flush mb-3">
                    <li class="list-group-item">Joint Replacement Surgery</li>
                    <li class="list-group-item">Sports Medicine</li>
                    <li class="list-group-item">Fracture Care</li>
                    <li class="list-group-item">Arthroscopic Surgery</li>
                    <li class="list-group-item">Spine Disorders</li>
                  </ul>
                  <h5 class="mt-3">Our Approach</h5>
                  <p>We employ both surgical and non-surgical treatments to help restore mobility and reduce pain. Our
                    team includes orthopedic surgeons, physical therapists, and pain management specialists working
                    together for optimal outcomes.</p>
                </div>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
              <button type="button" class="btn btn-success">Schedule Appointment</button>
            </div>
          </div>
        </div>
      </div>

  </body>

  </html>