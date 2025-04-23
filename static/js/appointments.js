

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
    
    // shiftPlaceholder.style.display = 'block';
    
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

            shiftPlaceholder.style.display = 'none'; // Hide placeholder message
            shiftContainer.innerHTML = '';  // Clear any previous shifts

            // Render clinic shifts after selecting a date
            renderShiftCards();

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
            color: '#d1e7dd' // light green or any highlight color
        })) // Future: Add dynamic shifts/events
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

function showAllAppoinments(clinicShiftId, selectedDate) {
    collectAppoinmentsByClinicShifts(clinicShiftId,selectedDate).then((data)=>{
        if(data!='empty') {
            console.log(data);
        } else {
            console.log("data not fetched");
        }
    }).catch((err)=>{
        console.log(err);
    })
}

