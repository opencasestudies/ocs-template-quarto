document.addEventListener("DOMContentLoaded", () => {

  document.querySelectorAll("details.ai-considerations").forEach(box => {

    let disclaimer = box.nextElementSibling;

    while (disclaimer &&
           !disclaimer.classList.contains("column-margin")) {
      disclaimer = disclaimer.nextElementSibling;
    }
  
    if (!disclaimer) return;

    function update() {
      disclaimer.style.display = box.open ? "" : "none";
    }

    update();

    box.addEventListener("toggle", update);

  });

});
