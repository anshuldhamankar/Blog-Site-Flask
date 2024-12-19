from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Integer, String
from sqlalchemy.orm import Mapped, mapped_column
import pymysql
import json
from flask_mail import Mail
from datetime import datetime
import os
from werkzeug.utils import secure_filename
import math

with open('config.json', 'r') as c:
    parameters = json.load(c)["parameters"]
local_server = True

app = Flask(__name__)
app.secret_key = 'super-secret-key'
app.config['UPLOAD_FOLDER'] = parameters['upload_location']
if (local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = parameters["local_uri"]
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = parameters["prod_uri"]
app.config.update(
    MAIL_SERVER="smtp.gmail.com",
    MAIL_PORT=465,
    MAIL_USE_SSL=True,
    MAIL_USERNAME='email@gmail',  # Replace with your actual Gmail email address
    MAIL_PASSWORD='password'  # Replace with your actual Gmail app password or account password
)

mail = Mail(app)
db = SQLAlchemy(app)


class Contacts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(255), nullable=False)
    email = db.Column(db.String(255))
    phone_num = db.Column(db.String(20), unique=True, nullable=False)
    msg = db.Column(db.String(255), unique=False, nullable=False)


class Posts(db.Model):
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(255), nullable=False)
    content = db.Column(db.String(255), nullable=True)
    date = db.Column(db.String(12), nullable=True)
    slug = db.Column(db.String(30), nullable=False)
    subtitle = db.Column(db.String(100), nullable=True)
    img_file = db.Column(db.String(12), nullable=True)
    link = db.Column(db.String(100), nullable=True)


@app.route('/')
def home():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(parameters['no_of_posts']))
    page = request.args.get('page')

    if not str(page).isnumeric():
        page = 1
    page = int(page)

    start_index = (page - 1) * int(parameters['no_of_posts'])
    end_index = start_index + int(parameters['no_of_posts'])
    posts = posts[start_index:end_index]

    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', parameters=parameters, posts=posts, prev=prev, next=next)


@app.route('/index')
def index1():
    posts = Posts.query.filter_by().all()
    last = math.ceil(len(posts) / int(parameters['no_of_posts']))
    page = request.args.get('page')

    if not str(page).isnumeric():
        page = 1
    page = int(page)

    start_index = (page - 1) * int(parameters['no_of_posts'])
    end_index = start_index + int(parameters['no_of_posts'])
    posts = posts[start_index:end_index]

    if page == 1:
        prev = "#"
        next = "/?page=" + str(page + 1)
    elif page == last:
        prev = "/?page=" + str(page - 1)
        next = "#"
    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template('index.html', parameters=parameters, posts=posts, prev=prev, next=next)


@app.route('/about')
def about():
    return render_template("about.html", parameters=parameters)


@app.route('/contact', methods=['GET', 'POST'])
def contact():
    if (request.method == 'POST'):
        name = request.form.get('name')
        email = request.form.get('email')
        phone = request.form.get('phone')
        message = request.form.get('message')

        entry = Contacts(name=name, phone_num=phone, msg=message, email=email)
        db.session.add(entry)
        db.session.commit()
        mail.send_message(
            sender=email,
            recipients='abzalyakim@gmail.com',
            body=message + "\n" + phone)
    return render_template("contact.html", parameters=parameters)


@app.route('/post/<string:post_slug>', methods=['GET'])
def post_route(post_slug):
    post = Posts.query.filter_by(slug=post_slug).first()

    return render_template("post.html", parameters=parameters, post=post)


@app.route('/dashboard', methods=["GET", "POST"])
def dashboard():
    if 'user' in session and session['user'] == parameters["admin_username"]:
        posts = Posts.query.filter_by().all()
        return render_template('dashboard.html', parameters=parameters, posts=posts)

    if request.method == "POST":
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == parameters["admin_username"] and userpass == parameters['admin_password']):
            session['user'] = username
            posts = Posts.query.filter_by().all()
            return render_template('dashboard.html', parameters=parameters, posts=posts)

    return render_template("login.html", parameters=parameters)


@app.route('/mygear')
def gear():
    return render_template("mygear.html", parameters=parameters)


@app.route('/edit/<string:sno>', methods=['GET', 'POST'])
def edit(sno):
    date = datetime.now()  # Initialize date before the if statement

    if 'user' in session and session['user'] == parameters["admin_username"]:
        if request.method == "POST":
            box_title = request.form.get('title')
            subtitle = request.form.get('subtitle')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')
            link = request.form.get('link')
            date = datetime.now()

            if sno == '0':
                post = Posts(title=box_title,
                             slug=slug,
                             content=content,
                             subtitle=subtitle,
                             img_file=img_file,
                             link=link,
                             date=date)
                db.session.add(post)
                db.session.commit()
            else:
                post = Posts.query.filter_by(sno=sno).first()
                post.title = box_title
                post.slug = slug
                post.content = content
                post.subtitle = subtitle
                post.img_file = img_file
                post.link = link
                post.date = date
                db.session.commit()
                return redirect('/edit/' + sno)
    post = Posts.query.filter_by(sno=sno).first()
    return render_template('edit.html', parameters=parameters, post=post, date=date, sno=sno)
    return render_template('login.html', parameters=parameters)


@app.route('/uploader', methods=['GET', 'POST'])
def uploader():
    if 'user' in session and session['user'] == parameters["admin_username"]:
        if request.method == "POST":
            f = request.files['file1']
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))
            return "Uploaded Successfully"


@app.route('/logout')
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route('/delete/<string:sno>')
def delete(sno):
    if 'user' in session and session['user'] == parameters["admin_username"]:
        post = Posts.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


app.run(debug=True)
