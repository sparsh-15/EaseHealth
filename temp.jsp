document.getElementById("doctorSearchInput").addEventListener("input", function () {
  const query = this.value.toLowerCase();
  const filteredDoctors = allDoctors.filter(doc => 
      doc.user.name.toLowerCase().includes(query) || 
      doc.specialization.specialization.toLowerCase().includes(query) 
  );
  renderDoctorCards(filteredDoctors.slice(0, 4)); // show only top 4 results
});
