<!-- <!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Digital Prescription</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: #f8f9fa;
    }
    .prescription {
      max-width: 800px;
      margin: 40px auto;
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 0 15px rgba(0,0,0,0.1);
    }
    .qr-box {
      width: 100px;
    }
    .signature {
      height: 50px;
      width: 150px;
      border-bottom: 1px solid #000;
      margin-top: 20px;
    }
  </style>
</head>
<body>

<div class="prescription">
  <div class="d-flex justify-content-between align-items-center mb-3">
    <div>
      <h4 class="mb-1">EaseHealth Clinic</h4>
      <small>Dr. Rahul Mehta, MD (General Physician)</small><br>
      <small>Reg No: MH123456 | Email: dr.mehta@easehealth.com</small>
    </div>
    <div class="text-end">
      <p class="mb-0"><strong>Date:</strong> 16-Apr-2025</p>
      <p class="mb-0"><strong>Time:</strong> 10:42 AM</p>
      <img src="https://api.qrserver.com/v1/create-qr-code/?data=RX-123456789&size=100x100" alt="QR Code" class="qr-box mt-2">
    </div>
  </div>

  <hr>

  <div class="mb-3">
    <h5 class="mb-2">Patient Information</h5>
    <p class="mb-0"><strong>Name:</strong> Rohan Sharma</p>
    <p class="mb-0"><strong>Age:</strong> 27</p>
    <p class="mb-0"><strong>Gender:</strong> Male</p>
    <p class="mb-0"><strong>Patient ID:</strong> P123456</p>
  </div>

  <div class="my-4">
    <h5 class="mb-2">Prescribed Medicines</h5>
    <table class="table table-bordered">
      <thead class="table-light">
        <tr>
          <th>Medicine</th>
          <th>Denomination</th>
          <th>Dosage</th>
          <th>Frequency</th>
          <th>Duration</th>
          <th>Instructions</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>Paracetamol</td>
          <td>500mg</td>
          <td>1 tab</td>
          <td>Twice a day</td>
          <td>5 days</td>
          <td>After meals</td>
        </tr>
        <tr>
          <td>Azithromycin</td>
          <td>250mg</td>
          <td>1 tab</td>
          <td>Once a day</td>
          <td>3 days</td>
          <td>Before breakfast</td>
        </tr>
      </tbody>
    </table>
  </div>

  <div class="mt-4">
    <h6>Additional Notes:</h6>
    <p>- Stay hydrated and rest well.</p>
    <p>- Avoid outside/junk food during medication.</p>
  </div>

  <div class="d-flex justify-content-between align-items-end mt-5">
    <div>
      <p><strong>Digital Prescription ID:</strong> RX-123456789</p>
    </div>
    <div class="text-end">
      <div class="signature"></div>
      <p class="mb-0">Dr. Rahul Mehta</p>
      <small>Digitally Signed</small>
    </div>
  </div>

  <div class="text-center mt-4">
    <button class="btn btn-outline-primary" onclick="window.print()">🖨️ Print / Save as PDF</button>
  </div>
</div>

</body>
</html> -->


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Digital Prescription</title>
  <style>
    body {
      font-family: 'Arial', sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f7f9fc;
      color: #333;
    }
    .prescription-container {
      max-width: 800px;
      margin: 20px auto;
      padding: 30px;
      background-color: white;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
      border-radius: 10px;
      position: relative;
    }
    .header {
      display: flex;
      justify-content: space-between;
      align-items: center;
      border-bottom: 2px solid #3498db;
      padding-bottom: 15px;
      margin-bottom: 20px;
    }
    .clinic-logo {
      width: 100px;
      height: 100px;
      background-color: #f0f0f0;
      display: flex;
      align-items: center;
      justify-content: center;
      border-radius: 5px;
    }
    .clinic-details {
      flex-grow: 1;
      padding-left: 20px;
    }
    .clinic-name {
      font-size: 24px;
      font-weight: bold;
      color: #2c3e50;
      margin: 0;
    }
    .section {
      margin-bottom: 20px;
    }
    .section-title {
      background-color: #3498db;
      color: white;
      padding: 8px 15px;
      border-radius: 5px;
      font-size: 16px;
      margin-bottom: 10px;
    }
    .section-content {
      padding: 0 15px;
      display: flex;
      flex-wrap: wrap;
    }
    .info-group {
      margin-right: 40px;
      margin-bottom: 10px;
    }
    .info-label {
      font-weight: bold;
      font-size: 14px;
      color: #7f8c8d;
      margin-bottom: 3px;
    }
    .info-value {
      font-size: 16px;
    }
    .divider {
      height: 1px;
      background-color: #ecf0f1;
      margin: 25px 0;
    }
    .prescription-details {
      background-color: #f8f9fa;
      border-left: 5px solid #3498db;
      padding: 15px;
      border-radius: 5px;
    }
    .medication-name {
      font-size: 18px;
      font-weight: bold;
      color: #2c3e50;
      margin-bottom: 10px;
    }
    .signature-section {
      margin-top: 40px;
      border-top: 1px dashed #bdc3c7;
      padding-top: 20px;
      display: flex;
      justify-content: space-between;
    }
    .signature-box {
      border-bottom: 1px solid #34495e;
      min-width: 200px;
      text-align: center;
      padding-bottom: 5px;
      margin-bottom: 10px;
    }
    .footer {
      margin-top: 30px;
      font-size: 12px;
      color: #95a5a6;
      text-align: center;
      border-top: 1px solid #ecf0f1;
      padding-top: 15px;
    }
    .prescription-id {
      font-family: monospace;
      background-color: #f0f0f0;
      padding: 3px 6px;
      border-radius: 3px;
    }
    .qr-section {
      display: flex;
      justify-content: flex-end;
      position: absolute;
      top: 30px;
      right: 30px;
    }
    .qr-code {
      width: 100px;
      height: 100px;
    }
    .qr-info {
      font-size: 12px;
      color: #7f8c8d;
      text-align: center;
      margin-top: 5px;
    }
    @media print {
      body {
        background-color: white;
      }
      .prescription-container {
        box-shadow: none;
        margin: 0;
        padding: 20px;
      }
    }
  </style>
