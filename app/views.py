from datetime import datetime
from django.shortcuts import render
from .models import Utilisateurs, Restaurants
from django.conf import settings
import csv
import os

def base(request):
    date = datetime.today()

    # Chemin complet vers le fichier CSV dans static
    csv_path = os.path.join(settings.BASE_DIR, 'app/static/restaurants-casvp.csv')

    try:
        if not os.path.exists(csv_path):
            print(f"Le fichier CSV {csv_path} est introuvable.")

        with open(csv_path, newline='', encoding='utf-8-sig') as csvfile:
            reader = csv.DictReader(csvfile, delimiter=';')

            # Nettoyer les noms de colonnes
            reader.fieldnames = [field.strip() for field in reader.fieldnames]
            print(f"Colonnes du fichier CSV nettoyées : {reader.fieldnames}")

            count_inserted = 0
            for row in reader:
                print(row)

                nom = row['Nom restaurant'.strip()].strip()
                adresse = row['adresse'.strip()].strip()
                ville = row['ville'.strip()].strip()
                code = row['code'.strip()].strip()
                description = row.get('tt', '').strip()

                # Vérifie si un Restaurants avec le même nom, adresse et code existe déjà
                if not Restaurants.objects.filter(nom_restaurant=nom, adresse=adresse, code=code).exists():
                    Restaurants.objects.create(
                        nom_restaurant=nom,
                        adresse=adresse,
                        ville=ville,
                        code=code,
                        description=description,
                    )
                    count_inserted += 1
                else:
                    print(f"Restaurants déjà présent : {nom_restaurant}, {adresse}, {code}")

        print(f"{count_inserted} Restaurants ont été ajoutés avec succès.")
    except Exception as e:
        print(f"Erreur lors du traitement du fichier CSV : {str(e)}")

    return render(request, "base.html", context={"prenom": "bob", "date": date})

def utilisateur(request):
    user = Utilisateurs.objects.all()
    print(user)
    return render(request, "utilisateur.html",context={'user':user})

def restaurant(request):
    restaurants = Restaurants.objects.all()
    return render(request, "restaurant.html",context={'restaurant':restaurants})

def message(request):
    return render(request, "message.html")