/* Base Styles & Variables */
:root {
    --primary-color: #4a6cf7;
    --secondary-color: #6b7eed;
    --dark-color: #121212;
    --light-color: #f8f9fa;
    --gray-color: #616161;
    --light-gray: #e9ecef;
    --success-color: #28a745;
    --danger-color: #dc3545;
    --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    --transition: all 0.3s ease;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

body {
    font-family: 'Hind Siliguri', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    line-height: 1.6;
    color: var(--dark-color);
    background-color: var(--light-color);
}

@import url('https://fonts.googleapis.com/css2?family=Hind+Siliguri:wght@300;400;500;600;700&display=swap');

ul {
    list-style: none;
}

a {
    text-decoration: none;
    color: var(--dark-color);
}

img {
    max-width: 100%;
    height: auto;
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
}

.section-title {
    font-size: 2rem;
    text-align: center;
    margin-bottom: 2rem;
    position: relative;
    color: var(--dark-color);
}

.section-title::after {
    content: '';
    position: absolute;
    width: 80px;
    height: 4px;
    background: var(--primary-color);
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    border-radius: 2px;
}

.btn {
    display: inline-block;
    padding: 12px 25px;
    border-radius: 5px;
    transition: var(--transition);
    font-weight: 500;
    cursor: pointer;
    border: none;
    text-align: center;
}

.btn-primary {
    background-color: var(--primary-color);
    color: #fff;
}

.btn-primary:hover {
    background-color: var(--secondary-color);
    transform: translateY(-3px);
}

.btn-secondary {
    background-color: transparent;
    color: var(--primary-color);
    border: 2px solid var(--primary-color);
}

.btn-secondary:hover {
    background-color: var(--primary-color);
    color: #fff;
    transform: translateY(-3px);
}

/* Header Styles */
.header {
    background-color: #fff;
    box-shadow: var(--box-shadow);
    position: sticky;
    top: 0;
    z-index: 100;
    padding: 1rem 0;
}

.header .container {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.logo a {
    display: flex;
    align-items: center;
}

.logo h1 {
    font-size: 1.8rem;
    font-weight: 700;
    color: var(--dark-color);
}

.logo span {
    color: var(--primary-color);
}

.nav-links {
    display: flex;
}

.nav-links li {
    margin-left: 1.5rem;
}

.nav-links a {
    font-weight: 500;
    padding: 0.5rem;
    transition: var(--transition);
}

.nav-links a:hover,
.nav-links a.active {
    color: var(--primary-color);
}

.mobile-menu {
    display: none;
    font-size: 1.5rem;
    cursor: pointer;
}

/* Hero Section */
.hero {
    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    color: #fff;
    padding: 5rem 0;
    text-align: center;
}

.hero-content {
    max-width: 800px;
    margin: 0 auto;
}

.hero h1 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
    font-weight: 700;
}

.hero p {
    font-size: 1.2rem;
    margin-bottom: 2rem;
    opacity: 0.9;
}

.search-container {
    display: flex;
    max-width: 600px;
    margin: 0 auto 2rem;
    position: relative;
}

.search-container input {
    flex: 1;
    padding: 15px 20px;
    border: none;
    border-radius: 5px 0 0 5px;
    font-size: 1rem;
}

.search-container button {
    background-color: var(--dark-color);
    color: white;
    border: none;
    border-radius: 0 5px 5px 0;
    padding: 0 20px;
    cursor: pointer;
    transition: var(--transition);
}

.search-container button:hover {
    background-color: #2e2e2e;
}

/* Suggestion Box Styles */
.suggestion-box {
    position: absolute !important;
    top: 100% !important;
    left: 0 !important;
    width: 100% !important;
    max-height: 300px;
    overflow-y: auto;
    background-color: white;
    border-radius: 0 0 5px 5px;
    box-shadow: var(--box-shadow);
    z-index: 9999 !important;
    display: none;
    text-align: left;
}

.suggestion-item {
    display: flex;
    align-items: center;
    padding: 10px 15px;
    cursor: pointer;
    transition: background-color 0.2s;
    border-bottom: 1px solid var(--light-gray);
}

.suggestion-item:last-child {
    border-bottom: none;
}

.suggestion-item:hover {
    background-color: var(--light-gray);
}

.suggestion-item i {
    font-size: 1.2rem;
    color: var(--primary-color);
    margin-right: 10px;
    width: 30px;
    text-align: center;
}

.suggestion-content {
    flex: 1;
}

.suggestion-name {
    font-weight: 500;
    color: var(--dark-color);
}

.suggestion-category {
    font-size: 0.8rem;
    color: var(--gray-color);
}

.hero-btns {
    display: flex;
    justify-content: center;
    gap: 1rem;
}

/* Categories Section */
.categories {
    padding: 3rem 0;
    background-color: #fff;
}

.category-filter {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 0.8rem;
    margin-bottom: 2rem;
}

.category-btn {
    background-color: var(--light-gray);
    color: var(--gray-color);
    border: none;
    padding: 8px 16px;
    border-radius: 30px;
    cursor: pointer;
    transition: var(--transition);
    font-weight: 500;
}

.category-btn:hover,
.category-btn.active {
    background-color: var(--primary-color);
    color: #fff;
}

/* Tools Section */
.tools {
    padding: 3rem 0;
    background-color: var(--light-color);
}

.tools-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 2rem;
}

