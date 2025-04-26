// Global Variables
let tools = [];
let filteredTools = [];
let currentCategory = 'all';
let searchQuery = '';
let suggestions = [];
let currentLanguage = 'en'; // Default language is English

// Language settings
const languages = {
    en: {
        search: "Search tools...",
        viewDetails: "View Details",
        noResults: "No tools found. Try another search.",
        loading: "Loading...",
        viewTools: "View Tools",
        learnMore: "Learn More",
        categories: "Categories",
        allTools: "All Tools",
        ourTools: "Our Tools",
        features: "Features",
        howToUse: "How to Use",
        useTool: "Use Tool",
        enterText: "Enter your text here...",
        generate: "Generate",
        process: "Process",
        execute: "Execute",
        clear: "Clear",
        output: "Output:",
        enterInput: "Enter your input here..."
    },
    bn: {
        search: "টুল খুঁজুন...",
        viewDetails: "বিস্তারিত দেখুন",
        noResults: "কোন টুল পাওয়া যায়নি। অন্য কিছু অনুসন্ধান করুন।",
        loading: "লোড হচ্ছে...",
        viewTools: "টুল দেখুন",
        learnMore: "আরও জানুন",
        categories: "ক্যাটাগরি",
        allTools: "সব টুলস",
        ourTools: "আমাদের টুলস",
        features: "বৈশিষ্ট্যসমূহ",
        howToUse: "ব্যবহার পদ্ধতি",
        useTool: "টুল ব্যবহার করুন",
        enterText: "আপনার টেক্সট এখানে লিখুন...",
        generate: "তৈরি করুন",
        process: "প্রসেস করুন",
        execute: "এক্সিকিউট করুন",
        clear: "মুছুন",
        output: "আউটপুট:",
        enterInput: "আপনার ইনপুট এখানে লিখুন..."
    },
    hi: {
        search: "टूल खोजें...",
        viewDetails: "विवरण देखें",
        noResults: "कोई टूल नहीं मिला। कुछ और खोजें।",
        loading: "लोड हो रहा है...",
        viewTools: "टूल देखें",
        learnMore: "अधिक जानें",
        categories: "श्रेणियाँ",
        allTools: "सभी टूल",
        ourTools: "हमारे टूल",
        features: "विशेषताएं",
        howToUse: "उपयोग कैसे करें",
        useTool: "टूल का उपयोग करें",
        enterText: "अपना टेक्स्ट यहां दर्ज करें...",
        generate: "जनरेट करें",
        process: "प्रोसेस करें",
        execute: "एक्ज़ीक्यूट करें",
        clear: "क्लियर करें",
        output: "आउटपुट:",
        enterInput: "अपना इनपुट यहां दर्ज करें..."
    }
};

// Get translated text
function getTranslation(key) {
    return languages[currentLanguage][key] || languages['en'][key]; // Fallback to English
}

// Add language switcher to the header
function addLanguageSwitcher() {
    const header = document.querySelector('.header .container');
    if (!header) return;
    
    const languageSwitcher = document.createElement('div');
    languageSwitcher.className = 'language-switcher';
    languageSwitcher.innerHTML = `
        <select id="language-select">
            <option value="en">English</option>
            <option value="bn">বাংলা</option>
            <option value="hi">हिन्दी</option>
        </select>
    `;
    
    header.appendChild(languageSwitcher);
    
    // Add event listener
    const languageSelect = document.getElementById('language-select');
    languageSelect.addEventListener('change', function() {
        currentLanguage = this.value;
        updateUILanguage();
    });
}

// Update UI language
function updateUILanguage() {
    // Update search placeholder
    searchInput.placeholder = getTranslation('search');
    
    // Update category titles
    document.querySelector('.categories .section-title').textContent = getTranslation('categories');
    document.querySelector('.tools .section-title').textContent = getTranslation('ourTools');
    
    // Update category buttons
    const allToolsBtn = document.querySelector('.category-btn[data-category="all"]');
    if (allToolsBtn) allToolsBtn.textContent = getTranslation('allTools');
    
    // Update hero buttons
    const viewToolsBtn = document.querySelector('.hero-btns .btn-primary');
    const learnMoreBtn = document.querySelector('.hero-btns .btn-secondary');
    if (viewToolsBtn) viewToolsBtn.textContent = getTranslation('viewTools');
    if (learnMoreBtn) learnMoreBtn.textContent = getTranslation('learnMore');
    
    // Re-render tools with new language
    renderTools();
}

