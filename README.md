# hashka

- Experimenting with the BloC architecture in flutter.  
- The app allows the user to generate hashes from text they've input, the hash is copied to  the clipboard (e.g. provides an easy way to generate an easily memorable very long password).
- Behind the scenes BLoC is getting some exercise: there are multiple blocs with different concerns working together, nested bloc builders generating the UI, a repository using  
a data provider (google cloud function) which provides a random colour for the UI.
