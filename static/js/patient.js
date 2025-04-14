
// Sample JavaScript for functionality
document.addEventListener('DOMContentLoaded', function () {
    // Toggle sidebar on mobile



});


// ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~````



// Wait for the DOM to be fully loaded before executing JavaScript
document.addEventListener('DOMContentLoaded', function () {
    // ========== mood functionality ===============

    const moodOptions = document.querySelectorAll(".quiz-option");

    moodOptions.forEach(option => {
        option.addEventListener("click", () => {
            // Remove "selected" from all
            moodOptions.forEach(opt => opt.classList.remove("selected"));

            // Add "selected" class to clicked one
            option.classList.add("selected");

            // Get mood and show fun message
            const mood = option.getAttribute("data-mood");
            let message = "";

            switch (mood) {
                case "great":
                    message = '<i class="far fa-smile text-success"></i> Awesome! Stay positive and shine bright!';
                    break;
                case "okay":
                    message = '<i class="far fa-meh text-warning"></i> Hang in there! Better days are coming!';
                    break;
                case "not-well":
                    message = '<i class="far fa-frown text-danger"></i> Take it easy. Remember to take care of yourself!';
                    break;
            }


            // Show fun message (toast-style alert)
            showMoodToast(message);
        });
    });


    // ========== SIDEBAR FUNCTIONALITY ==========
    const toggleSidebar = () => {
        const sidebar = document.querySelector('.sidebar');
        const mainContent = document.querySelector('.main-content');
        sidebar.classList.toggle('active');
        mainContent.classList.toggle('full-width');
    };

    // Mobile sidebar toggle
    const toggleSidebarBtn = document.querySelector('.sidebar-toggle');
    const sidebar = document.querySelector('.sidebar');
    const mainContent = document.querySelector('.main-content');


    // Add toggle button if it doesn't exist (it's missing in the HTML)
    if (!toggleSidebarBtn && window.innerWidth < 992) {
        const toggleBtn = document.createElement('button');
        toggleBtn.classList.add('btn', 'btn-sm', 'sidebar-toggle');
        toggleBtn.innerHTML = '<i class="fas fa-bars"></i>';
        toggleBtn.style.position = 'fixed';
        toggleBtn.style.top = '10px';
        toggleBtn.style.left = '10px';
        toggleBtn.style.zIndex = '1050';
        document.body.appendChild(toggleBtn);

        toggleBtn.addEventListener('click', function () {
            sidebar.classList.toggle('active');
            mainContent.classList.toggle('full-width');
        });
    }

    // Handle sidebar navigation links
    const navLinks = document.querySelectorAll('.sidebar .nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', function (e) {
            // Remove active class from all links
            navLinks.forEach(l => l.classList.remove('active'));
            // Add active class to clicked link
            this.classList.add('active');

            // If on mobile, close sidebar after clicking
            if (window.innerWidth < 992) {
                sidebar.classList.remove('active');
            }

            // Smooth scroll to section
            const sectionId = this.getAttribute('href');
            if (sectionId && sectionId.startsWith('#') && sectionId !== '#') {
                e.preventDefault();
                const section = document.querySelector(sectionId);
                if (section) {
                    window.scrollTo({
                        top: section.offsetTop - 20,
                        behavior: 'smooth'
                    });
                }
            }
        });
    });



    // Doctor profile view buttons
    const viewProfileButtons = document.querySelectorAll('.doctor-card .btn-outline-primary');
    viewProfileButtons.forEach(button => {
        button.addEventListener('click', function () {
            const doctorName = this.closest('.card-body').querySelector('h5').textContent;

            // In a real app, this would open a modal or navigate to doctor profile page
            showModal(`${doctorName}'s Profile`, `
                <div class="text-center mb-4">
                    <img src="${this.closest('.card-body').querySelector('img').src}" 
                         alt="Doctor" class="rounded-circle mb-3" style="width: 120px; height: 120px;">
                    <h4>${doctorName}</h4>
                    <p>${this.closest('.card-body').querySelector('p.text-muted').textContent}</p>
                    
                    <div class="text-warning mb-3">
                        ${this.closest('.card-body').querySelector('.text-warning').innerHTML}
                    </div>
                </div>
                
                <div class="row mb-3">
                    <div class="col-6">
                        <p><strong>Experience:</strong> 10+ years</p>
                        <p><strong>Languages:</strong> English, Spanish</p>
                    </div>
                    <div class="col-6">
                        <p><strong>Education:</strong> Harvard Medical School</p>
                        <p><strong>Office Hours:</strong> Mon-Fri, 9AM-5PM</p>
                    </div>
                </div>
                
                <button class="btn btn-primary w-100">Book Appointment</button>
            `);
        });
    });

    // ========== PRESCRIPTION FUNCTIONALITY ==========

    const refillButtons = document.querySelectorAll('#prescriptions .btn-outline-primary');
    refillButtons.forEach(button => {
        button.addEventListener('click', function () {
            const medicationName = this.closest('.prescription-card').querySelector('h6').textContent;

            showAlert(`Refill request sent for ${medicationName}. Your doctor will review and approve shortly.`, 'success');

            // Disable button temporarily
            this.disabled = true;
            this.innerHTML = '<i class="fas fa-check me-1"></i>Request Sent';

            // Re-enable after 5 seconds
            setTimeout(() => {
                this.disabled = false;
                this.innerHTML = 'Request Refill';
            }, 5000);
        });
    });

    function showAlert(message, type = 'success') {
        // Create alert div
        const alert = document.createElement('div');
        alert.className = `alert alert-${type} alert-dismissible fade show position-fixed top-0 start-50 translate-middle-x mt-3 shadow`;
        alert.style.zIndex = '1050';
        alert.style.minWidth = '300px';
        alert.innerHTML = `
            ${message}
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        `;

        document.body.appendChild(alert);

        // Auto-dismiss after 5 seconds
        setTimeout(() => {
            alert.classList.remove('show');
            alert.classList.add('fade');
            setTimeout(() => alert.remove(), 500); // Cleanup
        }, 5000);
    }


    // ========== HEALTH TRACKER FUNCTIONALITY ==========

    const updateMetricsBtn = document.querySelector('#health_tracker button.btn-outline-primary');

    if (updateMetricsBtn) {
        updateMetricsBtn.addEventListener('click', function () {

            // Show the modal form using custom modal rendering function
            showModal('Update Health Metrics', `
            <form id="health-metrics-form">
                <div class="mb-3">
                    <label class="form-label">Blood Pressure (systolic/diastolic)</label>
                    <div class="input-group">
                        <input type="number" class="form-control" id="bp-systolic" placeholder="Systolic" min="70" max="200">
                        <span class="input-group-text">/</span>
                        <input type="number" class="form-control" id="bp-diastolic" placeholder="Diastolic" min="40" max="130">
                    </div>
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Weight (kg)</label>
                    <input type="number" class="form-control" id="weight" step="0.1" min="30" max="200">
                </div>
                
                <div class="mb-3">
                    <label class="form-label">Heart Rate (bpm)</label>
                    <input type="number" class="form-control" id="heart-rate" min="40" max="200">
                </div>
                
                <button type="submit" class="btn btn-primary w-100">Save Metrics</button>
            </form>
        `);

            // Form submission handler
            document.getElementById('health-metrics-form').addEventListener('submit', function (e) {
                e.preventDefault();

                const systolic = parseInt(document.getElementById('bp-systolic').value.trim());
                const diastolic = parseInt(document.getElementById('bp-diastolic').value.trim());
                const weight = parseFloat(document.getElementById('weight').value.trim());
                const heartRate = parseInt(document.getElementById('heart-rate').value.trim());

                if (
                    isNaN(systolic) ||
                    isNaN(diastolic) ||
                    isNaN(weight) ||
                    isNaN(heartRate)
                ) {
                    showAlert('Please fill in all health metrics correctly!', 'warning');
                    return;
                }

                // ✅ Proceed to update UI
                document.querySelector('#health_tracker .d-flex.justify-content-between:nth-child(1) span:last-child').textContent = `${systolic}/${diastolic}`;
                document.querySelector('#health_tracker .d-flex.justify-content-between:nth-child(2) span:last-child').textContent = `${weight} kg`;
                document.querySelector('#health_tracker .d-flex.justify-content-between:nth-child(3) span:last-child').textContent = `${heartRate} bpm`;

                const bpScore = calculateBPScore(systolic, diastolic);
                const weightScore = calculateWeightScore(weight);
                const hrScore = calculateHeartRateScore(heartRate);
                const overallScore = Math.round((bpScore + weightScore + hrScore) / 3);

                document.querySelector('#health_tracker .progress-bar.bg-success').style.width = `${bpScore}%`;
                document.querySelector('#health_tracker .progress-bar.bg-primary').style.width = `${weightScore}%`;
                document.querySelector('#health_tracker .progress-bar.bg-info').style.width = `${hrScore}%`;

                document.querySelector('#health_tracker path[stroke="#1e88e5"]').setAttribute('stroke-dasharray', `${overallScore}, 100`);
                document.querySelector('#health_tracker .metric-value').textContent = `${overallScore}%`;

                closeModal();
                showAlert('Health metrics updated successfully!', 'success');
            });

        });
    }

    // Helper functions for health score calculations (simplified)
    function calculateBPScore(systolic, diastolic) {
        return (120 - Math.abs(120 - systolic) - Math.abs(80 - diastolic)) * 0.8; // Normalize
    }

    function calculateWeightScore(weight) {
        return weight >= 50 && weight <= 80 ? 100 : Math.max(0, 100 - Math.abs(65 - weight));
    }

    function calculateHeartRateScore(hr) {
        return hr >= 60 && hr <= 100 ? 100 : Math.max(0, 100 - Math.abs(80 - hr));
    }

    // ========== ARTICLE FUNCTIONALITY ==========

    // Article "Read More" buttons
    const readMoreButtons = document.querySelectorAll('#health_articles .btn-outline-primary');
    readMoreButtons.forEach(button => {
        button.addEventListener('click', function () {
            const articleTitle = this.closest('.card-body').querySelector('h5').textContent;
            const articleSummary = this.closest('.card-body').querySelector('p').textContent;

            showModal(articleTitle, `
                <img src="/api/placeholder/800/400" class="img-fluid rounded mb-3" alt="Article Image">
                <p class="lead">${articleSummary}</p>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla facilisi. 
                    Sed euismod, purus vel fermentum malesuada, nunc arcu tincidunt nisi, at 
                    aliquam arcu nisi vel nisi. Sed euismod, purus vel fermentum malesuada, 
                    nunc arcu tincidunt nisi, at aliquam arcu nisi vel nisi.
                </p>
                <p>
                    Etiam tincidunt magna vel nisi ultrices, ut aliquam nisi tincidunt. 
                    Curabitur euismod, purus vel fermentum malesuada, nunc arcu tincidunt nisi, 
                    at aliquam arcu nisi vel nisi. Sed euismod, purus vel fermentum malesuada, 
                    nunc arcu tincidunt nisi, at aliquam arcu nisi vel nisi.
                </p>
                <div class="mt-4">
                    <button class="btn btn-outline-primary me-2">Save Article</button>
                    <button class="btn btn-primary">Share</button>
                </div>
            `);
        });
    });

    // ========== CLINIC FINDER FUNCTIONALITY ==========

    // Clinic search
    const clinicSearchInput = document.querySelector('#find_nearby_clinic input');
    if (clinicSearchInput) {
        clinicSearchInput.addEventListener('keyup', function (e) {
            if (e.key === 'Enter') {
                const searchTerm = this.value.trim();
                if (searchTerm) {
                    showAlert(`Searching for clinics near "${searchTerm}"...`, 'info');
                    // In a real app, this would call an API to find nearby clinics
                    setTimeout(() => {
                        // Simulate API response
                        updateClinicResults(searchTerm);
                    }, 1000);
                }
            }
        });
    }

    // Function to update clinic search results
    function updateClinicResults(location) {
        const resultsContainer = document.querySelector('#find_nearby_clinic .row');

        // Clear existing results
        resultsContainer.innerHTML = '';

        // Mock data - in real app would come from API
        const clinics = [
            {
                name: `MediCare+ Primary Care ${location}`,
                address: `123 Medical Ave, ${location}`,
                open: true,
                closeTime: '7:00 PM',
                rating: 4.7
            },
            {
                name: `MediCare+ Specialty Clinic ${location}`,
                address: `456 Health Blvd, ${location}`,
                open: true,
                closeTime: '5:30 PM',
                rating: 4.2
            },
            {
                name: `MediCare+ Urgent Care ${location}`,
                address: `789 Emergency Dr, ${location}`,
                open: true,
                closeTime: '10:00 PM',
                rating: 4.5
            },
            {
                name: `MediCare+ Family Practice ${location}`,
                address: `321 Wellness Way, ${location}`,
                open: false,
                closeTime: 'Closed Today',
                rating: 4.9
            }
        ];

        // Create and append clinic cards
        clinics.forEach(clinic => {
            const clinicCol = document.createElement('div');
            clinicCol.classList.add('col-md-6', 'mb-3');

            const stars = generateStarRating(clinic.rating);

            clinicCol.innerHTML = `
                <div class="card h-100">
                    <div class="card-body">
                        <h6>${clinic.name}</h6>
                        <p class="text-muted mb-2"><i class="fas fa-map-marker-alt me-2"></i>${clinic.address}</p>
                        <div class="d-flex align-items-center mb-2">
                            <span class="badge-clinic-${clinic.open ? 'open' : 'closed'} me-3">
                                <i class="fas fa-circle me-1"></i>${clinic.open ? 'Open Now' : 'Closed'}
                            </span>
                            <span class="text-muted small">${clinic.open ? 'Closes at ' + clinic.closeTime : clinic.closeTime}</span>
                        </div>
                        <div class="text-warning mb-3">
                            ${stars}
                            <span class="text-muted ms-1">(${clinic.rating})</span>
                        </div>
                        <div class="d-flex">
                            <button class="btn btn-sm btn-outline-primary me-2">
                                <i class="fas fa-directions me-1"></i>Directions
                            </button>
                            <button class="btn btn-sm btn-primary">
                                <i class="fas fa-calendar-plus me-1"></i>Book
                            </button>
                        </div>
                    </div>
                </div>
            `;

            resultsContainer.appendChild(clinicCol);
        });

        // Handle new buttons
        const directionButtons = document.querySelectorAll('#find_nearby_clinic .btn-outline-primary');
        directionButtons.forEach(button => {
            button.addEventListener('click', function () {
                const clinicName = this.closest('.card-body').querySelector('h6').textContent;
                const clinicAddress = this.closest('.card-body').querySelector('p').textContent.replace(/.*\u{fa3c}/u, '').trim();

                // In a real app, this would open map directions
                showAlert(`Opening directions to ${clinicName} at ${clinicAddress}`, 'info');
            });
        });

        const bookButtons = document.querySelectorAll('#find_nearby_clinic .btn-primary');
        bookButtons.forEach(button => {
            button.addEventListener('click', function () {
                const clinicName = this.closest('.card-body').querySelector('h6').textContent;

                // Scroll to appointment booking section
                const appointmentSection = document.querySelector('#appointments');
                window.scrollTo({
                    top: appointmentSection.offsetTop - 20,
                    behavior: 'smooth'
                });

                showAlert(`Booking appointment at ${clinicName}`, 'info');
            });
        });
    }

    // Generate star rating HTML
    function generateStarRating(rating) {
        let stars = '';
        for (let i = 1; i <= 5; i++) {
            if (i <= Math.floor(rating)) {
                stars += '<i class="fas fa-star"></i>';
            } else if (i - 0.5 <= rating) {
                stars += '<i class="fas fa-star-half-alt"></i>';
            } else {
                stars += '<i class="far fa-star"></i>';
            }
        }
        return stars;
    }

    // ===========update top bar functions ========


    function updateTimeFancy() {
        const now = new Date();
        const time = now.toLocaleTimeString('en-US', {
            hour: '2-digit',
            minute: '2-digit'
        });
        const date = now.toLocaleDateString('en-US', {
            weekday: 'long',
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });
        document.getElementById("liveClock").textContent = time;
        document.getElementById("liveDate").textContent = date;
    }
    setInterval(updateTimeFancy, 1000);
    updateTimeFancy();

    const tips = [
        '<i class="fas fa-tint text-primary me-2"></i> Stay hydrated! Drink at least 8 glasses of water daily.',
        '<i class="fas fa-leaf text-success me-2"></i> Eat more greens. A balanced diet boosts immunity.',
        '<i class="fas fa-bed text-info me-2"></i> Sleep well! 7-8 hours of rest is essential.',
        '<i class="fas fa-walking text-warning me-2"></i> A 30-minute walk each day improves heart health.',
        '<i class="fas fa-brain text-danger me-2"></i> Mental health matters. Take breaks, breathe, and relax.'
    ];


    let tipIndex = 0;
    function rotateTips() {
        document.getElementById("tipBox").innerHTML = tips[tipIndex];
        tipIndex = (tipIndex + 1) % tips.length;
    }

    setInterval(rotateTips, 5000);
    rotateTips();



    // ========== UI HELPER FUNCTIONS ==========

    // Show a modal dialog
    function showModal(title, content) {
        // Remove any existing modal
        let modal = document.getElementById('dynamic-modal');
        if (modal) {
            document.body.removeChild(modal);
        }

        // Create modal element
        modal = document.createElement('div');
        modal.id = 'dynamic-modal';
        modal.classList.add('modal', 'fade', 'show');
        modal.style.display = 'block';
        modal.style.backgroundColor = 'rgba(0,0,0,0.5)';

        modal.innerHTML = `
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${title}</h5>
                        <button type="button" class="btn-close" onclick="closeModal()"></button>
                    </div>
                    <div class="modal-body">
                        ${content}
                    </div>
                </div>
            </div>
        `;

        document.body.appendChild(modal);

        // Add close modal function to window
        window.closeModal = function () {
            const modal = document.getElementById('dynamic-modal');
            if (modal) {
                document.body.removeChild(modal);
            }
        };

        // Close modal on background click
        modal.addEventListener('click', function (e) {
            if (e.target === modal) {
                closeModal();
            }
        });
    }
});