// Fallback tools in case nothing loads
const fallbackTools = [
    {
        "id": 1,
        "name": "AI Content Writer",
        "name_bn": "এআই কনটেন্ট রাইটার",
        "name_hi": "एआई कंटेंट राइटर",
        "category": "AI Tools",
        "description": "Create various types of content based on your needs with the help of AI.",
        "description_bn": "এআই এর সাহায্যে আপনার প্রয়োজন অনুযায়ী বিভিন্ন ধরনের কনটেন্ট তৈরি করুন।",
        "description_hi": "एआई की मदद से अपनी ज़रूरत के अनुसार विभिन्न प्रकार की सामग्री बनाएं।",
        "icon": "fa-feather",
        "usage": "Enter your topic and instructions, AI will automatically generate content.",
        "usage_bn": "আপনার টপিক এবং নির্দেশনা লিখুন, এআই স্বয়ংক্রিয়ভাবে কনটেন্ট তৈরি করবে।",
        "usage_hi": "अपना टॉपिक और निर्देश दर्ज करें, एआई स्वचालित रूप से सामग्री जनरेट करेगा।",
        "features": ["Blog Post Generation", "Paraphrasing", "Keyword Optimization", "Tone Adjustment"]
    },
    {
        "id": 2,
        "name": "AI Image Generator",
        "name_bn": "এআই ছবি জেনারেটর",
        "name_hi": "एआई इमेज जनरेटर",
        "category": "AI Tools",
        "description": "Create attractive images from text prompts in an instant.",
        "description_bn": "টেক্সট প্রম্পট থেকে মুহূর্তেই আকর্ষণীয় ছবি তৈরি করুন।",
        "description_hi": "टेक्स्ट प्रॉम्प्ट से तुरंत आकर्षक छवियां बनाएं।",
        "icon": "fa-image",
        "usage": "Write a description of the image you want, AI will quickly create it.",
        "usage_bn": "আপনি যে ছবি চান তার বর্ণনা লিখুন, এআই দ্রুত এটি তৈরি করবে।",
        "usage_hi": "आप जैसी इमेज चाहते हैं उसका विवरण लिखें, एआई इसे तुरंत बना देगा।",
        "features": ["High Resolution", "Various Styles", "Customization", "Commercial Use"]
    }
];

// Try to load tools from globalTools if available (this will be set from HTML)
if (typeof globalTools !== 'undefined' && Array.isArray(globalTools) && globalTools.length > 0) {
    console.log('Loading tools from global variable:', globalTools.length);
    tools = globalTools;
    
    // Add multilingual properties if they don't exist
    tools.forEach(tool => {
        if (!tool.name_bn) tool.name_bn = tool.name;
        if (!tool.name_hi) tool.name_hi = tool.name;
        if (!tool.description_bn) tool.description_bn = tool.description;
        if (!tool.description_hi) tool.description_hi = tool.description;
        if (!tool.usage_bn) tool.usage_bn = tool.usage;
        if (!tool.usage_hi) tool.usage_hi = tool.usage;
    });
}

// DOM Elements
const toolsContainer = document.getElementById('tools-container');
const searchInput = document.getElementById('search-input');
const searchBtn = document.getElementById('search-btn');
const categoryBtns = document.querySelectorAll('.category-btn');
const toolModal = document.getElementById('tool-modal');
const toolDetailsContainer = document.getElementById('tool-details-container');
const closeModal = document.querySelector('.close-modal');
const mobileMenuBtn = document.querySelector('.mobile-menu');
const navLinks = document.querySelector('.nav-links');
const categoryLinks = document.querySelectorAll('.footer-categories a');

// Add suggestion container after search input
const searchContainer = document.querySelector('.search-container');
const suggestionBox = document.createElement('div');
suggestionBox.className = 'suggestion-box';
searchContainer.appendChild(suggestionBox);

// Fetch Tools Data
async function fetchTools() {
    try {
        // Display loading state
        toolsContainer.innerHTML = `
            <div class="loading">
                <i class="fas fa-spinner fa-spin"></i>
                <p>${getTranslation('loading')}</p>
            </div>
        `;
        
        // Check if we already have tools
        if (tools.length > 0) {
            console.log('Tools already loaded from global variable:', tools.length);
            // Just use the tools we already have
        } else {
            // Fallback data for the first 20 tools to ensure something displays
            console.log('Using fallback data');
            tools = fallbackTools;
        }
        
        // Filter tools based on current filters and render
        filteredTools = [...tools];
        renderTools();
        
        console.log(`Loaded ${tools.length} tools successfully`);
        
    } catch (error) {
        console.error('Error loading tools:', error);
        toolsContainer.innerHTML = `
            <div class="error">
                <i class="fas fa-exclamation-triangle"></i>
                <p>${getTranslation('noResults')}</p>
                <button class="btn btn-primary" onclick="fetchTools()">${getTranslation('tryAgain')}</button>
            </div>
        `;
    }
}

