from django.contrib import admin
from django.urls import path
from django.contrib.auth import views as auth_views  # Correctement importer ici
from auth_app import views  # Remplace auth_app par ton nom d'app

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.auth, name='auth'),  # URL par défaut vers ta vue d'authentification
    path('accueil/', views.accueil, name='accueil'),
    path('deconnexion/', views.deconnexion, name='deconnexion'),

    # URLs pour réinitialiser le mot de passe
    path('password-reset/', auth_views.PasswordResetView.as_view(
        template_name='password_reset.html',
        email_template_name='password_reset_email.html',
        success_url='/password-reset/done/'
    ), name='password_reset'),

    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(
        template_name='password_reset_done.html'
    ), name='password_reset_done'),

    path('reset/<uidb64>/<token>/', auth_views.PasswordResetConfirmView.as_view(
        template_name='password_reset_confirm.html',
        success_url='/reset/done/'
    ), name='password_reset_confirm'),

    path('reset/done/', auth_views.PasswordResetCompleteView.as_view(
        template_name='password_reset_complete.html'
    ), name='password_reset_complete'),
]