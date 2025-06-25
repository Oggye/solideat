from django.db import models
from django.contrib.auth.models import AbstractUser

from django.contrib.auth.models import AbstractBaseUser, BaseUserManager, PermissionsMixin
from django.db import models
from django.utils import timezone


class UtilisateurManager(BaseUserManager):
    def create_user(self, email, password=None, **extra_fields):
        if not email:
            raise ValueError('L’adresse email est obligatoire')
        email = self.normalize_email(email)
        user = self.model(email=email, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, password=None, **extra_fields):
        extra_fields.setdefault('is_staff', True)
        extra_fields.setdefault('is_superuser', True)
        return self.create_user(email, password, **extra_fields)

class Utilisateur(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(unique=True, max_length=191)
    nom = models.CharField(max_length=50)
    prenom = models.CharField(max_length=50)
    telephone = models.CharField(max_length=50)
    adresse = models.CharField(max_length=255)
    role = models.CharField(max_length=50)
    actif = models.BooleanField(default=True)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)
    date_joined = models.DateTimeField(default=timezone.now)

    objects = UtilisateurManager()

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['nom', 'prenom']

    def __str__(self):
        return self.email


class Restaurant(models.Model):
    nom_restaurant = models.CharField(max_length=100)
    adresse = models.CharField(max_length=255)
    ville = models.CharField(max_length=100)
    code = models.CharField(max_length=5)
    description = models.TextField(blank=True, null=True)
    actif = models.BooleanField(default=True)

class Produit(models.Model):
    nom_produit = models.CharField(max_length=100)
    description = models.CharField(max_length=255)
    prix = models.DecimalField(max_digits=6, decimal_places=2)
    stock = models.IntegerField()
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)

class Panier(models.Model):
    montant_total = models.DecimalField(max_digits=8, decimal_places=2)
    type_operation = models.CharField(max_length=100)
    date_ajout = models.DateTimeField(auto_now_add=True)
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)

class Contient(models.Model):
    panier = models.ForeignKey(Panier, on_delete=models.CASCADE)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)

class Historique(models.Model):
    statut = models.CharField(max_length=100)
    type_operation = models.CharField(max_length=255)
    date_historique = models.DateTimeField(auto_now_add=True)
    produit = models.ForeignKey(Produit, on_delete=models.CASCADE)
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)

class Avis(models.Model):
    note = models.IntegerField()
    commentaire = models.CharField(max_length=255)
    date_avis = models.DateTimeField(auto_now_add=True)
    visbile = models.BooleanField(default=True)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    utilisateur = models.ForeignKey(Utilisateur, on_delete=models.CASCADE)


