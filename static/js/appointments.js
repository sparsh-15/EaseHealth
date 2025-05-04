

function formatTime(timeString) {
    if (!timeString || typeof timeString !== "string") return "Invalid Time";

    // Clean any unwanted characters like "?", commas, etc.
    timeString = timeString.replace(/[^\d:APMapm\s]/g, '');

    // Match hh:mm:ss with optional AM/PM (case-insensitive)
    const match = timeString.match(/(\d{1,2}):(\d{2})(?::\d{2})?\s*([AP]M)?/i);

    if (match) {
        const hours = match[1];
        const minutes = match[2];
        const ampm = match[3] ? match[3].toUpperCase() : '';
        return hours + ':' + minutes + (ampm ? ' ' + ampm : '');
    } else {
        return "Invalid Time";
    }
}

let selectedDate = '';
const allowedDays = selectedClinic.clinicDays.map(cd => cd.day.dayId - 1); // Convert to 0-indexed (Sun=0)


document.addEventListener('DOMContentLoaded', function () {
    const calendarEl = document.getElementById('calendar');
    const shiftPlaceholder = document.getElementById('shiftPlaceholder');

    let selectedEventId = null;
    const calendar = new FullCalendar.Calendar(calendarEl, {
        initialView: 'dayGridMonth',
        dateClick: function (info) {
            selectedDate = info.dateStr;

            const clickedDate = new Date(info.dateStr);
            const dayOfWeek = clickedDate.getDay(); // 0 = Sunday, ..., 6 = Saturday

            // if (!allowedDays.includes(dayOfWeek)) {
            //     Swal.fire({
            //         icon: 'error',
            //         title: 'Unavailable Day',
            //         text: `Appointments are not allowed on ${clickedDate.toLocaleDateString('en-US', { weekday: 'long' })}.`
            //     });
            //     return;
            // }

            if (!allowedDays.includes(dayOfWeek)) {
                showToastNotification(`Appointments are not available on ${clickedDate.toLocaleDateString('en-US', { weekday: 'long' })}.`);
                return;
            }

            // 🔄 Remove previously highlighted event (if exists)
            if (selectedEventId) {
                const prevEvent = calendar.getEventById(selectedEventId);
                if (prevEvent) prevEvent.remove();
            }

            selectedEventId = 'selectedDateHighlight';
            calendar.addEvent({
                id: selectedEventId,
                title: '<i class="fas fa-star text-danger fs-5"></i> ', // Optional label
                start: selectedDate,
                allDay: true,
                display: 'background',
                classNames: ['selected-date-highlight']
            });

            Swal.fire({
                title: 'Select Clinic Shifts',
                text: 'Please select a clinic shift to fetch available appointments.',
                icon: 'info', // info icon to indicate that it's an informative message
                confirmButtonText: '<i class="fas fa-calendar-check"></i> Select Shift',
                confirmButtonColor: '#007bff', // Blue color to indicate a selection action
                background: '#f7f7f7', // Light background color
                showClass: {
                    popup: 'animate__animated animate__fadeIn'
                },
                hideClass: {
                    popup: 'animate__animated animate__fadeOut'
                }
            });

            shiftPlaceholder.style.display = 'none';
            shiftContainer.innerHTML = '';
            renderShiftCards();
        },
        eventContent: function (arg) {
            return { html: arg.event.title }; // Allow HTML icons
        },
        headerToolbar: {
            left: 'prev,next today',
            center: 'title',
            right: 'dayGridMonth,timeGridWeek,timeGridDay'
        },
        height: 'auto',
        events: selectedClinic.clinicDays.map(cd => ({
            daysOfWeek: [cd.day.dayId - 1], // FullCalendar starts at 0
            display: 'background',
            color: '#d1e7dd'
        }))

    });

    calendar.render();

    function showToastNotification(message) {
        Swal.fire({
            toast: true,
            position: 'top-end',
            icon: 'warning',
            title: message,
            showConfirmButton: false,
            timer: 3000,
            background: '#f8d7da',
            color: '#721c24',
            timerProgressBar: true
        });
    }
});