// Render Tools to UI
function renderTools() {
    // Clear loading indicator
    toolsContainer.innerHTML = '';
    
    if (filteredTools.length === 0) {
        toolsContainer.innerHTML = `
            <div class="no-results">
                <i class="fas fa-search"></i>
                <p>${getTranslation('noResults')}</p>
            </div>
        `;
        return;
    }
    
    filteredTools.forEach(tool => {
        // Get name and description in the current language
        const toolName = tool[`name_${currentLanguage}`] || tool.name;
        const toolDescription = tool[`description_${currentLanguage}`] || tool.description;
        
        const toolCard = document.createElement('div');
        toolCard.className = 'tool-card';
        toolCard.setAttribute('data-id', tool.id);
        
        toolCard.innerHTML = `
            <div class="tool-icon">
                <i class="fas ${tool.icon}"></i>
            </div>
            <div class="tool-content">
                <h3>${toolName}</h3>
                <p class="tool-description">${toolDescription}</p>
                <button class="btn btn-primary view-details-btn" data-id="${tool.id}">${getTranslation('viewDetails')}</button>
            </div>
        `;
        
        toolsContainer.appendChild(toolCard);
    });
    
    // Add event listeners to view details buttons
    document.querySelectorAll('.view-details-btn').forEach(btn => {
        btn.addEventListener('click', function(e) {
            e.stopPropagation(); // Prevent card click
            const toolId = parseInt(this.getAttribute('data-id'));
            openToolDetails(toolId);
        });
    });
}

// Attach functionality to card tools
function attachCardFunctionality(tool, cardElement) {
    // Function is emptied as all card input functionality is removed
    return;
}

// Filter tools by category
function filterToolsByCategory(category) {
    currentCategory = category;
    applyFilters();
}

// Filter tools by search query
function filterToolsBySearch(query) {
    searchQuery = query.toLowerCase();
    applyFilters();
}

// Create suggestions based on user input
function createSuggestions(input) {
    // Clear previous suggestions
    suggestionBox.innerHTML = '';
    suggestions = [];
    
    if (!input.trim()) {
        suggestionBox.style.display = 'none';
        return;
    }
    
    // Find matching tools - search in all languages
    const matches = tools.filter(tool => 
        tool.name.toLowerCase().includes(input.toLowerCase()) || 
        (tool.name_bn && tool.name_bn.toLowerCase().includes(input.toLowerCase())) || 
        (tool.name_hi && tool.name_hi.toLowerCase().includes(input.toLowerCase())) || 
        tool.category.toLowerCase().includes(input.toLowerCase()) ||
        tool.description.toLowerCase().includes(input.toLowerCase()) ||
        (tool.description_bn && tool.description_bn.toLowerCase().includes(input.toLowerCase())) || 
        (tool.description_hi && tool.description_hi.toLowerCase().includes(input.toLowerCase()))
    );
    
    // Only show top 5 suggestions
    suggestions = matches.slice(0, 5);
    
    if (suggestions.length > 0) {
        suggestionBox.style.display = 'block';
        
        // Set absolute position
        suggestionBox.style.position = 'absolute';
        suggestionBox.style.top = '100%';
        suggestionBox.style.left = '0';
        suggestionBox.style.width = '100%';
        suggestionBox.style.zIndex = '999';
        
        suggestions.forEach(tool => {
            // Get name in the current language
            const toolName = tool[`name_${currentLanguage}`] || tool.name;
            
            const suggestionItem = document.createElement('div');
            suggestionItem.className = 'suggestion-item';
            suggestionItem.innerHTML = `
                <i class="fas ${tool.icon}"></i>
                <div class="suggestion-content">
                    <div class="suggestion-name">${toolName}</div>
                    <div class="suggestion-category">${tool.category}</div>
                </div>
            `;
            
            // Add click event to suggestion
            suggestionItem.addEventListener('click', () => {
                searchInput.value = toolName;
                filterToolsBySearch(toolName);
                suggestionBox.style.display = 'none';
            });
            
            suggestionBox.appendChild(suggestionItem);
        });
    } else {
        suggestionBox.style.display = 'none';
    }
}

// Apply both category and search filters
function applyFilters() {
    filteredTools = tools.filter(tool => {
        // Check if tool matches the selected category
        const categoryMatch = currentCategory === 'all' || tool.category === currentCategory;
        
        // Check if tool matches the search query
        const searchMatch = tool.name.toLowerCase().includes(searchQuery) || 
                           tool.description.toLowerCase().includes(searchQuery) ||
                           tool.category.toLowerCase().includes(searchQuery);
        
        return categoryMatch && searchMatch;
    });
    
    renderTools();
}

