from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth import authenticate
from .models import Utilisateur


class CustomUserCreationForm(UserCreationForm):
    class Meta:
        model = Utilisateur
        fields = ('email', 'nom', 'prenom', 'telephone', 'adresse', 'password1', 'password2')

    def __init__(self, *args, **kwargs):  # ← Cette ligne doit être dans la classe
        super().__init__(*args, **kwargs)  # ← Cette ligne ne doit PAS être à l’extérieur

        # Supprime les help_texts affichés par Django
        for field in self.fields.values():
            field.help_text = ''
        

class EmailAuthenticationForm(forms.Form):
    email = forms.EmailField(label="Email")
    password = forms.CharField(label="Mot de passe", widget=forms.PasswordInput)

    def __init__(self, *args, **kwargs):
        self.user = None
        super().__init__(*args, **kwargs)

    def clean(self):
        email = self.cleaned_data.get("email")
        password = self.cleaned_data.get("password")
        if email and password:
            self.user = authenticate(email=email, password=password)
            if self.user is None:
                raise forms.ValidationError("Email ou mot de passe incorrect.")
        return self.cleaned_data


    def get_user(self):
        return self.user
