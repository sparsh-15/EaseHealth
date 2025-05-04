<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MediCare+ Patient Dashboard</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="static/css/nav.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
        <!-- Flatpickr CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

        <style>
            :root {
                --primary: #4361ee;
                --primary-light: #edf2ff;
                --secondary: #3f37c9;
                --success: #4cc9f0;
                --danger: #f72585;
                --warning: #f8961e;
                --info: #90e0ef;
                --dark: #252422;
                --light-text: #6c757d;
                --light-bg: #f8f9fa;
                --card-shadow: 0 8px 16px rgba(67, 97, 238, 0.1);
                --transition: all 0.3s ease;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f6f8fd;
                color: #1e293b;
                overflow-x: hidden;
            }

            /* Modern sidebar */
            .sidebar {
                background: white;
                color: var(--dark);
                height: 100vh;
                position: fixed;
                padding: 1.5rem 1rem;
                z-index: 100;
                overflow-x: hidden;
                box-shadow: 4px 0 15px rgba(0, 0, 0, 0.05);
                transition: var(--transition);
            }

            .sidebar-brand {
                padding: 0 1rem;
                white-space: nowrap;
                overflow: hidden;
                text-overflow: ellipsis;
                transition: all 0.3s ease;
            }

            .sidebar-header {
                border-bottom: 1px solid #eef0f7;
                padding-bottom: 1rem;
                margin-bottom: 1.5rem;
            }

            .sidebar-logo {
                font-weight: 700;
                color: var(--primary);
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .sidebar-logo i {
                background: var(--primary-light);
                color: var(--primary);
                padding: 8px;
                border-radius: 8px;
            }

            .sidebar .nav-link {
                color: var(--light-text);
                padding: 12px 15px;
                margin: 4px 0;
                border-radius: 10px;
                transition: var(--transition);
                font-size: 0.95rem;
                display: flex;
                align-items: center;
            }

            .sidebar .nav-link:hover,
            .sidebar .nav-link.active {
                background-color: var(--primary-light);
                color: var(--primary);
            }

            .sidebar .nav-link i {
                margin-right: 10px;
                width: 22px;
                text-align: center;
            }

            .main-content {
                margin-left: 250px;
                padding: 25px;
                transition: var(--transition);
            }

            /* Modern cards */
            .card {
                border: none;
                border-radius: 16px;
                box-shadow: var(--card-shadow);
                transition: var(--transition);
                margin-bottom: 25px;
                overflow: hidden;
            }

            .card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 20px rgba(67, 97, 238, 0.15);
            }

            .card-header {
                border-bottom: none;
                background-color: white;
                padding: 20px;
                font-weight: 600;
                font-size: 1.1rem;
            }

            .card-footer {
                background-color: white;
                border-top: 1px solid #eef0f7;
                padding: 15px 20px;
            }

            /* Section headers */
            .section-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }

            .section-title {
                font-weight: 600;
                color: var(--dark);
            }

            /* Buttons */
            .btn {
                border-radius: 10px;
                font-weight: 500;
                padding: 8px 18px;
                transition: var(--transition);
            }

            .btn-primary {
                background-color: var(--primary);
                border-color: var(--primary);
            }

            .btn-primary:hover {
                background-color: var(--secondary);
                border-color: var(--secondary);
                transform: translateY(-2px);
            }

            .btn-outline-primary {
                color: var(--primary);
                border-color: var(--primary);
            }

            .btn-outline-primary:hover {
                background-color: var(--primary);
                border-color: var(--primary);
                transform: translateY(-2px);
            }

            .btn-icon {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .btn-icon i {
                font-size: 0.9rem;
            }

            /* Custom components */
            .search-bar {
                border-radius: 12px;
                padding: 10px 20px;
                border: 1px solid #eef0f7;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.03);
            }

            .pill-badge {
                padding: 5px 12px;
                border-radius: 50px;
                font-size: 0.75rem;
                font-weight: 500;
                display: inline-flex;
                align-items: center;
                gap: 5px;
            }

            .pill-badge i {
                font-size: 0.7rem;
            }

            .badge-open {
                background-color: rgba(76, 201, 240, 0.15);
                color: var(--success);
            }

            .badge-closed {
                background-color: rgba(247, 37, 133, 0.15);
                color: var(--danger);
            }

            /* Profile components */
            .profile-avatar {
                width: 42px;
                height: 42px;
                border-radius: 12px;
                object-fit: cover;
            }

            .doctor-avatar {
                width: 50px;
                height: 50px;
                border-radius: 15px;
                object-fit: cover;
            }

            .large-avatar {
                width: 100px;
                height: 100px;
                border-radius: 20px;
                object-fit: cover;
            }

            .notification-dot {
                position: absolute;
                top: 0px;
                right: 0px;
                width: 12px;
                height: 12px;
                background: var(--danger);
                border: 2px solid white;
                border-radius: 50%;
            }

            /* Appointment styles */
            .appointment-card {
                border-left: 4px solid transparent;
                border-radius: 12px;
                margin-bottom: 15px;
                transition: var(--transition);
            }

            .appointment-card:hover {
                transform: translateX(5px);
            }

            .appointment-upcoming {
                border-left-color: var(--primary);
            }

            .appointment-today {
                border-left-color: var(--warning);
            }

            /* Calendar and date picker */
            .date-pill {
                text-align: center;
                padding: 10px;
                border-radius: 12px;
                cursor: pointer;
                transition: var(--transition);
                border: 1px solid #eef0f7;
            }

            .date-pill:hover {
                background-color: var(--primary-light);
            }

            .date-pill.active {
                background-color: var(--primary);
                color: white;
                border-color: var(--primary);
            }

            .date-pill .day {
                font-size: 0.8rem;
                color: var(--light-text);
            }

            .date-pill.active .day {
                color: rgba(255, 255, 255, 0.7);
            }

            .date-pill .date {
                font-weight: 600;
                font-size: 1.1rem;
            }

            .time-pill {
                padding: 8px 15px;
                border-radius: 10px;
                background-color: var(--light-bg);
                cursor: pointer;
                transition: var(--transition);
                margin: 5px;
                border: 1px solid transparent;
                font-size: 0.9rem;
            }

            .time-pill:hover {
                background-color: var(--primary-light);
                border-color: var(--primary);
                color: var(--primary);
            }

            .time-pill.active {
                background-color: var(--primary);
                color: white;
                border-color: var(--primary);
            }

            /* Health metrics */
            .metric-circle {
                position: relative;
                width: 110px;
                height: 110px;
            }

            .metric-label {
                font-size: 0.85rem;
                color: var(--light-text);
                margin-top: 10px;
                text-align: center;
            }

            .metric-value {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                font-size: 1.3rem;
                font-weight: 600;
            }

            .progress-label {
                display: flex;
                justify-content: space-between;
                font-size: 0.85rem;
                margin-bottom: 5px;
            }

            .progress-thin {
                height: 8px;
                border-radius: 4px;
                background-color: #eef0f7;
            }

            /* Quick stats */
            .stat-card {
                text-align: center;
                padding: 20px 15px;
                height: 100%;
            }

            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                margin: 0 auto 15px;
            }

            .stat-value {
                font-size: 1.8rem;
                font-weight: 600;
                margin-bottom: 5px;
            }

            .stat-label {
                color: var(--light-text);
                font-size: 0.85rem;
            }

            /* Article cards */
            .article-card {
                height: 100%;
                border-radius: 16px;
                overflow: hidden;
            }

            .article-img {
                height: 160px;
                object-fit: cover;
            }

            .article-meta {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-top: 15px;
            }

            .article-tag {
                font-size: 0.75rem;
                background-color: var(--primary-light);
                color: var(--primary);
                padding: 4px 10px;
                border-radius: 20px;
            }

            /* Doctor cards */
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

            /* Prescription cards */
            .medication-icon {
                width: 45px;
                height: 45px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                background-color: var(--primary-light);
                color: var(--primary);
            }

            /* Clinic cards */
            .clinic-card {
                height: 100%;
            }

            .clinic-info {
                display: flex;
                flex-direction: column;
                gap: 8px;
            }

            /* clinic booking modal days */

            .available-day {
                background-color: #e8f5e9;
                /* Light green background */
                color: #2e7d32;
                /* Darker green text for contrast */
                border: 1px solid #c8e6c9;
                /* Subtle green border */
                padding: 8px 12px;
                margin: 5px;
                border-radius: 5px;
                display: inline-block;
                /* Better for alignment */
                font-size: 14px;
                font-weight: 500;
                /* Semi-bold for better readability */
            }




            /* Mobile optimizations */
            @media (max-width: 992px) {
                .sidebar {
                    width: 70px;
                    padding: 1.5rem 0.5rem;
                }


                .sidebar .nav-link span,
                .sidebar-header h4,
                .sidebar-header p {
                    display: none;
                }

                .sidebar .nav-link {
                    justify-content: center;
                    padding: 12px;
                }

                .sidebar .nav-link i {
                    margin-right: 0;
                    font-size: 1.2rem;
                }

                .main-content {
                    margin-left: 70px;
                }

                .search-container {
                    width: 100%;
                    margin-bottom: 15px;
                }

                .top-bar {
                    flex-direction: column;
                    align-items: flex-start;
                }

                .top-bar-actions {
                    width: 100%;
                    justify-content: space-between;
                }
            }

            /* Fun animations */
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

            @keyframes float {
                0% {
                    transform: translateY(0px);
                }

                50% {
                    transform: translateY(-10px);
                }

                100% {
                    transform: translateY(0px);
                }
            }

            .pulse-animation {
                animation: pulse 2s infinite;
            }

            .float-animation {
                animation: float 3s ease-in-out infinite;
            }

            /* Fun health tracker mascot */
            .health-mascot {
                position: relative;
                text-align: center;
                margin-bottom: 20px;
            }

            .mascot-bubble {
                position: absolute;
                top: -40px;
                right: -20px;
                background: white;
                border-radius: 15px;
                padding: 8px 15px;
                font-size: 0.85rem;
                box-shadow: var(--card-shadow);
            }

            .mascot-bubble:after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 20px;
                border-width: 10px 10px 0;
                border-style: solid;
                border-color: white transparent;
            }

            /* Fun toggle */
            .toggle-wrapper {
                position: relative;
                display: inline-block;
            }

            .toggle-input {
                position: absolute;
                left: -9999px;
            }

            .toggle-label {
                display: block;
                position: relative;
                padding: 10px 15px 10px 45px;
                border-radius: 100px;
                cursor: pointer;
                background: var(--light-bg);
                transition: var(--transition);
            }

            .toggle-label:before {
                content: '';
                position: absolute;
                left: 5px;
                top: 5px;
                width: 28px;
                height: 28px;
                border-radius: 50%;
                background: white;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                transition: var(--transition);
            }

            .toggle-input:checked+.toggle-label {
                background: var(--primary);
                color: white;
            }

            .toggle-input:checked+.toggle-label:before {
                left: calc(100% - 33px);
            }

            /* Personality quiz */
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

            /* Dynamic greeting based on time */
            .greeting-card {
                background: linear-gradient(135deg, var(--primary), var(--secondary));
                color: white;
                padding: 25px;
                position: relative;
                overflow: hidden;
            }

            .greeting-card:before {
                content: '';
                position: absolute;
                top: -50px;
                right: -50px;
                width: 150px;
                height: 150px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.1);
            }

            .greeting-icon {
                font-size: 2.5rem;
                margin-bottom: 15px;
            }

            .confetti {
                position: absolute;
                width: 10px;
                height: 10px;
                opacity: 0.7;
                animation: confetti-fall 3s ease-in-out infinite;
            }

            /* .search-container {
                padding: 20px 0;
                background-color: #f8f9fa;
                border-radius: 10px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                margin-bottom: 30px;
            } */

            .search-bar-box {
                max-width: 500px;
                margin: 0 auto;
            }

            .search-bar-box .form-control {
                border-radius: 30px 0 0 30px;
                padding-left: 20px;
                height: 50px;
                font-size: 16px;
                border: 2px solid #e0e0e0;
                box-shadow: none;
                transition: all 0.3s;
            }

            .search-bar-box .form-control:focus {
                border-color: #4e73df;
                box-shadow: 0 0 0 0.2rem rgba(78, 115, 223, 0.25);
            }

            .search-bar-box .btn {
                border-radius: 0 30px 30px 0;
                height: 50px;
                padding: 0 25px;
                background-color: #4e73df;
                border-color: #4e73df;
                transition: all 0.3s;
            }

            .search-bar-box .btn:hover {
                background-color: #375bd2;
                border-color: #375bd2;
            }

            .search-bar-box .btn i {
                font-size: 18px;
            }

            .search-categories {
                margin-top: 15px;
                display: flex;
                justify-content: center;
                gap: 10px;
                flex-wrap: wrap;
            }

            .category-pill {
                background-color: #e8eafd;
                color: #4e73df;
                border-radius: 20px;
                padding: 5px 15px;
                font-size: 14px;
                display: inline-flex;
                align-items: center;
                transition: all 0.2s;
                border: none;
                cursor: pointer;
            }

            .category-pill:hover {
                background-color: #d8dcfc;
                transform: translateY(-2px);
            }

            .category-pill i {
                margin-right: 5px;
                font-size: 12px;
            }

            @media (max-width: 576px) {
                .search-bar-box .form-control {
                    height: 45px;
                }

                .search-bar-box .btn {
                    height: 45px;
                    padding: 0 15px;
                }
            }

            .time-box {
                background: linear-gradient(135deg, #fdfdfd, #f4faff);
                border: 1px solid #ddd;
                color: #333;
                transition: all 0.3s ease;
            }

            .time-box:hover {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            }

            .live-time {
                font-family: 'Courier New', Courier, monospace;
                letter-spacing: 1px;
            }

            /* blur disable if not a patient */
            /* Wrapper to apply blur only when locked */
            .blurred {
                position: relative;
                overflow: hidden;
                pointer-events: none;
            }

            .blurred::before {
                content: "";
                position: absolute;
                inset: 0;
                backdrop-filter: blur(4px);
                background: rgba(255, 255, 255, 0.6);
                z-index: 10;
                border-radius: 8px;
            }

            .locked-overlay {
                position: absolute;
                inset: 0;
                z-index: 11;
                color: #333;
                font-weight: 500;
                font-size: 0.95rem;
                background: transparent;
                pointer-events: none;
                padding: 1rem;
                animation: pulse 2s infinite ease-in-out;
            }

            @keyframes pulse {

                0%,
                100% {
                    transform: scale(1);
                }

                50% {
                    transform: scale(1.1);
                }
            }

            @keyframes confetti-fall {
                0% {
                    transform: translateY(-20px) rotate(0deg);
                    opacity: 1;
                }

                100% {
                    transform: translateY(100px) rotate(360deg);
                    opacity: 0;
                }
            }

            .mood-toast {
                position: fixed;
                bottom: 40px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #333;
                color: white;
                padding: 12px 20px;
                border-radius: 8px;
                font-size: 1rem;
                opacity: 0;
                pointer-events: none;
                transition: opacity 0.3s ease, bottom 0.3s ease;
                z-index: 9999;
            }

            .mood-toast.show {
                opacity: 1;
                bottom: 60px;
            }

            .quiz-option.selected {
                border: 2px solid #4CAF50;
                background-color: #eaffea;
                transform: scale(1.05);
                transition: all 0.2s ease;
            }

            /* clinic css */
            .clinic-option:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            }

            /* carousel css */
            .carousel-control-prev,
            .carousel-control-next {

                transition: all 0.3s ease-in-out;
            }

            .carousel-control-prev-icon,
            .carousel-control-next-icon {
                filter: invert(100%);
                width: 2.5rem;
                height: 2.5rem;
            }

            /* 🟡 Hover Effect: Increases size & adds glow */
            .carousel-control-prev:hover,
            .carousel-control-next:hover {
                background: rgba(255, 255, 255, 0.3);
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.4);
                transform: scale(1.1);
            }
        </style>
    </head>

    <body>

        <!-- complete_doctor_profile_modal  ->  start -->

        <div class="modal fade" id="completeProfileModal" tabindex="-1" aria-labelledby="completeProfileModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content rounded-4 shadow">
                    <div class="modal-header">
                        <h5 class="modal-title" id="completeProfileModalLabel">${user.name} Profile</h5>

                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form action="complete_patient_profile.do" method="post" enctype="multipart/form-data"
                        id="patient_profile_form">
                        <div class="modal-body">
                            <h5 class="text-muted">Let's Get to Know You Better</h5>

                            <!-- Gender -->
                            <div class="mb-3">
                                <label for="gender" class="form-label">
                                    <i class="fas fa-venus-mars me-2 text-danger"></i>Gender
                                </label>
                                <select class="form-select" id="gender" name="gender" required>
                                    <option value="" disabled selected>Select Gender</option>
                                    <option value="M">Male</option>
                                    <option value="F">Female</option>
                                    <option value="O">Other</option>
                                </select>
                            </div>

                            <!-- Blood Group -->
                            <div class="mb-3">
                                <label for="blood_group" class="form-label">
                                    <i class="fas fa-tint me-2 text-danger"></i>Blood Group
                                </label>
                                <select class="form-select" id="blood_group" name="blood_group" required>
                                    <option value="" disabled selected>Select Blood Group</option>
                                    <option>O+</option>
                                    <option>O-</option>
                                    <option>A+</option>
                                    <option>A-</option>
                                    <option>B+</option>
                                    <option>B-</option>
                                    <option>AB+</option>
                                    <option>AB-</option>
                                </select>
                            </div>

                            <!-- Weight -->
                            <div class="mb-3">
                                <label for="weight" class="form-label">
                                    <i class="fas fa-weight me-2 text-success"></i>Weight (kg)
                                </label>
                                <input type="number" name="weight" class="form-control" id="weight"
                                    placeholder="e.g. 65.5" step="0.1" name="weight" required>
                            </div>

                            <!-- Height -->
                            <div class="mb-3">
                                <label for="height" class="form-label">
                                    <i class="fas fa-ruler-vertical me-2 text-info"></i>Height (cm)
                                </label>
                                <input type="number" name="height" class="form-control" id="height"
                                    placeholder="e.g. 170" name="height" required>
                            </div>

                            <div class="mb-3">
                                <label for="dob" class="form-label">
                                    <i class="fas fa-birthday-cake me-2 text-info"></i>Date of Birth
                                </label>
                                <input type="date" name="dob" class="form-control" id="dob" required>
                            </div>

                            <!-- UID -->
                            <div class="mb-2">
                                <label for="uid" class="form-label">
                                    <i class="fas fa-id-card me-2 text-secondary"></i>Aadhar UID (optional)
                                </label>
                                <input type="text" name="uid" class="form-control" id="uid" name="uid"
                                    placeholder="12-digit UID" maxlength="12">
                            </div>
                        </div>
                        <!-- Profile Pic Upload -->
                        <div class="mb-2 text-center">
                            <label class="form-label fw-bold">
                                <i class="fas fa-image me-2 text-primary"></i>Upload Profile Picture
                            </label>
                            <input type="file" name="profile_pic" id="profile_pic" name="profile_pic" accept="image/*"
                                class="form-control w-75 mx-auto" required>
                            <small class="text-muted">Accepted formats: JPG, PNG (max 2MB)</small>
                        </div>

                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-user-check me-2"></i>Complete Profile
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>

        <!-- complete_doctor_profile_modal  ->  end -->

        <!-- appointment success alert  -->
        <% String message=request.getParameter("message"); %>
            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
            <% if (message !=null && !message.isEmpty()) { %>
                <script>
                    Swal.fire({
                        icon: '<%= message.toLowerCase().contains("success") ? "success" : "error" %>',
                        title: '<%= message.toLowerCase().contains("success") ? "Success!" : "Oops..." %>',
                        text: '<%= message %>',
                        confirmButtonColor: '#3085d6',
                        timer: 3000,
                        showConfirmButton: false
                    });
                </script>
                <% } %>

                    <div class="container-fluid sticky-top">
                        <c:import url="nav.jsp" />
                    </div>
                    <!-- Sidebar -->
                    <div class="sidebar col-md-3 col-lg-2 d-md-block">
                        <div class="text-center mb-4 sidebar-brand">
                            <h4 class="m-0 fw-bold">MediCare<span class="text-primary">+</span></h4>
                            <p class="small mb-0 text-muted">Patient Portal</p>
                        </div>
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#dashboard">
                                    <i class="fas fa-home"></i>
                                    <span>Dashboard</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#appointments">
                                    <i class="fas fa-calendar-check"></i>
                                    <span>Appointments</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#top_doctors">
                                    <i class="fas fa-user-md"></i>
                                    <span>Doctors</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#prescriptions">
                                    <i class="fas fa-prescription"></i>
                                    <span>Prescriptions</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#find_nearby_clinic">
                                    <i class="fas fa-file-medical"></i>
                                    <span>Find nearby clinics</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#health_articles">
                                    <i class="fas fa-newspaper"></i>
                                    <span>Health Articles</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#health_tracker">
                                    <i class="fas fa-heartbeat"></i>
                                    <span>Health Tracker</span>
                                </a>
                            </li>
                            <li class="nav-item mt-3">
                                <a class="nav-link" type="button" data-bs-toggle="offcanvas"
                                    data-bs-target="#user_offcanvas">
                                    <i class="fas fa-cog"></i>
                                    <span>Settings</span>
                                </a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="#help">
                                    <i class="fas fa-question-circle"></i>
                                    <span>Help & Support</span>
                                </a>
                            </li>
                        </ul>
                    </div>

                    <!-- Main Content -->
                    <div class="main-content">
                        <!-- Top Navigation -->
                        <div class="row gx-4 gy-3 mb-4 px-2">
                            <!-- Health Tip -->
                            <div class="col-md-6 col-lg-4">
                                <div class="card p-3 shadow-sm h-100" style="background: #f9fafe;">
                                    <h5 class="text-primary mb-3">
                                        <i class="fas fa-heartbeat me-2"></i>Today's Health Tip
                                    </h5>
                                    <div id="tipBox" class="text-secondary small fw-medium">
                                        Loading tips...
                                    </div>
                                </div>
                            </div>

                            <!-- Location Card -->
                            <div class="col-md-6 col-lg-4">
                                <div class="card shadow-sm border-0 h-100"
                                    style="background: linear-gradient(145deg, #ffffff, #f0f4f9); border-radius: 1rem;">
                                    <div class="card-body py-3 px-4">
                                        <div class="d-flex align-items-center mb-2">
                                            <div class="bg-primary text-white rounded-circle d-flex align-items-center justify-content-center me-3"
                                                style="width: 36px; height: 36px;">
                                                <i class="fas fa-map-marker-alt"></i>
                                            </div>
                                            <h6 class="mb-0 text-dark">Your Location</h6>
                                        </div>
                                        <div id="currentLocation" class="text-muted small fw-medium ps-5">
                                            ${user.city.city}, ${user.city.state.state}
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Modern Clock Card -->
                            <div class="col-md-6 col-lg-4">
                                <div class="card shadow-sm border-0 h-100"
                                    style="border-radius: 1rem; background: linear-gradient(to right, #eef3f8, #ffffff); transition: all 0.3s;">
                                    <div class="card-body d-flex align-items-center gap-3 p-4">
                                        <div class="bg-gradient-primary rounded-circle d-flex align-items-center justify-content-center shadow"
                                            style="width: 48px; height: 48px; background: linear-gradient(145deg, #2e86de, #6c5ce7); color: white;">
                                            <i class="fas fa-clock fa-lg"></i>
                                        </div>
                                        <div class="flex-grow-1">
                                            <div class="fw-bold fs-4 text-dark" id="liveClock"
                                                style="letter-spacing: 1px;">--:-- --</div>
                                            <div class="text-muted small mt-1" id="liveDate">Loading date...</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>

                        <!-- Welcome Section -->
                        <div class="row mb-4" id="dashboard">
                            <div class="col-lg-7">
                                <div class="card greeting-card">
                                    <div class="confetti" style="left: 20%; background-color: #4CC9F0;"></div>
                                    <div class="confetti"
                                        style="left: 40%; background-color: #F72585; animation-delay: 0.5s;">
                                    </div>
                                    <div class="confetti"
                                        style="left: 60%; background-color: #4361EE; animation-delay: 1s;"></div>
                                    <div class="confetti"
                                        style="left: 80%; background-color: #F8961E; animation-delay: 1.5s;">
                                    </div>

                                    <span class="greeting-icon">
                                        <i class="fas fa-sun"></i>
                                    </span>
                                    <h3>Good morning, ${user.name}!</h3>
                                    <div class="d-flex mt-3 flex-wrap gap-2">
                                        <c:choose>
                                            <c:when test="${details_report eq 'true' }">
                                                <div>
                                                    <p class="mb-3 fs-5 text-light">
                                                        <i class="fas fa-heartbeat text-danger me-2"></i>
                                                        Hello again! Your wellness is our priority.
                                                    </p>

                                                    <!-- Button Row -->
                                                    <div class="d-flex gap-3 flex-wrap">
                                                        <button
                                                            class="btn btn-light d-flex align-items-center gap-2 px-3 py-2 shadow-sm">
                                                            <i class="fas fa-plus text-primary"></i>
                                                            <span>Book Appointment</span>
                                                        </button>

                                                        <button
                                                            class="btn btn-light d-flex align-items-center gap-2 px-3 py-2 shadow-sm">
                                                            <i class="fas fa-video text-danger"></i>
                                                            <span>Video Consult </span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </c:when>
                                            <c:otherwise>
                                                <div
                                                    class="alert alert-warning d-flex align-items-center gap-2 p-3 shadow-sm">
                                                    <i class="fas fa-exclamation-circle text-warning fs-4"></i>
                                                    <div>
                                                        <h5 class="mb-1">Profile Incomplete</h5>
                                                        <p class="mb-0">Please complete your profile to access
                                                            appointments
                                                            and
                                                            consultations.</p>
                                                    </div>
                                                    <button class="btn btn-primary mt-3" data-bs-toggle="modal"
                                                        data-bs-target="#completeProfileModal">
                                                        Complete Now
                                                    </button>

                                                </div>
                                            </c:otherwise>

                                        </c:choose>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <div class="card h-90">
                                    <div class="card-body">
                                        <h5 class="mb-3">Mood Tracker</h5>
                                        <p>How are you feeling today?</p>
                                        <div class="quiz-option float-animation" data-mood="great"
                                            style="animation-delay: 0.2s;">
                                            <i class="far fa-smile"></i>
                                            <div>Great</div>
                                        </div>
                                        <div class="quiz-option float-animation" data-mood="okay"
                                            style="animation-delay: 0.4s;">
                                            <i class="far fa-meh"></i>
                                            <div>Okay</div>
                                        </div>
                                        <div class="quiz-option float-animation" data-mood="not-well"
                                            style="animation-delay: 0.6s;">
                                            <i class="far fa-frown"></i>
                                            <div>Not well</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <!-- Stats Section -->
                        <div class="row mb-4 requires-profile">
                            <div class="col-md-3 col-6 mb-3 mb-md-0">
                                <div class="card stat-card h-100">
                                    <div class="stat-icon"
                                        style="background-color: rgba(76, 201, 240, 0.15); color: var(--success);">
                                        <i class="fas fa-calendar-check"></i>
                                    </div>
                                    <div class="stat-value" id="appointment-stat">3</div>
                                    <div class="stat-label">Appointments</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6 mb-3 mb-md-0">
                                <div class="card stat-card h-100">
                                    <div class="stat-icon"
                                        style="background-color: rgba(67, 97, 238, 0.15); color: var(--primary);">
                                        <i class="fas fa-prescription-bottle-alt"></i>
                                    </div>
                                    <div class="stat-value" id="prescription-stat">${fn:length(activePrescriptions)}</div>
                                    <div class="stat-label">Prescriptions</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6">
                                <div class="card stat-card h-100">
                                    <div class="stat-icon"
                                        style="background-color: rgba(247, 37, 133, 0.15); color: var(--danger);">
                                        <i class="fas fa-file-medical"></i>
                                    </div>
                                    <div class="stat-value">8</div>
                                    <div class="stat-label">Records</div>
                                </div>
                            </div>
                            <div class="col-md-3 col-6">
                                <div class="card stat-card h-100">
                                    <div class="stat-icon"
                                        style="background-color: rgba(248, 150, 30, 0.15); color: var(--warning);">
                                        <i class="fas fa-user-md"></i>
                                    </div>
                                    <div class="stat-value">5</div>
                                    <div class="stat-label">Doctors</div>
                                </div>
                            </div>
                        </div>

                        <!-- Appointments and Calendar -->
                        <div class="row mb-4 requires-profile"
                            title="Please complete your profile to unlock this feature" id="appointments">
                            <div class="col-lg-12"></div>
                            <!-- Repeat this card for each appointment dynamically using JS -->
                            <div class="card mb-3 shadow-sm border-0">
                                <div class="card-header d-flex justify-content-between align-items-center">
                                    <h5 class="fw-semi-bold text-dark my-2">
                                        <i class="fas fa-calendar-check me-2 text-primary"></i> Upcoming Appointments
                                    </h5>
                                    <button id="appointment_toggle_btn"
                                        class="btn btn-sm btn-outline-primary d-none">View All</button>
                                </div>
                                <div class="card-body" id="appointmentsContainer">
                                    <div class="d-flex align-items-center">
                                        <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Doctor"
                                            class="doctor-img rounded-circle me-3"
                                            style="width: 60px; height: 60px; object-fit: cover;">
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1">
                                                Dr. Anand Eknoriya
                                                <span class="badge bg-success text-white ms-2">Confirmed</span>
                                            </h6>
                                            <p class="text-muted mb-1">Gynecologist · Anoopaa Clinic · Itanagar</p>
                                            <div class="d-flex align-items-center text-muted small">
                                                <i class="fas fa-calendar-day me-2 text-primary"></i>
                                                <span>Sunday, Apr 6, 2025</span>
                                                <i class="fas fa-clock ms-3 me-2 text-primary"></i>
                                                <span>10:42 PM</span>
                                            </div>
                                        </div>
                                        <div class="ms-auto d-flex flex-column gap-2">
                                            <button class="btn btn-sm btn-outline-primary">
                                                <i class="fas fa-video me-1"></i> Join
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-calendar-alt me-1"></i> Reschedule
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="text-center mt-0 mb-3">
                                    <button id="appointment_toggle_btn"
                                        class="btn btn-sm btn-outline-primary d-none">View All</button>
                                </div>
                            </div>
                        </div>

                        <!-- Top Doctors -->
                        <div class="row mb-4" id="top_doctors">
                            <div class="col-12">
                                <div class="card">
                                    <div class="row card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0 col-3">Top Rated Doctors</h5>
                                        <div class="search-container w-90 w-md-auto col-7">
                                            <div class="search-bar-box">
                                                <div class="input-group">
                                                    <input type="search" class="form-control" id="doctorSearchInput"
                                                        placeholder="Search doctors by name, specialization, city...">
                                                    <button class="btn btn-primary" type="submit">
                                                        <i class="fas fa-search"></i> Search
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="dropdown col-2">
                                            <button class="btn btn-outline-primary dropdown-toggle" type="button"
                                                id="cityFilterButton" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="fas fa-map-marker-alt me-1"></i> Filter by City
                                            </button>
                                            <span id="selectedCityBadge" class="d-none">
                                                <span class="selected-city-name"></span>
                                                <i class="fas fa-times-circle clear-city-filter"></i>
                                            </span>
                                            <ul class="dropdown-menu city-dropdown overflow-auto" style="height: 450px;"
                                                aria-labelledby="cityFilterButton">
                                                <c:forEach var="ct" items="${cities}">
                                                    <li><a class="dropdown-item" href="#" data-city="${ct.city}"
                                                            data-state="${ct.state.state}">
                                                            ${ct.city} (${ct.state.state})
                                                        </a></li>
                                                </c:forEach>
                                                <!-- Add more cities dynamically or statically -->
                                            </ul>
                                        </div>
                                    </div>
                                    <div class="card-body">
                                        <div class="row top_doctors_row">
                                            <div class="col-md-6 col-lg-3 mb-3">
                                                <div class="card doctor-card h-100">
                                                    <div class="card-body">
                                                        <div class="text-center mb-3">
                                                            <img src="https://randomuser.me/api/portraits/men/32.jpg"
                                                                alt="Doctor" class="rounded-circle"
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
                                                            <button
                                                                class="btn btn-sm btn-outline-primary w-100 me-2">View
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
                                                            <img src="https://randomuser.me/api/portraits/women/28.jpg"
                                                                alt="Doctor" class="rounded-circle"
                                                                style="width: 100px; height: 100px;">
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
                                                            <button
                                                                class="btn btn-sm btn-outline-primary w-100 me-2">View
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

                        <!-- Prescriptions and Health Metrics -->
                        <div class="row mb-4 requires-profile" id="prescriptions">
                            <div class="col-lg-7">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Active Prescriptions</h5>
                                        <a href="#" class="btn btn-sm btn-outline-primary">View All</a>
                                    </div>

                                    <div class="card-body">
                                        <c:choose>
                                            <c:when test="${not empty activePrescriptions}">
                                                <c:forEach var="pres" items="${activePrescriptions}">
                                                    <div class="prescription-card p-3 mb-3 border rounded shadow-sm">
                                                        <div class="d-flex align-items-center">
                                                            <div class="me-3">
                                                                <i class="fas fa-user-md fa-2x text-primary"></i>
                                                            </div>
                                                            <div>
                                                                <h6 class="mb-1">
                                                                    Dr.
                                                                    ${pres.appointment.clinicShift.clinic.doctor.user.name}
                                                                </h6>
                                                                <p class="text-muted mb-1">
                                                                    <i class="fas fa-clinic-medical me-2 text-info"></i>
                                                                    ${pres.appointment.clinicShift.clinic.clinicName}
                                                                </p>
                                                                <p class="text-muted mb-1">
                                                                    <i
                                                                        class="fas fa-map-marker-alt me-2 text-danger"></i>
                                                                    ${pres.appointment.clinicShift.clinic.address},
                                                                    ${pres.appointment.clinicShift.clinic.city.city}
                                                                </p>
                                                                <div class="d-flex align-items-center">
                                                                    <i
                                                                        class="fas fa-calendar-day me-2 text-primary"></i>
                                                                    <span>Appointment:
                                                                        ${pres.appointment.appointmentDate}</span>
                                                                    <i
                                                                        class="fas fa-notes-medical ms-3 me-2 text-success"></i>
                                                                    <span>Reason: ${pres.appointment.reason}</span>
                                                                </div>
                                                                <div class="mt-2">
                                                                    <i
                                                                        class="fas fa-prescription-bottle-alt me-2 text-warning"></i>
                                                                    <span>Prescription ID:
                                                                        <strong>${pres.prescriptionCode}</strong>
                                                                    </span>
                                                                </div>
                                                            </div>
                                                            <div class="ms-auto">
                                                                <button class="btn btn-sm btn-outline-primary"
                                                                    onclick="showPrescription('${pres.appointment.appointmentId}')">View
                                                                    Details</button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="text-muted">No prescriptions found.</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>

                                </div>
                            </div>
                            <div class="col-lg-5" id="health_tracker">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Health Metrics</h5>
                                        <a href="#" class="btn btn-sm btn-outline-primary">View Details</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="row align-items-center mb-4">
                                            <div class="col-4">
                                                <div class="health-metric">
                                                    <svg width="100" height="100" viewBox="0 0 36 36">
                                                        <path
                                                            d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                                            fill="none" stroke="#eee" stroke-width="3" />
                                                        <path
                                                            d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                                            fill="none" stroke="#1e88e5" stroke-width="3"
                                                            stroke-dasharray="75, 100" />
                                                    </svg>
                                                    <div class="metric-value">75%</div>
                                                </div>
                                                <p class="text-center mt-2 mb-0">Overall</p>
                                            </div>
                                            <div class="col-8">
                                                <div class="mb-3">
                                                    <div class="d-flex justify-content-between mb-1">
                                                        <span>Blood Pressure</span>
                                                        <span>120/80</span>
                                                    </div>
                                                    <div class="progress progress-thin">
                                                        <div class="progress-bar bg-success" style="width: 85%"></div>
                                                    </div>
                                                </div>
                                                <div class="mb-3">
                                                    <div class="d-flex justify-content-between mb-1">
                                                        <span>Weight</span>
                                                        <span>68 kg</span>
                                                    </div>
                                                    <div class="progress progress-thin">
                                                        <div class="progress-bar bg-primary" style="width: 70%"></div>
                                                    </div>
                                                </div>
                                                <div>
                                                    <div class="d-flex justify-content-between mb-1">
                                                        <span>Heart Rate</span>
                                                        <span>72 bpm</span>
                                                    </div>
                                                    <div class="progress progress-thin">
                                                        <div class="progress-bar bg-info" style="width: 90%"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <button class="btn btn-outline-primary btn-sm w-100">Update Metrics</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Health Articles -->
                        <div class="row mb-4" id="health_articles">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-header d-flex justify-content-between align-items-center">
                                        <h5 class="mb-0">Featured Health Articles</h5>
                                        <a href="#" class="btn btn-sm btn-outline-primary">Browse Library</a>
                                    </div>
                                    <div class="card-body">
                                        <div class="row">
                                            <div class="col-md-4 mb-3 ">
                                                <div class="card article-card shadow h-100">
                                                    <img src="static/media/images/HealthArticle1.png"
                                                        class="article-img class=w-100 " alt="Article Image">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Understanding Heart Health: Key Facts
                                                        </h5>
                                                        <p class="card-text text-muted">Learn about the latest research
                                                            on
                                                            cardiovascular health and preventative measures.</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <small class="text-muted">5 min read</small>
                                                            <button class="btn btn-sm btn-outline-primary">Read
                                                                More</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <div class="card article-card">
                                                    <img src="/api/placeholder/800/400" class="article-img"
                                                        alt="Article Image">
                                                    <div class="card-body">
                                                        <h5 class="card-title">Nutrition Myths Debunked</h5>
                                                        <p class="card-text text-muted">Our experts separate fact from
                                                            fiction about
                                                            the
                                                            most common nutrition misconceptions.</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <small class="text-muted">8 min read</small>
                                                            <button class="btn btn-sm btn-outline-primary">Read
                                                                More</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <div class="card article-card">
                                                    <img src="/api/placeholder/800/400" class="article-img"
                                                        alt="Article Image">
                                                    <div class="card-body">
                                                        <h5 class="card-title">The Science of Sleep</h5>
                                                        <p class="card-text text-muted">Discover how quality sleep
                                                            impacts
                                                            your
                                                            overall
                                                            health and tips for better rest.</p>
                                                        <div class="d-flex justify-content-between align-items-center">
                                                            <small class="text-muted">6 min read</small>
                                                            <button class="btn btn-sm btn-outline-primary">Read
                                                                More</button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Virtual Waiting Room -->
                        <div class="row mb-4 requires-profile">
                            <div class="col-lg-4">
                                <div class="card bg-light">
                                    <div class="card-body">
                                        <h5 class="card-title">Virtual Waiting Room</h5>
                                        <div class="text-center my-4">
                                            <svg width="120" height="120" viewBox="0 0 36 36">
                                                <path
                                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                                    fill="none" stroke="#eee" stroke-width="3" />
                                                <path
                                                    d="M18 2.0845 a 15.9155 15.9155 0 0 1 0 31.831 a 15.9155 15.9155 0 0 1 0 -31.831"
                                                    fill="none" stroke="#26c6da" stroke-width="3"
                                                    stroke-dasharray="30, 100" />
                                            </svg>
                                            <h3 class="mt-3">30%</h3>
                                            <p class="text-muted">Your estimated wait time is <strong>15
                                                    minutes</strong>
                                            </p>
                                        </div>
                                        <div class="alert alert-info">
                                            <i class="fas fa-info-circle me-2"></i>
                                            You will receive a notification when the doctor is ready to see you.
                                        </div>
                                        <button class="btn btn-primary w-100">Check In</button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-8" id="find_nearby_clinic">
                                <div class="card shadow-sm border-0">
                                    <div class="card-header bg-primary text-white">
                                        <h5 class="mb-0"><i class="fas fa-search-location me-2"></i>Find Nearby Clinics
                                        </h5>
                                    </div>
                                    <div class="card-body">
                                        <!-- City Select -->
                                        <div class="mb-4">
                                            <label for="city" class="form-label fw-semibold">Select Your City</label>
                                            <select class="form-select" id="clinic_city_id" name="city_id" required
                                                onchange="showClinicsByCity(this.value)">
                                                <option value="" disabled>Choose your location</option>
                                                <c:forEach var="ct" items="${cities}">
                                                    <option value="${ct.cityId}" ${ct.city==user.city.city ? 'selected'
                                                        : '' }>
                                                        ${ct.city} (${ct.state.state})
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <!-- Clinics Container (to be filled dynamically via AJAX) -->
                                        <div class="row g-3" id="clinicCardsContainer">
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
                                                            <button class="btn btn-primary btn-sm">
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
                                </div>
                            </div>

                        </div>
                    </div>

                    <div id="moodToast" class="toast-container position-fixed bottom-0 end-0 p-3" style="z-index: 9999;">
                        <!-- Toast will be injected here dynamically -->
                    </div>
                    

                    <!-- Bootstrap and other Scripts -->
                    <script
                        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>

                    <script src="static/js/patient.js"></script>
                    <!-- Flatpickr JS -->
                    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
                    <script>
                        document.addEventListener("DOMContentLoaded", function () {
                            flatpickr("#appointmentDate", {
                                dateFormat: "Y-m-d",
                                disable: [
                                    function (date) {
                                        return true; // disable all by default
                                    }
                                ]
                            });
                        });
                    </script>



                    <script>
                        var patientId = "${patient.patientId}";

                    </script>
                    <script>
                        document.addEventListener("DOMContentLoaded", () => {

                            function showMoodToast(message) {
                                const toast = document.createElement("div");
                                toast.innerHTML = message;
                                toast.className = "mood-toast";
                                document.body.appendChild(toast);

                                setTimeout(() => {
                                    toast.classList.add("show");
                                }, 100);

                                setTimeout(() => {
                                    toast.classList.remove("show");
                                    setTimeout(() => toast.remove(), 300);
                                }, 3000);
                            }

                            const isProfileComplete = "${details_report}" === "true"; // From your JSP

                            if (!isProfileComplete) {
                                document.querySelectorAll(".requires-profile").forEach(section => {
                                    section.classList.add("blurred");

                                    // Inject overlay only once
                                    if (!section.querySelector(".locked-overlay")) {
                                        const overlay = document.createElement("div");
                                        overlay.className = "locked-overlay d-flex align-items-center justify-content-center";
                                        overlay.innerHTML = `
                                        <i class="fas fa-user-lock text-danger me-2" title="Locked"></i>
                                        <span class="locked-msg">Complete your profile to access</span>
                                    `;
                                        section.appendChild(overlay);
                                    }
                                });
                            }
                        });

                    </script>

                    <c:if test="${sessionScope.details_report == 'false'}">
                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                const profileModal = new bootstrap.Modal(document.getElementById("completeProfileModal"));
                                profileModal.show();
                            });
                        </script>
                    </c:if>
    </body>

    </html>