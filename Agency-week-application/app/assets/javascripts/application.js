// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

//needed for JS to work across multiple files/pages
document.addEventListener('turbolinks:load', function() {

console.log("loaded");

var ham = document.getElementById("hamburger");
ham.addEventListener('click', function(){
  openNav();
});

var closex = document.getElementById("closingx");
closex.addEventListener('click', function(){
  closeNav();
});

function openNav() {
    document.getElementById("mySidenav").style.width = "250px";
    document.getElementById("main").style.marginLeft = "250px";
    document.body.style.backgroundColor = "rgba(0,0,0,0.4)";
};

function closeNav() {
    document.getElementById("mySidenav").style.width = "0";
    document.getElementById("main").style.marginLeft= "0";
    document.body.style.backgroundColor = "white";
};
//  num = 0;
//  secondnum = 1;
// $('.card')[num].style.display='none';$('.card')[secondnum].style.display = 'initial';
//  function display() {
//    $('.card')[num+1].style.display='none';$('.card')[secondnum+1].style.display = 'initial';
//    num = num+1
//    secondnum = secondnum +1
// };
// $('#savebttn').addEventListener('click', display());



// var deletebttn = document.getElementById('deletebttn');
// var savebbttn = document.getElementById('savebbttn');
// var card =document.getElementsByClassName('card');
// var num
// var secondnum
//
// console.log(savebbttn);
// savebbttn.addEventListener('click', function(event) {
//   event.preventDefault();
//   console.log("button sclicked");
//     num = 0;
//     secondnum = 1;
//
//     card[num++].style.display = 'none';
//     card[secondnum++].style.display = 'initial';
//
//     num = num++
//     secondnum = secondnum ++
//     console.log(num, secondnum);
//   });

var deletebttn = document.getElementsByClassName('deletebttn');
var savebbttn = document.getElementsByClassName('savebbttn');
var card = document.getElementsByClassName('card');
var num = -1;
var secondnum = 0;
//
// for (var i = 0; i < card.length; i++) {
//   if (i == 0)  {
//     card[i].style.display = 'initial';
//   }else if (i >= 1) {
//     card[i].style.display = 'none';
//   }
// }

for (var i = 0; i < savebbttn.length; i++) {

  savebbttn[i].addEventListener('click', function(){
    console.log("button sclicked");
    // event.preventDefault();
      num++;
      secondnum++;

      card[num].style.display = 'none';
      card[secondnum].style.display = 'block';


    console.log(num, secondnum);
  });
}
for (var i = 0; i < deletebttn.length; i++) {
  deletebttn[i].addEventListener('click', function(event){
    console.log("button dclicked");
    event.preventDefault();
      num++;
      secondnum++;

      card[num].style.display = 'none';
      card[secondnum].style.display = 'block';


    console.log(num, secondnum);


  })
}


// NavBar Attribution:
// http://www.w3schools.com/howto/howto_js_sidenav.asp

});//end turbolinks load
