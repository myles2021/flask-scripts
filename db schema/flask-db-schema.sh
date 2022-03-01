sudo apt update
sudo apt install python3 python3-venv python3-pip -y
mkdir 4-flask-db-schema && cd $_
python3 -m venv venv
source venv/bin/activate
touch app.py create.py requirements.txt
code requirements.txt
# paste the following into requirements.txt
# flask
# flask_sqlalchemy
# pymysql
pip3 install -r requirements.txt
code app.py

# from flask import Flask # Import Flask class
# from flask_sqlalchemy import SQLAlchemy # Import SQLAlchemy class
# import os

# app = Flask(__name__) # create Flask object

# app.config['SQLALCHEMY_DATABASE_URI'] = os.getenv("DATABASE_URI") # Set the connection string to connect to the database using an environment variable
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False 
# db = SQLAlchemy(app) # Create SQLALchemy object

# class Users(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     first_name = db.Column(db.String(30), nullable=False)
#     last_name = db.Column(db.String(30), nullable=False)

# if __name__=='__main__':
#     app.run(debug==True, host='0.0.0.0')

code create.py

# from app import db, Users

# db.drop_all()
# db.create_all()

# testuser = Users(first_name='Grooty',last_name='Toot') # Extra: this section populates the table with an example entry
# db.session.add(testuser)
# db.session.commit()

export DATABASE_URI=mysql+pymysql://<user>:<password>@<ip_address>/testdb

python3 create.py

# clean up
deactivate
rm -rf venv