function getShiftMeta(rawTime) {
    let dateObj;

    // Handle known cases like "10:30:00" or "Jan 1, 1970, 10:30:00?PM"
    if (rawTime.includes('Jan')) {
        // Parse weird formatted string
        dateObj = new Date(rawTime.replace('?', ' '));
    } else {
        // Convert "HH:mm:ss" format to proper ISO string
        dateObj = new Date("1970-01-01T" + rawTime);
    }

    if (isNaN(dateObj)) return { label: 'Invalid', icon: 'fa-question', cls: 'invalid' };

    const hour = dateObj.getHours();

    if (hour < 12) {
        return { label: 'Morning Shift', icon: 'fa-sun', cls: 'morning' };
    } else if (hour < 17) {
        return { label: 'Afternoon Shift', icon: 'fa-cloud-sun', cls: 'afternoon' };
    } else {
        return { label: 'Evening Shift', icon: 'fa-moon', cls: 'evening' };
    }
}


const shiftContainer = document.getElementById('shiftContainer');
shiftContainer.innerHTML = '';  // clear any placeholder


function renderShiftCards() {

    selectedClinic.clinicShifts.forEach(shift => {
        const start = formatTime(shift.startTime); // e.g. "10:30 AM"
        const end = formatTime(shift.endTime);     // e.g. "12:30 PM"
        const max = shift.maxAppointment;
        const meta = getShiftMeta(shift.startTime);

        const card = document.createElement('div');
        card.className = 'shift-card card p-3 flex-fill mb-3';

        // Add the card content
        card.innerHTML = `
            <div class="d-flex align-items-center btn mb-2" onclick="showAllAppoinments(${shift.clinicShiftId}, '${selectedDate}')">
                <div class="shift-icon ${meta.cls} me-3">
                    <i class="fas ${meta.icon}"></i>
                </div>
                <div>
                    <div class="fw-bold">${meta.label}</div>
                    <div>${start} - ${end}</div>
                    <small class="text-muted">${max} Slots</small>
                </div>
            </div>
        `;

        shiftContainer.appendChild(card); // Append card to the container
    });
}

const collectAppoinmentsByClinicShifts = async (clinicShiftId, selectedDate) => {
    let response = await fetch(`collectAppoinmentByDateShift.do?clinic_shift_id=${clinicShiftId}&date=${selectedDate}`);
    let result = await response.json();

    return result;
}

function calculateAge(dob) {
    const birthDate = new Date(dob);
    const today = new Date();

    let age = today.getFullYear() - birthDate.getFullYear();
    const m = today.getMonth() - birthDate.getMonth();

    // Adjust age if current month/day is before birth month/day
    if (m < 0 || (m === 0 && today.getDate() < birthDate.getDate())) {
        age--;
    }

    return age;
}


function formatBookingTime(rawTime) {
    // Remove unwanted characters like "?" and trim the string
    let cleaned = rawTime.replace(/[?]/g, '').trim();

    // Optional: If you want a cleaner format like "24 Apr 2025, 10:41 AM"
    // Match using RegExp
    const match = cleaned.match(/^(\w+)\s(\d+),\s(\d+),\s(\d+:\d+)(:\d+)?\s(AM|PM)$/);
    if (match) {
        const month = match[1];
        const day = match[2];
        const year = match[3];
        const time = match[4];
        const meridian = match[6];
        return `${day} ${month} ${year}, ${time} ${meridian}`;
    }

    // Fallback: just return cleaned version
    return cleaned;
}


function showAllAppoinments(clinicShiftId, selectedDate) {
    console.log(clinicShiftId);
    console.log(selectedDate);

    collectAppoinmentsByClinicShifts(clinicShiftId, selectedDate).then((data) => {
        if (data !== 'empty' && data.length > 0) {
            console.log(data);
            let tableBody = document.getElementById('appointmentsTbody');
            tableBody.innerHTML = '';


            data.forEach((appointment, index) => {
                let row = document.createElement('tr');
                const dob = appointment.patient.dob;
                console.log(dob);

                const age = calculateAge(dob);
                console.log(age);
                console.log(appointment.bookingTime);

                row.innerHTML = `
                    <td>${formatBookingTime(appointment.bookingTime)}</td>
                    <td class="patient-name">${appointment.patient.user.name}</td>
                    <td>${appointment.patient.user.contact}</td>
                    <td>${age} / ${appointment.patient.gender}</td>
                    <td>${appointment.reason}</td>
                    <td><span class="status-badge ${appointment.status.status.toLowerCase()}">${appointment.status.status}</span></td>
                    <td>
                        <button class="action-btn view-btn" data-bs-toggle="modal" data-bs-target="#appointmentModal" data-index="${index}">
                            <i class="fas fa-eye"></i> View
                        </button>
                        <button class="action-btn reschedule-btn"><i class="fas fa-calendar"></i> Reschedule</button>
                        <button class="action-btn cancel-btn"><i class="fas fa-times"></i> Cancel</button>
                    </td>
                `;

                // Append the row to the appointments table body
                tableBody.appendChild(row);
            });
            document.querySelectorAll('.view-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    const index = this.getAttribute('data-index');
                    const appointmentData = data[index];
                    showPatientAppointmentDetails(appointmentData);
                });
            });

        } else {
            console.log("No data found");
            // You can display a message in the table if no appointments are found
            let tableBody = document.getElementById('appointmentsTbody');
            tableBody.innerHTML = `<tr><td colspan="7" class="text-center">No appointments found</td></tr>`;
        }
    }).catch((err) => {
        console.log(err);
    });
}

