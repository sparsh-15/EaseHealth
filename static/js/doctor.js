const profileIncompleteToastBtn = document.getElementById("profileIncompleteToastBtn");
const profileIncompleteToast = document.getElementById("profileIncompleteToast");


const dayButtons = document.querySelectorAll('.day-btn');

const collectClinicDetails = async () => {
    let response = await fetch("collect_clinics.do");
    let result = await response.json();

    return result;
}


function formatTime(timeString) {
    if (!timeString) return "Invalid Time";

    // Match hh:mm:ss and optional AM/PM
    const match = timeString.match(/(\d{1,2}):(\d{2}):\d{2}(?:\?([AP]M))?/i);

    if (match) {
        const hours = match[1];
        const minutes = match[2];
        const ampm = match[3] ? match[3].toUpperCase() : "";
        return `${hours}:${minutes} ${ampm}`.trim(); // e.g. "10:53 PM"
    } else {
        return "Invalid Time";
    }
}

const showClinics = () => {
    collectClinicDetails().then((data) => {
        if (data != "empty") {

            let clinicCardsHTML = '';
            for (let clinic of data) {

                clinicCardsHTML += `
                <div class='col'>
                    <div class='clinic-card' id='clinic_card_${clinic.clinicId}'>
                        <!-- Bootstrap Carousel Wrapper -->
                        <div id='clinicCarousel${clinic.clinicId}' class='carousel slide' data-bs-ride='carousel'>
                            <div class='carousel-inner' id='clinicImages${clinic.clinicId}'>
                                <!-- Images will be dynamically inserted here -->
                            </div>
            
                            <!-- Carousel Navigation Buttons -->
                            <button class='carousel-control-prev' type='button' data-bs-target='#clinicCarousel${clinic.clinicId}' data-bs-slide='prev'>
                                <span class='carousel-control-prev-icon' aria-hidden='true'></span>
                                <span class='visually-hidden'>Previous</span>
                            </button>
            
                            <button class='carousel-control-next' type='button' data-bs-target='#clinicCarousel${clinic.clinicId}' data-bs-slide='next'>
                                <span class='carousel-control-next-icon' aria-hidden='true'></span>
                                <span class='visually-hidden'>Next</span>
                            </button>
                        </div>
            
                        <!-- Clinic Details -->
                        <div class='clinic-card-body'>
                            <div class='d-flex justify-content-between align-items-start mb-3'>
                                <h5 class='card-title mb-0'>${clinic.clinicName}</h5>
                                <div class='dropdown'>
                                    <button class='options-btn' type='button' id='clinicOptionsMenu' data-bs-toggle='dropdown' aria-expanded='false'>
                                        <i class='fas fa-ellipsis-v'></i>
                                    </button>
                                    <input type='hidden' id='clinic_id_hidden_${clinic.clinicId}' value='${clinic.clinicId}'>
                                    <ul class='dropdown-menu dropdown-menu-end clinic-dropdown-menu' aria-labelledby='clinicOptionsMenu'>
                                        <li><a class='dropdown-item schedule btn' data-bs-toggle='modal' data-bs-target='#clinicShiftsModal' onclick="openScheduleModal(${clinic.clinicId})"><i class='fas fa-calendar-alt'></i>Manage Schedules</a></li>
                                        <li><a class='dropdown-item edit btn' href='#'><i class='fas fa-edit'></i>Edit</a></li>
                                        <li><hr class='dropdown-divider'></li>
                                        <li><a class='dropdown-item delete btn' id='delete_btn_${clinic.clinicId}' onclick='deleteClinic(${clinic.clinicId})' href='#'><i class='fas fa-trash'></i>Delete</a></li>
                                    </ul>
                                </div>
                            </div>
            
                            <div class='clinic-info-item'>
                                <span class='clinic-info-icon'><i class='fas fa-map-marker-alt'></i></span>
                                <span>${clinic.address}, ${clinic.city.city}</span>
                            </div>
            
                            <div class='clinic-info-item'>
                                <span class='clinic-info-icon'><i class='fas fa-phone'></i></span>
                                <span>${clinic.contact}</span>
                            </div>
            
                            <div class='clinic-info-item'>
                                <span class='clinic-info-icon'><i class='fas fa-indian-rupee-sign'></i></span>
                                <span>Consultation Fee: ${clinic.consultationFee}</span>
                            </div>
                           <div class="mt-3 mb-3 p-3 rounded border shadow-sm bg-light" id="clinic_days">
                                <h6 class="fw-bold text-primary mb-2">
                                    <i class="fas fa-calendar-day me-2 text-primary"></i>Available Days
                                </h6>
                                <div class="d-flex flex-wrap gap-2">
                                    ${clinic.clinicDays.map(day => `
                                        <span class="badge bg-success text-white py-2 px-3 shadow-sm fw-medium">
                                            ${day.day.name}
                                        </span>
                                    `).join('')}
                                </div>
                            </div>


                            <!-- Clinic Shifts Display Area -->
                            <div class="clinic-shifts-section mt-3">
                                <button 
                                    class="btn btn-outline-primary w-100 d-flex justify-content-between align-items-center mb-2" 
                                    type="button" 
                                    data-bs-toggle="collapse" 
                                    data-bs-target="#clinicShiftsCollapse_${clinic.clinicId}" 
                                    aria-expanded="false" 
                                    aria-controls="clinicShiftsCollapse_${clinic.clinicId}"
                                    onclick="toggleShiftIcon(${clinic.clinicId})"
                                >
                                    <span><i class="fas fa-clock me-2"></i>Clinic Shifts</span>
                                    <i id="shift-icon-${clinic.clinicId}" class="fas fa-chevron-down"></i>
                                </button>

                                <div class="collapse" id="clinicShiftsCollapse_${clinic.clinicId}" style="max-height: 250px; overflow-y: auto;">
                                    <ul class="list-group list-group-flush">
                                        ${clinic.clinicShifts.map(shift => `
                                            <li class="list-group-item px-3 py-3 mb-2 border-start border-4 border-primary rounded-3 shadow-sm bg-white">
                                                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center text-center text-md-start small">
                                                    
                                                    <div class="px-2 flex-fill border-end mb-2 mb-md-0">
                                                        <i class="fas fa-clock text-primary me-1"></i>
                                                        <strong>Start:</strong>
                                                        <span>${formatTime(shift.startTime)}</span>
                                                    </div>
                                                    
                                                    <div class="px-2 flex-fill border-end mb-2 mb-md-0">
                                                        <i class="fas fa-hourglass-end text-success me-1"></i>
                                                        <strong>End:</strong>
                                                        <span>${formatTime(shift.endTime)}</span>
                                                    </div>
                                                    
                                                    <div class="px-2 flex-fill">
                                                        <i class="fas fa-users text-info me-1"></i>
                                                        <strong>Max Appointments:</strong>
                                                        <span>${shift.maxAppointment || '10'}</span>
                                                    </div>
                                                </div>
                                            </li>
                                        `).join('')}
                                    </ul>
                                </div>
                            </div>
                            <div class='action-buttons mt-3'>
                                <a href='clinicAppointments.jsp?clinic_id=${clinic.clinicId}' class='btn btn-gradient w-100'>
                                    <i class='fas fa-calendar-check me-2'></i>View Appointments
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                
            `;

                showClinicPic(clinic.clinicId);
            }
            document.querySelector(".clinic_containers").innerHTML = clinicCardsHTML;
        } else {
            document.querySelector(".clinic_containers").innerHTML = "<h3> no clinics found</h3>"
        }
    })
        .catch((err) => {
            console.log(err);
        })
}