// ======== collect doctors ======

const collectTopDoctors = async () => {
    let response = await fetch('collect_doctors.do');
    let result = await response.json();
    console.log(result);


    return result;
}


const showTopDoctors = async () => {
    collectTopDoctors().then((data) => {
        const topDoctors = document.querySelector(".top_doctors_row");
        topDoctors.innerHTML = '';

        if (data != "empty") {
            for (let doctor of data) {
                console.log();

                topDoctors.innerHTML +=
                    `<div class="col-md-6 col-lg-3 mb-3">
                                    <div class="card doctor-card h-100" id="top_doctor_card_${doctor.doctorId}">
                                        <div class="card-body">
                                            <div class="text-center mb-3">
                                                <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="Doctor"
                                                    class="rounded-circle" style="width: 100px; height: 100px;">
                                                <h5 class="mt-3 mb-1">${doctor.user.name}</h5>
                                                <p class="text-muted mb-1">${doctor.specialization.specialization}</p>
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
                                                <button class="btn btn-sm btn-outline-primary w-100 me-2 view-profile-btn" id="doctor_profile_btn" data-doctor-id="${doctor.doctorId}">View
                                                    Profile</button>
                                                <button class="btn btn-sm btn-primary w-100">Book Now</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                `
            }
            document.querySelectorAll('.view-profile-btn').forEach(btn => {
                btn.addEventListener('click', function () {
                    const doctorId = parseInt(this.getAttribute('data-doctor-id'));
                    showDoctorProfileModal(doctorId, data); // Now safe to pass
                });
            });
        } else {
            console.log("doctors not fetched");

        }
    }).catch((err) => {
        console.log(err);

    })
}