function showPatientAppointmentDetails(appointment) {
    // Calculate age
    const age = calculateAge(appointment.patient.dob);

    // Fill modal fields
    document.getElementById('patientName').innerText = appointment.patient.user.name;
    document.getElementById('patientContact').innerText = appointment.patient.user.contact;
    document.getElementById('patientAgeGender').innerText = appointment.patient.user.email;
    // document.getElementById('appointmentCity').innerText = appointment.patient.user.city.city;

    document.getElementById('patientAgeGender').innerText = `${appointment.patient.gender} / ${age} yrs`;
    document.getElementById('patientBloodGroup').innerText = appointment.patient.bloodGroup;
    document.getElementById('patientWeight').innerText = appointment.patient.weight;
    document.getElementById('patientHeight').innerText = appointment.patient.height;

    document.getElementById('appointmentDate').innerText = appointment.appointmentDate;
    document.getElementById('bookingTime').innerText = appointment.bookingTime.replace('?', ' ');
    document.getElementById('appointmentReason').innerText = appointment.reason;


    document.getElementById('appointmentStatus').innerText = appointment.status.status.toLowerCase();

    document.getElementById('createPrescriptionBtn').onclick = () => {
        document.getElementById('prescriptionAppointmentId').value = appointment.appointmentId;

        // First, close the existing appointment modal properly
        const appointmentModalEl = document.getElementById('appointmentModal');
        const appointmentModal = bootstrap.Modal.getInstance(appointmentModalEl);
        appointmentModal.hide();

        // Wait a moment for the first modal to close before opening the second one
        setTimeout(() => {
            // Then open the create prescription modal
            const createPrescriptionModal = new bootstrap.Modal(document.getElementById('createPrescriptionModal'));
            createPrescriptionModal.show();
        }, 300);
    };
}

// prescription form ---------
const input = document.getElementById("medicineSearch");
const suggestions = document.getElementById("medicineSuggestions");


function getFormatNameById(id) {
    const format = allFormats.find(f => f.formatId === id);
    return format ? format.name : "Unknown Format";
}

function getUnitNameById(id) {
    const unit = allUnits.find(u => u.unitId === id);
    return unit ? unit.name : "Unknown Unit";
}

let timeout;
const DEBOUNCE_DELAY = 300;
let selectedIndex = -1;

input.addEventListener('input', function () {
    clearTimeout(timeout);   // cancel previous timer
    const word = input.value.trim();
    selectedIndex = -1;

    if (word.length === 0) {
        suggestions.innerHTML = "";
        return;
    }

    timeout = setTimeout(() => {
        fetchPrescriptionMedicine(word)
            .then((data) => {
                console.log(data);
                displaySuggestions(data);
            })
            .catch(err => console.error("Error fetching medicines:", err));
    }, DEBOUNCE_DELAY);
});

const fetchPrescriptionMedicine = async (word) => {
    let response = await fetch(`searchMedicineServlet.do?word=${encodeURIComponent(word)}`);
    let result = await response.json();
    return result;
}


function displaySuggestions(data) {
    suggestions.innerHTML = "";

    if (!Array.isArray(data) || data.length === 0) {
        suggestions.innerHTML = `<div class='list-group-item disabled text-center'>
                    <i class="fas fa-info-circle me-2"></i>No matches found
                </div>`;
        return;
    }

    data.forEach(med => {
        const div = document.createElement("div");
        div.classList.add("list-group-item", "list-group-item-action");
        div.innerHTML = `<i class="fas fa-pills me-2"></i>${med.name}`;

        div.onclick = () => {
            input.value = med.name;
            suggestions.innerHTML = "";
            document.getElementById("medicineIdHidden").value = med.medicineId;
            populateFormats(med);
        };

        suggestions.appendChild(div);
    });
}