// Open Tool Details Modal
function openToolDetails(toolId) {
    console.log('Opening tool ID:', toolId);
    
    // Find the tool by ID
    const tool = tools.find(t => t.id === toolId);
    
    // Check if tool exists
    if (!tool) {
        console.error('Tool not found:', toolId);
        return;
    }
    
    console.log('Tool found:', tool.name);
    
    // Get tool properties in the current language
    const toolName = tool[`name_${currentLanguage}`] || tool.name;
    const toolDescription = tool[`description_${currentLanguage}`] || tool.description;
    const toolUsage = tool[`usage_${currentLanguage}`] || tool.usage;
    
    // Create tool interface based on tool type
    let toolInterface = '';
    
    switch(tool.category) {
        case 'AI Tools':
            toolInterface = `
                <div class="tool-interface">
                    <textarea class="tool-input" placeholder="${getTranslation('enterText')}"></textarea>
                    <div class="tool-controls">
                        <button class="btn btn-primary generate-btn">${getTranslation('generate')}</button>
                        <button class="btn btn-secondary clear-btn">${getTranslation('clear')}</button>
                    </div>
                    <div class="tool-output">
                        <h4>${getTranslation('output')}</h4>
                        <div class="output-content"></div>
                    </div>
                </div>
            `;
            break;
        
        case 'Image Tools':
            toolInterface = `
                <div class="tool-interface">
                    <div class="image-upload-area">
                        <i class="fas fa-cloud-upload-alt"></i>
                        <p>Drag & drop your image here or</p>
                        <label for="image-input" class="btn btn-primary">Browse Files</label>
                        <input type="file" id="image-input" hidden accept="image/*">
                    </div>
                    <div class="image-preview">
                        <img id="preview-img" src="#" alt="Preview">
                    </div>
                    <div class="tool-controls">
                        <button class="btn btn-primary process-btn">${getTranslation('process')}</button>
                        <button class="btn btn-secondary reset-btn">${getTranslation('clear')}</button>
                    </div>
                </div>
            `;
            break;
        
        case 'Developer Tools':
            toolInterface = `
                <div class="tool-interface">
                    <textarea class="tool-input code-input" placeholder="${getTranslation('enterText')}"></textarea>
                    <div class="tool-controls">
                        <button class="btn btn-primary execute-btn">${getTranslation('execute')}</button>
                        <button class="btn btn-secondary clear-btn">${getTranslation('clear')}</button>
                    </div>
                    <div class="tool-output">
                        <h4>${getTranslation('output')}</h4>
                        <pre class="output-content code-output"></pre>
                    </div>
                </div>
            `;
            break;
        
        default:
            toolInterface = `
                <div class="tool-interface">
                    <input type="text" class="tool-input" placeholder="${getTranslation('enterInput')}">
                    <div class="tool-controls">
                        <button class="btn btn-primary process-btn">${getTranslation('process')}</button>
                        <button class="btn btn-secondary clear-btn">${getTranslation('clear')}</button>
                    </div>
                    <div class="tool-output">
                        <h4>${getTranslation('output')}</h4>
                        <div class="output-content"></div>
                    </div>
                </div>
            `;
    }
    
    // Populate modal content
    toolDetailsContainer.innerHTML = `
        <div class="tool-header">
            <i class="fas ${tool.icon}"></i>
            <h2>${toolName}</h2>
            <p>${toolDescription}</p>
            <span class="tool-category">${tool.category}</span>
        </div>
        
        <div class="tool-section">
            <h3>${getTranslation('howToUse')}</h3>
            <p>${toolUsage}</p>
        </div>
        
        <div class="tool-section">
            <h3>${getTranslation('features')}</h3>
            <div class="features-list">
                ${tool.features.map(feature => `
                    <div class="feature-item">
                        <i class="fas fa-check-circle"></i>
                        <span>${feature}</span>
                    </div>
                `).join('')}
            </div>
        </div>
        
        <div class="tool-action">
            <button class="btn btn-primary use-tool-btn">${getTranslation('useTool')}</button>
        </div>
        
        <div class="tool-application" style="display: none;">
            <h3>${getTranslation('useTool')} ${toolName}</h3>
            ${toolInterface}
        </div>
    `;
    
    // Display the modal - important to be visible
    toolModal.classList.add('show');
    toolModal.style.display = 'block';
    document.body.style.overflow = 'hidden';
    
    // Add event listener for the Use Tool button
    const useToolBtn = toolDetailsContainer.querySelector('.use-tool-btn');
    const toolApplication = toolDetailsContainer.querySelector('.tool-application');
    
    useToolBtn.addEventListener('click', function() {
        this.style.display = 'none';
        toolApplication.style.display = 'block';
        
        // Add event listeners for tool functionality
        attachToolFunctionality(tool, toolApplication);
    });
    
    console.log('Modal should be visible now');
}

