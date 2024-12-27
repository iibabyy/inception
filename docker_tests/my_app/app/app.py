from flask import Flask, render_template, request, redirect, url_for
from datetime import datetime

# Initialisation de l'application Flask
app = Flask(__name__)

# Liste pour stocker les messages
messages = []

# Route pour la page d'accueil
@app.route('/')
def accueil():
    return render_template('accueil.html', messages=messages)

# Route pour traiter le formulaire
@app.route('/poster', methods=['POST'])
def poster_message():
    message = request.form.get('message')
    if message:
        messages.append({
            'texte': message,
            'date': datetime.now().strftime("%Y-%m-%d %H:%M:%S")
        }) 
    return redirect(url_for('accueil'))

# Démarrage de l'application
if __name__ == '__main__':
    app.debug = True
    app.run(host='0.0.0.0', port=5000)