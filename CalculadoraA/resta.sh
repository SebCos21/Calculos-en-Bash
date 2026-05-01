#!/bin/env bash
# =============================================================================
# resta.sh — Problemas de RESTA
# Proyecto: Calculadora Educativa Interactiva
# =============================================================================
# CONFIGURACIÓN DE RANGOS
MIN_A=0
MAX_A=100
# NOTA: MIN_B es siempre 0, y MAX_B es siempre igual a A.
# Esto garantiza que B <= A y el resultado nunca sea negativo.

# =============================================================================
# GENERACIÓN DE NÚMEROS ALEATORIOS
# Primero generamos A normalmente.
# Luego generamos B entre 0 y A (no entre 0 y MAX_A).
# Así aseguramos que A - B >= 0 siempre.
# Caso especial: si A es 0, B también debe ser 0.
# =============================================================================
A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))

if [[ $A -eq 0 ]]; then
    B=0
else
    B=$(( RANDOM % (A + 1) ))  # B entre 0 y A (inclusive)
fi

# Calculamos la respuesta correcta
RESPUESTA_CORRECTA=$(( A - B ))

# Máximo de intentos permitidos
MAX_INTENTOS=3

# =============================================================================
# PRESENTACIÓN DEL PROBLEMA
# =============================================================================
echo ""
echo "=================================================="
echo "           ➖  PROBLEMA DE RESTA"
echo "=================================================="
echo ""
echo "  Resuelve la siguiente operación:"
echo ""
echo "        $A - $B = ?"
echo ""
echo "=================================================="

# =============================================================================
# BUCLE DE INTENTOS
# Misma lógica que suma.sh: 3 oportunidades con validación de entrada.
# =============================================================================
for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do

    INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))

    # -------------------------------------------------------------------------
    # LECTURA Y VALIDACIÓN DE ENTRADA
    # Aceptamos enteros no negativos únicamente, ya que el resultado
    # nunca puede ser negativo según la configuración elegida.
    # La expresión regular ^[0-9]+$ acepta solo dígitos (sin signo negativo).
    # -------------------------------------------------------------------------
    while true; do
        echo ""
        read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO

        if [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]]; then
            break
        else
            echo "   Entrada inválida. Ingresa un número entero positivo o cero."
        fi
    done

    # -------------------------------------------------------------------------
    # EVALUACIÓN DE LA RESPUESTA
    # -------------------------------------------------------------------------
    if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
        echo ""
        echo "   ¡Correcto! ¡Excelente!"
        echo "     $A - $B = $RESPUESTA_CORRECTA"
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
echo "     La respuesta correcta era: $A - $B = $RESPUESTA_CORRECTA"
echo ""

exit 1