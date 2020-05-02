carousel();

function carousel() {
  const buttonLeft = document.querySelector('.prev');
  const buttonRight = document.querySelector('.next');
  const films = document.querySelectorAll('.film');
  const listOfFilms = document.querySelector('ul.list_films');
  const numberOfFilms = films.length - 1;
  const mainFilms = 3;
  let i = 0;
  let count = mainFilms;


  buttonLeft.onclick = function(){
    if (count > mainFilms) {
      listOfFilms.insertBefore(films[i - 1], films[i]);
      i--;
      count--;
    } else {
        listOfFilms.insertBefore(films[numberOfFilms], films[i]);
        i = numberOfFilms;
        count = films.length + mainFilms - 1;
      }
  }

  buttonRight.onclick = function(){
    listOfFilms.appendChild(films[i]);
    count++;
    if (count <= films.length + mainFilms - 1) {
      i++;
    } else {
        if (count == films.length + mainFilms) {
          count = mainFilms;
          i = 0;
        }
      }
  }
}
