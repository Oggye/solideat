from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .models import Utilisateur
from django.utils.translation import gettext_lazy as _
from django import forms
from django.contrib.auth.forms import ReadOnlyPasswordHashField

class UtilisateurCreationForm(forms.ModelForm):
    """Formulaire de création d'un nouvel utilisateur avec mot de passe"""
    password1 = forms.CharField(label='Mot de passe', widget=forms.PasswordInput)
    password2 = forms.CharField(label='Confirmation du mot de passe', widget=forms.PasswordInput)

    class Meta:
        model = Utilisateur
        fields = ('email', 'nom', 'prenom')

    def clean_password2(self):
        p1 = self.cleaned_data.get("password1")
        p2 = self.cleaned_data.get("password2")
        if p1 and p2 and p1 != p2:
            raise forms.ValidationError("Les mots de passe ne correspondent pas.")
        return p2

    def save(self, commit=True):
        user = super().save(commit=False)
        user.set_password(self.cleaned_data["password1"])
        if commit:
            user.save()
        return user

class UtilisateurAdmin(UserAdmin):
    add_form = UtilisateurCreationForm
    model = Utilisateur
    list_display = ('email', 'nom', 'prenom', 'is_staff', 'is_active')
    list_filter = ('is_staff', 'is_active')
    ordering = ('email',)  # Remplace 'username'
    search_fields = ('email', 'nom', 'prenom')
    fieldsets = (
        (None, {'fields': ('email', 'password')}),
        (_('Informations personnelles'), {'fields': ('nom', 'prenom', 'telephone', 'adresse')}),
        (_('Permissions'), {'fields': ('is_staff', 'is_active', 'is_superuser', 'groups', 'user_permissions')}),
        (_('Dates importantes'), {'fields': ('last_login',)}),
    )
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('email', 'nom', 'prenom', 'password1', 'password2', 'is_staff', 'is_active')}
        ),
    )

admin.site.register(Utilisateur, UtilisateurAdmin)
