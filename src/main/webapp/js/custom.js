document.addEventListener("DOMContentLoaded", function () {
    // AOS
    AOS.init({ duration: 1000, once: true });

    // Nav Highlight
    const navLinks = document.querySelectorAll("#nav-menu ul li a");
    const sections = document.querySelectorAll("section");

    function changeLinkState() {
        let index = sections.length;
        while (--index && window.scrollY + 50 < sections[index].offsetTop) {}
        navLinks.forEach((link) => link.classList.remove("active"));
        navLinks[index].classList.add("active");
    }

    changeLinkState();
    window.addEventListener("scroll", changeLinkState);

    // Dropdown Filter
    const dropdownLinks = document.querySelectorAll('.dropdown-content a');
    dropdownLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const filterValue = this.getAttribute('data-filter');
            const filterButton = document.querySelector(`[data-filter="${filterValue}"]`);
            if (filterButton) {
                document.querySelectorAll('.filter-btn').forEach(btn => btn.classList.remove('active'));
                filterButton.classList.add('active');
                const cards = document.querySelectorAll('.card');
                cards.forEach(card => {
                    card.style.display = filterValue === 'all' || card.dataset.category === filterValue
                        ? 'block' : 'none';
                });
            }
        });
    });

    // Contact Form
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const formData = new FormData(this);
            const name = formData.get('name');
            const email = formData.get('email');
            const subject = formData.get('subject');
            const message = formData.get('message');

            if (!name || !email || !subject || !message) {
                alert('Please fill in all required fields.');
                return;
            }

            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                return;
            }

            const submitButton = this.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;

            submitButton.textContent = 'Sending...';
            submitButton.disabled = true;

            setTimeout(() => {
                alert('Thank you for your message! We will get back to you soon.');
                this.reset();
                submitButton.textContent = originalText;
                submitButton.disabled = false;
            }, 2000);
        });
    }
});
