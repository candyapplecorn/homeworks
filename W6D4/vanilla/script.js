document.addEventListener("DOMContentLoaded", () => {
  // toggling restaurants

  const toggleLi = (e) => {
    const li = e.target;
    if (li.className === "visited") {
      li.className = "";
    } else {
      li.className = "visited";
    }
  };

  document.querySelectorAll("#restaurants li").forEach((li) => {
    li.addEventListener("click", toggleLi);
  });



  // adding SF places as list items

  // --- your code here!
	const addPlace = function addPlace(place){
		let li = document.createElement('li');
		li.innerText = place;
		document.querySelector('#sf-places').appendChild(li);
	};

	const sfCityForm = document.querySelector(".list-container form")

	sfCityForm
	.addEventListener('submit', event => {
		event.preventDefault();
		const textInput = sfCityForm.querySelector('input[type="text"]');
		const data = textInput.value;
		textInput.value = "";

		addPlace(data)
	});



  // adding new photos

  // --- your code here!

	const dogPhotosUl = document.querySelector('ul.dog-photos');
	const dogPhotoForm = document.querySelector('.photo-form-container');

	const imageMaker = function imageMaker(url){
		let image = document.createElement('img');
		image.src = url;
		return image;
	};

	const addLiPhoto = function addPhoto(container, url){
		let li = document.createElement('li');
		li.appendChild(imageMaker(url));
		container.appendChild(li);
	};

	const addHidden = domEl => domEl.classList.add('hidden');
	const removeHidden = domEl => domEl.classList.remove('hidden');

	document
	.querySelector('.photo-show-button')
	.addEventListener('click', function(event){
		removeHidden(dogPhotoForm);	
	});

	dogPhotoForm.addEventListener('submit', event => {
		event.preventDefault();

		const photoUrl = dogPhotoForm.querySelector('input').value;
		dogPhotoForm.querySelector('input').value = "";

		addLiPhoto(dogPhotosUl, photoUrl);

		addHidden(dogPhotoForm);
	});
});
