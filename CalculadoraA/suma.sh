#!/bin/env bash
# =============================================================================
# suma.sh — Problemas de SUMA
# Proyecto: Calculadora Educativa Interactiva
# =============================================================================
# CONFIGURACIÓN DE RANGOS
# Estos valores definen los límites de los números generados aleatoriamente.
# Puedes cambiarlos aquí sin tocar el resto del código.
MIN_A=0
MAX_A=100
MIN_B=0
MAX_B=100

# =============================================================================
# GENERACIÓN DE NÚMEROS ALEATORIOS
# RANDOM genera un número entre 0 y 32767.
# La fórmula (RANDOM % (MAX - MIN + 1)) + MIN ajusta ese rango a lo que
# necesitamos. Ejemplo: (RANDOM % 101) + 0 da un número entre 0 y 100.
# =============================================================================
A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))

# Calculamos la respuesta correcta
RESPUESTA_CORRECTA=$(( A + B ))

# Máximo de intentos permitidos
MAX_INTENTOS=3

# =============================================================================
# PRESENTACIÓN DEL PROBLEMA
# =============================================================================
echo ""
echo "=================================================="
echo "           ➕  PROBLEMA DE SUMA"
echo "=================================================="
echo ""
echo "  Resuelve la siguiente operación:"
echo ""
echo "        $A + $B = ?"
echo ""
echo "=================================================="

# =============================================================================
# BUCLE DE INTENTOS
# Usamos un bucle 'for' que va del intento 1 al máximo permitido.
# Dentro del bucle validamos la entrada y evaluamos la respuesta.
# =============================================================================
for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do

    # Calculamos cuántos intentos quedan ANTES de leer la respuesta
    INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))

    # -------------------------------------------------------------------------
    # LECTURA Y VALIDACIÓN DE ENTRADA
    # Usamos un bucle 'while' interno para asegurarnos de que el usuario
    # ingrese un número entero válido (positivo, negativo o cero).
    # La expresión regular ^-?[0-9]+$ acepta:
    #   ^      → inicio de cadena
    #   -?     → un guión opcional (para negativos)
    #   [0-9]+ → uno o más dígitos
    #   $      → fin de cadena
    # -------------------------------------------------------------------------
    while true; do
        echo ""
        read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO

        if [[ "$RESPUESTA_USUARIO" =~ ^-?[0-9]+$ ]]; then
            break   # Entrada válida → salimos del bucle de validación
        else
            echo "  Entrada inválida. Por favor ingresa solo números enteros."
        fi
    done

    # -------------------------------------------------------------------------
    # EVALUACIÓN DE LA RESPUESTA
    # -------------------------------------------------------------------------
    if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
        # RESPUESTA CORRECTA
        echo ""
        echo "  ¡Correcto! ¡Muy bien hecho!"
        echo "     $A + $B = $RESPUESTA_CORRECTA"
        echo ""
        exit 0   # Salimos del script con éxito
    else
        # RESPUESTA INCORRECTA
        echo ""
        echo "  Respuesta incorrecta."

        # Solo mostramos los intentos restantes si aún quedan oportunidades
        if [[ $INTENTOS_RESTANTES -gt 0 ]]; then
            echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    fi

done

# =============================================================================
# MENSAJE FINAL — El usuario agotó todos los intentos
# Solo llegamos aquí si el bucle terminó sin un 'exit 0'
# =============================================================================
echo ""
echo "     Has agotado tus oportunidades. ¡Vuelve después!"
echo "     La respuesta correcta era: $A + $B = $RESPUESTA_CORRECTA"
echo ""

exit 1  # Salimos con código de error (útil para main.sh si lo necesita)