// Attach tool functionality based on tool type
function attachToolFunctionality(tool, toolApplication) {
    // Find elements
    const toolInput = toolApplication.querySelector('.tool-input');
    const outputContent = toolApplication.querySelector('.output-content');
    const processBtn = toolApplication.querySelector('.process-btn') || 
                      toolApplication.querySelector('.generate-btn') || 
                      toolApplication.querySelector('.execute-btn');
    const clearBtn = toolApplication.querySelector('.clear-btn');
    
    if (processBtn) {
        processBtn.addEventListener('click', function() {
            if (!toolInput || !toolInput.value.trim()) {
                outputContent.textContent = currentLanguage === 'bn' ? 'অনুগ্রহ করে প্রথমে কিছু ইনপুট দিন।' : 'Please enter some input first.';
                return;
            }
            
            const input = toolInput.value.trim();
            const isBengali = /[\u0980-\u09FF]/.test(input); // Check if input contains Bengali characters
            
            // Process the input based on tool category and language
            switch(tool.category) {
                case 'AI Tools':
                    if (tool.name === 'AI Content Writer' || tool.name_bn === 'এআই কনটেন্ট রাইটার') {
                        let response = '';
                        
                        if (isBengali || currentLanguage === 'bn') {
                            // Bengali responses
                            if (input.includes('হ্যালো') || input.includes('হাই') || input.includes('হেলো')) {
                                response = "হ্যালো! আজকে আমি আপনাকে কিভাবে সাহায্য করতে পারি? আমি ব্লগ পোস্ট, আর্টিকেল, প্রোডাক্ট বর্ণনা এবং আরও অনেক কিছু তৈরি করতে সাহায্য করতে পারি।";
                            } else if (input.includes('ব্লগ')) {
                                response = "# ২০২৩ সালে ডিজিটাল মার্কেটিং কীভাবে মাস্টার করবেন\n\nডিজিটাল মার্কেটিং দ্রুত বিকশিত হচ্ছে। নতুন প্ল্যাটফর্ম, অ্যালগরিদম এবং ভোক্তাদের আচরণ ক্রমাগত পরিবর্তন হচ্ছে, আপডেট থাকা অত্যন্ত গুরুত্বপূর্ণ।\n\nএই বছরের জন্য ৫টি মূল কৌশল এখানে দেওয়া হল:\n\n১. ব্যক্তিগতকৃত কন্টেন্টে ফোকাস করুন\n২. কাস্টমার ইনসাইটের জন্য AI ব্যবহার করুন\n৩. সমস্ত প্ল্যাটফর্মে ভিডিও মার্কেটিং গ্রহণ করুন\n৪. মোবাইল-ফার্স্ট অভিজ্ঞতাকে অগ্রাধিকার দিন\n৫. সত্যিকারের কমিউনিটি এনগেজমেন্ট তৈরি করুন\n\nএই কৌশলগুলি বাস্তবায়ন করলে আপনার ব্যবসা ডিজিটাল পরিবেশে উন্নতি করবে।";
                            } else if (input.includes('পণ্য') || input.includes('প্রোডাক্ট')) {
                                response = "**আল্ট্রা কমফোর্ট এর্গোনমিক চেয়ার**\n\nআপনার কর্মক্ষেত্রকে রূপান্তরিত করুন আমাদের প্রিমিয়াম এর্গোনমিক অফিস চেয়ার দিয়ে, যা আপনার আরাম এবং স্বাস্থ্যকে মাথায় রেখে ডিজাইন করা হয়েছে। বৈশিষ্ট্যগুলি অন্তর্ভুক্ত:\n\n• শ্বাসযোগ্য মেশ ব্যাক সাপোর্ট\n• অ্যাডজাস্টেবল লাম্বার কুশনিং\n• পারফেক্ট পজিশনিং এর জন্য ৪ডি আর্মরেস্ট\n• মেমোরি ফোম সিট কুশন\n• ৫ বছরের ওয়ারেন্টি\n\nদীর্ঘ কাজের সেশনের জন্য উপযুক্ত, এই চেয়ার ক্লান্তি কমায় এবং সঠিক পোস্চার উৎসাহিত করে। আপনার উৎপাদনশীলতা বাড়বে এবং পিঠের ব্যথা অতীতের বিষয় হয়ে যাবে।";
                            } else {
                                response = `আপনার "${input.substring(0, 15)}..." সম্পর্কে ইনপুট অনুযায়ী, আমি একটি বিস্তৃত আর্টিকেল তৈরি করেছি যা আপনার উল্লেখ করা সমস্ত মূল দিকগুলি কভার করে। কন্টেন্টটি এনগেজমেন্টের জন্য অপ্টিমাইজ করা হয়েছে এবং এসইও পারফরম্যান্সের জন্য প্রাসঙ্গিক কীওয়ার্ড অন্তর্ভুক্ত করা হয়েছে।`;
                            }
                        } else {
                            // Original English responses
                            if (input.toLowerCase().includes('hello') || input.toLowerCase().includes('hi')) {
                                response = "Hello there! How can I assist you with content creation today? I can help with blog posts, articles, product descriptions and more.";
                            } else if (input.toLowerCase().includes('blog')) {
                                response = "# How to Master Digital Marketing in 2023\n\nDigital marketing continues to evolve at a rapid pace. With new platforms, algorithms, and consumer behaviors emerging constantly, staying ahead of the curve is essential.\n\nHere are 5 key strategies for successful digital marketing this year:\n\n1. Focus on personalized content\n2. Leverage AI for customer insights\n3. Embrace video marketing across platforms\n4. Prioritize mobile-first experiences\n5. Build authentic community engagement\n\nImplementing these strategies will help your business thrive in the digital landscape.";
                            } else if (input.toLowerCase().includes('product')) {
                                response = "**Ultra Comfort Ergonomic Chair**\n\nTransform your workspace with our premium ergonomic office chair, designed with your comfort and health in mind. Features include:\n\n• Breathable mesh back support\n• Adjustable lumbar cushioning\n• 4D armrests for perfect positioning\n• Memory foam seat cushion\n• 5-year warranty\n\nPerfect for long work sessions, this chair reduces fatigue and promotes proper posture. Your productivity will soar while back pain becomes a thing of the past.";
                            } else {
                                response = "Based on your input about \"" + input.substring(0, 15) + "...\", I've generated a comprehensive article that covers all the key aspects you mentioned. The content is optimized for engagement and includes relevant keywords for better SEO performance. The tone is professional yet conversational, making it accessible to your target audience.";
                            }
                        }
                        outputContent.innerHTML = response;
                    } else if (tool.name === 'AI Image Generator' || tool.name_bn === 'এআই ছবি জেনারেটর') {
                        let response = "";
                        if (isBengali || currentLanguage === 'bn') {
                            response = "<div style='background-color: #f5f5f5; padding: 10px; border-radius: 5px;'><p>✅ আপনার প্রম্পট অনুযায়ী ছবি সফলভাবে তৈরি করা হয়েছে!</p><div style='height: 150px; background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); margin: 10px 0; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white;'><i class='fas fa-image' style='font-size: 2rem; margin-right: 10px;'></i> জেনারেটেড ইমেজ প্রিভিউ</div><p><small>নোট: এটি একটি সিমুলেশন। একটি বাস্তব অ্যাপে, এখানে একটি বাস্তব AI-জেনারেটেড ইমেজ দেখা যাবে।</small></p></div>";
                        } else {
                            response = "<div style='background-color: #f5f5f5; padding: 10px; border-radius: 5px;'><p>✅ Image generated successfully based on your prompt!</p><div style='height: 150px; background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%); margin: 10px 0; border-radius: 8px; display: flex; align-items: center; justify-content: center; color: white;'><i class='fas fa-image' style='font-size: 2rem; margin-right: 10px;'></i> Generated Image Preview</div><p><small>Note: This is a simulation. In a real app, an actual AI-generated image would appear here.</small></p></div>";
                        }
                        outputContent.innerHTML = response;
                    } else {
                        let response = "";
                        if (isBengali || currentLanguage === 'bn') {
                            response = "AI আপনার ইনপুট বিশ্লেষণ করেছে এবং আপনার নির্দিষ্ট প্রয়োজনের জন্য তৈরি ফলাফল প্রদান করেছে। অ্যালগরিদম সর্বোত্তম আউটপুট মানের জন্য একাধিক ভেরিয়েবল প্রসেস করেছে।";
                        } else {
                            response = "AI has analyzed your input and generated results tailored to your specific requirements. The algorithm has processed multiple variables to ensure optimal output quality and relevance.";
                        }
                        outputContent.innerHTML = response;
                    }
                    break;
                    
                case 'Document Tools':
                    if (tool.name === 'PDF Converter' || tool.name_bn === 'পিডিএফ কনভার্টার') {
                        let response = "";
                        if (isBengali || currentLanguage === 'bn') {
                            response = `<div style="text-align:center;">
                                <i class="fas fa-file-pdf" style="font-size: 2rem; color: #dc3545; margin-bottom: 10px;"></i>
                                <p>আপনার ডকুমেন্ট PDF ফর্ম্যাটে কনভার্ট করা হয়েছে!</p>
                            </div>`;
                        } else {
                            response = `<div style="text-align:center;">
                                <i class="fas fa-file-pdf" style="font-size: 2rem; color: #dc3545; margin-bottom: 10px;"></i>
                                <p>Your document has been converted to PDF format!</p>
                            </div>`;
                        }
                        outputContent.innerHTML = response;
                    } else if (tool.name === 'Text Translator' || tool.name_bn === 'টেক্সট অনুবাদক') {
                        let translated = '';
                        
                        if (isBengali || currentLanguage === 'bn') {
                            if (input.includes('হ্যালো') || input.includes('হাই')) {
                                translated = "Hello! How can I help you?";
                            } else if (input.includes('ধন্যবাদ')) {
                                translated = "Thank you! I'm glad to be able to help you.";
                            } else if (input.length < 15) {
                                translated = "English translation: " + input;
                            } else {
                                translated = "Your text has been translated to English. For full translation of longer texts, please upgrade to our premium version.";
                            }
                            
                            outputContent.innerHTML = `<div style="border-left: 4px solid #4a6cf7; padding-left: 10px;">
                                <p style="font-weight: bold;">অনুবাদিত টেক্সট (ইংরেজি):</p>
                                <p>${translated}</p>
                            </div>`;
                        } else {
                            if (input.toLowerCase().includes('hello') || input.toLowerCase().includes('hi')) {
                                translated = "হ্যালো! আপনাকে কিভাবে সাহায্য করতে পারি?";
                            } else if (input.toLowerCase().includes('thank')) {
                                translated = "ধন্যবাদ! আপনাকে সাহায্য করতে পেরে আমি খুশি।";
                            } else if (input.length < 15) {
                                translated = "বাংলায় অনুবাদিত: " + input;
                            } else {
                                translated = "আপনার টেক্সট বাংলায় অনুবাদ করা হয়েছে। দীর্ঘ টেক্সটের সম্পূর্ণ অনুবাদের জন্য, আমাদের প্রিমিয়াম সংস্করণে আপগ্রেড করুন।";
                            }
                            
                            outputContent.innerHTML = `<div style="border-left: 4px solid #4a6cf7; padding-left: 10px;">
                                <p style="font-weight: bold;">Translated Text (Bengali):</p>
                                <p>${translated}</p>
                            </div>`;
                        }
                    } else {
                        let response = "";
                        if (isBengali || currentLanguage === 'bn') {
                            response = "ডকুমেন্ট সফলভাবে প্রসেস করা হয়েছে! আপনার ডকুমেন্ট নির্বাচিত প্যারামিটার অনুযায়ী বিশ্লেষণ এবং প্রসেস করা হয়েছে।";
                        } else {
                            response = "Document processed successfully! Your document has been analyzed and processed according to the selected parameters.";
                        }
                        outputContent.textContent = response;
                    }
                    break;
                    
                default:
                    // Generic response for any other tool
                    if (isBengali || currentLanguage === 'bn') {
                        if (input.includes('হ্যালো') || input.includes('হাই')) {
                            outputContent.textContent = "হ্যালো! আমি আপনার অনুরোধে সাহায্য করতে এখানে আছি। আমাকে জানান যদি আপনার কোন নির্দিষ্ট সাহায্য প্রয়োজন হয়।";
                        } else if (input.includes('ধন্যবাদ')) {
                            outputContent.textContent = "আপনাকে স্বাগতম! আমি সাহায্য করতে পেরে খুশি। আপনি যখনই প্রয়োজন হবে আমাদের টুলগুলি ব্যবহার করতে পারেন।";
                        } else if (input.length < 5) {
                            outputContent.textContent = "আপনার অনুরোধটি প্রসেস করার জন্য খুব ছোট। আরও ভালো ফলাফলের জন্য অনুগ্রহ করে আরও তথ্য প্রদান করুন।";
                        } else {
                            outputContent.textContent = "আপনার অনুরোধ সফলভাবে প্রসেস করা হয়েছে। সিস্টেম আপনার ইনপুট বিশ্লেষণ করেছে এবং টুলের কার্যকারিতা অনুযায়ী উপযুক্ত ফলাফল তৈরি করেছে।";
                        }
                    } else {
                        if (input.toLowerCase().includes('hello') || input.toLowerCase().includes('hi')) {
                            outputContent.textContent = "Hello! I'm here to help you with your request. Please let me know if you need any specific assistance.";
                        } else if (input.toLowerCase().includes('thank')) {
                            outputContent.textContent = "You're welcome! I'm glad I could help. Feel free to use our tools anytime you need them.";
                        } else if (input.length < 5) {
                            outputContent.textContent = "Your request was too short to process. Please provide more details for better results.";
                        } else {
                            outputContent.textContent = "Your request has been processed successfully. The system has analyzed your input and generated appropriate results based on the tool's functionality.";
                        }
                    }
            }
        });
    }
    
    if (clearBtn) {
        clearBtn.addEventListener('click', function() {
            if (toolInput) toolInput.value = '';
            if (outputContent) outputContent.textContent = '';
        });
    }
    
    // Special handling for image tools
    if (tool.category === 'Image Tools') {
        const imageInput = toolApplication.querySelector('#image-input');
        const previewImg = toolApplication.querySelector('#preview-img');
        const uploadArea = toolApplication.querySelector('.image-upload-area');
        const imagePreview = toolApplication.querySelector('.image-preview');
        
        if (imageInput) {
            imageInput.addEventListener('change', function() {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    
                    reader.onload = function(e) {
                        previewImg.src = e.target.result;
                        uploadArea.style.display = 'none';
                        imagePreview.style.display = 'block';
                    };
                    
                    reader.readAsDataURL(this.files[0]);
                }
            });
        }
        
        const resetBtn = toolApplication.querySelector('.reset-btn');
        if (resetBtn) {
            resetBtn.addEventListener('click', function() {
                if (uploadArea) uploadArea.style.display = 'block';
                if (imagePreview) imagePreview.style.display = 'none';
                if (imageInput) imageInput.value = '';
            });
        }
    }
}

