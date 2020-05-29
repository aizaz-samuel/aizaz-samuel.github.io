$(document).ready(function(){
  //document.getElementById("list").style.display = "none";
  showlistbig();
});

// Below variables should reflect height entries in css file
var fullheight = "800px";
var reducedht  = "500px";

function showlistbig(){
  document.getElementById("list").style.height = fullheight;
  document.getElementById("text").style.height = fullheight;
  document.getElementById("graphics").style.display = "none";
}

function showgraphics(){
  document.getElementById("list").style.height = reducedht;
  document.getElementById("text").style.height = reducedht;
  document.getElementById("graphics").style.display = "block";
}