input.addEventListener("keydown", function (e) {
    const items = suggestions.querySelectorAll(".list-group-item-action");
    if (items.length === 0) return;

    if (e.key === "ArrowDown") {
        e.preventDefault();
        if (selectedIndex < items.length - 1) {
            selectedIndex++;
        }
        updateHighlight(items);
    } else if (e.key === "ArrowUp") {
        e.preventDefault();
        if (selectedIndex > 0) {
            selectedIndex--;
        }
        updateHighlight(items);
    } else if (e.key === "Enter") {
        e.preventDefault();
        if (selectedIndex >= 0) {
            items[selectedIndex].click(); // Trigger click
        }
    } else if (e.key === "Escape") {
        suggestions.innerHTML = "";
    }
});

function updateHighlight(items) {
    items.forEach((item, idx) => {
        if (idx === selectedIndex) {
            item.classList.add("active"); // Bootstrap active class
        } else {
            item.classList.remove("active");
        }
    });
}



function populateFormats(medicineJson) {
    medicine = medicineJson; // Save the selected medicine for later

    const formatSelect = document.getElementById("formatSelect");
    formatSelect.style.display = "block";
    formatSelect.innerHTML = '<option value="">-- Select Format --</option>';

    const availableFormatIds = medicine.medicineFormats.map(f => f.format.formatId);

    availableFormatIds.forEach(formatId => {
        const option = document.createElement("option");
        option.value = formatId;
        option.textContent = getFormatNameById(formatId);
        formatSelect.appendChild(option);
    });

    formatSelect.style.opacity = 0;
    formatSelect.style.transition = "opacity 0.3s ease";
    setTimeout(() => {
        formatSelect.style.opacity = 1;
    }, 100);
}

function handleFormatChange() {
    const selectedFormatId = parseInt(document.getElementById("formatSelect").value);
    const denominationList = document.getElementById("denominationList");
    denominationList.innerHTML = "";

    if (!selectedFormatId || isNaN(selectedFormatId)) return;

    const selectedFormat = medicine.medicineFormats.find(
        mf => mf.format.formatId === selectedFormatId
    );

    if (!selectedFormat || !selectedFormat.medicineDenominations.length) {
        denominationList.innerHTML = "<p class='no-denominations'>No denominations available for this format.</p>";
        return;
    }

    selectedFormat.medicineDenominations.forEach(denom => {
        const denomId = denom.medicineDenominationId;
        const quantity = denom.quantity;
        const unitName = getUnitNameById(denom.unit.unitId);

        const wrapper = document.createElement("div");
        wrapper.className = "denomination-item";

        wrapper.innerHTML = `
            <div class="form-check d-flex align-items-center w-100">
                        <input type="checkbox" name="denominationIds" value="${denomId}" 
                            class="form-check-input denomination-checkbox" id="denom-${denomId}"
                            onchange="toggleDosageInput(this, 'dosage-${denomId}')">
                        <label class="form-check-label denomination-label ms-2" for="denom-${denomId}">
                            ${quantity} ${unitName}
                        </label>
                        <div class="ms-auto">
                            <div class="input-group">
                                <input type="number" name="dosage-${denomId}" id="dosage-${denomId}" 
                                     class="form-control dosage-input" placeholder="Units per dose" 
                                        aria-label="Number of units per dose"
                                        disabled min="1">
                                <span class="input-group-text">${unitName}(s)</span>
                            </div>
                        </div>
                    </div>
        `;

        denominationList.appendChild(wrapper);
    });

    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
    tooltipTriggerList.forEach(function (tooltipTriggerEl) {
        new bootstrap.Tooltip(tooltipTriggerEl);
    });
}

function toggleDosageInput(checkbox, dosageInputId) {
    const dosageInput = document.getElementById(dosageInputId);
    if (checkbox.checked) {
        dosageInput.disabled = false;
        dosageInput.required = true;
        dosageInput.focus();
    } else {
        dosageInput.disabled = true;
        dosageInput.required = false;
        dosageInput.value = '';
    }
}
// prescription form text area

function addInstructionText(text) {
    const textarea = document.getElementById('specialInstructions');
    const currentText = textarea.value.trim();

    if (currentText === '') {
        textarea.value = text;
    } else if (currentText.endsWith('.') || currentText.endsWith('!') || currentText.endsWith('?')) {
        textarea.value = currentText + ' ' + text;
    } else {
        textarea.value = currentText + '. ' + text;
    }

    // Focus the textarea and move cursor to the end
    textarea.focus();
    textarea.selectionStart = textarea.selectionEnd = textarea.value.length;
}










