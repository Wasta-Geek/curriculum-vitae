/**
 * @function onToggleMode
 * @summary: intervert between light/dark theme and save settings to local stroage.
 * Basically, replaces/toggles every CSS class that has '-light' class with '-dark' and opposite
 */
 function onToggleMode() {
  var bg_light_list = document.querySelectorAll(".bg-light")
  var bg_dark_list = document.querySelectorAll(".bg-dark")
  var text_light_list = document.querySelectorAll(".text-light")
  var text_dark_list = document.querySelectorAll(".text-dark")

  for (var index = 0; index < bg_light_list.length; index++)
  {
    if (!bg_light_list[index].className.includes("no-theme-switch"))
      bg_light_list[index].className = bg_light_list[index].className.replace(/bg-light/g, "bg-dark");
  }

  for (var index = 0; index < bg_dark_list.length; index++)
  {
    if (!bg_dark_list[index].className.includes("no-theme-switch"))
      bg_dark_list[index].className = bg_dark_list[index].className.replace(/bg-dark/g, "bg-light");
  }

  for (var index = 0; index < text_light_list.length; index++)
  {
    if (!text_light_list[index].className.includes("no-theme-switch"))
      text_light_list[index].className = text_light_list[index].className.replace(/text-light/g, "text-dark");
  }

  for (var index = 0; index < text_dark_list.length; index++)
  {
    if (!text_dark_list[index].className.includes("no-theme-switch"))
      text_dark_list[index].className = text_dark_list[index].className.replace(/text-dark/g, "text-light");
  }
}

// set in Dark mode by default
// by default it's in light mode
// onToggleMode()