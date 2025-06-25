from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login, logout
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from .forms import CustomUserCreationForm, EmailAuthenticationForm  # bien importer les deux


def auth(request):
    form_connexion = EmailAuthenticationForm()
    form_inscription = CustomUserCreationForm()

    if request.method == 'POST':
        if 'login' in request.POST:
            form_connexion = EmailAuthenticationForm(request.POST)
            if form_connexion.is_valid():
                user = form_connexion.get_user()
                login(request, user)
                return redirect('accueil')
            else:
                messages.error(request, "Identifiants incorrects")

        elif 'register' in request.POST:
            form_inscription = CustomUserCreationForm(request.POST)
            if form_inscription.is_valid():
                user = form_inscription.save()
                login(request, user)
                return redirect('accueil')

    return render(request, 'auth.html', {
        'form_connexion': form_connexion,
        'form_inscription': form_inscription
    })


@login_required
def accueil(request):
    return render(request, 'accueil.html')

def deconnexion(request):
    logout(request)
    return redirect('auth')