</head>
<body>
  <div class="prescription-container">
    <!-- QR Code Section -->
    <div class="qr-section">
      <div>
        <img class="qr-code" src="https://api.qrserver.com/v1/create-qr-code/?data=RX-123456789&size=100x10" alt="QR Code for Prescription Verification">
        <div class="qr-info">Scan to verify authenticity</div>
      </div>
    </div>

    <!-- Header Section -->
    <div class="header">
      <div class="clinic-details">
        <h1 class="clinic-name">MediCare Clinic</h1>
        <p>44, Block B , Civil lines, Indore</p>
        <p>Phone: 0761 8787690  Email: info@easeHealth.com</p>
      </div>
    </div>

    <!-- Doctor Information -->
    <div class="section">
      <div class="section-title">PHYSICIAN</div>
      <div class="section-content">
        <div class="info-group">
          <div class="info-label">Name</div>
          <div class="info-value">Dr. Anoop Saxena</div>
        </div>
        <div class="info-group">
          <div class="info-label">License #</div>
          <div class="info-value">MD123456</div>
        </div>
        <div class="info-group">
          <div class="info-label">NPI #</div>
          <div class="info-value">1234567890</div>
        </div>
        <div class="info-group">
          <div class="info-label">DEA #</div>
          <div class="info-value">XJ5678912</div>
        </div>
      </div>
    </div>

    <!-- Patient Information -->
    <div class="section">
      <div class="section-title">PATIENT</div>
      <div class="section-content">
        <div class="info-group">
          <div class="info-label">Name</div>
          <div class="info-value">Mayank Singh</div>
        </div>
        <div class="info-group">
          <div class="info-label">DOB</div>
          <div class="info-value">05/12/1996</div>
        </div>
        <div class="info-group">
          <div class="info-label">Patient ID</div>
          <div class="info-value">PAT-2023-45678</div>
        </div>
        <div class="info-group">
          <div class="info-label">Date of Issue</div>
          <div class="info-value">04/02/2025</div>
        </div>
      </div>
    </div>

    <div class="divider"></div>

    <!-- Prescription Details -->
    <div class="section">
      <div class="section-title">PRESCRIPTION</div>
      <div class="prescription-details">
        <div class="medication-name">Amoxicillin (Amoxil) 500mg Capsules</div>
        
        <div class="section-content">
          <div class="info-group">
            <div class="info-label">Strength</div>
            <div class="info-value">500mg</div>
          </div>
          <div class="info-group">
            <div class="info-label">Form</div>
            <div class="info-value">Capsule</div>
          </div>
          <div class="info-group">
            <div class="info-label">Quantity</div>
            <div class="info-value">30 capsules</div>
          </div>
          <div class="info-group">
            <div class="info-label">Refills</div>
            <div class="info-value">0</div>
          </div>
        </div>

        <div class="info-group" style="margin-top: 15px; width: 100%">
          <div class="info-label">Sig (Instructions)</div>
          <div class="info-value">Take 1 capsule by mouth three times daily for 10 days until all medication is gone.</div>
        </div>
        
        <div class="info-group" style="margin-top: 15px; width: 100%">
          <div class="info-label">Special Instructions</div>
          <div class="info-value">Take with food to minimize stomach upset. Complete entire course of antibiotics even if feeling better. Avoid alcohol consumption during treatment.</div>
        </div>
      </div>
    </div>

    <!-- Pharmacy Information -->
    <div class="section">
      <div class="section-title">PHARMACY</div>
      <div class="section-content">
        <div class="info-group">
          <div class="info-label">Preferred Pharmacy</div>
          <div class="info-value">City Pharmacy</div>
        </div>
        <div class="info-group">
          <div class="info-label">Address</div>
          <div class="info-value">South civil line, Indore</div>
        </div>
        <div class="info-group">
          <div class="info-label">Phone</div>
          <div class="info-value">(761) 987-6543</div>
        </div>
      </div>
    </div>

    <!-- Signature Section -->
    <div class="signature-section">
      <div>
        <div class="signature-box">Dr. Anoop Saxena </div>
        <div class="info-value">Electronically signed on 04/02/2025 at 10:45 AM</div>
      </div>
      <div>
        <div>
          <input type="checkbox" id="daw" checked> <label for="daw">Dispense As Written</label>
        </div>
        <div>
          <input type="checkbox" id="sub"> <label for="sub">Substitution Permitted</label>
        </div>
      </div>
    </div>

    <!-- Footer -->
    <div class="footer">
      <p>This prescription was generated electronically via <b>EaseHealth™</b> by MediConnect</p>
      <p>Prescription ID: <span class="prescription-id">RX-2025-0417-8AF3D9</span> • Issued: February 04, 2025 at 10:45 AM</p>
      <p><b>CONFIDENTIAL PATIENT INFORMATION</b></p>
    </div>
  </div>
</body>
</html>
