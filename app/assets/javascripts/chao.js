
$(document).ready(function(){ //loads script after the page is loaded
    $('.card-container').click(function(){ // When the element card-container is click it triggers the function
        $(this).toggleClass("flipped"); // Finds the element and toggles the class called flipped to let you know the card is currently flipped or active
          $('.card-container .flipped').toggle("flipper"); // If the card-container element also contains the class flipped it will toggle the flip
    });
  });