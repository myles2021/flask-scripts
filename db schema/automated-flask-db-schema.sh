sudo apt update
sudo apt install python3 python3-venv python3-pip -y
mkdir 4-flask-db-schema && cd $_
python3 -m venv venv
source venv/bin/activate
touch app.py create.py requirements.txt

printf 'flask\nflask_sqlalchemy\npymysql' >> requirements.txt

pip3 install -r requirements.txt

printf "from flask import Flask # Import Flask class\nfrom flask_sqlalchemy import SQLAlchemy # Import SQLAlchemy class\nimport os\napp = Flask(__name__) # create Flask object\napp.config['SQLALCHEMY_DATABASE_URI'] = os.getenv('DATABASE_URI') # Set the connection string to connect to the database using an environment variable\napp.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False\ndb = SQLAlchemy(app) # Create SQLALchemy object\nclass Users(db.Model):\n    id = db.Column(db.Integer, primary_key=True)\n    first_name = db.Column(db.String(30), nullable=False)\n    last_name = db.Column(db.String(30), nullable=False)\nif __name__=='__main__':\n    app.run(debug==True, host='0.0.0.0')\n" >> app.py

printf "from app import db, Users\ndb.drop_all()\ndb.create_all()\ntestuser = Users(first_name='Grooty',last_name='Toot') # Extra: this section populates the table with an example entry\ndb.session.add(testuser)\ndb.session.commit()\n" >> create.py

export DATABASE_URI=mysql+pymysql://<user>:<password>@<ip_address>/testdb

python3 create.py

# # clean up
# deactivate
# rm -rf venv
