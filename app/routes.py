from flask import Blueprint, render_template, send_from_directory

bp = Blueprint('main', __name__)

@bp.route('/')
def index():
    songs = []  # empty → template renders safely
    return render_template('index.html', songs=songs)

@bp.route('/static/songs/<path:filename>')
def stream_song(filename):
    return send_from_directory('static/songs', filename, as_attachment=False)

@bp.route('/test-no-db')
def test_no_db():
    return "<h1>Hello from Flask! No database was used.</h1>"