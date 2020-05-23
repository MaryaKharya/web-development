async function sendData() {
    event.preventDefault();

    let form = document.getElementById('form');
    let name = form.elements.name;
    let email = form.elements.email;
    let gender = "male";
    if (form.elements.gender.value === "female") {
        gender = "female";
    }
    let check = {
        "name": name.value,
        "email": email.value,
        "country": form.elements.country.value,
        "gender": gender,
        "message": form.elements.message.value
    };

    const response = await fetch('http://localhost:8080/src/saveform.php', {
        method: 'POST',
        body: JSON.stringify(check)
    });

    function addRedBorder(validity) {
        for (let inputId of Object.keys(validity)) {
            if (validity[inputId] === true) {
                let invalidInput = document.getElementById(inputId);
                invalidInput.classList.add('red');
            }
        }
    }
    
    function removeRedBorder() {
        let inputsRedBorder = document.querySelectorAll('.red');
        for (let input of inputsRedBorder) {
            input.classList.remove('red');
        }
    }

    if (response.ok) {
        const validity = await response.json();
        if (validity['success']) {
            let successMessage = document.getElementById('success');
            successMessage.classList.add('show_message');
            removeRedBorder();
        } else {
            addRedBorder(validity);
        }
    } else {
        alert('Ошибка' + response.status);
    }
}

function run() {
    let form = document.getElementById('form');
    form.addEventListener('submit', sendData);
}

window.onload = run;