.tool-card {
    background-color: #fff;
    border-radius: 10px;
    box-shadow: var(--box-shadow);
    transition: transform 0.3s, box-shadow 0.3s;
    padding: 1.5rem;
    height: 100%;
    display: flex;
    flex-direction: column;
    position: relative;
    overflow: hidden;
    cursor: default;
}

.tool-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 10px 25px rgba(0, 0, 0, 0.15);
}

.tool-icon {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, var(--primary-color) 0%, var(--secondary-color) 100%);
    color: #fff;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-bottom: 1rem;
    font-size: 1.5rem;
}

.tool-content {
    flex: 1;
    display: flex;
    flex-direction: column;
}

.tool-card h3 {
    font-size: 1.2rem;
    margin-bottom: 0.5rem;
    font-weight: 600;
}

.tool-category {
    display: inline-block;
    font-size: 0.8rem;
    background-color: var(--light-gray);
    padding: 0.2rem 0.5rem;
    border-radius: 15px;
    margin-bottom: 0.8rem;
    color: var(--gray-color);
}

.tool-description {
    margin-bottom: 1rem;
    font-size: 0.9rem;
    color: var(--gray-color);
    line-height: 1.5;
}

.view-details-btn {
    margin-top: auto;
    align-self: flex-start;
}

/* Loading Animation */
.loading {
    text-align: center;
    padding: 3rem;
}

