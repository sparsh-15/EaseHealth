<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <!-- (Signup/SignIn Fail) Handling ~~~~ start -->
  <input type="hidden" id="user_signup_report" value="${param.signup}">
  <input type="hidden" id="user_signin_report" value="${param.signin_status}">
  <input type="hidden" id="user_signin_activation_report" value="${param.activated}">

  <div class="modal fade" id="message_box" tabindex="-1">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="message_title">SignUp</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div>
            <span class="material-icons d-block fs-3 ms-5 mb-2">cancel</span>
            <p id="message"></p>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
          <button type="button" class="btn btn-primary" id="msg_btn" data-bs-toggle="modal"
            data-bs-target="#signupbox">SignUp</button>
        </div>
      </div>
    </div>
  </div>

  <!-- (Signup/SignIn Fail) Handling ~~~~ start -->


  <!-- verify email alert ~~~~~ start  -->
  <div id="emailAlert" class="alert alert-success" role="alert" style="display: none;">
    <h4 class="alert-heading">Well done!</h4>
    <p>Aww yeah, you successfully verified your email!! <br>
      Now you can sign in to your account :-)
    </p>
    <hr>
    <p class="mb-0">Click the below button to sign in <br></p>

    <div class="mt-3">
      <button type="button" class="btn btn-success" data-bs-toggle="modal"
        data-bs-target="#signup_form">Success</button>
    </div>
  </div>
  <!-- verify email alert ~~~~~ end  -->

  <!-- Signup SignIn Success/Fail Handling ~~~~ end -->

  <!-- #signup box  Step-1 ~~~~ start -->
  <div class="modal fade" id="signupbox" tabindex="-1">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Create Account</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body mb-4">
          <div class="container">
            <div id="user_card_box" class="row justify-content-around">
              <div class="col-lg-4">
                <div class="card mx-auto user_type" id="a1" data-bs-toggle="modal" data-bs-target="#signup_form"
                  style="width: 13rem;box-shadow:7px 7px 10px #ddd">
                  <img src="static/media/images/patient.jpg" class="card-img-top h-25 " alt="...">
                  <div class="card-body bg-secondary-subtle">
                    <h5 class="card-title text-center">Patient</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4 my-4 my-lg-0">
                <div class="card mx-auto user_type " id="a2" data-bs-toggle="modal" data-bs-target="#signup_form"
                  style="width: 13rem;box-shadow:7px 7px 10px #ddd">
                  <img src="static/media/images/doctor.png" class="card-img-top h-25 " alt="...">
                  <div class="card-body bg-secondary-subtle">
                    <h5 class="card-title text-center">Doctor</h5>
                  </div>
                </div>
              </div>
              <div class="col-lg-4">
                <div class="card mx-auto user_type" id="a3" data-bs-toggle="modal" data-bs-target="#signup_form"
                  style="width: 13rem;box-shadow:7px 7px 10px #ddd">
                  <img src="static/media/images/pharmaCo.png" class="card-img-top" alt="...">
                  <div class="card-body bg-secondary-subtle">
                    <h5 class="card-title text-center">Pharma Company</h5>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- #signup box ~~~~ start -->


  <!-- #signup form Step-2 ~~~~ start -->
  <div class="modal fade" id="signup_form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <form action="signup.do" method="post" id="signup_inner_form">
          <div class="modal-header">
            <h1 class="modal-title fs-5" id="signup_title">SignUp ------</h1>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <input type="hidden" name="user_type_id" id="utype">
            <div class="mb-3">
              <label for="name" class="form-label">Name</label>
              <input type="text" class="form-control" name="name" id="name" required>
            </div>
            <div class="mb-3">
              <label for="email" class="form-label">Email</label>
              <input type="email" autocomplete="on" class="form-control" name="email" id="email" required>
            </div>
            <div class="mb-3 position-relative">
              <label for="password" class="form-label">Password</label>
              <input type="password" class="form-control" name="password" id="password"
                placeholder="Enter your password" required>
              <span class="position-absolute" onclick="togglePasswordVisibility('password')">
                <i class="fas fa-eye"></i>
              </span>
            </div>
            <div class="mb-3">
              <label for="contact" class="form-label">Contact</label>
              <input type="number" autocomplete="on" class="form-control" name="contact" id="contact" required>
            </div>
            <div class="mb-3">
              <label for="city" class="form-label">City</label>
              <input list="city_list" autocomplete="off" type="text" class="form-control" name="city" id="city"
                required>
              <input type="hidden" name="city_id" id="city_id">
              <datalist id="city_list">
                <c:forEach var="ct" items="${cities}">
                  <option value="${ct.city}(${ct.state.state})" id="${ct.cityId}">
                </c:forEach>
              </datalist>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">SignUp</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  
  <!-- #signup form ~~~~ end -->

  <!-- SignIn Step-3 Modal ---- start -->
  <div class="modal fade" id="signin_form" tabindex="-1">
    <div class="modal-dialog ">
      <div class="modal-content shadow-lg rounded-4">
        <form action="signin.do" method="post">
          <div class="modal-header">
            <h5 class="modal-title" id="signin_title">Welcome Back</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="mb-3">
              <label for="signin_email" class="form-label">Email</label>
              <input type="email" autocomplete="off" class="form-control" name="signin_email" id="signin_email"
                required>
            </div>
            <div class="mb-3">
              <label for="signin_password" class="form-label">Password</label>
              <input type="password" class="form-control" name="signin_password" id="signin_password" required>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">SignIn</button>
          </div>
        </form>
      </div>
    </div>
  </div>
  <!-- SignIn Step-1 Modal ---- end -->

  <!-- User offcanvas ------ start -->
  <!-- 
  <div class="offcanvas offcanvas-end" tabindex="-1" id="user_offcanvas" aria-labelledby="offcanvasExampleLabel">
    <div class="offcanvas-header">
      <h5 class="offcanvas-title" id="offcanvasExampleLabel">Offcanvas</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body">
      <div>
        <li>
          <span class="btn dropdown-item text-center">
            <img src="static/media/images/user.png" height="100"><br>
            <a href="profile.do">${user.email}</a>
          </span>
        </li>
        <li>
          <hr>
          <a href="logout.do" class="btn btn-danger dropdown-item d-flex align-items-center">
            <span class="material-icons ms-auto">logout</span>
            <span class="ms-2 me-auto">Logout</span>
          </a>
        </li> -
      </div>
      <div class="dropdown mt-3">
        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown">
          Dropdown button
        </button>
        <ul class="dropdown-menu">
          <li><a class="dropdown-item" href="#">Action</a></li>
          <li><a class="dropdown-item" href="#">Another action</a></li>
          <li><a class="dropdown-item" href="#">Something else here</a></li>
        </ul>
      </div>
    </div>
  </div> -->

  <div class="offcanvas offcanvas-end" tabindex="-1" id="user_offcanvas" aria-labelledby="userOffcanvasLabel">
    <div class="offcanvas-header border-bottom">
      <h5 class="offcanvas-title" id="userOffcanvasLabel">User Profile</h5>
      <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
    </div>
    <div class="offcanvas-body p-0">
      <!-- User Profile Section -->
      <div class="user-profile text-center p-4 border-bottom">
        <!-- Avatar with upload functionality -->
        <div class="position-relative d-inline-block mb-3">
          <input type="file" id="avatar-upload" class="d-none" accept="image/*">
          <img src="static/media/images/user.png" alt="User Avatar" class="rounded-circle" height="80" width="80"
            id="user-avatar" style="cursor: pointer;">
          <div class="position-absolute bottom-0 end-0 bg-primary rounded-circle p-1" style="cursor: pointer;">
            <i class="material-icons text-white" style="font-size: 16px;">photo_camera</i>
          </div>
        </div>
        <h6 class="mb-1">${user.name}</h6>
        <p class="text-muted small mb-3">${user.email}</p>
        <a href="profile.do" class="btn btn-sm btn-outline-primary">Edit Profile</a>
      </div>

      <!-- Quick Actions -->
      <div class="p-3 border-bottom">
        <h6 class="fw-bold mb-3">Quick Actions</h6>
        <div class="list-group list-group-flush">
          <a href="dashboard.do" class="list-group-item list-group-item-action d-flex align-items-center">
            <i class="material-icons me-3">dashboard</i>
            Dashboard
          </a>
          <a href="notifications.do" class="list-group-item list-group-item-action d-flex align-items-center">
            <i class="material-icons me-3">notifications</i>
            Notifications
            <span class="badge bg-danger rounded-pill ms-auto">3</span>
          </a>
          <a href="settings.do" class="list-group-item list-group-item-action d-flex align-items-center">
            <i class="material-icons me-3">settings</i>
            Settings
          </a>
        </div>
      </div>

      <!-- Theme Switcher -->
      <div class="p-3 border-bottom">
        <h6 class="fw-bold mb-3">Appearance</h6>
        <div class="d-flex align-items-center">
          <span class="me-3">Theme:</span>
          <div class="form-check form-switch ms-auto">
            <input class="form-check-input" type="checkbox" id="themeSwitch">
            <label class="form-check-label" for="themeSwitch">Dark Mode</label>
          </div>
        </div>
      </div>

      <!-- Logout -->
      <div class="mt-auto p-3">
        <a href="logout.do" class="btn btn-danger w-100 d-flex align-items-center justify-content-center">
          <i class="material-icons me-2">logout</i>
          Logout
        </a>
      </div>
    </div>
  </div>

  <!-- User offcanvas ------ end -->



  <!-- nav  ---- start -->
  <div class="row">
    <nav class="navbar navbar-expand-lg bg-body-secondary  sticky-top">
      <div class="container-fluid">
        <a class="navbar-brand" href="#">
          <img src="static/media/images/logo.png" alt="Logo" width="190" height="50"
            class="d-inline-block align-text-top">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
          <ul class="navbar-nav mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="#">Home</a>
            </li>
            <c:choose>
              <c:when test="${user.userType.userTypeId == 2}">
                <li class="nav-item">
                  <a class="nav-link" href="#">Find medicines</a>
                </li>
              </c:when>
              <c:otherwise>
                <li class="nav-item">
                  <a class="nav-link" href="#">Find doctor</a>
                </li>
              </c:otherwise>
            </c:choose>
          </ul>
          <div class="ms-auto">
            <c:choose>
              <c:when test="${empty user}">
                <div class="dropdown">
                  <div class="dropdown-center">
                    <button class="btn btn-custom-secondary dropdown-toggle d-flex align-items-center me-5"
                      type="button" data-bs-toggle="dropdown">
                      <span class="material-icons">person</span>
                      <span class="ms-2">User</span>
                    </button>
                    <ul class="dropdown-menu ">
                      <li>
                        <span class="btn dropdown-item d-flex align-items-center" data-bs-toggle="modal"
                          data-bs-target="#signin_form">
                          <span class="material-icons me-2">login</span>
                          <span>Sign In</span>
                        </span>
                      </li>
                      <li>
                        <span class="btn dropdown-item d-flex align-items-center" data-bs-toggle="modal"
                          data-bs-target="#signupbox">
                          <span class="material-icons me-2">person_add</span>
                          <span>Sign Up</span>
                        </span>
                      </li>
                    </ul>
                  </div>
                </div>
              </c:when>
              <c:otherwise>
                <button class="btn btn-primary d-flex align-items-center" type="button" data-bs-toggle="offcanvas"
                  data-bs-target="#user_offcanvas" aria-controls="offcanvasExample" id="user_offcanvas_btn">
                  <span class="material-icons">person</span>
                  <span class="ms-2">User</span>
                </button>
              </c:otherwise>
            </c:choose>
          </div>
        </div>
      </div>
    </nav>
  </div>

  <script>
    document.addEventListener('DOMContentLoaded', function () {
      const avatarImg = document.getElementById('user-avatar');
      const cameraIcon = avatarImg.nextElementSibling;
      const fileInput = document.getElementById('avatar-upload');

      // Open file dialog when clicking on avatar or camera icon
      avatarImg.addEventListener('click', function () {
        fileInput.click();
      });

      cameraIcon.addEventListener('click', function () {
        fileInput.click();
      });
    });
  </script>