showClinics();





const collectClinicPic = async (clinicId) => {

    let response = await fetch("collect_clinic_pic.do?clinicId=" + clinicId);

    let result = await response.json();

    return result;
}

function toggleShiftIcon(clinicId) {
    const icon = document.getElementById(`shift-icon-${clinicId}`);
    icon.classList.toggle("fa-chevron-down");
    icon.classList.toggle("fa-chevron-up");
}

const showClinicPic = (clinicId) => {

    collectClinicPic(clinicId).then((data) => {
        if (data != 'empty') {
            for (let next of data) {

                if (next.clinic.clinicId == clinicId) {
                    let clinicImagesContainer = document.getElementById(`clinicImages${next.clinic.clinicId}`);

                    let activeClass = clinicImagesContainer.children.length === 0 ? 'active' : '';
                    let imgElement = document.createElement('div');
                    imgElement.className = `carousel-item ${activeClass}`;
                    imgElement.innerHTML = `<img src='download_media.do?path=${next.picPath}' class='img-thumbnail w-100' style='height: 300px; object-fit: cover;' alt='Clinic Image'>`;
                    clinicImagesContainer.appendChild(imgElement);
                }
            }
        }
    }).catch((err) => {
        console.log("error in fetching clinic pic paths" + err);
    })
}


