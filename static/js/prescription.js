
const urlParams = new URLSearchParams(window.location.search);
console.log(urlParams);

const appointmentId = urlParams.get('appointment_id');
console.log(appointmentId);

const fetchPrescriptionDetails = async () => {
    let response = await fetch('collect_prescription_details.do?appointmentId=' + appointmentId);
    let result = await response.json();

    return result;
}

const showPrescriptionDetails = () => {
    fetchPrescriptionDetails().then((prescriptions) => {
        console.log(prescriptions);
        const prescription = prescriptions[0];

        // Parse the date string by removing the question mark
        const dateStr = prescription.createdAt.replace('?', ' ');
        const date = new Date(dateStr);

        // Format the date in a standard way
        const formattedDate = date.toLocaleString('en-US', {
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: 'numeric',
            minute: '2-digit',
            second: '2-digit',
            hour12: true
        });

        // Fill clinic info
        document.getElementById('clinic-name').textContent = prescription.appointment.clinicShift.clinic.clinicName;
        document.getElementById('clinic-address').textContent =
            `${prescription.appointment.clinicShift.clinic.address}, 
            ${prescription.appointment.clinicShift.clinic.city.city}, 
            ${prescription.appointment.clinicShift.clinic.city.state.state}`;
        document.getElementById('clinic-contact').textContent = `Contact: ${prescription.appointment.clinicShift.clinic.contact}`;

        // Fill prescription info
        document.getElementById('prescription-code').textContent = prescription.prescriptionCode;

        // Fill patient info
        document.getElementById('patient-name').textContent = prescription.appointment.patient.user.name;
        document.getElementById('patient-id').textContent = `PAT${prescription.appointment.patient.patientId}`;
        document.getElementById('appointment-reason').textContent = prescription.appointment.reason;

        // Fill doctor info
        document.getElementById('doctor-name').textContent = `Dr. ${prescription.appointment.clinicShift.clinic.doctor.user.name}`;
        document.getElementById('doctor-qualification').textContent = prescription.appointment.clinicShift.clinic.doctor.qualification.toUpperCase();
        document.getElementById('doctor-specialization').textContent = prescription.appointment.clinicShift.clinic.doctor.specialization.specialization;
        document.getElementById('prescription-date').textContent = formattedDate;

        // Fill doctor signature
        document.getElementById('doctor-signature-name').textContent = `Dr. ${prescription.appointment.clinicShift.clinic.doctor.user.name}`;

        // Fill special instructions
        document.getElementById('special-instructions').textContent = prescription.specialInstructions;

        // Fill footer date
        document.getElementById('footer-date').textContent = formattedDate;

        // Fill medicines
        const medicineList = document.getElementById('medicine-list');
        medicineList.innerHTML = ''; // Clear existing items

        prescription.prescriptionItems.forEach((item, index) => {
            const row = document.createElement('tr');

            const srCell = document.createElement('td');
            srCell.textContent = index + 1;

            const medicineCell = document.createElement('td');
            medicineCell.textContent = item.medicineDenomination.medicineFormat.medicine.name;

            const dosageCell = document.createElement('td');
            dosageCell.textContent = item.dosage;

            const unitCell = document.createElement('td');
            unitCell.textContent = item.medicineDenomination.unit.name;

            row.appendChild(srCell);
            row.appendChild(medicineCell);
            row.appendChild(dosageCell);
            row.appendChild(unitCell);

            medicineList.appendChild(row);
        });

    }).catch((err) => {
        console.error("Error fetching prescription:", err);
    });


}

showPrescriptionDetails();