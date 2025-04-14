
const toastTrigger = document.getElementById('complete_profile')
const toastLiveExample = document.getElementById('complete_profile_toast')
const toast_update_btn = document.getElementById('toast_update_btn')

const medicine_name = document.getElementById('medicine_name');
const description = document.getElementById('description');
const ingredients = document.getElementById('ingredients');
const effective_body_part = document.getElementById('effective_body_part');
const side_effects = document.getElementById('side_effects');
const warnings = document.getElementById('warnings');
const all_medicines = document.getElementById('all_medicines');
const all_medicines_footer = document.getElementById('all_medicines_footer');

const save_medicine_btn = document.getElementById('save_medicine_btn')
const add_medicine_modal = new bootstrap.Modal(document.getElementById("add_medicine_modal"));

const add_format_title = document.querySelector('.add_format_title')

const format_id = document.querySelector('#format_id');
const medicine_id_hidden = document.querySelector('#medicine_id_hidden');
const save_format_btn = document.querySelector('#save_format_btn');
const add_format_modal = new bootstrap.Modal(document.getElementById("add_format_modal"));
const addFormatModal = document.getElementById("add_format_modal");
const addMoreUnitbtn = document.getElementById("add_more_units");


// ~~~~~~~~~~~~~~ formats start ~~~~~~~~~~~~~~~~

const resetAddFormatModal = () => {
    document.querySelectorAll(".form-check-input:checked").forEach(checkbox => {
        checkbox.checked = false; // Uncheck checkboxes
    });

    add_format_modal.hide();
}

document.addEventListener("DOMContentLoaded", function () {
    let addFormatModal = document.getElementById("add_format_modal");

    addFormatModal.addEventListener("show.bs.modal", function (event) {
        let button = event.relatedTarget;
        let medicineId = button.getAttribute("data-medicine-id");


        document.getElementById("medicine_id_hidden").value = medicineId;

        disableCheckboxesForSavedFormats(medicineId);


    });
});

const updateModalFormats = (medicineId, fetchedFormatsdata) => {

    let formatsForMedicine = fetchedFormatsdata.filter(item => item.medicine.medicineId == medicineId);

    let formatList = document.querySelector("#format_list");

    formatList.innerHTML = "";

    let formatUl = document.createElement("ul");
    formatUl.className = "list-unstyled"; // Bootstrap class to remove default list styling

    // Create and append list items (formats)
    formatsForMedicine.forEach((item) => {
        let formatName = item.format.name;

        let formatLi = document.createElement("li");
        formatLi.className = "badge bg-secondary px-2 py-1 me-1"; // Add badge styling
        formatLi.innerText = formatName;

        formatUl.appendChild(formatLi);
    });

    formatList.appendChild(formatUl);
};

const disableCheckboxesForSavedFormats = (medicineId) => {
    collectAllMedicineFormat(medicineId).then((data) => {
        if (data != 'no') {
            data.forEach((item) => {
                if (item.medicine.medicineId == medicineId) {
                    let formatId = item.format.formatId;
                    let formatCheckbox = document.querySelector('.form-check-input[id="' + formatId + '"]');
                    if (formatCheckbox) {
                        formatCheckbox.disabled = true;
                    }
                }
            });
            updateModalFormats(medicineId, data);
        }
    }).catch((err) => {
        console.log("Error fetching formats: " + err);
    });
};

addFormatModal.addEventListener('hidden.bs.modal', function () {
    document.querySelectorAll(".form-check-input").forEach(checkbox => {
        checkbox.disabled = false;
    });
});

const collectAllMedicineFormat = async (medicineId) => {
    let url = 'collect_all_medicine_format.do?medicine_id=' + medicineId

    let response = await fetch(url);
    let result = await response.json();

    return result;
}

