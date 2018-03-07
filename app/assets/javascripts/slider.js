var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value + " KM";

slider.oninput = function() {
  output.innerHTML = this.value + " KM";
}
