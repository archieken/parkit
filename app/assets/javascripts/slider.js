var slider = document.getElementById("myRange");
var output = document.getElementById("demo");
output.innerHTML = slider.value + " KM";

 if (slider.value < 1000) {
    output.innerHTML = slider.value + " Meters";
  }

  else if (slider.value == 1000 || slider.value == 2000 ) {
    output.innerHTML = (slider.value/1000).toFixed(0) + " KM";
  }
  else {
    output.innerHTML = (slider.value/1000).toFixed(2) + " KM";
  }

slider.oninput = function() {
  if (this.value < 1000) {
    output.innerHTML = this.value  + " Meters";
  }

  else if (slider.value == 1000 || slider.value == 2000 ) {
    output.innerHTML = (slider.value/1000).toFixed(0) + " KM";
  }

  else {
    output.innerHTML = (this.value/1000).toFixed(2) + " KM";
  }
}
