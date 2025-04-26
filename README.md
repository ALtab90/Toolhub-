# Tool Hub - Online Tools Website

## About the Project

Tool Hub is a modern web application that brings together 20 popular online tools, such as:

- AI-based tools (Content Writer, Image Generator)
- Image editing tools (Background Remover, Resizer)
- Video tools (Editor, Converter)
- Developer tools (Code Editor, JSON Formatter)
- Utility tools (Currency Converter, Time Zone Converter)
- And much more!

## Features

- ✅ Modern and responsive design
- ✅ Category-based filtering
- ✅ Search functionality
- ✅ Detailed tool modal view
- ✅ Mobile-friendly design
- ✅ Easy to add new tools

## Technologies

- HTML5
- CSS3 (Flexbox, Grid, Custom Properties)
- Vanilla JavaScript (ES6+)
- Font Awesome Icons
- JSON-based data management

## Setup Instructions

### Local Development

1. Clone the project:
```bash
git clone https://github.com/yourusername/tool-hub.git
cd tool-hub
```

2. Start a local server (e.g., Live Server VS Code extension or any HTTP server):

Using Live Server extension:
- Open the project in Visual Studio Code
- Click on the index.html file
- Click the Go Live button (in the status bar at the bottom) or press Alt+L Alt+O

Other HTTP servers (like Python):
```bash
# Python 3
python -m http.server

# Python 2
python -m SimpleHTTPServer
```

3. Go to `http://localhost:8080` or the address shown by your server in your browser.

### Production Deployment

1. Upload the files to your preferred hosting platform (Netlify, Vercel, GitHub Pages, etc.).
2. No special configuration is required since it's a static website.

## Adding New Tools

To add a new tool, edit the `data/tools.json` file and add a new object in the following format:

```json
{
  "id": 21,
  "name": "New Tool Name",
  "category": "Category Name",
  "description": "Tool description",
  "icon": "fa-icon-class",
  "usage": "Usage instructions",
  "features": ["Feature 1", "Feature 2", "Feature 3", "Feature 4"]
}
```

## File Structure

```
tool-hub/
│
├── index.html                  # Main HTML file
├── css/
│   └── style.css               # Stylesheet
├── js/
│   └── main.js                 # Main JavaScript file
├── data/
│   └── tools.json              # Tool data
├── images/                     # Image files
└── README.md                   # Project documentation
```

## Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License.

## Contact

If you have questions or feedback, contact us at: [email@example.com](mailto:email@example.com) 