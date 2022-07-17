
/* Testimonial slider */
function testimonialSlider(){
    const carouselOne = document.getElementById('carouselOne')
    if(carouselOne){ /*if the element exists */
    carouselOne.addEventListener('slide.bs.carousel', function () {
        const activeItem = this.querySelector(".active");
        document.querySelector(".js-testimonial-img").src =
        activeItem.getAttribute("data-js-testimonial-img");
      })
    }
}
testimonialSlider();

/* course preview video */
function coursePreviewVideo(){
  const coursePreviewModal =document.querySelector(".js-course-preview-modal");
  if(coursePreviewModal){ //if the element exists
    coursePreviewModal.addEventListener("shown.bs.modal", function(){
      this.querySelector(".js-course-preview-video").play();
      this.querySelector(".js-course-preview-video").currentTime=0;
    });

    coursePreviewModal.addEventListener("hide.bs.modal", function(){
      this.querySelector(".js-course-preview-video").pause();
    });
  }
}
coursePreviewVideo();

/* header menu */
function headerMenu(){
  const menu = document.querySelector(".js-header-menu"),
  backdrop = document.querySelector(".js-header-backdrop"),
  menuCollapseBreakpoint = 991;

  function toggleMenu(){
    menu.classList.toggle("open");
    backdrop.classList.toggle("active");
    document.body.classList.toggle("overflow-hidden");
  }
  document.querySelectorAll(".js-header-menu-toggler").forEach((item) => {
    item.addEventListener("click", toggleMenu);
  });

  //close the menu by clicking outside of it
  backdrop.addEventListener("click", toggleMenu);

  function collapse(){
    menu.querySelector(".active .js-sub-menu").removeAttribute("style");
    menu.querySelector(".active").classList.remove("active");
  }

  menu.addEventListener("click", (event) => {
    const { target } = event;
    
    if(target.classList.contains("js-toggle-sub-menu") &&
    window.innerWidth <= menuCollapseBreakpoint){
      //prevent default anchor click behavior
      event.preventDefault();

      //if menu item already expanded, collapse it and exit
      if(target.parentElement.classList.contains("active")){
        collapse();
        return;
      }
      //if not already expaned...run below code

      //collapse the other expanded menu-item if exists
      if(menu.querySelector(".active")){
        collapse();
      }

      //expand new menu-item
      target.parentElement.classList.add("active");
      target.nextElementSibling.style.maxHeight = 
      target.nextElementSibling.scrollHeight + "px";
    }
  });

  //when resizing window
  window.addEventListener("resize", function(){
    if(this.innerWidth > menuCollapseBreakpoint && menu.classList.contains("open")){
      toggleMenu();
    }
    if(this.innerWidth > menuCollapseBreakpoint && menu.querySelector(".active")){
      collapse();
    }
  });
}
headerMenu();

/* Style switcher */
function styleSwitcherToggle(){
  const styleSwitcher = document.querySelector(".js-style-switcher"),
  styleSwitcherToggler = document.querySelector(".js-style-switcher-toggler");

  styleSwitcherToggler.addEventListener("click", function(){
    styleSwitcher.classList.toggle("open");
    this.querySelector("i").classList.toggle("fa-times");
    this.querySelector("i").classList.toggle("fa-cog");
  });
}
styleSwitcherToggle();

/* theme colors */

/* theme light and dark mode */
function themeLightDark(){
  const darkModeCheckbox = document.querySelector(".js-dark-mode");

  darkModeCheckbox.addEventListener("click", function(){
    if(this.checked){
      localStorage.setItem("theme-dark", "true");
    }
    else{
      localStorage.setItem("theme-dark", "false");
    }
    themeMode();
  });

  function themeMode(){
    if(localStorage.getItem("theme-dark") === "false"){
      document.body.classList.remove("t-dark");
    }
    else{
      document.body.classList.add("t-dark");
    }
  }

  if(localStorage.getItem("theme-dark") !== null){
    themeMode();
  }
  if(document.body.classList.contains("t-dark")){
    darkModeCheckbox.checked = true;
  }
}
themeLightDark();

/* theme glass effect */
function themeGlassEffect(){
  const glassEffectCheckbox = document.querySelector(".js-glass-effect"),
  glassStyle = document.querySelector(".js-glass-style");

  glassEffectCheckbox.addEventListener("click", function(){
    if(this.checked){
      localStorage.setItem("glass-effect", 'true');
    }
    else{
      localStorage.setItem("glass-effect", "false");
    }
    glass();
  });

  function glass(){
    if(localStorage.getItem("glass-effect") === "true"){
      glassStyle.removeAttribute("disabled");
    }
    else{
      glassStyle.disabled = true;
    }
  }
  if(localStorage.getItem("glass-effect") !== null){
    glass();
  }

  if(!glassStyle.hasAttribute("disabled")){
    glassEffectCheckbox.checked = true;
  }
}
themeGlassEffect();