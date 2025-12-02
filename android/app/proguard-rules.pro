# ---------------------------------------------------------
# PROGUARD RULES — SANAD IDARI / QRPRUF
# Protection & compatibilité biométrie / Flutter
# ---------------------------------------------------------

# Garder les classes Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.embedding.** { *; }

# Garder les classes utilisées par local_auth
-keep class com.tekartik.sqflite.** { *; }
-keep class android.hardware.biometrics.** { *; }
-keep class androidx.biometric.** { *; }

# Garder Kotlin (Flutter utilise beaucoup de Kotlin)
-keep class kotlin.** { *; }
-dontwarn kotlin.**

# Garder les intents Android utilisés pour ouvrir l'app native
-keep class android.content.Intent { *; }

# Garder les activités Flutter
-keep class com.sanadidari.empreinte.** { *; }

# Empêcher la suppression des annotations
-keepattributes *Annotation*

# Garder les classes Firebase si un jour on les ajoute
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**

# Sécurité : ne jamais supprimer des classes inconnues (Flutter interne)
-dontwarn io.flutter.**
