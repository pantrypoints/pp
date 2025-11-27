// OBSERVER FOR GLY AND ANI 
const observerOptions = {
    root: null, // Use the viewport as the root
    rootMargin: '0px', // No margin around the viewport
    threshold: 0.1 // Trigger when at least 10% of the element is visible
};

// Callback function to execute when an observed element intersects
const observerCallback = (entries, observer) => {
    entries.forEach(entry => {
        // Check if the element is intersecting (visible)
        if (entry.isIntersecting) {
            // Add the 'is-visible' class to trigger the animation
            entry.target.classList.add('is-visible');

            // Optional: Stop observing the element once it's visible
            // This prevents the animation from re-triggering if you scroll up and down
            // observer.unobserve(entry.target);
        }
         // Optional: If you want the animation to reverse when scrolling up
         // (Remove the unobserve line above if you use this)
         // else {
         //    entry.target.classList.remove('is-visible');
         // }
    });
};

// Create the Intersection Observer instance
const observer = new IntersectionObserver(observerCallback, observerOptions);

// Select all elements that should be animated (both fly-in and fade-in)
// We select elements with class 'fly-in' OR 'ani'
const elementsToObserve = document.querySelectorAll('.fly-in, .ani');

// Start observing each target element
elementsToObserve.forEach(el => {
    observer.observe(el);
});


  const scrollToTopBtn = document.getElementById('scrollToTopBtn');

  window.addEventListener('scroll', () => {
    if (window.scrollY > 200) {
      scrollToTopBtn.classList.remove('hidden');
      scrollToTopBtn.classList.add('opacity-100');
    } else {
      scrollToTopBtn.classList.add('opacity-0');
      setTimeout(() => {
        if (scrollToTopBtn.classList.contains('opacity-0')) {
          scrollToTopBtn.classList.add('hidden');
        }
      }, 300); // match the transition duration
    }
  });

  scrollToTopBtn.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