// Close Tool Details Modal
function closeToolDetails() {
    console.log('Closing modal');
    toolModal.classList.remove('show');
    toolModal.style.display = 'none';
    document.body.style.overflow = 'auto';
}

// Toggle Mobile Menu
function toggleMobileMenu() {
    navLinks.classList.toggle('active');
}

// Event Listeners
window.addEventListener('DOMContentLoaded', () => {
    // Add language switcher
    addLanguageSwitcher();
    
    // Update placeholder text for search
    searchInput.placeholder = getTranslation('search');
    
    fetchTools();
    
    // Search functionality
    searchBtn.addEventListener('click', () => {
        filterToolsBySearch(searchInput.value);
        suggestionBox.style.display = 'none';
    });
    
    searchInput.addEventListener('keyup', (e) => {
        if (e.key === 'Enter') {
            filterToolsBySearch(searchInput.value);
            suggestionBox.style.display = 'none';
        } else {
            createSuggestions(searchInput.value);
        }
    });
    
    // Category buttons
    categoryBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            // Remove active class from all buttons
            categoryBtns.forEach(b => b.classList.remove('active'));
            // Add active class to clicked button
            this.classList.add('active');
            // Filter tools by selected category
            filterToolsByCategory(this.getAttribute('data-category'));
        });
    });
    
    // Category links in footer
    categoryLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const category = this.getAttribute('data-category');
            
            // Update active button in category filter
            categoryBtns.forEach(btn => {
                if (btn.getAttribute('data-category') === category) {
                    btn.classList.add('active');
                } else {
                    btn.classList.remove('active');
                }
            });
            
            filterToolsByCategory(category);
            
            // Scroll to tools section
            document.getElementById('tools').scrollIntoView({ behavior: 'smooth' });
        });
    });
    
    // Close modal
    closeModal.addEventListener('click', closeToolDetails);
    
    // Close modal when clicking outside
    window.addEventListener('click', (e) => {
        if (e.target === toolModal) {
            closeToolDetails();
        }
    });
    
    // Close modal with Escape key
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape' && toolModal.style.display === 'block') {
            closeToolDetails();
        }
    });
    
    // Mobile menu toggle
    mobileMenuBtn.addEventListener('click', toggleMobileMenu);
    
    // Close mobile menu when clicking a link
    document.querySelectorAll('.nav-links a').forEach(link => {
        link.addEventListener('click', () => {
            navLinks.classList.remove('active');
        });
    });
    
    // Close suggestions when clicking outside
    document.addEventListener('click', (e) => {
        if (!searchContainer.contains(e.target)) {
            suggestionBox.style.display = 'none';
        }
    });
}); 