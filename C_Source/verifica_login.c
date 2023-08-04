
int ricerca_password(int *password, int codice_utente, int numero_elementi) {
  int sx, dx, mx;
  
  for (sx = 0, dx = numero_elementi - 1, mx = (sx + dx) / 2;
              ((sx <= dx) && (password[mx] != codice_utente));
       mx = (sx + dx) / 2) {
        if (codice_utente < password[mx])
          dx = mx - 1;
        else
          sx = mx + 1;
  }
  
  return ((sx <= dx)? mx : 1);
}
