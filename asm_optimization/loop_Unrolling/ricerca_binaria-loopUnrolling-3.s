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

imposta_elemento_mezzo2: ; imposta l'indice if r12 < r3

      daddi r7, r7, 8 ; i++, incrementa il puntatore 
      daddi r12, r12, 1 ; incrementa il contatore del ciclo 

; LOOP SROLOTOLATO 
imposta_elemento_mezzo:  

      lw r5, codice_utente(r0) ; STALLO RISOLTO
      slt r11, r12, r3  ; if r12 < r3 
      lw r4, var_supporto(r0)  ; STALLO RISOLTO

imposta_elemento_mezzo2: ; imposta l'indice if r12 < r3

      daddi r7, r7, 8 ; i++, incrementa il puntatore 
      daddi r12, r12, 1 ; incrementa il contatore del ciclo 

indice_impostato: ; indice dell'elemento impostato correttamente

      slt r8, r1, r2   ; if r1 < r2
      lw r9, 0(r7)  ;  STALLO RISOLTO

trovato:

      lw r11, codice_utente(r0) ; scrivo in r11 il contenuto di passoword[mx]

end:

      halt