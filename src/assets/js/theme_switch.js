/**
 * @function onToggleMode
 * @summary: intervert between light/dark theme and save settings to local stroage.
 * Basically, replaces/toggles every CSS class that has '-light' class with '-dark' and opposite
 */
function onToggleMode() {
  let bg_light_list = document.querySelectorAll(".bg-light")
  let bg_dark_list = document.querySelectorAll(".bg-dark")
  let text_light_list = document.querySelectorAll(".text-light")
  let text_dark_list = document.querySelectorAll(".text-dark")

  bg_light_list.forEach((element) => {
    element.className = element.className.replace(/bg-light/g, "bg-dark");
  });

  bg_dark_list.forEach((element) => {
    element.className = element.className.replace(/bg-dark/g, "bg-light");
  });

  text_light_list.forEach((element) => {
    element.className = element.className.replace(/text-light/g, "text-dark");
  });

  text_dark_list.forEach((element) => {
    element.className = element.className.replace(/text-dark/g, "text-light");
  });
}

window.addEventListener("load", function(){
  // set in Dark mode by default
  // by default it's in light mode
  onToggleMode();
});
