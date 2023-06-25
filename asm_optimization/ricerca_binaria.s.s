; @authors Elia Renzoni, Alessio Visentino e Alessio Biagioli
; @date 20/05/2023
; Progetto per la Sessione Estiva di Architettura degli Elaboratori
; @brief Implementazione in MIPS Assembly dell'algoritmo di ricerca dicotomica per array giá ordinati

          .data

password:         .word 12, 37, 57, 64, 89, 95
codice_utente:    .word 57
indice_sx:        .word 0
indice_dx:        .word 5
indice_mx:        .word 0
divisore:         .word 2
var_supporto:     .word 1

          .text

start: 

      lw r1, indice_sx(r0)
      lw r2, indice_dx(r0)
      lw r3, indice_mx(r0)
      lw r4, var_supporto(r0)
      lw r5, codice_utente(r0)
      lw r6, divisore(r0)
      daddi r7, r0, password 

ricerca_loop:

      dadd r3, r1, r2                           ; somma l'indice di sinistra e quello di destra
      ddiv r3, r3, r6                           ; calcola l'indice di mezzo -> sx + dx / 2

imposta_elemento_mezzo:

      bne r12, r3, imposta_elemento_mezzo2
      j indice_impostato

imposta_elemento_mezzo2:

      daddi r7, r7, 8
      daddi r12, r12, 1
      j imposta_elemento_mezzo

indice_impostato:

      slt r8, r1, r2                            ; scrive in r8 il valore di veritá dell'espressione r1 < r2
      bnez r8, seconda_validazione
      beqz r8, controlla_uguaglianza

controlla_uguaglianza:

      beq r1, r2, seconda_validazione           ; se r1 é uguale a r2 allora salto all'etichetta seconda_validazione
      bne r1, r2, fine_ricerca                  ; se r1 non é uguale a r2 allora vuol dire che é maggiore, quindi salto all'etichecca fine_ricerca

seconda_validazione:

      lw r9, 0(r7)
      bne r9, r5, continua_ricerca              ; if password[mx] != codice_utente then continua_ricerca
      j fine_ricerca                            ; if password[mx] == codice_utente then fine_ricerca
 
continua_ricerca:

      slt r10, r5, r9                            ; if codice_utente < password[mx] 
      bnez r10, ricerca_in_sx                    ; if r9 == 1 then ricerca_in_sx 
      beqz r10, ricerca_in_dx                    ; if r0 == 0 then ricerca_in_dx

ricerca_in_sx:

      dsub r2, r3, r4                           ; indice_dx = indice_mx - 1
      j ricerca_loop

ricerca_in_dx:

      daddi r1, r3 , 1                          ; indice_sx = indice_mx + 1
      j ricerca_loop

fine_ricerca:

      bnez r8, trovato                          ; if r8 != 0 then trovato -> if r1 < r2
      beqz r8, secondo_controllo                ; if r8 == 0 then secondo_controllo -> if r1 < r2

secondo_controllo: 
      
      beq r1, r2, trovato                       ; if r1 == r2 then trovato
      j non_trovato                             ; if r1 > r2 then non trovato

trovato:

      lw r11, codice_utente(r0)
      j end

non_trovato:

      lw r11, var_supporto(r0)

end:

      halt
      