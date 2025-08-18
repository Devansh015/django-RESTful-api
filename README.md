# Django Restful API
A lightweight REST API built with Django and TastyPie tested with Postman

### Tech Stack
- **Backend Framework**: Django (Python)  
- **API Framework**: TastyPie (for quick REST API scaffolding)  
- **Database**: SQLite (default Django DB, easily swappable)  
- **Environment**: Python 3, pip, virtualenv  

### Features
- 📦 CRUD operations (`Create`, `Read`, `Update`, `Delete`) for notes  
- 🔄 Automatic JSON serialization and deserialization  
- 🌐 RESTful endpoints exposed at `/api/v1/`  
- ⚙️ Minimal configuration required thanks to TastyPie  
- 📝 Extensible design — easily add more models and endpoints  

### Quick Start

1. **Clone the repository (or start a new Django project):**
   ```bash
   git clone <repo_url>
   cd notable_django
   ```
2. **Create and activate a virtual environment:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate (macOS)
   ```
4. **Install dependencies:**
   ```bash
   pip install django django-tastypie
   ```
5. **Run migrations:**
   ```bash
   python manage.py migrate
   ```
6. **Start the development server:**
   python manage.py runserver


