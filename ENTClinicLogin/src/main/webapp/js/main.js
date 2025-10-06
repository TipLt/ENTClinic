// Wait for DOM to be ready
document.addEventListener('DOMContentLoaded', function() {
    
    // Mobile Navigation Toggle
    const navToggle = document.querySelector('.nav-toggle');
    const navMenu = document.querySelector('.nav-menu');
    
    if (navToggle) {
        navToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            navToggle.classList.toggle('active');
        });
    }
    
    // Close mobile menu when clicking on a link
    const navLinks = document.querySelectorAll('.nav-link');
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (navMenu.classList.contains('active')) {
                navMenu.classList.remove('active');
                navToggle.classList.remove('active');
            }
        });
    });
    
    // Close mobile menu when clicking outside
    document.addEventListener('click', function(event) {
        const isClickInsideNav = navMenu.contains(event.target) || navToggle.contains(event.target);
        if (!isClickInsideNav && navMenu.classList.contains('active')) {
            navMenu.classList.remove('active');
            navToggle.classList.remove('active');
        }
    });
    
    // Smooth scrolling for navigation links
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            const href = this.getAttribute('href');
            
            // Only handle anchor links on the same page
            if (href.startsWith('#')) {
                e.preventDefault();
                const targetId = href;
                const targetSection = document.querySelector(targetId);
                
                if (targetSection) {
                    const offsetTop = targetSection.offsetTop - 80;
                    window.scrollTo({
                        top: offsetTop,
                        behavior: 'smooth'
                    });
                }
            }
        });
    });
    
    // Header scroll effect
    const header = document.querySelector('.header');
    if (header) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 100) {
                header.style.background = 'rgba(255, 255, 255, 0.98)';
                header.style.boxShadow = '0 2px 30px rgba(0, 0, 0, 0.15)';
            } else {
                header.style.background = 'rgba(255, 255, 255, 0.95)';
                header.style.boxShadow = '0 2px 20px rgba(0, 0, 0, 0.1)';
            }
        });
    }
    
    // Active navigation link highlighting
    window.addEventListener('scroll', function() {
        const sections = document.querySelectorAll('section[id]');
        const scrollPos = window.scrollY + 100;

        sections.forEach(section => {
            const sectionTop = section.offsetTop;
            const sectionHeight = section.offsetHeight;
            const sectionId = section.getAttribute('id');
            const correspondingLink = document.querySelector(`.nav-link[href="#${sectionId}"]`);

            if (scrollPos >= sectionTop && scrollPos < sectionTop + sectionHeight) {
                navLinks.forEach(link => link.classList.remove('active'));
                if (correspondingLink) {
                    correspondingLink.classList.add('active');
                }
            }
        });
    });
    
    // Scroll animations using Intersection Observer
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    // Add fade-in animation to elements
    const animatedElements = document.querySelectorAll('.service-card, .doctor-card, .about-text, .about-stats, .contact-item, .stat-item, .feature-item, .mv-card, .facility-item');
    animatedElements.forEach(el => {
        el.classList.add('fade-in');
        observer.observe(el);
    });
    
    // Counter animation for statistics
    function animateCounters() {
        const counters = document.querySelectorAll('.stat h3, .stat-item h3');
        
        counters.forEach(counter => {
            const text = counter.textContent;
            const hasPlus = text.includes('+');
            const hasPercent = text.includes('%');
            const target = parseInt(text.replace(/\D/g, ''));
            
            if (isNaN(target)) return;
            
            let current = 0;
            const increment = target / 100;
            const duration = 2000;
            const stepTime = duration / 100;
            
            counter.textContent = '0' + (hasPlus ? '+' : hasPercent ? '%' : '');
            
            const timer = setInterval(function() {
                current += increment;
                if (current >= target) {
                    current = target;
                    clearInterval(timer);
                }
                
                let suffix = '';
                if (hasPlus) suffix = '+';
                if (hasPercent) suffix = '%';
                if (text.includes('24/7')) suffix = '';
                
                counter.textContent = Math.floor(current) + suffix;
                
                if (text.includes('24/7')) {
                    counter.textContent = '24/7';
                    clearInterval(timer);
                }
            }, stepTime);
        });
    }

    // Trigger counter animation when stats section is visible
    const statsSection = document.querySelector('.stats-section, .about-stats');
    if (statsSection) {
        const statsObserver = new IntersectionObserver(function(entries) {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateCounters();
                    statsObserver.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });
        
        statsObserver.observe(statsSection);
    }
    
    // Form validation
    const forms = document.querySelectorAll('form');
    forms.forEach(form => {
        form.addEventListener('submit', function(e) {
            let isValid = true;
            const inputs = form.querySelectorAll('input[required], select[required], textarea[required]');
            
            inputs.forEach(input => {
                if (!input.value.trim()) {
                    input.style.borderColor = '#ef4444';
                    isValid = false;
                } else {
                    input.style.borderColor = '#e5e7eb';
                }
            });
            
            // Email validation
            const emailInput = form.querySelector('input[type="email"]');
            if (emailInput && emailInput.value) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(emailInput.value)) {
                    emailInput.style.borderColor = '#ef4444';
                    isValid = false;
                    alert('Email không hợp lệ');
                    e.preventDefault();
                    return false;
                }
            }
            
            // Phone validation
            const phoneInput = form.querySelector('input[type="tel"]');
            if (phoneInput && phoneInput.value) {
                const phoneRegex = /^[0-9]{10,11}$/;
                if (!phoneRegex.test(phoneInput.value.replace(/[\s\-\(\)]/g, ''))) {
                    phoneInput.style.borderColor = '#ef4444';
                    isValid = false;
                    alert('Số điện thoại không hợp lệ (10-11 chữ số)');
                    e.preventDefault();
                    return false;
                }
            }
            
            // Password match validation
            const password = form.querySelector('input[name="password"]');
            const confirmPassword = form.querySelector('input[name="confirmPassword"]');
            if (password && confirmPassword && password.value !== confirmPassword.value) {
                password.style.borderColor = '#ef4444';
                confirmPassword.style.borderColor = '#ef4444';
                isValid = false;
                alert('Mật khẩu xác nhận không khớp');
                e.preventDefault();
                return false;
            }
            
            if (!isValid) {
                e.preventDefault();
                alert('Vui lòng điền đầy đủ thông tin');
                return false;
            }
        });
        
        // Clear error styling on input
        const inputs = form.querySelectorAll('input, select, textarea');
        inputs.forEach(input => {
            input.addEventListener('input', function() {
                this.style.borderColor = '#e5e7eb';
            });
        });
    });
    
    // Back to top button
    const backToTopBtn = document.createElement('button');
    backToTopBtn.innerHTML = '<i class="fas fa-arrow-up"></i>';
    backToTopBtn.className = 'back-to-top';
    backToTopBtn.style.cssText = `
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 50px;
        height: 50px;
        background: #2563eb;
        color: white;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: none;
        align-items: center;
        justify-content: center;
        font-size: 1.2rem;
        box-shadow: 0 4px 20px rgba(37, 99, 235, 0.3);
        transition: all 0.3s ease;
        z-index: 1000;
    `;
    
    document.body.appendChild(backToTopBtn);
    
    window.addEventListener('scroll', function() {
        if (window.scrollY > 300) {
            backToTopBtn.style.display = 'flex';
        } else {
            backToTopBtn.style.display = 'none';
        }
    });
    
    backToTopBtn.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
    
    backToTopBtn.addEventListener('mouseenter', function() {
        this.style.transform = 'scale(1.1)';
        this.style.background = '#1d4ed8';
    });
    
    backToTopBtn.addEventListener('mouseleave', function() {
        this.style.transform = 'scale(1)';
        this.style.background = '#2563eb';
    });
    
    // Service card hover effects
    const serviceCards = document.querySelectorAll('.service-card');
    serviceCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // Doctor card hover effects
    const doctorCards = document.querySelectorAll('.doctor-card');
    doctorCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    // Password strength indicator
    const passwordInputs = document.querySelectorAll('input[type="password"]');
    passwordInputs.forEach(input => {
        if (input.name === 'password' || input.name === 'newPassword') {
            input.addEventListener('input', function() {
                const password = this.value;
                const strength = calculatePasswordStrength(password);
                
                // Find or create strength indicator
                let indicator = this.parentElement.querySelector('.password-strength-indicator');
                if (!indicator) {
                    indicator = document.createElement('div');
                    indicator.className = 'password-strength-indicator';
                    indicator.style.cssText = `
                        margin-top: 0.5rem;
                        font-size: 0.875rem;
                        padding: 0.5rem;
                        border-radius: 5px;
                    `;
                    this.parentElement.appendChild(indicator);
                }
                
                if (password.length === 0) {
                    indicator.style.display = 'none';
                } else {
                    indicator.style.display = 'block';
                    indicator.textContent = strength.text;
                    indicator.style.background = strength.color + '20';
                    indicator.style.color = strength.color;
                }
            });
        }
    });
    
    function calculatePasswordStrength(password) {
        let strength = 0;
        
        if (password.length >= 6) strength++;
        if (password.length >= 8) strength++;
        if (/[a-z]/.test(password) && /[A-Z]/.test(password)) strength++;
        if (/\d/.test(password)) strength++;
        if (/[^a-zA-Z\d]/.test(password)) strength++;
        
        if (strength <= 2) {
            return { text: 'Mật khẩu yếu', color: '#ef4444' };
        } else if (strength <= 3) {
            return { text: 'Mật khẩu trung bình', color: '#f59e0b' };
        } else {
            return { text: 'Mật khẩu mạnh', color: '#10b981' };
        }
    }
    
    // Auto-hide success/error messages after 5 seconds
    const alerts = document.querySelectorAll('.alert');
    alerts.forEach(alert => {
        setTimeout(function() {
            alert.style.transition = 'opacity 0.5s ease';
            alert.style.opacity = '0';
            setTimeout(function() {
                alert.style.display = 'none';
            }, 500);
        }, 5000);
    });
    
    // User dropdown menu
    const userDropdown = document.querySelector('.user-dropdown');
    if (userDropdown) {
        const userBtn = userDropdown.querySelector('.user-btn');
        const dropdownContent = userDropdown.querySelector('.dropdown-content');
        
        if (userBtn && dropdownContent) {
            // Toggle dropdown on click (for mobile)
            userBtn.addEventListener('click', function(e) {
                e.stopPropagation();
                dropdownContent.style.display = dropdownContent.style.display === 'block' ? 'none' : 'block';
            });
            
            // Close dropdown when clicking outside
            document.addEventListener('click', function() {
                dropdownContent.style.display = 'none';
            });
        }
    }
    
    // Print confirmation for important actions
    const logoutButtons = document.querySelectorAll('a[href*="logout"]');
    logoutButtons.forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!confirm('Bạn có chắc chắn muốn đăng xuất?')) {
                e.preventDefault();
            }
        });
    });
    
    console.log('Phòng Khám Tai Mũi Họng - Website đã được tải thành công!');
});