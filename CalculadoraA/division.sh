#!/bin/env bash
# =============================================================================
# division.sh — Problemas de DIVISIÓN
# Proyecto: Calculadora Educativa Interactiva
# =============================================================================
# ESTRATEGIA DE GENERACIÓN:
# Para garantizar divisiones exactas (sin decimales), usamos este truco:
#   1. Generamos A entre MIN_A y MAX_A  → será la RESPUESTA CORRECTA
#   2. Generamos B entre MIN_B y MAX_B  → será el DIVISOR
#   3. El DIVIDENDO = A * B             → siempre divisible entre B
#
# Ejemplo: A=7, B=4 → Dividendo=28 → pregunta: "28 ÷ 4 = ?" → respuesta: 7
#
# Esto garantiza:
#    División siempre exacta (resultado entero)
#    Nunca hay división entre cero (B mínimo = 1)
# =============================================================================
MIN_A=1
MAX_A=20
MIN_B=1
MAX_B=10

# =============================================================================
# GENERACIÓN DE NÚMEROS
# A  = la respuesta correcta (cociente)
# B  = el divisor
# DIVIDENDO = lo que se le muestra al usuario
# =============================================================================
A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))

DIVIDENDO=$(( A * B ))
RESPUESTA_CORRECTA=$A   # El usuario debe encontrar A

# Máximo de intentos permitidos
MAX_INTENTOS=3

# =============================================================================
# PRESENTACIÓN DEL PROBLEMA
# Se muestra el DIVIDENDO y el DIVISOR, nunca la respuesta.
# =============================================================================
echo ""
echo "=================================================="
echo "           ➗  PROBLEMA DE DIVISIÓN"
echo "=================================================="
echo ""
echo "  Resuelve la siguiente operación:"
echo ""
echo "        $DIVIDENDO ÷ $B = ?"
echo ""
echo "=================================================="

# =============================================================================
# BUCLE DE INTENTOS
# El resultado siempre es un entero positivo (mínimo 1),
# así que validamos solo dígitos positivos (^[1-9][0-9]*$ o "0" no aplica
# aquí porque el mínimo de A es 1).
# Usamos ^[0-9]+$ para no rechazar entradas como "10", "20", etc.
# =============================================================================
for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do

    INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))

    # -------------------------------------------------------------------------
    # LECTURA Y VALIDACIÓN DE ENTRADA
    # Solo aceptamos enteros no negativos. El resultado siempre será >= 1
    # pero dejamos que el usuario intente con cualquier entero y simplemente
    # falle — es más educativo que rechazar la entrada.
    # -------------------------------------------------------------------------
    while true; do
        echo ""
        read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO

        if [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]]; then
            break
        else
            echo "    Entrada inválida. Ingresa un número entero positivo."
        fi
    done

    # -------------------------------------------------------------------------
    # EVALUACIÓN DE LA RESPUESTA
    # -------------------------------------------------------------------------
    if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
        echo ""
        echo "   ¡Correcto! ¡Brillante!"
        echo "     $DIVIDENDO ÷ $B = $RESPUESTA_CORRECTA"
        echo ""
        exit 0
    else
        echo ""
        echo "   Respuesta incorrecta."
        if [[ $INTENTOS_RESTANTES -gt 0 ]]; then
            echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    fi

done

# =============================================================================
# MENSAJE FINAL — El usuario agotó todos los intentos
# =============================================================================
echo ""
echo "     Has agotado tus oportunidades. ¡Vuelve después!"
echo "     La respuesta correcta era: $DIVIDENDO ÷ $B = $RESPUESTA_CORRECTA"
echo ""

exit 1