const showAllMedicinesFormats = (medicineId) => {

    collectAllMedicineFormat(medicineId).then((data) => {
        if (data != 'no') {
            createAlreadyAddedFormats(data, medicineId)
        }
    }).catch((err) => {
        console.log("error fetching formats : " + err);
    })
}

const createAlreadyAddedFormats = (fetchedFormatsdata, medicineId) => {

    let modal = document.getElementById("add_format_modal");
    let formatList = document.querySelector("#format_list")
    let cardformatList = document.querySelector("#format_list_" + medicineId);

    if (!formatList || !cardformatList) {
        console.warn("no format list found for medicine id: ", medicineId);
        return;
    }

    let formatHTML = `
    <div class="collapse " id="collapse_format_${medicineId}">
        <div class="d-inline flex-wrap gap-2 align-items-center">
`;
    const medicineFormatIds = [];

    fetchedFormatsdata.forEach((item) => {
        if (item.medicine.medicineId == medicineId) {

            let formatName = item.format.name;
            let formatId = item.format.formatId;
            let medicineFormatId = item.medicineFormatId;

            medicineFormatIds.push(medicineFormatId);


            formatHTML += '<div class="d-inline-block format-chip dropdown-center dropdown m-2" >';
            formatHTML += '  <button class="btn btn-link text-decoration-none p-2 dropdown-toggle"';
            formatHTML += '    data-bs-toggle="dropdown" id="format-dropdown-' + formatId + '" aria-expanded="false">';
            formatHTML += formatName;
            formatHTML += '  </button>';

            // Dropdown Menu
            formatHTML += '  <ul class="dropdown-menu format-dropdown-menu aria-labelledby="format-dropdown-' + formatId + '">';
            formatHTML += '    <li class="dropdown-header fw-bold">' + formatName + ' Denomination </li>';
            formatHTML += '    <li>';
            formatHTML += '         <div class="unit-list mb-2" id="unit-list-' + formatId + '"></div>';
            formatHTML += '    </li>';
            formatHTML += '   <li>';
            formatHTML += '        <div class="added-units-container px-3 py-1" id="added-units-' + medicineFormatId + '">';
            formatHTML += '            <p class="text-muted small mb-1">Added Units:</p>';
            formatHTML += '        </div>';
            formatHTML += '    </li>';
            formatHTML += '    <li><hr class="dropdown-divider"></li>';
            formatHTML += '    <li><button class="btn btn-sm btn-primary btn-add-unit w-100" onclick="openUnitModal(' + medicineFormatId + ' , \'' + formatName + '\')" >Add Denominations</button></li>';
            formatHTML += '  </ul>';
            formatHTML += '</div>';

        }
    });
    formatHTML += `</div>`;

    cardformatList.innerHTML = formatHTML;
    formatList.innerHTML = formatHTML;

    console.log("Containers created, now adding denominations");
    
    // Wait a tiny bit to ensure the DOM is updated
    setTimeout(() => {
        medicineFormatIds.forEach(medicineFormatId => {
            console.log(`Loading denominations for medicineFormatId: ${medicineFormatId}`);
            showMedicineDenomination(medicineFormatId);
        });
    }, 50);

};



const saveMedicineFormat = async () => {
    let checkboxes = document.querySelectorAll(".form-check-input:checked");
    if (checkboxes.length == 0) {
        alert("please select formats");
    }


    let url = 'save_medicine_format.do?medicine_id=' + medicine_id_hidden.value
    if (checkboxes.length != 0) {

        checkboxes.forEach(checkbox => {
            url += "&format_id=" + encodeURIComponent(checkbox.id);
        });

        console.log(url);
    }

    let response = await fetch(url);
    let result = await response.text();

    return result;
}


save_format_btn.addEventListener('click', () => {
    let medicineIdHidden = medicine_id_hidden.value;
    console.log("~~~~~~~~~~~~~" + medicineIdHidden);

    saveMedicineFormat().then((data) => {
        if (data == 'success') {
            // Reset modal after updating the list
            resetAddFormatModal();
            add_format_modal.hide();

        } else {
            alert('format not added')
        }
    }).catch((err) => {
        console.log(err);
    })

});



