<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

    <%@ page import="com.google.gson.Gson" %>
        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Doctor Appointment Dashboard</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
            <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
            <link rel="stylesheet" href="static/css/nav.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">



            <link href="https://cdn.jsdelivr.net/npm/@sweetalert2/theme-dark/dark.css" rel="stylesheet">


            <link href="https://cdn.jsdelivr.net/npm/fullcalendar@3.2.0/dist/fullcalendar.min.css" rel="stylesheet" />

            <style>
                /* calendar */

                .card {
                    padding: 20px;
                    background-color: #ffffff;
                    border-radius: 16px;
                    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.05);
                    max-width: 800px;
                    margin: auto;
                    overflow: hidden;
                }

                #calendar {
                    max-height: 300px;
                    overflow-y: auto;
                    padding: 5px;
                    border-radius: 12px;
                    font-size: 14px;
                }

                .card:hover {
                    box-shadow: 0 12px 40px rgba(0, 0, 0, 0.1);
                }

                .card-header {
                    font-size: 24px;
                    font-weight: 600;
                    color: #333;
                    margin-bottom: 20px;
                    text-align: center;
                    border-bottom: 1px solid #dee2e6;
                    padding-bottom: 10px;
                }

                .fc .fc-daygrid-day-frame {
                    padding: 6px !important;
                }

                /* Calendar Theme Enhancements */
                .fc .fc-toolbar-title {
                    font-size: 20px;
                    color: #333;
                }

                .fc .fc-button {
                    background-color: #0d6efd;
                    border: none;
                    border-radius: 6px;
                    padding: 4px 8px;
                    font-size: 14px;
                    transition: 0.3s ease-in-out;
                }

                .fc .fc-button:hover {
                    background-color: #0a58ca;
                }

                .fc .fc-daygrid-day:hover {
                    background-color: #f0f0f0;
                    cursor: pointer;
                }

                .fc-event.highlighted-event {
                    background-color: #fff3cd !important;
                    border: 1px solid #ffc107 !important;
                    color: #856404 !important;
                    font-weight: bold;
                }


                .selected-date-highlight .fc-bg-event {
                    background-color: #e91e63 !important;
                    /* Vibrant Pink */
                    border: 2px solid #c2185b;
                    /* Darker pink */
                    border-radius: 10px;
                    box-shadow: 0 0 12px rgba(233, 30, 99, 0.6);
                    /* Pinkish shadow */

                }


                :root {
                    --primary: #0d6efd;
                    --primary-dark: #0a58ca;
                    --secondary: #6c757d;
                    --success: #198754;
                    --warning: #ffc107;
                    --danger: #dc3545;
                    --info: #0dcaf0;
                    --light: #f8f9fa;
                    --dark: #212529;
                    --border-radius: 10px;

                    --gradient-primary: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
                    --gradient-primary: linear-gradient(135deg, #4e73df 0%, #224abe 100%);
                    --gradient-secondary: linear-gradient(135deg, #6c757d 0%, #495057 100%);
                }


                body {
                    background-color: #f5f7fa;
                    color: var(--dark);
                    font-family: 'Segoe UI', Roboto, 'Helvetica Neue', sans-serif;
                }

                /* Container for the entire dashboard */
                .dashboard-container {
                    max-width: 1600px;
                    margin: 0 auto;
                    padding: 20px;
                }

                .bg-custom-primary {
                    background-color: var(--primary);
                    color: white;
                }

                /* Dashboard header */
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
                    color: rgb(255, 255, 255);
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

                /* Clinic shifts */
                .clinic-shifts {
                    background-color: white;
                    border-radius: var(--border-radius);
                    padding: 20px;
                    margin-bottom: 20px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
                }

                .clinic-shifts h2 {
                    font-size: 1.25rem;
                    margin-bottom: 15px;
                    font-weight: 600;
                }

                .shift-card {
                    border-radius: 12px;
                    background-color: #fff;
                    border: none;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
                    transition: all 0.3s ease-in-out;
                    width: 100%;
                    max-width: 250px;
                }

                .shift-card:hover {
                    background-color: #f8f9fa;
                    transform: translateY(-2px);
                }

                .shift-card.active {
                    border-color: var(--primary);
                    background-color: rgba(13, 110, 253, 0.05);
                }

                .shift-header {
                    display: flex;
                    align-items: center;
                    justify-content: space-between;
                    margin-bottom: 10px;
                }

                .shift-title {
                    font-weight: 600;
                    font-size: 1.1rem;
                    color: var(--dark);
                }

                .shift-info {
                    display: flex;
                    align-items: center;
                    color: var(--secondary);
                }

                .shift-icon {
                    width: 50px;
                    height: 50px;
                    border-radius: 50%;
                    color: white;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    font-size: 1.4rem;
                }

                .shift-icon.morning {
                    background: linear-gradient(135deg, #f9d423, #ff4e50);
                }

                .shift-icon.afternoon {
                    background: linear-gradient(135deg, #fbc2eb, #a6c1ee);
                }

                .shift-icon.evening {
                    background: linear-gradient(135deg, #667eea, #764ba2);
                }

                .shift-card.active {
                    border: 2px solid var(--primary);
                }

                #shiftContainer {
                    position: relative;
                }

                #shiftPlaceholder {
                    font-size: 1.2em;
                    font-style: italic;
                    color: #6c757d;
                    text-align: center;
                    margin-top: 20px;
                }

                /* Appointments table */
                .appointments-table {
                    background-color: white;
                    border-radius: var(--border-radius);
                    padding: 20px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
                }

                .appointments-table h2 {
                    font-size: 1.25rem;
                    margin-bottom: 15px;
                    font-weight: 600;
                }

                .appointments-count {
                    background-color: var(--primary);
                    color: white;
                    padding: 5px 10px;
                    border-radius: 20px;
                    font-size: 0.8rem;
                    font-weight: 600;
                }

                .table {
                    vertical-align: middle;
                }

                .table thead th {
                    background-color: #f8f9fa;
                    border-top: none;
                    border-bottom: 1px solid #e9ecef;
                    font-weight: 600;
                    padding: 12px 15px;
                }

                .table tbody td {
                    padding: 15px;
                    border-bottom: 1px solid #e9ecef;
                }

                .table tbody tr:last-child td {
                    border-bottom: none;
                }

                .patient-name {
                    font-weight: 600;
                }

                .status-badge {
                    padding: 5px 10px;
                    border-radius: 20px;
                    font-size: 0.8rem;
                    font-weight: 600;
                }

                .confirmed {
                    background-color: rgba(25, 135, 84, 0.1);
                    color: var(--success);
                }

                .pending {
                    background-color: rgba(255, 193, 7, 0.1);
                    color: var(--warning);
                }

                .cancelled {
                    background-color: rgba(220, 53, 69, 0.1);
                    color: var(--danger);
                }

                .completed {
                    background-color: rgba(13, 202, 240, 0.1);
                    color: var(--info);
                }

                .action-btn {
                    padding: 5px 10px;
                    border-radius: 6px;
                    font-size: 0.9rem;
                    margin-right: 5px;
                    cursor: pointer;
                    border: none;
                    transition: all 0.2s;
                }

                .action-btn:hover {
                    transform: translateY(-2px);
                }

                .view-btn {
                    background-color: rgba(13, 110, 253, 0.1);
                    color: var(--primary);
                }

                .view-btn:hover {
                    background-color: var(--primary);
                    color: white;
                }

                .reschedule-btn {
                    background-color: rgba(255, 193, 7, 0.1);
                    color: var(--warning);
                }

                .reschedule-btn:hover {
                    background-color: var(--warning);
                    color: white;
                }

                .cancel-btn {
                    background-color: rgba(220, 53, 69, 0.1);
                    color: var(--danger);
                }

                .cancel-btn:hover {
                    background-color: var(--danger);
                    color: white;
                }

                @media (max-width: 992px) {
                    .date-grid {
                        grid-template-columns: repeat(4, 1fr);
                    }
                }

                @media (max-width: 768px) {
                    .date-grid {
                        grid-template-columns: repeat(3, 1fr);
                    }

                    .doctor-avatar {
                        width: 50px;
                        height: 50px;
                        font-size: 20px;
                    }

                    .doctor-details h1 {
                        font-size: 1.3rem;
                    }
                }

                @media (max-width: 576px) {
                    .date-grid {
                        grid-template-columns: repeat(2, 1fr);
                    }

                    .table-responsive {
                        margin-bottom: 0;
                    }
                }


                /* prescription form  */

                .medicine-search-container {
                    max-width: 600px;
                    margin: 0 auto;
                    padding: 20px;
                    border-radius: 12px;
                    box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
                    background-color: #ffffff;
                }

                .search-box {
                    position: relative;
                    margin-bottom: 20px;
                }

                .search-icon {
                    position: absolute;
                    left: 12px;
                    top: 50%;
                    transform: translateY(-50%);
                    color: #6c757d;
                }

                #medicineSearch {
                    padding: 12px 12px 12px 40px;
                    border-radius: 8px;
                    border: 1px solid #ced4da;
                    font-size: 16px;
                    transition: all 0.3s;
                }

                #medicineSearch:focus {
                    border-color: #4d90fe;
                    box-shadow: 0 0 0 0.25rem rgba(77, 144, 254, 0.25);
                }

                #medicineSuggestions {
                    max-height: 250px;
                    overflow-y: auto;
                    border-radius: 8px;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                    z-index: 1050;
                }

                #medicineSuggestions .list-group-item {
                    padding: 12px 16px;
                    border-left: none;
                    border-right: none;
                    transition: background-color 0.2s;
                }

                #medicineSuggestions .list-group-item:first-child {
                    border-top-left-radius: 8px;
                    border-top-right-radius: 8px;
                }

                #medicineSuggestions .list-group-item:last-child {
                    border-bottom-left-radius: 8px;
                    border-bottom-right-radius: 8px;
                }

                #medicineSuggestions .list-group-item.active {
                    background-color: #e9ecef;
                    color: #212529;
                    border-color: #dee2e6;
                }

                #medicineSuggestions .list-group-item:hover {
                    background-color: #f8f9fa;
                    cursor: pointer;
                }

                #formatSelect {
                    margin-bottom: 20px;
                    padding: 12px;
                    border-radius: 8px;
                    border: 1px solid #ced4da;
                    background-color: #f8f9fa;
                    font-size: 16px;
                }

                #formatSelect:focus {
                    border-color: #4d90fe;
                    box-shadow: 0 0 0 0.25rem rgba(77, 144, 254, 0.25);
                }

                #denominationList {
                    padding: 15px;
                    border-radius: 8px;
                    background-color: #f8f9fa;
                    margin-top: 10px;
                }

                .denomination-item {
                    display: flex;
                    align-items: center;
                    margin-bottom: 12px;
                    padding: 10px;
                    border-radius: 6px;
                    background-color: #fff;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
                }

                .denomination-checkbox {
                    margin-right: 10px;
                }

                .denomination-label {
                    font-weight: 500;
                    flex-grow: 1;
                }

                .dosage-input {
                    width: 100px;
                    padding: 8px;
                    border-radius: 6px;
                    border: 1px solid #ced4da;
                    margin-left: 10px;
                }

                .dosage-input:focus {
                    border-color: #4d90fe;
                    box-shadow: 0 0 0 0.25rem rgba(77, 144, 254, 0.25);
                }

                .prescription-section-title {
                    font-size: 18px;
                    font-weight: 600;
                    margin-bottom: 15px;
                    color: #495057;
                }

                .format-section,
                .denomination-section {
                    margin-bottom: 20px;
                }

                .no-denominations {
                    color: #6c757d;
                    font-style: italic;
                }

                /* Enhancing the placeholder styling */
                ::placeholder {
                    color: #adb5bd;
                    opacity: 1;
                }

                .special-instructions-section {
                    background-color: #f8f9fa;
                    border-radius: 8px;
                    padding: 16px;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
                }

                #specialInstructions {
                    border-radius: 6px;
                    resize: vertical;
                    min-height: 90px;
                    transition: all 0.3s;
                    font-size: 15px;
                }

                #specialInstructions:focus {
                    border-color: #4d90fe;
                    box-shadow: 0 0 0 0.25rem rgba(77, 144, 254, 0.25);
                }

                .instruction-quick-btn {
                    font-size: 12px;
                    border-radius: 4px;
                    transition: all 0.2s;
                }

                .instruction-quick-btn:hover {
                    background-color: #e9ecef;
                    border-color: #6c757d;
                }

                .section-title {
                    font-size: 18px;
                    font-weight: 600;
                    margin-bottom: 15px;
                    color: #495057;
                }

                /* Add tooltip styling */
                .tooltip-icon {
                    cursor: help;
                    color: #6c757d;
                }

                /* Make the helper buttons more visible on hover */
                .instruction-helpers .row:hover .instruction-quick-btn {
                    opacity: 1;
                }

                .instruction-helpers .instruction-quick-btn {
                    opacity: 0.85;
                }
            </style>

        </head>

        <body>
            <div id="toastContainer"></div>

            <!-- Navigation Bar (Imported from nav.jsp) -->
            <div class="container-fluid sticky-top">
                <c:import url="nav.jsp" />
            </div>

            <!-- create prescription form -->

            <div class="modal fade" id="createPrescriptionModal" tabindex="-1"
                aria-labelledby="addDenominationModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="addDenominationModalLabel">Create Prescription <i
                                    class="fas fa-prescription-bottle    "></i></h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <form action="save_prescription.do" method="post" id="save_denomination_form">
                                <input type="hidden" id="medicineIdHidden" name="medicineId" />
                                <input type="hidden" id="prescriptionAppointmentId" name="appointment_id">

                                <div class="medicine-search-container">
                                    <h4 class="mb-4 text-center">Medicine Search</h4>

                                    <!-- Search Box -->
                                    <div class="search-box">
                                        <i class="fas fa-search search-icon"></i>
                                        <input type="text" id="medicineSearch" class="form-control"
                                            placeholder="Search medicine..." autocomplete="off" >
                                        <div id="medicineSuggestions" class="list-group position-absolute w-100 z-3">
                                        </div>
                                    </div>

                                    <!-- Medicine Format Section -->
                                    <div class="format-section">
                                        <h5 class="section-title"><i
                                                class="fas fa-prescription-bottle me-2"></i>Medicine Format</h5>
                                        <select id="formatSelect" style="display: none;" onchange="handleFormatChange()"
                                            class="form-select" required>
                                        </select>
                                    </div>

                                    <!-- Denominations Section -->
                                    <div class="denomination-section">
                                        <h5 class="prescription-section-title">
                                            <span class="ms-auto fs-6 fw-normal text-muted d-flex align-items-center">
                                            <i class="fas fa-tablets me-2"></i>Denominations
                                                <i class="fas fa-info-circle ms-5 me-1" data-bs-toggle="tooltip"
                                                    data-bs-placement="top"
                                                    title="Select denominations and enter the number of units per dose"></i>
                                                Help
                                            </span>
                                        </h5>

                                        <div class="alert alert-light border p-2 mb-3">
                                            <small>
                                                <i class="fas fa-lightbulb text-warning me-1"></i>
                                                Select the medication form and enter dosage as number of units per dose (e.g., "2" units of 220 mg)
                                            </small>
                                        </div>

                                        <div id="denominationList" class="denomination-list-container"></div>
                                    </div>

                                    <div class="special-instructions-section mt-4">
                                        <h5 class="prescription-section-title">
                                            <i class="fas fa-file-medical me-2"></i>Special Instructions
                                        </h5>
                                        <div class="special-instructions-container">
                                            <textarea id="specialInstructions" name="special_instructions" class="form-control" rows="3"
                                                placeholder="Enter special instructions for the patient" required></textarea>

                                            <div class="instruction-helpers mt-2">
                                                <div class="row g-2">
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Take with food')">
                                                            <i class="fas fa-utensils me-1"></i> With food
                                                        </button>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Take on empty stomach')">
                                                            <i class="fas fa-egg me-1"></i> Empty stomach
                                                        </button>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Take before bedtime')">
                                                            <i class="fas fa-bed me-1"></i> Before bed
                                                        </button>
                                                    </div>
                                                </div>
                                                <div class="row g-2 mt-1">
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Take with plenty of water')">
                                                            <i class="fas fa-tint me-1"></i> With water
                                                        </button>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Take as needed for pain')">
                                                            <i class="fas fa-band-aid me-1"></i> As needed
                                                        </button>
                                                    </div>
                                                    <div class="col">
                                                        <button type="button"
                                                            class="btn btn-sm btn-outline-secondary instruction-quick-btn w-100"
                                                            onclick="addInstructionText('Continue previous dose')">
                                                            <i class="fas fa-sync-alt me-1"></i> Continue
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-text text-muted mt-2">
                                                <i class="fas fa-info-circle me-1"></i>
                                                These instructions will be printed on the prescription and shared with
                                                the pharmacist.
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary"
                                        data-bs-dismiss="modal">Cancel</button>
                                    <button type="submit" class="btn btn-primary">Save Prescription </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Appointment Detail Modal -->
            <div class="modal fade" id="appointmentModal" tabindex="-1" aria-labelledby="appointmentModalLabel"
                aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <!-- Modal Header -->
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title" id="appointmentModalLabel">
                                <i class="fas fa-calendar-check me-2"></i>Appointment Details
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"
                                aria-label="Close"></button>
                        </div>

                        <!-- Modal Body -->
                        <div class="modal-body">
                            <div class="row">
                                <!-- Patient Information Section -->
                                <div class="col-12 mb-3">
                                    <div class="card">
                                        <div class="card-header bg-light">
                                            <h6 class="mb-0"><i class="fas fa-user me-2"></i>Patient Information</h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Name</label>
                                                    <p class="mb-1 fw-bold" id="patientName">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Contact</label>
                                                    <p class="mb-1 fw-bold" id="patientContact">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Age/Gender</label>
                                                    <p class="mb-1 fw-bold" id="patientAgeGender">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Blood Group</label>
                                                    <p class="mb-1 fw-bold" id="patientBloodGroup">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Weight</label>
                                                    <p class="mb-1 fw-bold" id="patientWeight">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Height</label>
                                                    <p class="mb-1 fw-bold" id="patientHeight">-</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Appointment Information Section -->
                                <div class="col-12">
                                    <div class="card">
                                        <div class="card-header bg-light">
                                            <h6 class="mb-0"><i class="fas fa-calendar-alt me-2"></i>Appointment Details
                                                &nbsp;

                                                <span class="badge bg-success" id="appointmentStatus"></span>

                                            </h6>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Date</label>
                                                    <p class="mb-1 fw-bold" id="appointmentDate">-</p>
                                                </div>
                                                <div class="col-md-6 mb-2">
                                                    <label class="text-muted small">Booked On</label>
                                                    <p class="mb-1 fw-bold" id="bookingTime">-</p>
                                                </div>
                                                <div class="col-12 mb-2">
                                                    <label class="text-muted small">Reason</label>
                                                    <p class="mb-1 fw-bold" id="appointmentReason">-</p>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal Footer -->
                        <div class="modal-footer">
                            <button class="btn btn-outline-primary" id="createPrescriptionBtn">
                                Create Presciption <i class="fas fa-prescription-bottle    "></i>
                            </button>
                            <button type="button" class="btn btn-danger" data-bs-dismiss="modal">
                                <i class="fas fa-times me-1"></i> Close
                            </button>
                        </div>
                    </div>
                </div>
            </div>


            <div class="dashboard-container">
                <!-- Dashboard Header -->
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
                                                <i class="fas fa-calendar-check"></i>
                                            </div>
                                            <div>
                                                <h3 class="mb-0 fw-bold">${appByClinic}</h3>
                                                <p class="text-muted mb-0">Appointments</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- calendar -->


                <!-- Clinic Shifts -->
                <div class="clinic-shifts row g-4 mt-2">
                    <h2 class="section-header">Available Shifts</h2>
                    <!-- Calendar Column -->
                    <div class="col-md-8">
                        <div class="card h-100 shadow-sm rounded-4 p-3">
                            <div class="mt-2 d-flex flex-wrap gap-2">

                                <!-- Available Days Legend -->
                                <div
                                    class="d-inline-flex align-items-center border rounded px-2 py-1 bg-white shadow-sm">
                                    <div
                                        style="width: 22px; height: 22px; background-color: #e0ffe0; border: 1px solid #ccc; border-radius: 4px;">
                                    </div>
                                    <span class="ms-2 small fw-semibold text-dark">Available Days</span>
                                </div>

                                <!-- Today Legend -->
                                <div
                                    class="d-inline-flex align-items-center border rounded px-2 py-1 bg-white shadow-sm">
                                    <div
                                        style="width: 22px; height: 22px; background-color: #F1F5DF; border: 1px solid #ccc; border-radius: 4px;">
                                    </div>
                                    <span class="ms-2 small fw-semibold text-dark">Today</span>
                                </div>

                                <!-- Selected Date Legend (Star icon perfectly aligned) -->
                                <div
                                    class="d-inline-flex align-items-center border rounded px-2 py-1 bg-white shadow-sm">
                                    <div class="d-flex justify-content-center align-items-center"
                                        style="width: 22px; height: 22px; background-color: #CCE9CB; border: 1px solid #ccc; border-radius: 4px;">
                                        <i class="fas fa-star text-danger" style="font-size: 12px;"></i>
                                    </div>
                                    <span class="ms-2 small fw-semibold text-dark">Selected Date</span>
                                </div>

                            </div>

                            <div class="card-header fw-semibold bg-white border-0">
                                <h5><i class="fas fa-calendar-day"></i> Doctor Shift Calendar</h5>
                            </div>
                            <div id="calendar"></div>
                        </div>
                    </div>

                    <!-- Shifts Column -->
                    <div class="col-md-4 text-center">
                        <div class="bg-light border border-primary-subtle rounded-3 py-2 px-3 mb-3 shadow-sm">
                            <h5 class="mb-0 fw-semibold text-primary">
                                <i class="fas fa-clock me-2"></i>Select a Clinic Shift
                            </h5>
                        </div>
                        <p id="shiftPlaceholder" class="text-center text-muted">Select a date to get clinic shifts.</p>
                        <div id="shiftContainer" class="d-flex flex-wrap gap-3 justify-content-center">
                            <!-- Loading Spinner/Placeholder -->

                            <!-- JS will inject .shift-card here -->
                        </div>
                    </div>

                </div>


                <!-- Appointments Table -->
                <div class="appointments-table">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2>Appointments ${medDetails}</h2>
                        <span class="appointments-count">${totalAppOnDateShift}</span>
                    </div>
                    <div class="table-responsive">
                        <table class="table" id="appointmentsTable">
                            <thead>
                                <tr>
                                    <th>
                                        Booking Time
                                        <i class="fas fa-sort" id="bookingTimeSortIcon"></i>
                                    </th>
                                    <th>Patient</th>
                                    <th>Contact</th>
                                    <th>Age/Gender</th>
                                    <th>Reason</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody id="appointmentsTbody">
                                <!-- Data will be appended here dynamically -->
                            </tbody>
                        </table>
                    </div>
                </div>

            </div>

            <% Gson gson=new Gson(); String currentUserJson=gson.toJson(session.getAttribute("user")); String
                currentDoctorJson=gson.toJson(session.getAttribute("doctor"));
                currentDoctorJson=currentDoctorJson.replace("\\", "\\\\" ); %>

                <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
                <script
                    src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

                <script>
                    var clinics = ${ clinics };

                    const allFormats = <%= new Gson().toJson(application.getAttribute("formats")) %>;
                    const allUnits = <%= new Gson().toJson(application.getAttribute("units")) %>;

                    var clinicId = parseInt('${clinicId}');
                    var selectedClinic = clinics.find(c => c.clinicId === clinicId);


                </script>
                <script src="static/js/appointments.js"></script>

                <!-- Toast Container -->
                <div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3"
                    style="z-index: 1050;">
                    <div id="calendarToast" class="toast align-items-center text-bg-warning border-0" role="alert">
                        <div class="d-flex">
                            <div class="toast-body" id="toastBody"></div>
                            <button type="button" class="btn-close btn-close-white me-2 m-auto"
                                data-bs-dismiss="toast"></button>
                        </div>
                    </div>
                </div>


        </body>

        </html>