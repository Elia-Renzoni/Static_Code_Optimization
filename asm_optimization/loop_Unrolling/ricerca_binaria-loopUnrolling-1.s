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

      lw r1, indice_sx(r0)    ; indice sx di ogni spazio di ricerca                   
      lw r2, indice_dx(r0)    ; indice dx di ogni spazio di ricerca
      lw r3, indice_mx(r0)    ; indice di mx di ogni spazio di ricerca
      lw r6, divisore(r0)    ; variabile contente il divisore = 2
      daddi r7, r0, password  ; puntatore al primo elemento dell'arr.

ricerca_loop:

      dadd r3, r1, r2  ; somma l'indice di sinistra e quello di destra
      ddiv r3, r3, r6  ; calcola l'indice di mezzo -> mx = sx + dx / 2

imposta_elemento_mezzo:  

      lw r5, codice_utente(r0) ; STALLO RISOLTO
      slt r11, r12, r3  ; if r12 < r3 
      lw r4, var_supporto(r0)  ; STALLO RISOLTO
      bnez r11, imposta_elemento_mezzo2 ; if r11 != 0 then imposta_elemento_mezzo2
      beqz r11, ultimo_controllo ; if r11 == 0 then ultimo_controllo

ultimo_controllo: ; controlla se r12 é uguale o maggiore di r3

      bne r12, r3, imposta_elemento_mezzo3 ; if r12 != r3 then imposta_elemento_mezzo3
      j indice_impostato  ; if r12 == r3 then indice_impostato

imposta_elemento_mezzo2: ; imposta l'indice if r12 < r3

      daddi r7, r7, 8 ; i++, incrementa il puntatore 
      daddi r12, r12, 1 ; incrementa il contatore del ciclo 

; LOOP SROLOTOLATO 
imposta_elemento_mezzo:  

      lw r5, codice_utente(r0) ; STALLO RISOLTO
      slt r11, r12, r3  ; if r12 < r3 
      lw r4, var_supporto(r0)  ; STALLO RISOLTO
      bnez r11, imposta_elemento_mezzo2 ; if r11 != 0 then imposta_elemento_mezzo2
      beqz r11, ultimo_controllo ; if r11 == 0 then ultimo_controllo

ultimo_controllo: ; controlla se r12 é uguale o maggiore di r3

      bne r12, r3, imposta_elemento_mezzo3 ; if r12 != r3 then imposta_elemento_mezzo3
      j indice_impostato  ; if r12 == r3 then indice_impostato

imposta_elemento_mezzo2: ; imposta l'indice if r12 < r3

      daddi r7, r7, 8 ; i++, incrementa il puntatore 
      daddi r12, r12, 1 ; incrementa il contatore del ciclo 

imposta_elemento_mezzo3: ; imposta l'indice if r12 > r3

      daddi r7, r7, -8 ; i--, decrementa il puntatore
      daddi r12, r12, -1 ; decrementa il contatore del ciclo
      j imposta_elemento_mezzo ; ritorna all'inizio del ciclo

indice_impostato: ; indice dell'elemento impostato correttamente

      slt r8, r1, r2   ; if r1 < r2
      lw r9, 0(r7)  ;  STALLO RISOLTO
      bnez r8, seconda_validazione ; if r8 != 0 then seconda_validazione
      beqz r8, controlla_uguaglianza ; if r8 == 0 then controlla_uguaglianza

controlla_uguaglianza: ; controllo l'uguaglianza tra gli indici

      beq r1, r2, seconda_validazione ; if r1 == r2 then seconda_validazione
      bne r1, r2, fine_ricerca  ; if r1 != r2 then fine_ricerca, in quanto r1 > r2

seconda_validazione: ; secondo controllo

      bne r9, r5, continua_ricerca   ; if password[mx] != codice_utente then continua_ricerca
      j fine_ricerca   ; if password[mx] == codice_utente then fine_ricerca
 
continua_ricerca: 

      slt r10, r5, r9       ; if codice_utente < password[mx] 
      bnez r10, ricerca_in_sx   ; if r9 == 1 then ricerca_in_sx 
      beqz r10, ricerca_in_dx   ; if r0 == 0 then ricerca_in_dx

ricerca_in_sx: ; cerco r5 verso valori minori

      dsub r2, r3, r4  ; indice_dx = indice_mx - 1
      j ricerca_loop ; ritorno all'inizio del loop

ricerca_in_dx: ; cerco r5 verso valori maggiori

      daddi r1, r3 , 1  ; indice_sx = indice_mx + 1
      j ricerca_loop ; ritorno all'inizio del loop

fine_ricerca:

      bnez r8, trovato   ; if r8 != 0 then trovato -> if r1 < r2
      beqz r8, secondo_controllo  ; if r8 == 0 then secondo_controllo -> if r1 < r2

secondo_controllo: ; controllo se gli indici sono uguali o meno
      
      beq r1, r2, trovato    ; if r1 == r2 then trovato
      j non_trovato     ; if r1 > r2 then non trovato

trovato:

      lw r11, codice_utente(r0) ; scrivo in r11 il contenuto di passoword[mx]
      j end 

non_trovato:

      lw r11, var_supporto(r0) ; scrivo in r11 il contenuto di var_supporto

end:

      halt