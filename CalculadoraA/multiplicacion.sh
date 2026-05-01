#!/bin/env bash
# =============================================================================
# multiplicacion.sh — Problemas de MULTIPLICACIÓN
# Proyecto: Calculadora Educativa Interactiva
# =============================================================================
# CONFIGURACIÓN DE RANGOS
# A y B tienen rangos diferentes en esta operación.
MIN_A=0
MAX_A=100
MIN_B=0
MAX_B=10

# =============================================================================
# GENERACIÓN DE NÚMEROS ALEATORIOS
# Cada variable usa su propio rango MIN/MAX independiente.
# Resultado máximo posible: 100 x 10 = 1000
# =============================================================================
A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))

# Calculamos la respuesta correcta
RESPUESTA_CORRECTA=$(( A * B ))

# Máximo de intentos permitidos
MAX_INTENTOS=3

# =============================================================================
# PRESENTACIÓN DEL PROBLEMA
# =============================================================================
echo ""
echo "=================================================="
echo "        ✖️   PROBLEMA DE MULTIPLICACIÓN"
echo "=================================================="
echo ""
echo "  Resuelve la siguiente operación:"
echo ""
echo "        $A x $B = ?"
echo ""
echo "=================================================="

# =============================================================================
# BUCLE DE INTENTOS
# El resultado siempre es >= 0, así que validamos solo enteros no negativos.
# =============================================================================
for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do

    INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))

    # -------------------------------------------------------------------------
    # LECTURA Y VALIDACIÓN DE ENTRADA
    # Solo aceptamos enteros no negativos (^[0-9]+$) ya que el producto
    # de dos números >= 0 siempre es >= 0.
    # -------------------------------------------------------------------------
    while true; do
        echo ""
        read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO

        if [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]]; then
            break
        else
            echo "    Entrada inválida. Ingresa un número entero positivo o cero."
        fi
    done

    # -------------------------------------------------------------------------
    # EVALUACIÓN DE LA RESPUESTA
    # -------------------------------------------------------------------------
    if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
        echo ""
        echo "   ¡Correcto! ¡Fantástico!"
        echo "     $A x $B = $RESPUESTA_CORRECTA"
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
echo "     La respuesta correcta era: $A x $B = $RESPUESTA_CORRECTA"
echo ""

exit 1