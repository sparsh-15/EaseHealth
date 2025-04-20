<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Doctor</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
        <link rel="stylesheet" href="static/css/nav.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <style>
            :root {
                --primary: #4e73df;
                --primary-dark: #2e59d9;
                --secondary: #6c757d;
                --success: #1cc88a;
                --warning: #f6c23e;
                --danger: #e74a3b;
                --light: #f8f9fc;
                --dark: #5a5c69;

                --gradient-light: linear-gradient(135deg, #f8f9fc 0%, #e8eeff 100%);
                --gradient-primary: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
                --gradient-secondary: linear-gradient(135deg, #6c757d 0%, #495057 100%);
            }

            body {
                background-color: #d1dcfd3c;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .navbar {
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }

            .navbar-brand {
                font-weight: 700;
                color: var(--primary);
            }

            .nav-link {
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .nav-link:hover {
                color: var(--primary);
                transform: translateY(-2px);
            }

            .doctor-header {
                background: var(--gradient-light);
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                transition: all 0.3s ease;
            }

            .doctor-header:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
                transform: translateY(-3px);
            }

            .profile-image {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                overflow: hidden;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
                border: 3px solid white;
                transition: all 0.3s ease;
            }

            .profile-image:hover {
                transform: scale(1.05);
            }

            .stat-card {
                border: none;
                border-radius: 12px;
                transition: all 0.3s ease;
                background: white;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            .stat-card:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
            }

            .stat-icon {
                width: 50px;
                height: 50px;
                border-radius: 12px;
                display: flex;
                align-items: center;
                justify-content: center;
                background: var(--gradient-primary);
                color: white;
                font-size: 1.5rem;
            }

            .section-header {
                margin-bottom: 1.5rem;
                position: relative;
                display: inline-block;
            }

            .section-header::after {
                content: '';
                position: absolute;
                bottom: -10px;
                left: 0;
                width: 60px;
                height: 3px;
                background: var(--primary);
                border-radius: 2px;
            }

            .clinic-card {
                border: none;
                border-radius: 12px;
                overflow: hidden;
                transition: all 0.3s ease;
                height: 100%;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            }

            .clinic-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 12px 16px rgba(0, 0, 0, 0.1);
            }

            .clinic-image {
                height: 180px;
                object-fit: cover;
            }

            .btn {
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: 500;
                transition: all 0.3s ease;
            }

            .btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .btn-primary {
                background: var(--gradient-primary);
                border: none;
            }

            .btn-outline-primary {
                border: 1px solid var(--primary);
                color: var(--primary);
            }

            .btn-outline-primary:hover {
                background: var(--gradient-primary);
                color: white;
                border: 1px solid transparent;
            }

            .modal-content {
                border-radius: 12px;
                overflow: hidden;
                border: none;
                box-shadow: 0 12px 24px rgba(0, 0, 0, 0.1);
            }

            .modal-header {
                background: var(--gradient-primary);
                color: white;
                border-bottom: none;
            }

            .form-control,
            .form-select {
                border-radius: 8px;
                padding: 10px 15px;
                border: 1px solid #e0e0e0;
                transition: all 0.3s ease;
            }

            .form-control:focus,
            .form-select:focus {
                box-shadow: 0 0 0 3px rgba(78, 115, 223, 0.1);
                border-color: var(--primary);
            }

            .days-of-operation {
                display: flex;
                flex-wrap: wrap;
                gap: 8px;
                margin-bottom: 15px;
            }

            .day-checkbox {
                display: none;
            }

            .day-label {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
                cursor: pointer;
                transition: all 0.3s ease;
                font-weight: 500;
                font-size: 0.9rem;
            }

            .day-checkbox:checked+.day-label {
                background: var(--primary);
                color: white;
                border-color: var(--primary);
            }

            .file-upload-container {
                position: relative;
                overflow: hidden;
                display: inline-block;
                cursor: pointer;
            }

            .custom-file-upload {
                display: inline-block;
                padding: 10px 15px;
                cursor: pointer;
                background: var(--gradient-light);
                border-radius: 8px;
                border: 1px dashed var(--primary);
                width: 100%;
                text-align: center;
                transition: all 0.3s ease;
            }

            .custom-file-upload:hover {
                background: rgba(78, 115, 223, 0.1);
            }

            .file-upload-container input[type="file"] {
                position: absolute;
                left: 0;
                top: 0;
                opacity: 0;
                width: 100%;
                height: 100%;
                cursor: pointer;
            }

            .pagination {
                margin-top: 2rem;
            }

            .page-link {
                border: none;
                border-radius: 8px;
                margin: 0 3px;
                color: var(--primary);
                transition: all 0.3s ease;
                width: 36px;
                height: 36px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            .page-link:hover {
                background-color: rgba(78, 115, 223, 0.1);
                transform: translateY(-2px);
            }

            .page-item.active .page-link {
                background-color: var(--primary);
                box-shadow: 0 4px 8px rgba(78, 115, 223, 0.3);
            }

            .clinic-card-body {
                padding: 1.5rem;
            }

            .badge-day {
                border-radius: 6px;
                padding: 5px 10px;
                margin-right: 5px;
                margin-bottom: 5px;
                font-size: 0.75rem;
                background-color: rgba(78, 115, 223, 0.1);
                color: var(--primary);
                display: inline-block;
            }

            .clinic-info-item {
                display: flex;
                align-items: flex-start;
                margin-bottom: 8px;
            }

            .clinic-info-icon {
                margin-right: 10px;
                color: var(--primary);
                min-width: 20px;
                text-align: center;
            }

            .action-buttons {
                display: flex;
                justify-content: space-between;
                margin-top: 1rem;
            }

            .action-button-group {
                display: flex;
                gap: 8px;
            }

            .btn-gradient {
                background: var(--gradient-primary);
                border: none;
                color: white;
            }

            @media (max-width: 768px) {
                .profile-image {
                    width: 80px;
                    height: 80px;
                }

                .doctor-name {
                    font-size: 1.5rem;
                }

                .stat-card {
                    margin-bottom: 1rem;
                }
            }

            /* toast css ~~~~~~~ start*/
            .custom-toast {
                background: var(--gradient-primary);
                color: white;
                border-radius: 12px;
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
                max-width: 350px;
                width: 100%;
            }

            .custom-toast .toast-header {
                background: transparent;
                color: white;
                border-bottom: none;
            }

            .custom-toast .btn-close {
                filter: invert(1) grayscale(100%) brightness(200%);
            }

            .complete-profile-btn {
                background: white;
                color: var(--primary);
                border: none;
                border-radius: 8px;
                padding: 8px 16px;
                font-weight: 600;
                margin-top: 10px;
                transition: all 0.3s ease;
            }

            .complete-profile-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            /* toast css ~~~~~~~ end*/

            /* days styling~~~~~~~~~~~~~~~~~~~~~ */
            .day-btn {
                transition: all 0.3s ease-in-out;
                font-weight: 500;
                border-radius: 8px;
                min-width: 60px;
                text-align: center;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                cursor: pointer;
            }

            .day-btn input {
                display: none;
                /* Hide the actual checkbox */
            }

            /* Styling for selected buttons */
            .day-btn.active {
                background-color: #007bff !important;
                color: #fff !important;
                border-color: #007bff !important;
                box-shadow: 0 5px 15px rgba(0, 123, 255, 0.3);
            }

            /* Hover effect */
            .day-btn:hover {
                transform: translateY(-3px);
                box-shadow: 0 8px 18px rgba(0, 123, 255, 0.3);
            }

            #imagePreview {
                display: flex;
                flex-wrap: wrap;
                gap: 10px;
            }

            #imagePreview img {
                border: 2px solid #ccc;
                transition: transform 0.3s;
            }

            #imagePreview img:hover {
                transform: scale(1.1);
            }

            /* Dropdown menu styling~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` */

            .options-btn {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                background: rgba(0, 0, 0, 0.05);
                border: none;
                transition: all 0.2s ease;
            }

            .options-btn:hover {
                background: rgba(0, 0, 0, 0.1);
                transform: rotate(90deg);
            }

            .options-btn:focus {
                box-shadow: 0 0 0 3px rgba(13, 110, 253, 0.25);
                outline: none;
            }


            .clinic-dropdown-menu {
                border-radius: 8px;
                box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
                border: none;
                padding: 8px 0;
                min-width: 200px;
                animation: fadeIn 0.2s ease;
                margin-top: 10px;
            }

            @keyframes fadeIn {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .clinic-dropdown-menu .dropdown-item {
                padding: 10px 16px;
                color: #495057;
                font-weight: 500;
                display: flex;
                align-items: center;
                transition: all 0.15s ease;
            }

            .clinic-dropdown-menu .dropdown-item i {
                width: 20px;
                text-align: center;
                margin-right: 12px;
                font-size: 15px;
            }

            .clinic-dropdown-menu .dropdown-item:hover {
                background-color: #f8f9fa;
                padding-left: 20px;
            }

            /* Style for each option */
            .dropdown-item.schedule i {
                color: #0ca678;
            }

            .dropdown-item.schedule:hover {
                color: #0ca678;
                background-color: rgba(12, 166, 120, 0.08);
            }

            .dropdown-item.edit i {
                color: #4263eb;
            }

            .dropdown-item.edit:hover {
                color: #4263eb;
                background-color: rgba(66, 99, 235, 0.08);
            }

            .dropdown-item.delete i {
                color: #e03131;
            }

            .dropdown-item.delete:hover {
                color: #e03131;
                background-color: rgba(224, 49, 49, 0.08);
            }

            .clinic-dropdown-menu .dropdown-divider {
                margin: 8px 0;
                opacity: 0.1;
            }

            /* Dropdown menu styling~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~` */

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

            .list-group-item {
                background-color: #f8f9fa;
                border: none;
                border-bottom: 1px solid #dee2e6;
            }

            .clinic-shifts-section .btn {
                transition: all 0.2s ease;
                font-weight: 500;
            }

            .clinic-shifts-section .btn:hover {
                background-color: #0d6efd;
                color: #fff;
            }

            .clinic-shifts-section .btn:hover {
                box-shadow: 0 0 10px rgba(13, 110, 253, 0.5);
            }
        </style>
    </head>

    <body>
        <!-- nav bar start -->
        <div class="container-fluid sticky-top">
            <c:import url="nav.jsp" />
        </div>
        <!-- nav bar end -->

        <!-- Clinic shifts modal --- start  -->
        <div class="modal fade" id="clinicShiftsModal" tabindex="-1" aria-labelledby="clinicShiftsModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="clinicShiftsModalLabel">Clinic Shifts</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form id="save_clinic_shift_form">
                        <div class="modal-body">
                            <div class="card">
                                <div class="card-header bg-light fw-bold">Clinic Shifts</div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label for="startTime" class="form-label">Start Time</label>
                                            <input type="time" class="form-control" id="start_time" name="start_time"
                                                required>
                                        </div>

                                        <input type="hidden" name="clinic_id" id="clinic_id_hidden_modal">

                                        <div class="col-md-6">
                                            <label for="endTime" class="form-label">End Time</label>
                                            <input type="time" class="form-control" id="end_time" name="end_time"
                                                required>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="maxAppointment" class="form-label">Max Appointments</label>
                                            <input type="number" class="form-control" id="max_appointment"
                                                name="max_appointment" required>
                                        </div>
                                    </div>
                                    <div id="errorMessage" class="text-danger mt-3" style="display: none;"></div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-primary" id="save_clinic_shift_btn">Save
                                changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Clinic shifts modal --- end  -->

        <!-- Add New Clinic Modal -->
        <div class="modal fade" id="addClinicModal" tabindex="-1" aria-labelledby="addClinicModal" aria-hidden="true">
            <div class="modal-dialog modal-lg">
                <div class="modal-content shadow-lg rounded-4">
                    <div class="modal-header bg-primary text-white">
                        <h5 class="modal-title">Save Clinic Details</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <form method="post" action="save_clinic.do" enctype="multipart/form-data">
                        <div class="modal-body p-4">

                            <!-- Clinic Basic Information -->
                            <div class="card mb-4">
                                <div class="card-header bg-light fw-bold">Basic Information</div>
                                <div class="card-body">
                                    <div class="row g-3">
                                        <input type="hidden" name="doctor_id" value=${doctor.doctorId}>
                                        <div class="col-md-12">
                                            <label for="clinicName" class="form-label">Clinic Name</label>
                                            <input type="text" class="form-control" id="clinicName" name="clinic_name"
                                                maxlength="30" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="clinicAddress" class="form-label">Address</label>
                                            <textarea class="form-control" id="clinicAddress" name="address" rows="2"
                                                maxlength="500" required></textarea>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="consultationFee" class="form-label">Consultation Fee</label>
                                            <input type="number" class="form-control" id="consultationFee"
                                                name="consultation_fee" required>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="city" class="form-label">City</label>
                                            <select class="form-select" id="city" name="city_id" required>
                                                <option value="" disabled selected>Select City</option>
                                                <c:forEach var="ct" items="${cities}">
                                                    <option value="${ct.cityId}">${ct.city} (${ct.state.state})</option>
                                                </c:forEach>
                                            </select>
                                        </div>

                                        <div class="col-md-6">
                                            <label for="contactNumber" class="form-label">Contact Number</label>
                                            <input type="text" class="form-control" id="contactNumber" name="contact"
                                                pattern="\d{10}" title="Enter a valid 10-digit number" required>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Clinic Days of Operation -->
                            <div class="mb-3">
                                <label class="form-label">Days of Operation</label>
                                <div class="btn-group-toggle d-flex flex-wrap" data-toggle="buttons">
                                    <c:forEach var="day" items="${days}">
                                        <label class="btn btn-outline-primary m-1 day-btn">
                                            <input type="checkbox" name="clinic_days[]" value="${day.dayId}"
                                                autocomplete="off"> ${day.name}
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>


                            <!-- Clinic Image Upload -->
                            <div class="card">
                                <div class="card-header bg-light fw-bold">Clinic Image</div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center">
                                        <label for="clinicImage" class="btn btn-outline-primary me-2">
                                            <i class="fas fa-upload me-1"></i> Upload Image
                                        </label>
                                        <input type="file" id="clinicImage" name="clinic_image[]" accept="image/*"
                                            class="d-none" onchange="previewImage(event)" multiple>
                                        <div id="imagePreview" class="d-flex flex-wrap">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="modal-footer bg-light">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary">Save Clinic</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Add New Clinic Modal -->


        <!-- complete_doctor_profile_modal  ->  start -->
        <div class="modal" id="complete_doctor_profile_modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title"> ${user.name} Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="save_doctor.do" method="post" enctype="multipart/form-data">
                        <div class="modal-body">
                            <h5 class="text-muted">Please complete your profile to add clinics</h5>

                            <div class="mb-3">
                                <label class="form-label">Gender</label>
                                <div>
                                    <input type="radio" id="male" name="gender" value="Male" required>
                                    <label for="male">Male</label>

                                    <input type="radio" id="female" name="gender" value="Female" required>
                                    <label for="female">Female</label>

                                    <input type="radio" id="other" name="gender" value="Other" required>
                                    <label for="other">Other</label>
                                </div>
                            </div>
                            <div class="mb-3">
                                <label for="specialization" class="form-label">Specialization</label>
                                <select class="form-select" name="specialization_id" id="specialization" required>
                                    <c:forEach var="specialization" items="${specializations}">
                                        <option value="${specialization.specializationId}">
                                            ${specialization.specialization}</option>
                                    </c:forEach>
                                    <!-- Add more specializations dynamically from the database -->
                                </select>
                            </div>

                            <!-- Qualification -->
                            <div class="mb-3">
                                <label for="qualification" class="form-label">Qualification</label>
                                <input type="text" class="form-control" name="qualification" id="qualification"
                                    maxlength="100" placeholder="Enter your qualification" required>
                            </div>

                            <!-- Experience -->
                            <div class="mb-3">
                                <label for="experience" class="form-label">Experience (in years)</label>
                                <input type="number" class="form-control" name="experience" id="experience" min="0"
                                    max="50" placeholder="Enter your experience" required>
                            </div>

                            <!-- Certificate Upload -->
                            <div class="mb-3">
                                <label for="certificate" class="form-label">Certificate</label>
                                <input type="file" class="form-control" name="certificate" id="certificate"
                                    accept=".pdf, .jpg, .jpeg, .png" required>
                                <small class="form-text text-muted">Upload your certification (PDF, JPG, PNG)</small>
                            </div>

                        </div>

                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-primary">Save Details</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
        <!-- complete_doctor_profile_modal  ->  end -->

        <div class="dashboard-container">
            <!-- Main Content -->
            <div class="container py-4">
                <!-- Doctor Profile Header -->
                <div class="doctor-header p-4 mb-4">
                    <div class="row align-items-center">
                        <div class="col-md-6 d-flex align-items-center">
                            <div class="profile-image bg-primary d-flex align-items-center justify-content-center">
                                <i class="fas fa-user-md text-white" style="font-size: 3rem;"></i>
                            </div>
                            <div class="ms-4">
                                <h2 class="doctor-name mb-1">${user.name}</h2>
                                <p class="text-muted mb-2">${doctor.experience} years experience</p>
                                <div class="d-flex align-items-center">
                                    <span class="badge bg-primary me-2"
                                        style="text-transform: uppercase;">${doctor.qualification}</span>
                                    <span class="badge bg-success">Active</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="row mt-3 mt-md-0">
                                <div class="col-6 col-md-6">
                                    <div class="stat-card p-3">
                                        <div class="d-flex align-items-center">
                                            <div class="stat-icon me-3">
                                                <i class="fas fa-clinic-medical"></i>
                                            </div>
                                            <div>
                                                <h3 class="mb-0 fw-bold">${doctor.clinicCount}</h3>
                                                <p class="text-muted mb-0">Total Clinics</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-6 col-md-6">
                                    <div class="stat-card p-3">
                                        <div class="d-flex align-items-center">
                                            <div class="stat-icon me-3">
                                                <i class="fas fa-calendar-check"></i>
                                            </div>
                                            <div>
                                                <h3 class="mb-0 fw-bold">24</h3>
                                                <p class="text-muted mb-0">Appointments</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Clinics Section -->
                <div class="mb-4">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="section-header mb-0">Manage Your Clinics</h3>
                        <c:choose>
                            <c:when test="${details_report eq 'true' || empty details_report}">
                                <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addClinicModal">
                                    <i class="fas fa-plus me-2"></i>Add New Clinic
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button class="btn btn-primary" id="profileIncompleteToastBtn"><i
                                        class="fas fa-plus me-2"></i>Add New Clinic</button>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Clinics Grid -->
                    <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4 clinic_containers">
                        <!-- Clinic Card 1 -->
                        <hr>
                        <h5 class="text-muted">no clinics found</h5>
                        <hr>
                    </div>
                </div>

                <!-- Pagination -->
                <nav aria-label="Clinics pagination" class="mt-4">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" aria-label="Previous">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        </li>
                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item">
                            <a class="page-link" href="#" aria-label="Next">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>


        <!-- complete profile toast -->
        <div class="toast-container position-fixed top-0 start-50 translate-middle-x">
            <div id="profileIncompleteToast" class="toast custom-toast" role="alert" aria-live="assertive"
                aria-atomic="true">
                <div class="toast-header">
                    <i class="fas fa-exclamation-circle me-2 text-danger"></i>
                    <strong class="me-auto">Profile Incomplete</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <p class="mb-3 fw-bold">
                        <i class="fas fa-info-circle me-2"></i>
                        You need to complete your profile before adding clinics. This helps us provide the best
                        experience for your patients.
                    </p>
                    <button class="complete-profile-btn w-100" id="completeProfileBtn" data-bs-toggle="modal"
                        data-bs-target="#complete_doctor_profile_modal">
                        <i class="fas fa-user-edit me-2"></i>Complete Profile
                    </button>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/doctor.js"></script>
    </body>

    </html>