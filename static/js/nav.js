const user_card_box = document.querySelector("#user_card_box");
const users = new Array("Patient", "Doctor", "Pharma company");
const utype = document.querySelector("#utype");


const city_list = document.querySelector('#city_list');
const city_id = document.querySelector('#city_id');
const city = document.querySelector('#city');

const signup_title = document.querySelector('#signup_title');
const signup_form = document.querySelector('#signup_inner_form');
const user_signup_report = document.querySelector('#user_signup_report');

const user_signin_report = document.querySelector('#user_signin_report');
const user_signin_activation_report = document.querySelector('#user_signin_activation_report');

const message_box = new bootstrap.Modal('#message_box'); // modal: message
const message_title = document.querySelector('#message_title'); // h3
const message = document.querySelector('#message'); //<p>
const signupMsgIcon = document.querySelector("#signup-msg-icon");
const signup_msg_btn = document.querySelector("#signup_msg_btn")


signup_form.addEventListener('submit', (ev) => {
  ev.preventDefault();

  const options = city_list.options;
  for (i = 0; i < options.length; i++) {
    if (options[i].value == city.value) {
      city_id.value = options[i].id;
    }
  }
  signup_form.submit();
});


user_card_box.addEventListener('click', (event) => {
  event.preventDefault();

  const card = event.target.closest('.user_type');

  if (card) {
    utype.value = card.id == 'a1' ? 1 : card.id == 'a2' ? 2 : 3;
    console.log(utype)
    signup_title.innerText = 'SignUp as '.concat(card.id == 'a1' ? 'Patient' : card.id == 'a2' ? 'Doctor' : 'Pharma Company');
  }
});

const showMessageBox = () => {

  setTimeout(() => {
    message_box.show();
  }, 1000);
};

signup_msg_btn.addEventListener("click", function () {
  const modal = new bootstrap.Modal(document.getElementById("signin_form"));
  modal.show();
});


if (user_signup_report.value) {
  if (user_signup_report.value == 'true') {
    message.innerHTML = 'Congratulations .... your account is created <br> please signin';
    message.classList.add('text-success');
    message.classList.add('text-center');
    signupMsgIcon.innerText = 'verified';
    signup_msg_btn.innerText = 'Sign In';
    signup_msg_btn.setAttribute("data-bs-target","signin_form")
    showMessageBox();

  } else {
    message.innerHTML = 'Either Email and/or Contact already in use...!!!';
    message.classList.add('text-danger');
    message.classList.add('text-center');

    showMessageBox();
  }
}

if (user_signin_report.value) {
  switch (parseInt(user_signin_report.value)) {
    case -1:
      message.innerHTML = 'Account with the given Email does not exist...!!!';
      break;
    case 0:
      message.innerHTML = 'Incorrect Password...!!!';
      break;
    case 3:
      message.innerHTML = 'Your account is Inactive...!!! Please click here to get an account activation link to your email... <a href="send_activation_link.do?email=${param.email}">Activation Link</a>';
      break;
    case 5:
      message.innerHTML = 'Your account is Closed by you...!!! Please click here to get an account activation link to your email... <a href="send_activation_link.do?email=${param.email}">Reopen My Account</a>';
      break;
    case 6:
      message.innerHTML = 'Your account is Blocked...!!!';
  }

  showMessageBox();
}

if (user_signin_activation_report.value == true) {
  document.getElementById("emailAlert").style.display = "block";
}

function togglePasswordVisibility(inputId) {
  const passwordInput = document.getElementById(inputId);
  const icon = document.getElementById("toggle-password-icon");

  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    icon.classList.remove("fa-eye-slash");
    icon.classList.add("fa-eye");
  } else {
    passwordInput.type = "password";
    icon.classList.remove("fa-eye");
    icon.classList.add("fa-eye-slash");
  }
}
