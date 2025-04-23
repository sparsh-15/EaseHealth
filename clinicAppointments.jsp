<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

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
        </style>

    </head>

    <body>
        <div id="toastContainer"></div>

        <!-- Navigation Bar (Imported from nav.jsp) -->
        <div class="container-fluid sticky-top">
            <c:import url="nav.jsp" />
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
                        <div class="mt-2 ">
                            <span
                                style="display:inline-block; width:20px; height:20px; background:#e0ffe0; border:1px solid #ccc;"></span>
                            <span class="mx-2">Available Days</span>
                            <span class="mx-2"
                                style="display:inline-block; width:20px; height:20px; background:#F1F5DF; border:1px solid #ccc;"></span>
                            <span class="ms-2">today</span>
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
                    <h2>Appointments</h2>
                    <span class="appointments-count">8 Appointments</span>
                </div>
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Time</th>
                                <th>Patient</th>
                                <th>Contact</th>
                                <th>Age/Gender</th>
                                <th>Reason</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1:00 PM</td>
                                <td class="patient-name">John Doe</td>
                                <td>+1 234-567-8901</td>
                                <td>45 / Male</td>
                                <td>Follow-up</td>
                                <td><span class="status-badge confirmed">Confirmed</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                            <tr>
                                <td>1:30 PM</td>
                                <td class="patient-name">Sarah Johnson</td>
                                <td>+1 234-567-8902</td>
                                <td>32 / Female</td>
                                <td>Consultation</td>
                                <td><span class="status-badge confirmed">Confirmed</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2:00 PM</td>
                                <td class="patient-name">Michael Brown</td>
                                <td>+1 234-567-8903</td>
                                <td>58 / Male</td>
                                <td>Check-up</td>
                                <td><span class="status-badge completed">Completed</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2:30 PM</td>
                                <td class="patient-name">Emily Wilson</td>
                                <td>+1 234-567-8904</td>
                                <td>28 / Female</td>
                                <td>New Patient</td>
                                <td><span class="status-badge pending">Pending</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3:00 PM</td>
                                <td class="patient-name">Robert Garcia</td>
                                <td>+1 234-567-8905</td>
                                <td>62 / Male</td>
                                <td>Blood Test</td>
                                <td><span class="status-badge cancelled">Cancelled</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3:30 PM</td>
                                <td class="patient-name">Jennifer Taylor</td>
                                <td>+1 234-567-8906</td>
                                <td>41 / Female</td>
                                <td>Prescription Renewal</td>
                                <td><span class="status-badge confirmed">Confirmed</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3:45 PM</td>
                                <td class="patient-name">David Martinez</td>
                                <td>+1 234-567-8907</td>
                                <td>35 / Male</td>
                                <td>Follow-up</td>
                                <td><span class="status-badge confirmed">Confirmed</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                            <tr>
                                <td>4:00 PM</td>
                                <td class="patient-name">Amanda Lee</td>
                                <td>+1 234-567-8908</td>
                                <td>29 / Female</td>
                                <td>Consultation</td>
                                <td><span class="status-badge pending">Pending</span></td>
                                <td>
                                    <button class="action-btn view-btn"><i class="fas fa-eye"></i> View</button>
                                    <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i>
                                        Reschedule</button>
                                    <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/fullcalendar@6.1.11/index.global.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <script>
            var clinics = ${ clinics };
            var clinicId = parseInt('${clinicId}');
            var selectedClinic = clinics.find(c => c.clinicId === clinicId);
            console.log("Selected Clinic:", selectedClinic);
        </script>

        <!-- Toast Container -->
        <div class="toast-container position-fixed top-0 start-50 translate-middle-x p-3" style="z-index: 1050;">
            <div id="calendarToast" class="toast align-items-center text-bg-warning border-0" role="alert">
                <div class="d-flex">
                    <div class="toast-body" id="toastBody"></div>
                    <button type="button" class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast"></button>
                </div>
            </div>
        </div>


        <script src="static/js/appointments.js"></script>
    </body>

    </html>