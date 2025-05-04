const collectTopDoctors = async () => {
    let response = await fetch('collect_doctors.do');
    let result = await response.json();

    return result;
}
let allDoctors = [];


const showTopDoctors = async () => {
    collectTopDoctors().then((data) => {
        console.log(data);
        if (data != "empty") {

            allDoctors = data;
            renderDoctorCards(data.slice(0, 4));

        } else {
            console.log("doctors not fetched");

        }
    }).catch((err) => {
        console.log(err);

    })
}


function renderDoctorCards(doctors) {
    const topDoctors = document.querySelector(".top_doctors_row");
    topDoctors.innerHTML = '';

    for (let doctor of doctors) {
        topDoctors.innerHTML +=
            `<div class="col-md-6 col-lg-3 mb-4">
    <div class="card doctor-card h-100 shadow-sm border-0 transition-scale" id="top_doctor_card_${doctor.doctorId}">
        <div class="card-body text-center">
            <div class="mb-3">
                <img src="static/media/images/home_doctor.jpeg" alt="Doctor"
                    class="rounded-circle border border-3 border-primary shadow-sm"
                    style="width: 100px; height: 100px; object-fit: cover;">
            </div>
            <h5 class="fw-bold mb-1">${doctor.user.name}</h5>
            <p class="text-muted mb-1 small">${doctor.specialization.specialization}</p>
            <p class="text-muted mb-2 small"><i class="fas fa-map-marker-alt me-1"></i>${doctor.user.city.city}</p>
            
            <div class="text-warning mb-2">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span class="text-muted small ms-1">(4.7)</span>
            </div>

            <span class="badge bg-gradient-success text-white px-3 py-1 rounded-pill mb-3">
                <i class="fas fa-circle me-1"></i>Open Now
            </span>

            <div class="d-flex justify-content-between mt-3 gap-2">
                <button class="btn btn-outline-primary w-50 view-profile-btn" 
                    id="doctor_profile_btn" data-doctor-id="${doctor.doctorId}">
                    <i class="fas fa-user me-1"></i> Profile
                </button>
                <button class="btn btn-primary w-50" onclick="promptLogin()">
                    <i class="fas fa-calendar-check me-1"></i> Book
                </button>
            </div>
        </div>
    </div>
</div>

        `

        document.querySelectorAll('.view-profile-btn').forEach(btn => {
            btn.addEventListener('click', function () {
                const doctorId = parseInt(this.getAttribute('data-doctor-id'));
                showDoctorProfileModal(doctorId, doctors); // Now safe to pass
            });
        });
    }
}

showTopDoctors();



// Filter doctors by city, name, specialization
function filterDoctors() {
    const searchQuery = document.getElementById("doctorSearchInput").value.toLowerCase();

    const filtered = allDoctors.filter(doc => {
        const nameMatch = doc.user.name.toLowerCase().includes(searchQuery);
        const specMatch = doc.specialization.specialization.toLowerCase().includes(searchQuery);
        const cityMatch = selectedCity ? doc.user.city.city.toLowerCase() === selectedCity : true;

        return (nameMatch || specMatch) && cityMatch;
    });

    renderDoctorCards(filtered.slice(0, 4)); // show top 4
}
document.getElementById("doctorSearchInput").addEventListener("input", filterDoctors);


let typedCityFilter = '';
let typingTimer;

document.querySelector('.dropdown-menu.city-dropdown').addEventListener('keydown', function (e) {
    if (e.key.length === 1 && /^[a-zA-Z]$/.test(e.key)) {
        typedCityFilter += e.key.toLowerCase();

        clearTimeout(typingTimer);
        typingTimer = setTimeout(() => typedCityFilter = '', 1500);

        this.querySelectorAll('.dropdown-item').forEach(item => {
            const city = item.dataset.city.toLowerCase();
            item.style.display = city.startsWith(typedCityFilter) ? 'block' : 'none';
        });
    } else if (e.key === 'Backspace') {
        typedCityFilter = typedCityFilter.slice(0, -1);
    }
});


let selectedCity = ''; // Global

document.querySelectorAll('.dropdown-item[data-city]').forEach(item => {
    item.addEventListener('click', function () {
        selectedCity = this.dataset.city.toLowerCase();
        updateSelectedCity(selectedCity);
        filterDoctors();
    });
});

document.querySelector('.dropdown-menu.city-dropdown').setAttribute('tabindex', '0');

document.getElementById('cityFilterButton').addEventListener('click', () => {
    setTimeout(() => {
        document.querySelector('.dropdown-menu.city-dropdown').focus();
    }, 100);
});


function updateSelectedCity(city) {
    const badge = document.getElementById('selectedCityBadge');
    const cityNameEl = badge.querySelector('.selected-city-name');
    
    if (city) {
      cityNameEl.textContent = city;
      badge.classList.remove('d-none');
    } else {
      badge.classList.add('d-none');
    }
  }

  document.querySelector('.clear-city-filter').addEventListener('click', function() {
    selectedCity = '';
    updateSelectedCity('');
    filterDoctors(); // Your existing function
  });