showTopDoctors();


// Doctor profile view buttons

function showDoctorProfileModal(doctorId, data) {
    console.log(data);
    let dataForProfile = data.filter(item => item.doctorId == doctorId);
    const doctor = dataForProfile[0];


    const modalContent = `
    <div class="modal fade" id="doctorProfileModal" tabindex="-1" aria-labelledby="doctorProfileLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content shadow-sm border-0 rounded-lg overflow-hidden">
          <!-- Profile Header with Background -->
          <div class="position-relative">
            <div class="text-center" style="margin-top: 10px;">
              <img src="static/media/images/doctor.png" alt="${doctor.user.name}" 
                  class="rounded-circle border border-4 border-white shadow" 
                  style="width: 120px; height: 120px; object-fit: cover;">
            </div>
          </div>
          
          <!-- Doctor Info Section -->
          <div class="modal-body p-2 pt-1">
            <div class="text-center mb-3">
              <h3 class="fw-bold mt-2 mb-0">${doctor.user.name}</h3>
              <p class="text-primary mb-1">${doctor.qualification}</p>
              <p class="text-warning mb-1">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star-half-alt"></i>
                <span class="text-muted ms-1">(4.5)</span>
              </p>
              <span class="badge bg-primary-subtle text-primary py-2 px-3 mb-3">
                <i class="fas fa-stethoscope me-1"></i>${doctor.specialization.specialization}
              </span>
            </div>
            
            <hr class="my-3">
            
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
            <div class="d-grid gap-2 w-100">
              <button type="button" class="btn btn-primary btn-lg py-3 shadow-sm" onclick="bookDoctor(${doctor.doctorId})">
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






