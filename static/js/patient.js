

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

    function showMoodToast(message) {
    const toastContainer = document.getElementById("moodToast");

    const toast = document.createElement("div");
    toast.className = "toast align-items-center text-white bg-dark border-0 show";
    toast.setAttribute("role", "alert");
    toast.setAttribute("aria-live", "assertive");
    toast.setAttribute("aria-atomic", "true");
    toast.style.minWidth = "280px";

    toast.innerHTML = `
        <div class="d-flex">
            <div class="toast-body">
                ${message}
            </div>
            <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
        </div>
    `;

    toastContainer.appendChild(toast);

    // Auto-remove toast after 4s
    setTimeout(() => {
        toast.classList.remove("show");
        toast.classList.add("hide");
        setTimeout(() => toast.remove(), 500); // Fade-out delay
    }, 4000);
}


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


    document.addEventListener('hidden.bs.modal', function () {
        // Check if any modals are still visible
        if (document.querySelectorAll('.modal.show').length === 0) {
            document.body.classList.remove('modal-open');
            document.body.style.overflow = ''; // restore scroll
            document.querySelectorAll('.modal-backdrop').forEach(el => el.remove());
        }
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
                <button class="btn btn-primary w-50" onclick="showClinics(${doctor.doctorId})">
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
              <button type="button" class="btn btn-primary btn-lg py-3 shadow-sm" onclick="showClinics(${doctor.doctorId})">
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

const collectClinicsOfADoctor = async (doctorId) => {
    let response = await fetch('collect_clinics.do?doctor_id=' + doctorId);
    let result = await response.json();

    return result;
}

const collectClinicPic = async (clinicId) => {

    let response = await fetch("collect_clinic_pic.do?clinicId=" + clinicId);

    let result = await response.json();

    return result;
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

function showClinics(doctorId) {
    collectClinicsOfADoctor(doctorId).then((clinics) => {
        console.log(clinics);

        let clinicHtml = clinics.map(clinic => {
            const encodedShifts = encodeURIComponent(JSON.stringify(clinic.clinicShifts));
            const encodedDays = encodeURIComponent(JSON.stringify(clinic.clinicDays));


            return `
          <div class="col">
            <div class="card p-3 mb-3 clinic-option shadow-sm border-0 rounded-3">
              
              <!-- Carousel -->
              <div id='clinicCarousel${clinic.clinicId}' class='carousel slide mb-3' data-bs-ride='carousel'>
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
        
              <!-- Clinic Info BELOW the carousel -->
              <div style="cursor: pointer; transition: transform 0.3s ease;"
                   onclick="selectClinic('${clinic.clinicName}', '${clinic.city.city}', JSON.parse(decodeURIComponent('${encodedShifts}')), JSON.parse(decodeURIComponent('${encodedDays}')))">
                <h6 class="mb-1 fw-bold text-primary">${clinic.clinicName}</h6>
                <p class="mb-1 small text-muted">${clinic.address}</p>
                <p class="mb-0 text-muted">
                  <i class="fas fa-map-marker-alt me-1 text-danger"></i>${clinic.city.city}
                </p>
              </div>
            </div>
          </div>
        `;
        }).join('');

        const modalContent = `
            <div class="modal fade" id="clinicModal" tabindex="-1">
              <div class="modal-dialog modal-lg modal-dialog-centered">
                <div class="modal-content border-0 shadow rounded-4">
                
                  <div class="modal-header bg-primary text-white">
                    <h5 class="modal-title">Choose a Clinic</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                  </div>
                  
                  <div class="modal-body">
                   <div class="row row-cols-1 row-cols-md-2 row-cols-lg-2 g-4">
                    ${clinicHtml}
                  </div>
                  </div>
                  
                </div>
              </div>
            </div>
          `;
        const existingModal = document.getElementById('clinicModal');
        if (existingModal) {
            existingModal.remove();
        }

        document.body.insertAdjacentHTML('beforeend', modalContent);
        clinics.forEach(clinic => {
            showClinicPic(clinic.clinicId);
        });
        new bootstrap.Modal(document.getElementById('clinicModal')).show();
        document.getElementById('doctorProfileModal')?.remove();

    }).catch((err) => {
        console.log(err);
    })
}

const formatTime = (rawTime) => {
    let cleanedTime = rawTime.replace('?', '').trim(); // "Jan 1, 1970, 10:00:00AM"
    cleanedTime = cleanedTime.replace(/(AM|PM)/, ' $1'); // "Jan 1, 1970, 10:00:00 AM"

    let date = new Date(cleanedTime);
    let formattedTime = "";
    if (!isNaN(date.getTime())) {
        formattedTime = date.toLocaleTimeString('en-US', { hour: '2-digit', minute: '2-digit', hour12: true });
    } else {
        console.log("Invalid Date Format");
    }
    return formattedTime;
}

function selectClinic(clinicName, city, clinicShifts, clinicDays) {
    console.log(clinicShifts);
    console.log(clinicDays);

    const getShiftLabel = (rawTime) => {
        let cleanedTime = rawTime.replace('?', '').trim().replace(/(AM|PM)/, ' $1');
        let date = new Date(cleanedTime);
        if (!isNaN(date.getTime())) {
            const hour = date.getHours(); // 0-23 format
            return hour < 12 ? "Morning Shift" : "Evening Shift";
        } else {
            return "Unknown Shift";
        }
    };

    const shiftOptions = clinicShifts.map(shift => {
        const label = getShiftLabel(shift.startTime);
        const timeRange = `${formatTime(shift.startTime)} - ${formatTime(shift.endTime)}`;
        const max = shift.maxAppointment ?? 'N/A';

        return `<option value="${shift.clinicShiftId}">
        ${label} | ${timeRange} | Max: ${max}   
                </option>`;
    }).join('');


    const availableDays = clinicDays.map(day => {
        return `<div class="available-day">${day.day.name}</div>`;
    }).join('');


    const appointmentForm = `
        <div class="modal fade" id="appointmentModal" tabindex="-1">
          <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content p-3">
              <div class="modal-header">
                <h5 class="modal-title">Book Appointment at ${clinicName}, ${city}</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
              </div>
              <form action="book_appointment.do" method="post">
                <div class="modal-body">
                  <input type="hidden" name="appointment_patient_id" value="${patientId}">
                  <label>Select Date</label>
                  <input type="text" id="appointmentDate" name="appointment_date" class="form-control" placeholder="Choose Appointment Date">

                  <label>Select Shift</label>
                  <select name="app_clinic_shift_id" class="form-select mb-3" required>
                     ${shiftOptions}
                  </select>

                  <label>Available Days</label>
                    <div class="d-flex flex-wrap mb-3">
                        ${availableDays}
                    </div>
                    
                    <label for="reason">Reason for Appointment</label>
                    <textarea name="reason" id="reason" class="form-control mb-3" rows="3" placeholder="Describe your symptoms or reason for visit..." required></textarea>

                  <button class="btn btn-primary w-100" type="submit">Confirm Appointment</button>
                </div>
              </form>
            </div>
          </div>
        </div>
    `;

    // Close clinic modal and show appointment modal
    document.getElementById('doctorProfileModal')?.remove();
    document.body.insertAdjacentHTML('beforeend', appointmentForm);

    let openDays = clinicDays.map(day => day.day.dayId);

    flatpickr("#appointmentDate", {
        dateFormat: "Y-m-d",
        disable: [
            function (date) {
                const dayOfWeek = date.getDay();
                const mappedDayId = (dayOfWeek === 0) ? 7 : dayOfWeek + 1; // Map Sunday to 7
                console.log(`Day of week: ${dayOfWeek}, Mapped dayId: ${mappedDayId}`);
                return !openDays.includes(mappedDayId);
            }
        ],
        onChange: function (selectedDates, dateStr, instance) {
            console.log("Selected date:", dateStr);  // Log the selected date
        }
    });

    new bootstrap.Modal(document.getElementById('appointmentModal')).show();
}


const collectAppointments = async () => {
    let response = await fetch('collect_appoinments.do');
    let result = await response.json();

    return result;
}

function getStatusClass(status) {
    const s = status.toLowerCase();
    if (s === "confirmed") return "success";
    if (s === "cancelled") return "danger";
    if (s === "completed") return "warning";
    return "secondary";
}

let allAppointments = []; // to store everything
let showingAll = false;
const showAppointments = () => {
    collectAppointments().then((appointments) => {
        if (appointments != 'empty') {
            document.getElementById('appointment-stat').innerText = appointments.length
            
            allAppointments = appointments.sort((a, b) => new Date(b.appointmentDate) - new Date(a.appointmentDate));

            const container = document.getElementById("appointmentsContainer");
            const toggleBtn = document.getElementById("appointment_toggle_btn");

            const visibleAppointments = showingAll ? allAppointments : allAppointments.slice(0, 3);

            container.innerHTML = ""; // Clear previous
            visibleAppointments.forEach(app => {
                const cardHTML = `
                            <div class="card mb-4 shadow border-0 rounded-4">
            <div class="card-body p-4">
                <div class="d-flex align-items-center">
                <!-- Doctor Image -->
                <img src="${app.clinicShift.clinic.doctor.user.profile_pic || 'https://randomuser.me/api/portraits/men/32.jpg'}" 
                    alt="Doctor"
                    class="rounded-circle border me-4"
                    style="width: 70px; height: 70px; object-fit: cover;">

                <!-- Info Section -->
                <div class="flex-grow-1">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-1 text-dark fw-semibold">
                            ${app.clinicShift.clinic.doctor.user.name}
                            <span class="badge bg-${getStatusClass(app.status.status)} ms-2 text-capitalize">${app.status.status}</span>
                        </h5>
                        <div class="fee-display">
                            <small class="text-dark fw-semibold">
                                <i class="fas fa-tag me-1 text-success"></i>
                                ${app.clinicShift.clinic.consultationFee}
                            </small>
                        </div>                 
                    </div>
                    
                    <p class="text-muted mb-1">
                    ${app.clinicShift.clinic.doctor.specialization.specialization} at 
                    <strong>${app.clinicShift.clinic.clinicName}</strong>
                    </p>

                    <p class="text-muted small mb-2">
                    <i class="fas fa-map-marker-alt me-1 text-danger"></i>${app.clinicShift.clinic.address}, ${app.clinicShift.clinic.city.city} &nbsp;|&nbsp;
                    <i class="fas fa-phone-alt me-1 text-success"></i>${app.clinicShift.clinic.contact}
                    </p>

                    <div class="d-flex align-items-center text-muted small">
                    <i class="fas fa-calendar-alt me-2 text-primary"></i>
                    <span>${app.appointmentDate}</span>
                    <i class="fas fa-clock ms-3 me-2 text-primary"></i>
                    <span>${formatTime(app.clinicShift.startTime)} - ${formatTime(app.clinicShift.endTime)}</span>
                    </div>
                </div>

                <!-- Actions -->
                <div class="ms-4 d-flex flex-column align-items-end gap-2">
                    <button class="btn btn-sm btn-outline-primary px-3">
                    <i class="fas fa-video me-1"></i> Join
                    </button>
                    <button class="btn btn-sm btn-outline-secondary px-3">
                    <i class="fas fa-calendar-alt me-1"></i> Reschedule
                    </button>
                </div>
                </div>
            </div>
            </div>

                `;
                container.innerHTML += cardHTML;
            });

            if (allAppointments.length > 3) {
                toggleBtn.classList.remove("d-none");
                toggleBtn.innerText = showingAll ? "View Less" : "View All";
            } else {
                toggleBtn.classList.add("d-none");
            }
        } else {
            console.log("failed to fetch appointments");
        }
    }).catch((err) => {
        console.log(err);
    });
}

document.getElementById("appointment_toggle_btn").addEventListener("click", function () {
    showingAll = !showingAll;
    showAppointments(allAppointments); // will re-render with updated visibility
});


showAppointments();


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
                                    <button class="btn btn-primary btn-sm">
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

window.addEventListener('DOMContentLoaded', () => {
    const defaultCityId = document.getElementById('clinic_city_id').value;
    if (defaultCityId) {
        showClinicsByCity(defaultCityId);
    }
});

// const fetchPrescription = async()=>{
//     let response = await fetch('');
//     let result = await response.json();

//     return result
// }

function showPrescription(appointmentId) {
    window.location.href = 'prescription.jsp?appointment_id=' + appointmentId;
}