function showDoctorProfileModal(doctorId, data) {
    let dataForProfile = data.filter(item => item.doctorId == doctorId);
    const doctor = dataForProfile[0];


    const modalContent = `
    <div class="modal fade" id="doctorProfileModal" tabindex="-1" aria-labelledby="doctorProfileLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content shadow-sm border-0 rounded-lg overflow-hidden">
          <!-- Profile Header with Background -->
          <div class="position-relative">
            <div class="text-center" style="margin-top: 5px;">
              <img src="static/media/images/doctor.png" alt="${doctor.user.name}" 
                  class="rounded-circle border border-4 border-white shadow" 
                  style="width: 120px; height: 120px; object-fit: cover;">
            </div>
            </div>
            
            <!-- Doctor Info Section -->
            <div class="modal-body p-1 ">
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            <div class="text-center mb-1">
              <h3 class="fw-bold mb-0">${doctor.user.name}</h3>
              <p class="text-primary mb-1">${doctor.qualification}</p>
              <p class="text-warning mb-1">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span class="text-muted ms-1">(4.5)</span>
              </p>
              <span class="badge bg-primary-subtle text-primary py-2 px-3 mb-1">
                <i class="fas fa-stethoscope me-1"></i>${doctor.specialization.specialization}
              </span>
            </div>
            
            <hr class="my-1">
            
            <!-- Doctor Details in Cards -->
            <div class="row g-2">
              <div class="col-md-6 col-lg-4">
                <div class="card h-70 border-0 bg-light">
                  <div class="card-body text-center">
                    <i class="fas fa-calendar-alt text-primary fs-4 mb-1"></i>
                    <h6 class="mb-1">Experience</h6>
                    <p class="mb-0 fw-bold">${doctor.experience} years</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card h-70 border-0 bg-light">
                  <div class="card-body text-center">
                    <i class="fas fa-clinic-medical text-primary fs-4 mb-1"></i>
                    <h6 class="mb-1">Clinics</h6>
                    <p class="mb-0 fw-bold">${doctor.clinicCount}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-4">
                <div class="card h-70 border-0 bg-light">
                  <div class="card-body text-center">
                    <i class="fas fa-map-marker-alt text-primary fs-4 mb-1"></i>
                    <h6 class="mb-1">Location</h6>
                    <p class="mb-0 fw-bold">${doctor.user.city.city}</p>
                  </div>
                </div>
              </div>
              <div class="col-md-6 col-lg-6">
                <div class="card h-70 border-0 bg-light">
                  <div class="card-body text-center">
                    <i class="fas fa-venus-mars text-primary fs-4 mb-1"></i>
                    <h6 class="mb-1">Gender</h6>
                    <p class="mb-0 fw-bold">${doctor.gender}</p>
                  </div>
                </div>  
              </div>
              <div class="col-md-6 col-lg-6">
                <div class="card h-70 border-0 bg-light">
                  <div class="card-body text-center">
                    <i class="fas fa-phone-alt text-primary fs-4 mb-1"></i>
                    <h6 class="mb-1">Contact</h6>
                    <p class="mb-0 fw-bold">${doctor.user.contact}</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
          
          <!-- Footer with Action Buttons -->
          <div class="modal-footer border-0 bg-white p-4 pt-0">
            <input type="hidden" value="${doctor.doctorId}" id="hiddenDoctorId">
            <div class="d-grid gap-2  w-100">
             <button type="button" class="btn btn-primary btn-lg py-3 shadow-sm" onclick="promptLogin()">
  <i class="fas fa-calendar-check me-2"></i>Book Appointment
</button>

              <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                Close
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  `;

    // Remove existing modal if already present
    const existingModal = document.getElementById('doctorProfileModal');
    if (existingModal) existingModal.remove();

    // Append modal and show
    document.body.insertAdjacentHTML('beforeend', modalContent);

    new bootstrap.Modal(document.getElementById('doctorProfileModal')).show();
}

const collectClinicsByCity = async (cityId) => {
    let response = await fetch("collect_city_clinics.do?city_id=" + cityId);
    let result = await response.json();

    return result;
}

const showClinicsByCity = (cityId) => {
    const clinicContainer = document.getElementById("clinicCardsContainer");

    collectClinicsByCity(cityId).then((clinics) => {
        if (clinics != 'empty') {

            clinicContainer.innerHTML = "";
            if (clinics.length === 0) {
                clinicContainer.innerHTML = '<p class="text-danger">No clinics found for this city.</p>';
                return;
            }
            clinics.forEach(clinic => {
                const cardHTML = `
                    <div class="col-md-6">
                        <div class="card h-100 shadow-sm">
                            <div class="card-body">
                                <h6 class="fw-bold">${clinic.clinicName}</h6>
                                <p class="text-muted small mb-2">
                                    <i class="fas fa-map-marker-alt me-2 text-danger"></i>
                                    ${clinic.address}
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
                                    <button class="btn btn-primary btn-sm" onclick="promptLogin()">
                                        <i class="fas fa-calendar-plus me-1"></i>Book Appointment
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                clinicContainer.innerHTML += cardHTML;
            });
        }
    }).catch((err) => {
        console.log(err);
    })
}



function promptLogin() {
    Swal.fire({
        title: 'Login Required',
        text: 'Please log in to book an appointment.',
        icon: 'info',
        showCancelButton: true,
        confirmButtonText: 'Login Now',
        cancelButtonText: 'Cancel',
        confirmButtonColor: '#0d6efd',
        cancelButtonColor: '#6c757d',
        backdrop: true,
        customClass: {
            popup: 'shadow rounded',
            title: 'fw-bold fs-4',
            confirmButton: 'btn btn-primary',
            cancelButton: 'btn btn-outline-secondary'
        }
    }).then((result) => {
        document.querySelectorAll('.modal.show').forEach(modalEl => {
            const modalInstance = bootstrap.Modal.getInstance(modalEl);
            if (modalInstance) {
                modalInstance.hide();
            }
        });

        // Small delay to ensure all modals are closed before opening login modal
        setTimeout(() => {
            const loginModal = new bootstrap.Modal(document.getElementById('signin_form'));
            loginModal.show();
        }, 300);

    });
}