const reqdeleteClinic = async (clinicId) => {


    let response = await fetch("delete_clinic.do?clinic_id=" + clinicId);

    let result = await response.text();

    return result;
}

const deleteClinic = (clinicId) => {
    if (confirm("Are you sure you want to delete this clinic?")) {

        reqdeleteClinic(clinicId).then((data) => {
            console.log(data);

            if (data == "yes") {

                alert("clinic deleted successfully");
                document.getElementById("clinic_card_" + clinicId).innerHTML = " "
            } else {
                console.log("no data fetched");

            }
        }).catch((err) => {
            console.log(err);

        });
    }
}


dayButtons.forEach(btn => {
    btn.addEventListener('click', () => {
        btn.classList.toggle('active');

        // Select the hidden checkbox associated with the button
        const checkbox = btn.querySelector('input');
        checkbox.checked = !checkbox.checked;
    });
});

const hiddenInput = document.getElementById("clinic_id_hidden_modal");
function openScheduleModal(clinicId) {
    if (hiddenInput) {
        hiddenInput.value = clinicId;
        console.log("Set clinic ID to:", clinicId);
    }
    // You can open modal manually if needed, or rely on data-bs-toggle
    // new bootstrap.Modal(document.getElementById('clinicShiftsModal')).show();
}

const saveClinicShift = async () => {

    const clinicId = hiddenInput.value;
    console.log(clinicId);

    const startTime = document.getElementById("start_time").value;

    const endTime = document.getElementById("end_time").value;
    const maxAppointment = document.getElementById("max_appointment").value;

    let response = await fetch(`save_clinic_shifts.do?clinic_id=${clinicId}&start_time=${startTime}&end_time=${endTime}&max_appointment=${maxAppointment}`)

    let result = await response.text();
    return result;
}

document.getElementById("save_clinic_shift_btn").addEventListener('click', () => {
    saveClinicShift().then((data) => {
        if (data == 'saved') {
            // showAllClinicShifts();
            let modal = bootstrap.Modal.getInstance(document.getElementById("clinicShiftsModal"))
            modal.hide();
            document.getElementById("save_clinic_shift_form").reset();
        }
    }).catch((err) => {
        console.log("error in saving clinic shift", err);

    })
})




document.addEventListener("DOMContentLoaded", () => {
    const dayButtons = document.querySelectorAll(".day-btn");

    dayButtons.forEach(btn => {
        btn.addEventListener("click", () => {
            const checkbox = btn.querySelector("input[type='checkbox']");
            checkbox.checked = !checkbox.checked;
            btn.classList.toggle("active", checkbox.checked);
        });
    });
});


// Image preview functionality
function previewImage(event) {
    const imagePreview = document.getElementById('imagePreview');
    const files = event.target.files;

    if (files.length > 0) {
        Array.from(files).forEach(file => {
            const reader = new FileReader();

            reader.onload = function (e) {
                const imgElement = document.createElement('img');
                imgElement.src = e.target.result;
                imgElement.classList.add('img-thumbnail', 'm-2');
                imgElement.style.width = '150px';   // Set preview size
                imgElement.style.height = '150px';

                imagePreview.appendChild(imgElement);
            };

            reader.readAsDataURL(file);
        });
    }
}

if (profileIncompleteToastBtn) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(profileIncompleteToast)
    profileIncompleteToastBtn.addEventListener('click', () => {
        toastBootstrap.show();
    })
    document.getElementById("completeProfileBtn").addEventListener('click', () => {
        toastBootstrap.hide();
    })
}


