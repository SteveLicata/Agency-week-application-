document.addEventListener('turbolinks:load', function() {
console.log("12loaded");


var imageArray = [
  "/assets/food-1.png",
  "/assets/food-2.png",
  "/assets/food-3.png",
  "/assets/food-4.png",
  "/assets/food-5.png",
  "/assets/food-6.png",
  "/assets/food-7.png",
  "/assets/food-8.png",
  "/assets/food-9.png",
  "/assets/food-10.png",
  "/assets/food-11.png",
  "/assets/food-12.png",
  "/assets/food-13.png",
  "/assets/food-14.png",
  "/assets/food-15.png",
  "/assets/food-16.png",
  "/assets/food-17.png",
  "/assets/food-18.png",
  "/assets/food-19.png",
  "/assets/food-20.png",
  "/assets/food-21.png",
  "/assets/food-22.png",
  "/assets/food-23.png",
  "/assets/food-24.png",
  "/assets/food-25.png",
  "/assets/food-26.png",
  "/assets/food-27.png",
  "/assets/food-28.png",
  "/assets/food-29.png",
  "/assets/food-30.png"
];

var icons = document.getElementById('icons');
var headerlogo = document.getElementById('headerlogo');

if (icons !== null){
  console.log("alla", icons);
  var i = 0
  setInterval(function(){
    if (i ==  imageArray.length) {
      i = 0
    }
    icons.src = imageArray[i];
    i++;
  }, 1000);

  headerlogo.style.visibility = 'hidden';

}

}); //end window onload
