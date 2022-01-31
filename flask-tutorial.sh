sudo apt update
sudo apt install python3 python3-venv python3-pip
mkdir 2-flask-routes && cd $_
python3 -m venv venv
source venv/bin/activate
pip3 install flask
touch app.py
code app.py

# from flask import Flask
 
# app = Flask(__name__)
 
# @app.route('/')
# @app.route('/home')
# def home():
#     return 'This is the home page'
 
# @app.route('/about')
# def about():
#     return 'This is the about page'
 
# if __name__ == "__main__":
#     app.run(debug=True, host='0.0.0.0', port=5000)

python app.py

# clean up

deactivate
rm -rf venv
