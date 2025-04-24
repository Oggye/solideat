from django.db import models

# Create your models here.
class Utilisateurs(models.Model):
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)
    email = models.EmailField(max_length=100)
    mot_de_passe = models.CharField(max_length=255)
    telephone = models.CharField(max_length=50)
    adresse = models.CharField(max_length=255)
    role = models.CharField(max_length=50)
    actif = models.BooleanField(default=True)

class Restaurants(models.Model):
    nom_restaurant = models.CharField(max_length=100)
    adresse = models.CharField(max_length=255)
    ville = models.CharField(max_length=100)
    code = models.CharField(max_length=5)
    description = models.TextField(null=True)
    actif = models.BooleanField(default=True)

class Produits(models.Model):
    nom_produit = models.CharField(max_length=100)
    description = models.CharField(max_length=255)
    prix = models.DecimalField(max_digits=6, decimal_places=2, default=0.00)
    stock = models.IntegerField()
    restaurant = models.ForeignKey(Restaurants, on_delete=models.CASCADE, related_name="produits")

class Panier(models.Model):
    montant_total = models.DecimalField(max_digits=8, decimal_places=2, default=0.00)
    type_operation = models.CharField(max_length=100)
    date_ajout = models.DateTimeField(auto_now_add=True)
    utilisateur = models.ForeignKey(Utilisateurs, on_delete=models.CASCADE, related_name="paniers")
    produits = models.ManyToManyField(Produits, through='Contient')

class Historiques(models.Model):
    statut = models.CharField(max_length=100)
    type_operation = models.CharField(max_length=255)
    date_historique = models.DateTimeField(auto_now_add=True)
    utilisateur = models.ForeignKey(Utilisateurs, on_delete=models.CASCADE, related_name="historiques")
    produit = models.ForeignKey(Produits, on_delete=models.CASCADE, related_name="historiques")

class Avis(models.Model):
    note = models.IntegerField()
    commentaire = models.CharField(max_length=255)
    date_avis = models.DateTimeField(auto_now_add=True)
    visbile = models.BooleanField(default=True)
    utilisateur = models.ForeignKey(Utilisateurs, on_delete=models.CASCADE, related_name="avis")
    restaurant = models.ForeignKey(Restaurants, on_delete=models.CASCADE, related_name="avis")


class Contient(models.Model):
    panier = models.ForeignKey(Panier, on_delete=models.CASCADE)
    produit = models.ForeignKey(Produits, on_delete=models.CASCADE)
