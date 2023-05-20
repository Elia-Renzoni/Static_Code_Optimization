; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati


                .data    
password: .word 12, 34, 56, 78, 123, 456, 678
nuovo_codice_utente: .word 56
indice_sx: .word 0
indice_dx: .word 6
indice_mx: .word 0
esito_ricerca: .word 0

              .text
start:
    lw r1, indice_sx(r0)
    lw r2, indice_dx(r0)
    lw r3, indice_mx(r0)
    lw r4, esito_ricerca(r0)
    daddi r5, r3, password
    daddi r6, r0, nuovo_codice_utente
func_ricerca_binaria:
dadd r7, r1, r2                       ; inizializzazione del contatore indice_mx
ddiv r3, r7, 2
loop_scorri_elementi_array:
  lw r8, 0(r5)
  controllo_spostamento:              ; imposto la condizione del ciclo annidato : indice_sx <= indice_dx &&  password[mx] != nuovo_codice_utente
  
  
  spazio_ricerca_destra:
  
  spazione_ricerca_sinistra:
  
  
end:
  halt
