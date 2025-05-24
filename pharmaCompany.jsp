<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>${user.name}</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Icons">
        <link rel="stylesheet" href="static/css/nav.css">
        <link rel="stylesheet" href="static/css/pharmaCompany.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    </head>

    <body class="bg-body-secondary">

        <!-- add_format_modal ~~~~ start  -->

        <div class="modal fade" tabindex="-1" id="add_format_modal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Add formats for medicines</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row align-text-center">
                            <h3 class="add_format_title"></h3>
                        </div>
                        <!-- Section for Previously Added Formats -->
                        <div id="previous_formats" class="mb-3">
                            <h6>Previously Added Formats</h6>
                            <div id="format_list">
                                <!-- Previously added formats will be appended here dynamically -->
                            </div>
                        </div>
                        <input type="hidden" id="medicine_id_hidden">
                        <!-- Add New Format Section -->
                        <div class="add_format_card p-3 border rounded">
                            <h6 class="mb-2">Add New Format</h6>
                            <div class="row">
                                <!-- Multiple Formats Selection -->
                                <div class="col-md-6">
                                    <label class="form-label">Select Formats</label>
                                    <div class="border p-2 rounded">
                                        <c:forEach var="format" items="${formats}">
                                            <div class="form-check ">
                                                <input class="form-check-input" type="checkbox" value="${format.name}"
                                                    id="${format.formatId}">
                                                <label class="form-check-label"
                                                    for="${format.formatId}">${format.name}</label>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="save_format_btn">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- add_format_modal ~~~~ end -->

        <!-- Add denomination Modal ~~~ Start -->
        <div class="modal fade" id="addDenominationModal" tabindex="-1" aria-labelledby="addDenominationModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="addDenominationModalLabel">Add Unit</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form action="save_denomination.do" method="post" id="save_denomination_form">
                            <input type="hidden" id="medicineFormatId" name="medicineFormatId">
                            <div class="row mb-2">
                                <div class="col-12">
                                    <div class="form-floating">
                                        <select class="form-select" name="unit" id="unit_selection">
                                            <c:forEach var="unit" items="${units}">
                                                <option value="${unit.unitId}">${unit.name}</option>
                                            </c:forEach>
                                        </select>
                                        <label for="unit_selection">Select Unit</label>
                                    </div>
                                </div>
                            </div>
                            <div id="quantity_container">
                                <div class="row g-2 align-items-center quantity-row">
                                    <div class="col-md-8 mb-2">
                                        <div class="form-floating">
                                            <input type="number" class="form-control quantity-input" id="quantity"
                                                name="quantity[]" min="1" placeholder="Quantity" required>
                                            <label for="quantity">Quantity</label>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <button type="button" class="btn btn-danger btn-remove d-none">Remove</button>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-2">
                                <div class="col-md-4">
                                    <button type="button" class="btn btn-primary d-flex align-items-center"
                                        id="add_more_units">
                                        <span class="material-icons me-1">add</span> Add More
                                    </button>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" class="btn btn-primary">Save Unit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- Add Unit Modal ~~~ End -->


        <!-- add_medicine_modal ~~~ start  -->
        <div class="modal" id="add_medicine_modal" tabindex="-1">
            <div class="modal-dialog modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">add Medicines</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">

                        <div class="mb-3">
                            <label for="name" class="form-label">name</label>
                            <input type="text" class="form-control" id="medicine_name"
                                aria-describedby="medicinenamedescr" required>
                            <div id="medicinenamedescr" class="form-text">enter full medicine name</div>
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">description</label>
                            <textarea class="form-control" id="description" aria-describedby="medicinedescription"
                                autocomplete="on" required></textarea>
                            <div id="medicinedescription" class="form-text">enter description about the medicine
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="ingredients" class="form-label">ingredients</label>
                            <input type="text" class="form-control" id="ingredients" required>
                        </div>
                        <div class="mb-3">
                            <label for="effective_body_part" class="form-label">effective body part</label>
                            <input type="text" class="form-control" id="effective_body_part" required>
                        </div>
                        <div class="mb-3">
                            <label for="side_effects" class="form-label">side effects</label>
                            <input type="text" class="form-control" id="side_effects" required>
                        </div>
                        <div class="mb-3">
                            <label for="warnings" class="form-label">warnings</label>
                            <input type="text" class="form-control" id="warnings" required>
                        </div>
                        <div class="mb-3 form-check">
                            <input type="checkbox" class="form-check-input" id="exampleCheck1" required>
                            <label class="form-check-label" for="exampleCheck1">I confirm that all description given
                                is
                                correct</label>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="button" id="save_medicine_btn" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>
        <!-- add_medicine_modal ~~~ end  -->

        <!-- complete profile toast ~~~ start  -->
        <div class="toast-container position-fixed top-0 start-50 translate-middle-x">
            <div id="complete_profile_toast" class="toast text-bg-danger" role="alert" aria-live="assertive"
                aria-atomic="true">
                <div class="toast-header">
                    <img src="..." class="rounded me-2 img-fluid" alt="...">
                    <strong class="me-auto">EaseHealth</strong>
                    <small>1 mins ago</small>
                    <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
                </div>
                <div class="toast-body">
                    <h6>please complete your profile before doing any operations</h6>
                    <button type="button" class="btn btn-primary btn-sm" id="toast_update_btn" data-bs-toggle="modal"
                        data-bs-target="#complete_profile_modal">Update profile</button>
                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="toast">Close</button>
                </div>
            </div>
        </div>
        <!-- complete profile toast ~~~ end  -->


        <!-- complete profile modal ~~~ start  -->
        <div class="modal" id="complete_profile_modal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Profile</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>dear ${user.name} Please complete your profile to add medicines</p>
                        <form action="save_pharma.do" method="post" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">Enter details</label>
                                <textarea class="form-control" name="details" id="details"
                                    aria-describedby="emailHelp"></textarea>
                                <div id="emailHelp" class="form-text">add your qualification details</div>
                            </div>
                            <div class="mb-3">
                                <label for="license" class="form-label">license</label>
                                <input type="file" class="form-control" name="license" id="license">
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Save details</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- complete profile modal ~~~ end  -->


        <!-- nav bar start -->
        <div class="container-fluid">
            <c:import url="nav.jsp" />
        </div>

        <!-- nav bar end -->

        <!-- page controls ~~~ start -->
        <div class="container  mt-3">
            <div class="row align-items-center py-3">
                <div class="col-md-4">
                    <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='%236c757d'/%3E%3C/svg%3E&#34;);"
                        aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="index.do">Home</a></li>
                            <li class="breadcrumb-item active" aria-current="page">doctor dashboard</li>
                        </ol>
                    </nav>
                </div>
                <div class="col-md-4">
                    <div class="mb-3">
                        <input type="text" class="form-control" id="searchMedicineInput"
                            placeholder="Search medicines...">
                    </div>


                </div>
            </div>

            <div class="row mt-3">
                <div class="col-12 d-flex justify-content-between align-items-center">
                    <h2>Welcome ${user.name}
                    </h2>
                    <c:choose>
                        <c:when test="${requestScope.details_report == 'true'}">
                            <button class="btn btn-primary d-flex align-items-center" data-bs-toggle="modal"
                                data-bs-target="#add_medicine_modal">
                                <span class="material-icons me-2">add</span>
                                Add Medicine
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button class="btn btn-primary d-flex align-items-center" id="complete_profile">
                                <span class="material-icons me-2">add</span>
                                Add Medicine
                            </button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- page controls ~~~ end -->


            <!-- Dashboard Quick Starts -->
            <div class="row mt-4 ">
                <div class="col-md-3">
                    <div class="card bg-light dashboard_card">
                        <div class="card-body">
                            <h5 class="card-title">Total Medicines</h5>
                            <p class="card-text h3">${pharma_details.medicineCount}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-light dashboard_card">
                        <div class="card-body">
                            <h5 class="card-title">Categories</h5>
                            <p class="card-text h3">10</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card bg-light dashboard_card">
                        <div class="card-body">
                            <h5 class="card-title">Active Medicines</h5>
                            <p class="card-text h3">${pharma_details.medicineCount}</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Dashboard Quick ends -->
            <div class="filter-container p-3 my-4 bg-light rounded shadow-sm">
                <h5 class="filter-heading mb-3">
                    <i class="bi bi-funnel-fill me-2"></i>Filter by Format
                </h5>
                <div class="filter-badges d-flex flex-wrap gap-2">
                    <!-- Show All Badge -->
                    <span 
                        class="filter-badge active" 
                        onclick="renderMedicineCards(medicineDataGlobal); setActiveFilter(this)">
                        <i class="bi bi-grid-3x3-gap me-1"></i>Show All
                    </span>
                    
                    <!-- Dynamic Badges -->
                    <c:forEach var="format" items="${formats}">
                        <span 
                            class="filter-badge" 
                            onclick="filterByFormat(${format.formatId}); setActiveFilter(this)">
                            ${format.name}
                        </span>
                    </c:forEach>
                </div>
            </div>
            
            



            <!-- medicines Card starts -->
            <div class="row mt-5 justify-content-evenly" id="all_medicines">
                all medicine
                <!-- medicines by javascript -->
            </div>
            <!-- medicines Card ends -->
        </div>







        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="static/js/nav.js"></script>
        <script src="static/js/pharmaCompany.js"></script>

    </body>

    </html>