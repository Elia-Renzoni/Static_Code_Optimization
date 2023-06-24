
int ricerca_password(int *password, int codice_utente, int numero_elementi) {

  int sx, dx, mx;
  int risultato;

  for (sx = 0, dx = numero_elementi - 1, mx = (sx + dx) / 2;
              ((sx <= dx) && (password[mx] != codice_utente));
       mx = (sx + dx) / 2) {
        if (password[mx] > codice_utente)
          dx = mx - 1;
        else
          dx = mx + 1;
  }

  return (risultato = (sx <= dx)? 1 : 0);

}
