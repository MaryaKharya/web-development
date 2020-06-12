async function sendData() {
  event.preventDefault();
  const form = document.getElementById('form');
  const response = await fetch('src/saveform.php', {
    method: 'POST',
    body: new FormData(form)
  });
  const validity = await response.json();
  const successMessage = document.getElementById('success');
  const name = document.getElementById('name');
  const email = document.getElementById('email');
  const message = document.getElementById('message');

  if (response.ok) {
    if (validity['success']) {
      successMessage.classList.add('show_message');
    } else {
        for (let input of Object.keys(validity)) {
          let invalidInput = document.getElementById(input);
          if (validity[input] === false) {
            invalidInput.classList.add('red');
          }
        }
          successMessage.classList.remove('show_message');
        }
    } else {
        alert('Ошибка' + response.status);
    }

    name.addEventListener('click', function(){
      name.classList.remove('red');
    });

    email.addEventListener('click', function(){
      email.classList.remove('red');
    });

    message.addEventListener('click', function(){
      message.classList.remove('red');
    });

}

function run() {
  let form = document.getElementById('form');
  form.addEventListener('submit', sendData); 
}

window.onload = run;