.loading i {
    font-size: 3rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

/* About Section */
.about {
    padding: 4rem 0;
    background-color: #fff;
}

.about-content {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 3rem;
    align-items: center;
}

.about-text p {
    margin-bottom: 1.5rem;
    color: var(--gray-color);
    font-size: 1.1rem;
}

.about-features {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 1.5rem;
}

.feature {
    background-color: var(--light-color);
    padding: 1.5rem;
    border-radius: 10px;
    text-align: center;
    transition: var(--transition);
}

.feature:hover {
    transform: translateY(-5px);
    box-shadow: var(--box-shadow);
}

.feature i {
    font-size: 2rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

.feature h3 {
    margin-bottom: 0.5rem;
}

/* Footer Section */
.footer {
    background-color: var(--dark-color);
    color: #fff;
    padding: 4rem 0 2rem;
}

.footer-content {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
    gap: 2rem;
    margin-bottom: 2rem;
}

.footer-logo h2 {
    font-size: 1.8rem;
    margin-bottom: 1rem;
}

.footer-logo span {
    color: var(--primary-color);
}

.footer-logo p {
    opacity: 0.8;
}

.footer h3 {
    font-size: 1.2rem;
    margin-bottom: 1.5rem;
    position: relative;
}

.footer h3::after {
    content: '';
    position: absolute;
    width: 40px;
    height: 3px;
    background: var(--primary-color);
    bottom: -10px;
    left: 0;
    border-radius: 2px;
}

.footer-links ul li,
.footer-categories ul li {
    margin-bottom: 0.8rem;
}

.footer-links a,
.footer-categories a {
    color: #ddd;
    transition: var(--transition);
}

.footer-links a:hover,
.footer-categories a:hover {
    color: var(--primary-color);
    padding-left: 5px;
}

.footer-contact p {
    margin-bottom: 1rem;
    display: flex;
    align-items: center;
}

.footer-contact i {
    margin-right: 10px;
    color: var(--primary-color);
}

.social-links {
    display: flex;
    gap: 1rem;
    margin-top: 1.5rem;
}

.social-links a {
    display: flex;
    align-items: center;
    justify-content: center;
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background-color: rgba(255,255,255,0.1);
    color: #fff;
    transition: var(--transition);
}

.social-links a:hover {
    background-color: var(--primary-color);
    transform: translateY(-3px);
}

.copyright {
    text-align: center;
    border-top: 1px solid rgba(255,255,255,0.1);
    padding-top: 2rem;
    opacity: 0.7;
}

/* Modal Styles */
.modal {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0,0,0,0.8);
    z-index: 9999;
    overflow-y: auto;
}

.modal.show {
    display: block !important;
}

.modal-content {
    background-color: #fff;
    margin: 5% auto;
    padding: 2.5rem;
    width: 90%;
    max-width: 900px;
    border-radius: 10px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
    position: relative;
    animation: modalFadeIn 0.3s ease;
}

@keyframes modalFadeIn {
    from {
        opacity: 0;
        transform: translateY(-30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.close-modal {
    position: absolute;
    top: 15px;
    right: 20px;
    font-size: 1.8rem;
    cursor: pointer;
    color: var(--gray-color);
    transition: var(--transition);
    z-index: 10;
}

.close-modal:hover {
    color: var(--danger-color);
}

.tool-details {
    padding: 1rem 0;
}

.tool-header {
    text-align: center;
    margin-bottom: 2rem;
}

.tool-header i {
    font-size: 4rem;
    color: var(--primary-color);
    margin-bottom: 1rem;
}

.tool-header h2 {
    font-size: 2rem;
    margin-bottom: 0.5rem;
}

.tool-header p {
    font-size: 1.1rem;
    color: var(--gray-color);
}

.tool-header .tool-category {
    margin-top: 1rem;
}

.tool-section {
    margin-bottom: 2rem;
}

.tool-section h3 {
    font-size: 1.4rem;
    margin-bottom: 1rem;
    padding-bottom: 0.5rem;
    border-bottom: 1px solid var(--light-gray);
}

.features-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
    gap: 1rem;
}

.feature-item {
    display: flex;
    align-items: center;
    background-color: var(--light-color);
    padding: 0.8rem 1rem;
    border-radius: 5px;
}

.feature-item i {
    color: var(--success-color);
    margin-right: 10px;
}

.tool-action {
    text-align: center;
    margin-top: 2rem;
}

/* Responsive Styles */
@media (max-width: 992px) {
    .about-content {
        grid-template-columns: 1fr;
    }
    
    .hero h1 {
        font-size: 2rem;
    }
}

@media (max-width: 768px) {
    .nav-links {
        position: fixed;
        top: 70px;
        left: -100%;
        width: 100%;
        height: calc(100vh - 70px);
        background-color: #fff;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        transition: var(--transition);
        z-index: 99;
    }
    
    .nav-links.active {
        left: 0;
    }
    
    .nav-links li {
        margin: 1rem 0;
    }
    
    .mobile-menu {
        display: block;
    }
    
    .hero-btns {
        flex-direction: column;
        align-items: center;
    }
    
    .hero-btns .btn {
        width: 100%;
        max-width: 300px;
        margin-bottom: 1rem;
    }
    
    .about-features {
        grid-template-columns: 1fr;
    }
    
    .footer-content {
        grid-template-columns: 1fr;
        text-align: center;
    }
    
    .footer h3::after {
        left: 50%;
        transform: translateX(-50%);
    }
    
    .social-links {
        justify-content: center;
    }
    
    .tool-input-area {
        padding: 0.8rem;
    }
    
    .tool-card-controls {
        flex-direction: column;
    }
    
    .view-details-btn {
        width: 100%;
        text-align: center;
    }
}

@media (max-width: 576px) {
    .category-filter {
        flex-direction: column;
        align-items: center;
    }
    
    .category-btn {
        width: 100%;
        max-width: 300px;
    }
    
    .tools-grid {
        grid-template-columns: 1fr;
    }
    
    .modal-content {
        margin: 10% 5%;
        padding: 1.5rem;
    }
}

/* Tool Interface Styles */
.tool-interface {
    margin-top: 1.5rem;
    padding: 1.5rem;
    background-color: var(--light-color);
    border-radius: 10px;
}

.tool-input {
    width: 100%;
    padding: 15px;
    border: 2px solid var(--light-gray);
    border-radius: 5px;
    margin-bottom: 1rem;
    font-family: inherit;
    font-size: 1rem;
    resize: vertical;
    min-height: 150px;
}

input.tool-input {
    min-height: auto;
}

.code-input {
    font-family: monospace;
    white-space: pre;
    min-height: 200px;
}

.tool-controls {
    display: flex;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.tool-output {
    background-color: white;
    border: 2px solid var(--light-gray);
    border-radius: 5px;
    padding: 1rem;
    min-height: 100px;
}

.tool-output h4 {
    margin-bottom: 0.5rem;
    color: var(--gray-color);
}

.code-output {
    font-family: monospace;
    white-space: pre-wrap;
    background-color: #f5f5f5;
    padding: 1rem;
    border-radius: 5px;
    overflow-x: auto;
}

.output-content {
    color: var(--gray-color);
}

/* Image Upload Styles */
.image-upload-area {
    border: 2px dashed var(--light-gray);
    border-radius: 5px;
    padding: 2rem;
    text-align: center;
    background-color: white;
    margin-bottom: 1.5rem;
    cursor: pointer;
}

.image-upload-area i {
    font-size: 3rem;
    color: var(--gray-color);
    margin-bottom: 1rem;
}

.image-upload-area p {
    margin-bottom: 1rem;
    color: var(--gray-color);
}

.image-preview {
    display: none;
    margin-bottom: 1.5rem;
    text-align: center;
}

.image-preview img {
    max-width: 100%;
    max-height: 300px;
    border-radius: 5px;
    box-shadow: var(--box-shadow);
}

.tool-application {
    margin-top: 2rem;
    border-top: 1px solid var(--light-gray);
    padding-top: 1.5rem;
}

/* Tool Card Input Styles */
.tool-input-area {
    display: none !important;
}

.card-tool-input {
    display: none !important;
}

.tool-card-controls {
    display: none !important;
}

.tool-output-area {
    display: none !important;
}

.card-output-content {
    display: none !important;
}

.card-image-upload {
    display: none !important;
}

.file-name {
    display: none !important;
}

/* Language Switcher Styles */
.language-switcher {
    margin-left: 20px;
    display: flex;
    align-items: center;
}

#language-select {
    padding: 5px 10px;
    border-radius: 5px;
    border: 1px solid var(--light-gray);
    background-color: #fff;
    font-family: inherit;
    cursor: pointer;
    transition: var(--transition);
}

#language-select:hover {
    border-color: var(--primary-color);
}

#language-select:focus {
    outline: none;
    border-color: var(--primary-color);
    box-shadow: 0 0 0 2px rgba(74, 108, 247, 0.2);
}

@media (max-width: 768px) {
    .language-switcher {
        position: absolute;
        top: 15px;
        right: 70px;
    }
} 