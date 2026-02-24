from flask import Flask
from .config import Config

def create_app():
    app = Flask(__name__,
                static_folder='../static',
                template_folder='templates')

    app.config.from_object(Config)

    # No database / migrate anymore
    # db.init_app(app)          # removed
    # migrate.init_app(app, db) # removed

    with app.app_context():
        from . import routes
        app.register_blueprint(routes.bp)

    return app