// ~~~~~~~~~~~~~~ formats end ~~~~~~~~~~~~~~~~


// ~~~~~~~~~~~~~~~~units start ~~~~~~~~~~~~

function openUnitModal(medicineFormatId, formatName) {
    console.log(formatName + " ~~~~~");
    document.getElementById('addDenominationModalLabel').innerText = 'Add denomination for ' + formatName;

    document.getElementById("medicineFormatId").value = medicineFormatId;
    let modal = new bootstrap.Modal(document.getElementById("addDenominationModal"))
    modal.show();
}

addMoreUnitbtn.addEventListener('click', () => {
    let container = document.getElementById("quantity_container")

    let newQuantityRow = container.querySelector(".quantity-row").cloneNode(true);

    newQuantityRow.querySelector(".quantity-input").value = "";

    let removeBtn = newQuantityRow.querySelector(".btn-remove");
    console.log(removeBtn);

    removeBtn.classList.remove("d-none");
    removeBtn.addEventListener("click", () => {
        newQuantityRow.remove();
    });

    container.appendChild(newQuantityRow);
})

const collectMedicineDenomination = async (medicineFormatId) => {
    let url = 'collect_medicine_denomination.do?medicine_format_id=' + medicineFormatId;

    let response = await fetch(url);

    let result = await response.json();

    return result;
}

const showMedicineDenomination = (medicineFormatId) => {
    collectMedicineDenomination(medicineFormatId).then((data) => {
        if (data == 'empty') {
            console.log('medicines denominations not fetched');
        } else {
            createAlreadyAddedDenominations(data, medicineFormatId);
        }
    }).catch((err) => {
        console.log(err);
    })
}

const createAlreadyAddedDenominations = (fetchedDenominations, medicineFormatId) => {
    const addedUnitsContainer = document.getElementById("added-units-" + medicineFormatId);

    if (!addedUnitsContainer) {
        console.error(`Container not found for ID: added-units-${medicineFormatId}`);
        return;
    }

    // Clear and reset to a known state
    addedUnitsContainer.innerHTML = '';

    // Add the title
    const titleEl = document.createElement('p');
    titleEl.className = 'text-muted small mb-1';
    titleEl.textContent = 'Added Units:';
    addedUnitsContainer.appendChild(titleEl);

    let denomsAdded = false;

    // Add each denomination
    fetchedDenominations.forEach((item) => {
        if (String(item.medicineFormat.medicineFormatId) === String(medicineFormatId)) {
            denomsAdded = true;

            // Create a simple badge instead of a complex structure
            const badge = document.createElement('span');
            badge.className = 'badge bg-success me-1 mb-1';
            badge.textContent = `${item.quantity} ${item.unit.name}`;
            addedUnitsContainer.appendChild(badge);

            console.log(`Added badge to container: ${badge.textContent}`);
        }
    });

    if (!denomsAdded) {
        const noDenomsEl = document.createElement('p');
        noDenomsEl.className = 'text-muted small';
        noDenomsEl.textContent = 'No denominations added yet';
        addedUnitsContainer.appendChild(noDenomsEl);
    }


};


const debugCheckContainer = (medicineFormatId) => {
    console.log(`Checking for container with ID: added-units-${medicineFormatId}`);
    const container = document.getElementById(`added-units-${medicineFormatId}`);
    console.log("Container found:", !!container);
    if (container) {
        console.log("Container contents:", container.innerHTML);
        console.log("Container visibility:", getComputedStyle(container).display);
    }
};

// Call this before and after trying to add denominations
// ~~~~~~~~~~~~~~~~units end ~~~~~~~~~~~~

