# Flask Blog Site

A modern, responsive blog website built with Flask and Bootstrap, featuring a complete content management system with admin dashboard, contact functionality, and MySQL database integration.

![Flask](https://img.shields.io/badge/Flask-2.0+-blue.svg)
![Python](https://img.shields.io/badge/Python-3.7+-green.svg)
![Bootstrap](https://img.shields.io/badge/Bootstrap-5.0+-purple.svg)
![MySQL](https://img.shields.io/badge/MySQL-8.0+-orange.svg)

## 🌟 Features

### Frontend
- **Responsive Design**: Bootstrap-powered responsive layout that works on all devices
- **Modern UI**: Clean, professional design with custom CSS styling
- **Blog Posts**: Paginated blog post listing with preview content
- **Individual Post Pages**: Dedicated pages for each blog post with full content
- **About Page**: Personal information and background
- **Contact Form**: Functional contact form with email integration
- **My Gear Page**: Showcase of personal equipment/tools

### Backend & Admin Features
- **Admin Dashboard**: Secure admin panel for content management
- **CRUD Operations**: Create, read, update, and delete blog posts
- **File Upload**: Image upload functionality for blog posts
- **User Authentication**: Session-based admin authentication
- **Email Integration**: Contact form submissions sent via email
- **Database Management**: MySQL integration with SQLAlchemy ORM
- **Pagination**: Configurable post pagination

### Technical Features
- **Flask Framework**: Built with Flask web framework
- **SQLAlchemy ORM**: Database operations using SQLAlchemy
- **Flask-Mail**: Email functionality for contact forms
- **Secure File Handling**: Safe file upload with werkzeug
- **Session Management**: Secure admin session handling
- **Configuration Management**: JSON-based configuration system

## 🛠️ Technology Stack

- **Backend**: Python, Flask, SQLAlchemy
- **Frontend**: HTML5, CSS3, JavaScript, Bootstrap 5
- **Database**: MySQL with PyMySQL connector
- **Email**: Flask-Mail with SMTP
- **File Handling**: Werkzeug secure filename
- **Styling**: Custom CSS with Bootstrap framework

## 📋 Prerequisites

- Python 3.7 or higher
- MySQL Server
- pip (Python package installer)

## 🚀 Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd Blog-Site-Flask-main
```

### 2. Install Dependencies
```bash
pip install flask flask-sqlalchemy pymysql flask-mail
```

### 3. Database Setup
1. Create a MySQL database named `codingwizard`
2. Import the provided SQL file:
```bash
mysql -u root -p codingwizard < codingwizard.sql
```

### 4. Configuration
Update `config.json` with your settings:
```json
{
  "parameters": {
    "local_uri": "mysql+pymysql://username:password@localhost/codingwizard",
    "blog_name": "Your Blog Name",
    "admin_username": "your_admin_username",
    "admin_password": "your_admin_password",
    "gmailuserid": "your_email@gmail.com",
    "gmailpassword": "your_app_password",
    "upload_location": "path/to/upload/directory",
    "no_of_posts": 2
  }
}
```

### 5. Run the Application
```bash
python main.py
```

The application will be available at `http://localhost:5000`

## 📁 Project Structure

```
Blog-Site-Flask-main/
├── static/
│   ├── assets/
│   │   ├── img/           # Images and backgrounds
│   │   └── favicon.ico
│   ├── css/
│   │   ├── styles.css     # Main stylesheet
│   │   └── sign-in.css    # Login page styles
│   └── js/
│       └── scripts.js     # JavaScript functionality
├── templates/
│   ├── layout.html        # Base template
│   ├── index.html         # Home page
│   ├── about.html         # About page
│   ├── contact.html       # Contact form
│   ├── post.html          # Individual post page
│   ├── dashboard.html     # Admin dashboard
│   ├── edit.html          # Post editor
│   ├── login.html         # Admin login
│   └── mygear.html        # Gear showcase
├── main.py                # Main Flask application
├── config.json            # Configuration file
├── codingwizard.sql       # Database schema
└── README.md              # Project documentation
```

## 🎯 Usage

### For Visitors
1. **Browse Posts**: Visit the homepage to see all blog posts
2. **Read Posts**: Click on any post title to read the full content
3. **Contact**: Use the contact form to send messages
4. **About**: Learn more about the blog author

### For Administrators
1. **Login**: Access `/dashboard` and login with admin credentials
2. **Create Posts**: Use the dashboard to create new blog posts
3. **Edit Posts**: Modify existing posts through the edit interface
4. **Upload Images**: Upload images for blog posts
5. **Delete Posts**: Remove posts from the dashboard
6. **Manage Content**: Full CRUD operations on blog content

## 🔧 Configuration Options

- `no_of_posts`: Number of posts per page
- `blog_name`: Name displayed on the blog
- `admin_username/password`: Admin login credentials
- `upload_location`: Directory for uploaded files
- `local_uri/prod_uri`: Database connection strings
- Social media links (Instagram, LinkedIn, GitHub)

## 📧 Email Setup

For contact form functionality:
1. Enable 2-factor authentication on your Gmail account
2. Generate an app-specific password
3. Update the email configuration in `config.json`
4. Configure SMTP settings in `main.py`

## 🔒 Security Features

- Session-based authentication for admin access
- Secure file upload with filename sanitization
- SQL injection protection through SQLAlchemy ORM
- Password protection for admin functions

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨💻 Author

**Anshul Dhamankar**
- GitHub: [@anshuldhamankar2004](https://github.com/anshuldhamankar2004)
- LinkedIn: [Anshul Dhamankar](https://www.linkedin.com/in/anshul-dhamankar-57146b251/)
- Instagram: [@anshuldhamankar](https://www.instagram.com/anshuldhamankar/)

## 🙏 Acknowledgments

- Bootstrap for the responsive framework
- Flask community for excellent documentation
- MySQL for reliable database management
- All contributors and users of this project

---

⭐ **Star this repository if you found it helpful!**