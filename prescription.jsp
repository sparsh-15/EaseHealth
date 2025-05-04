<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medical Prescription</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700&display=swap');
        
        :root {
            --primary-color: #2a52be;
            --secondary-color: #f0f6ff;
            --accent-color: #4b75d8;
            --text-dark: #333;
            --text-medium: #555;
            --text-light: #777;
            --border-color: #e0e0e0;
            --success-color: #4caf50;
            --warning-color: #ff9800;
            --button-color: #2a52be;
            --button-hover: #1a42ae;
        }
        
        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f5f8fc;
            color: var(--text-dark);
            line-height: 1.6;
        }

        .prescription-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            overflow: hidden;
            border: 1px solid var(--border-color);
        }

        .prescription-header {
            background: linear-gradient(135deg, var(--primary-color), var(--accent-color));
            color: white;
            padding: 25px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            position: relative;
        }

        .prescription-header::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            height: 5px;
            background: linear-gradient(90deg, var(--success-color), var(--accent-color));
        }

        .clinic-info {
            flex: 1;
        }

        .clinic-info h1 {
            margin: 0 0 5px;
            font-family: 'Poppins', sans-serif;
            font-size: 26px;
            font-weight: 600;
            letter-spacing: 0.5px;
        }

        .clinic-info p {
            margin: 5px 0;
            font-size: 15px;
            opacity: 0.9;
        }

        .header-right {
            text-align: right;
        }

        .prescription-code {
            font-size: 14px;
            background-color: rgba(255, 255, 255, 0.2);
            padding: 6px 12px;
            border-radius: 20px;
            margin-bottom: 5px;
            display: inline-block;
            font-weight: 500;
            letter-spacing: 0.5px;
        }

        .rx-symbol {
            display: inline-block;
            font-size: 24px;
            margin-right: 5px;
            vertical-align: middle;
            font-style: italic;
            font-weight: bold;
        }

        .prescription-status {
            font-size: 12px;
            background-color: var(--success-color);
            color: white;
            padding: 4px 10px;
            border-radius: 20px;
            display: inline-block;
            text-transform: uppercase;
            letter-spacing: 1px;
            font-weight: 600;
        }

        .prescription-content {
            padding: 30px;
        }

        .info-section {
            display: flex;
            justify-content: space-between;
            margin-bottom: 30px;
            padding-bottom: 20px;
            border-bottom: 1px dashed var(--border-color);
        }

        .info-column {
            flex: 1;
            position: relative;
        }

        .info-item {
            margin-bottom: 14px;
        }

        .info-label {
            font-weight: 600;
            color: var(--text-medium);
            font-size: 13px;
            display: block;
            margin-bottom: 4px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .info-value {
            font-size: 16px;
            color: var(--text-dark);
            font-weight: 500;
        }

        .doctor-info {
            text-align: right;
            padding-left: 20px;
        }

        .doctor-info::before {
            content: '';
            position: absolute;
            left: -20px;
            top: 0;
            bottom: 0;
            width: 1px;
            background-color: var(--border-color);
        }

        .section-title {
            font-family: 'Poppins', sans-serif;
            color: var(--primary-color);
            font-size: 18px;
            margin: 0 0 15px;
            padding-bottom: 10px;
            border-bottom: 2px solid var(--secondary-color);
            font-weight: 600;
            display: flex;
            align-items: center;
        }

        .section-title i {
            margin-right: 10px;
            font-size: 20px;
            color: var(--accent-color);
        }

        .medicines-section {
            margin-bottom: 30px;
            padding: 20px;
            background-color: var(--secondary-color);
            border-radius: 8px;
            border-left: 5px solid var(--primary-color);
        }

        .medicine-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            margin-top: 15px;
            background-color: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
        }

        .medicine-table th {
            background-color: rgba(42, 82, 190, 0.1);
            text-align: left;
            padding: 14px;
            font-weight: 600;
            color: var(--primary-color);
            font-size: 14px;
            letter-spacing: 0.5px;
            text-transform: uppercase;
        }

        .medicine-table td {
            padding: 14px;
            border-top: 1px solid var(--border-color);
            font-weight: 400;
            font-size: 15px;
        }

        .medicine-table tr:hover {
            background-color: rgba(240, 246, 255, 0.5);
        }

        .special-instructions {
            background-color: #fff9ed;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
            border-left: 5px solid var(--warning-color);
        }

        .instruction-label {
            font-weight: 600;
            margin-bottom: 10px;
            color: var(--text-medium);
            font-size: 15px;
            display: flex;
            align-items: center;
        }

        .instruction-label i {
            margin-right: 8px;
            color: var(--warning-color);
        }

        .instruction-value {
            white-space: pre-line;
            color: var(--text-dark);
            font-size: 15px;
            line-height: 1.7;
        }

        .footer {
            text-align: center;
            padding: 20px;
            background-color: #f9fafc;
            font-size: 13px;
            color: var(--text-light);
            border-top: 1px solid var(--border-color);
        }

        .footer p {
            margin: 5px 0;
        }

        .footer-disclaimer {
            color: var(--text-light);
            font-style: italic;
            margin-top: 5px;
        }

        .signature {
            margin-top: 40px;
            text-align: right;
            display: flex;
            justify-content: flex-end;
            align-items: flex-end;
        }

        .signature-content {
            text-align: center;
        }

        .signature-line {
            width: 200px;
            display: block;
            border-top: 1px solid #333;
            margin-bottom: 5px;
        }

        .signature-name {
            font-weight: 600;
            font-size: 16px;
        }

        .signature-title {
            font-size: 13px;
            color: var(--text-medium);
        }

        .signature-stamp {
            width: 70px;
            height: 70px;
            border: 2px solid var(--primary-color);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: var(--primary-color);
            font-weight: bold;
            font-size: 11px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            margin-left: 20px;
            transform: rotate(-15deg);
            position: relative;
        }

        .signature-stamp::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            border-radius: 50%;
            border: 1px dashed var(--primary-color);
            margin: 5px;
        }

        /* Watermark */
        .watermark {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            pointer-events: none;
            z-index: 0;
        }

        .watermark-text {
            color: rgba(42, 82, 190, 0.03);
            font-size: 120px;
            font-weight: 700;
            letter-spacing: 5px;
            transform: rotate(-45deg);
            text-transform: uppercase;
            white-space: nowrap;
        }

        .patient-badge {
            display: inline-flex;
            align-items: center;
            background-color: #e8f5e9;
            color: #2e7d32;
            padding: 3px 8px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 600;
            margin-top: 5px;
        }

        .patient-badge i {
            font-size: 10px;
            margin-right: 5px;
        }

        /* Print styles */
        @media print {
            body {
                background-color: white;
                padding: 0;
                margin: 0;
            }

            .prescription-container {
                box-shadow: none;
                border: 1px solid #ccc;
                margin: 0;
                width: 100%;
                max-width: none;
            }
        }

        /* Action Buttons */
        .action-buttons {
            position: relative;
            text-align: right;
            padding: 15px 20px 0;
            z-index: 5;
            margin-bottom: 10px;
        }

        .action-button {
            background-color: var(--button-color);
            color: white;
            border: none;
            border-radius: 4px;
            padding: 8px 16px;
            font-family: 'Roboto', sans-serif;
            font-size: 14px;
            font-weight: 500;
            cursor: pointer;
            margin-left: 10px;
            display: inline-flex;
            align-items: center;
            transition: all 0.2s ease;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .action-button:hover {
            background-color: var(--button-hover);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            transform: translateY(-1px);
        }

        .action-button i {
            margin-right: 6px;
            font-size: 14px;
        }

        .download-button {
            background-color: var(--success-color);
        }

        .download-button:hover {
            background-color: #3d9c40;
        }

        .print-button {
            background-color: var(--accent-color);
        }

        .print-button:hover {
            background-color: #3a64c7;
        }

        @media (max-width: 768px) {
            .info-section {
                flex-direction: column;
            }

            .doctor-info {
                text-align: left;
                padding-left: 0;
                margin-top: 20px;
            }

            .doctor-info::before {
                display: none;
            }
            
            .action-buttons {
                display: flex;
                justify-content: center;
                padding: 15px 0;
            }
            
            .action-button {
                flex: 1;
                margin: 0 5px;
                font-size: 13px;
                padding: 8px 10px;
            }
        }
    </style>
</head>

<body>
    <div class="prescription-container">
        <div class="action-buttons mb-3">
            <button id="download-prescription" class="action-button download-button mb-4">
                <i class="fas fa-download"></i> Download Prescription
            </button>
            <button id="print-prescription" class="action-button print-button">
                <i class="fas fa-print"></i> Print
            </button>
        </div>
        <div class="prescription-header">
            <div class="clinic-info">
                <h1 id="clinic-name">Clinic Name</h1>
                <p id="clinic-address">Clinic Address</p>
                <p id="clinic-contact">Contact</p>
            </div>
            <div class="header-right">
                <div class="prescription-code" id="prescription-code"><span class="rx-symbol">Rx</span> RX123456789</div>
                <div class="prescription-status">Verified</div>
            </div>
        </div>

        <div class="prescription-content">
            <div class="watermark">
                <div class="watermark-text">Prescription</div>
            </div>

            <div class="info-section">
                <div class="info-column">
                    <div class="info-item">
                        <span class="info-label">Patient Name</span>
                        <span class="info-value" id="patient-name">Patient Name</span>
                        <div class="patient-badge"><i class="fas fa-circle"></i> Active Patient</div>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Patient ID</span>
                        <span class="info-value" id="patient-id">PATXXX</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Reason For Visit</span>
                        <span class="info-value" id="appointment-reason">Reason</span>
                    </div>
                </div>

                <div class="info-column doctor-info">
                    <div class="info-item">
                        <span class="info-label">Doctor</span>
                        <span class="info-value" id="doctor-name">Dr. Name</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Qualification</span>
                        <span class="info-value" id="doctor-qualification">MBBS</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Specialization</span>
                        <span class="info-value" id="doctor-specialization">Specialty</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">Date & Time</span>
                        <span class="info-value" id="prescription-date">May 1, 2025</span>
                    </div>
                </div>
            </div>

            <div class="medicines-section">
                <h3 class="section-title"><i class="fas fa-pills"></i> Prescribed Medications</h3>
                <table class="medicine-table">
                    <thead>
                        <tr>
                            <th>Sr.</th>
                            <th>Medicine</th>
                            <th>Dosage</th>
                            <th>Unit</th>
                        </tr>
                    </thead>
                    <tbody id="medicine-list">
                        <!-- Medicine items will be inserted here dynamically -->
                    </tbody>
                </table>
            </div>

            <div class="special-instructions">
                <div class="instruction-label"><i class="fas fa-exclamation-circle"></i> Special Instructions</div>
                <div class="instruction-value" id="special-instructions">Special instructions will be displayed here.</div>
            </div>

            <div class="signature">
                <div class="signature-content">
                    <div class="signature-line"></div>
                    <div class="signature-name" id="doctor-signature-name">Dr. Name</div>
                    <div class="signature-title" id="doctor-signature-title">Gastroenterologist</div>
                </div>
                <div class="signature-stamp">
                    Digitally<br>Verified
                </div>
            </div>
        </div>

        <div class="footer">
            <p>This is an electronic medical prescription generated on <span id="footer-date">May 1, 2025</span></p>
            <p class="footer-disclaimer">Please check with your pharmacist if you have any questions about this prescription.</p>
        </div>
    </div>

    <script src="static/js/prescription.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script>
        // Update signature title with doctor specialization
        document.addEventListener('DOMContentLoaded', function() {
            // This will be overridden by your actual implementation
            if (document.getElementById('doctor-signature-title') && 
                document.getElementById('doctor-specialization')) {
                document.getElementById('doctor-signature-title').textContent = 
                    document.getElementById('doctor-specialization').textContent;
            }
            
            // Download PDF functionality
            document.getElementById('download-prescription').addEventListener('click', function() {
                // Get prescription code for filename
                const prescriptionCode = document.getElementById('prescription-code').textContent.trim();
                const patientName = document.getElementById('patient-name').textContent.trim();
                const filename = `${prescriptionCode}_${patientName}.pdf`;
                
                // Configure PDF options
                const pdfOptions = {
                    margin: 10,
                    filename: filename,
                    image: { type: 'jpeg', quality: 0.98 },
                    html2canvas: { scale: 2, useCORS: true, logging: false },
                    jsPDF: { unit: 'mm', format: 'a4', orientation: 'portrait' }
                };
                
                // Hide action buttons before generating PDF
                const actionButtons = document.querySelector('.action-buttons');
                actionButtons.style.display = 'none';
                
                // Generate PDF
                const prescriptionElement = document.querySelector('.prescription-container');
                html2pdf().from(prescriptionElement).set(pdfOptions).save().then(() => {
                    // Show action buttons again after PDF is generated
                    actionButtons.style.display = 'block';
                });
            });
            
            // Print functionality
            document.getElementById('print-prescription').addEventListener('click', function() {
                window.print();
            });
        });
    </script>
</body>

</html>