// ~~~~~~~~~~~~~~~~medicines start ~~~~~~~~~~~
if (toastTrigger) {
    const toastBootstrap = bootstrap.Toast.getOrCreateInstance(toastLiveExample)
    toastTrigger.addEventListener('click', () => {
        toastBootstrap.show()

    })
    toast_update_btn.addEventListener('click', () => {
        toastBootstrap.hide();
    });
}


const resetMedicineModal = (modalId) => {
    const modal = document.getElementById(modalId);

    if (!modal) return;

    modal.querySelectorAll("input, textarea").forEach(field => {
        field.value = "";
    });

    modal.querySelectorAll("input[type='checkbox']").forEach(checkbox => {
        checkbox.checked = false;
    });

}



const saveMedicine = async () => {
    let response = await fetch('save_medicine.do?medicine_name=' + medicine_name.value + '&description=' + description.value + '&ingredients=' + ingredients.value + '&effective_body_part=' + effective_body_part.value + '&side_effects=' + side_effects.value + '&warnings=' + warnings.value);
    let result = await response.text();

    return result;
};


const collectAllMedicine = async () => {
    let response = await fetch('collect_medicine.do')
    let result = await response.json();

    return result;
}

const showAllMedicines = () => {
    collectAllMedicine().then((data) => {
        if (data != 'no') {
            console.log(data);

            all_medicines.innerHTML = '<div class="mb-3"><h4> All medicines </h4></div>'
            for (let next of data) {
                all_medicines.innerHTML +=
                    '<div class="col-md-4 d-flex justify-content-center mb-4">' +
                    '<div class="card medicine-card border-0 shadow-lg rounded-4 overflow-hidden text-white" id="card_' + next.medicineId + '">' +

                    // Header section with image
                    '<div class="d-flex align-items-center p-2 pb-2">' +
                    '<div class="position-relative me-3 img-container">' +
                    '<div class="position-absolute top-0 start-0 w-80 h-50 rounded-circle glow-effect"></div>' +
                    '<img src="static/media/images/medicine.png" ' +
                    'alt="' + next.name + '" class="medicine-icon">' +
                    '</div>' +
                    '<h5 id="t_' + next.medicineId + '" class="card-title fw-bold mb-0 flex-grow-1 medicine-title">' + next.name + '</h5>' +
                    '<span class="badge med-badge px-3 py-2 rounded-pill shadow-sm">RX-2023</span>' +
                    '</div>' +

                    // Animated divider
                    '<hr class="divider my-0">' +

                    '<div class="card-body pt-2">' +
                    // Description with better contrast
                    '<p class="card-text mb-2 lh-base medicine-description">' + next.description + '</p>' +

                    // Info section with improved icons and layout
                    '<div class="info-container p-2 rounded-3 mb-1">' +

                    '<div class="d-flex align-items-center mb-1 info-row">' +
                    '<div class="icon-container me-3 d-flex align-items-center justify-content-center ingredients-icon">' +
                    '<i class="bi bi-capsule-pill"></i>' +
                    '</div>' +
                    '<div class="flex-grow-1">' +
                    '<span class="d-block category-label ingredients-label mb-1">Ingredients</span>' +
                    '<span class="info-text">' + next.ingredients + '</span>' +
                    '</div>' +
                    '</div>' +

                    '<div class="d-flex align-items-center mb-1 info-row">' +
                    '<div class="icon-container me-3 d-flex align-items-center justify-content-center effective-icon">' +
                    '<i class="bi bi-check-circle-fill"></i>' +
                    '</div>' +
                    '<div class="flex-grow-1">' +
                    '<span class="d-block category-label effective-label mb-1">Effective For</span>' +
                    '<span class="info-text">' + next.effectiveBodypart + '</span>' +
                    '</div>' +
                    '</div>' +

                    '<div class="d-flex align-items-center mb-1 info-row">' +
                    '<div class="icon-container me-3 d-flex align-items-center justify-content-center side-effects-icon">' +
                    '<i class="bi bi-exclamation-triangle"></i>' +
                    '</div>' +
                    '<div class="flex-grow-1">' +
                    '<span class="d-block category-label side-effects-label mb-1">Side Effects</span>' +
                    '<span class="info-text">' + next.sideEffects + '</span>' +
                    '</div>' +
                    '</div>' +

                    '<div class="d-flex align-items-center mb-1 info-row">' +
                    '<div class="icon-container me-3 d-flex align-items-center justify-content-center effective-icon">' +
                    '<i class="bi bi-check-circle-fill"></i>' +
                    '</div>' +
                    '<div class="flex-grow-1">' +
                    '<span class="d-block category-label warnings-label mb-1">Warnings</span>' +
                    '<span class="info-text">' + next.warnings + '</span>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '<div class="added-formats p-3">' +
                    '<button ' +
                    'class="format-button  w-100 mt-1 " ' +
                    // 'style="background: linear-gradient(135deg, #007bff, #0056b3); border: none; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);" ' +
                    'type="button" ' +
                    'data-bs-toggle="collapse" ' +
                    'data-bs-target="#collapse_format_' + next.medicineId + '" ' +
                    'aria-expanded="false" ' +
                    'aria-controls="collapse_format_' + next.medicineId + '" ' +
                    'onclick="toggleFormatIcon(' + next.medicineId + ')" ' +
                '>' +
                    '<span><i class="fas fa-pills me-2"></i> Available Formats</span>' +
                    '<i id="format-icon-' + next.medicineId + '" class="fas fa-chevron-down"></i>' +
                '</button>' +
                    // '<h6 class="fw-bold  mb-2">Available Formats:</h6>' +
                    '<div id="format_list_' + next.medicineId + '" >' +
                    '<!-- Formats will be added dynamically here as badges -->' +
                    '</div>' +
                    '</div>' +


                    // Footer with button
                    '<div class="card-footer border-0 bg-transparent d-flex justify-content-center p-2 pt-1">' +
                    '<button id="' + next.medicineId + '" data-medicine-id="' + next.medicineId + '" class="details-btn btn fw-bold px-4 py-1 w-100 position-relative overflow-hidden btn-79" data-bs-toggle="modal" data-bs-target="#add_format_modal" >' +
                    '<span class="z-index-1 position-relative">' +
                    '<i class="bi bi-info-circle-fill me-2"></i> Add Formats' +
                    '</span>' +
                    '<span class="position-absolute top-0 start-0 w-100 h-100 opacity-0 hover-effect"></span>' +
                    '</button>' +
                    '</div>' +
                    '</div>' +
                    '</div>';
                showAllMedicinesFormats(next.medicineId);

            }
            all_medicines.addEventListener('click', (ev) => {
                let elm = ev.target.closest('.btn-79')
                if (elm) {
                    add_format_title.innerText = document.getElementById('t_' + elm.id).innerText;
                    medicine_id_hidden.value = elm.id;
                }
            });
        }
        else {
            window.location('index.do')
        }
    }).catch((err) => {
        console.log(err);
    });
}

showAllMedicines();
function toggleFormatIcon(medicineId) {
    let icon = document.getElementById("format-icon-" + medicineId);
    if (!icon) return;

    // Toggle between chevron up and down
    if (icon.classList.contains("fa-chevron-down")) {
        icon.classList.remove("fa-chevron-down");
        icon.classList.add("fa-chevron-up");
    } else {
        icon.classList.remove("fa-chevron-up");
        icon.classList.add("fa-chevron-down");
    }
}



save_medicine_btn.addEventListener('click', () => {

    saveMedicine().then((data) => {

        if (data == 'yes') {
            showAllMedicines();
            add_medicine_modal.hide();
            resetMedicineModal("add_medicine_modal");
        } else {
            console.log("thumbnail not created");
        }
    }).catch((err) => {
        console.log(err);
    });

});
// ~~~~~~~~~~~~~~~~medicines end ~~~~~~~~~~~~


