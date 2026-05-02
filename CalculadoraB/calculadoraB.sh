#!/bin/env bash

_suma() {
    local MIN_A=0 MAX_A=100 MIN_B=0 MAX_B=100
    local A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
    local B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))
    local RESPUESTA_CORRECTA=$(( A + B ))
    local MAX_INTENTOS=3

    echo ""
    echo "=================================================="
    echo "           +  PROBLEMA DE SUMA"
    echo "=================================================="
    echo ""
    echo "  Resuelve la siguiente operación:"
    echo ""
    echo "        $A + $B = ?"
    echo ""
    echo "=================================================="

    for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do
        local INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))
        while true; do
            echo ""
            read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO
            [[ "$RESPUESTA_USUARIO" =~ ^-?[0-9]+$ ]] && break
            echo "  Entrada inválida. Por favor ingresa solo números enteros."
        done
        if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
            echo ""
            echo "  ¡Correcto! ¡Muy bien hecho!"
            echo "     $A + $B = $RESPUESTA_CORRECTA"
            echo ""
            return 0
        else
            echo ""
            echo "  Respuesta incorrecta."
            [[ $INTENTOS_RESTANTES -gt 0 ]] && echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    done

    echo ""
    echo "     Has agotado tus oportunidades. ¡Vuelve después!"
    echo "     La respuesta correcta era: $A + $B = $RESPUESTA_CORRECTA"
    echo ""
    return 1
}

_resta() {
    local MIN_A=0 MAX_A=100
    local A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
    local B
    [[ $A -eq 0 ]] && B=0 || B=$(( RANDOM % (A + 1) ))
    local RESPUESTA_CORRECTA=$(( A - B ))
    local MAX_INTENTOS=3

    echo ""
    echo "=================================================="
    echo "           -  PROBLEMA DE RESTA"
    echo "=================================================="
    echo ""
    echo "  Resuelve la siguiente operación:"
    echo ""
    echo "        $A - $B = ?"
    echo ""
    echo "=================================================="

    for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do
        local INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))
        while true; do
            echo ""
            read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO
            [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]] && break
            echo "   Entrada inválida. Ingresa un número entero positivo o cero."
        done
        if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
            echo ""
            echo "   ¡Correcto! ¡Excelente!"
            echo "     $A - $B = $RESPUESTA_CORRECTA"
            echo ""
            return 0
        else
            echo ""
            echo "   Respuesta incorrecta."
            [[ $INTENTOS_RESTANTES -gt 0 ]] && echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    done

    echo ""
    echo "     Has agotado tus oportunidades. ¡Vuelve después!"
    echo "     La respuesta correcta era: $A - $B = $RESPUESTA_CORRECTA"
    echo ""
    return 1
}

_multiplicacion() {
    local MIN_A=0 MAX_A=100 MIN_B=0 MAX_B=10
    local A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
    local B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))
    local RESPUESTA_CORRECTA=$(( A * B ))
    local MAX_INTENTOS=3

    echo ""
    echo "=================================================="
    echo "        *   PROBLEMA DE MULTIPLICACIÓN"
    echo "=================================================="
    echo ""
    echo "  Resuelve la siguiente operación:"
    echo ""
    echo "        $A x $B = ?"
    echo ""
    echo "=================================================="

    for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do
        local INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))
        while true; do
            echo ""
            read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO
            [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]] && break
            echo "    Entrada inválida. Ingresa un número entero positivo o cero."
        done
        if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
            echo ""
            echo "   ¡Correcto! ¡Fantástico!"
            echo "     $A x $B = $RESPUESTA_CORRECTA"
            echo ""
            return 0
        else
            echo ""
            echo "   Respuesta incorrecta."
            [[ $INTENTOS_RESTANTES -gt 0 ]] && echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    done

    echo ""
    echo "     Has agotado tus oportunidades. ¡Vuelve después!"
    echo "     La respuesta correcta era: $A x $B = $RESPUESTA_CORRECTA"
    echo ""
    return 1
}

_division() {
    local MIN_A=1 MAX_A=20 MIN_B=1 MAX_B=10
    local A=$(( RANDOM % (MAX_A - MIN_A + 1) + MIN_A ))
    local B=$(( RANDOM % (MAX_B - MIN_B + 1) + MIN_B ))
    local DIVIDENDO=$(( A * B ))
    local RESPUESTA_CORRECTA=$A
    local MAX_INTENTOS=3

    echo ""
    echo "=================================================="
    echo "           /  PROBLEMA DE DIVISIÓN"
    echo "=================================================="
    echo ""
    echo "  Resuelve la siguiente operación:"
    echo ""
    echo "        $DIVIDENDO ÷ $B = ?"
    echo ""
    echo "=================================================="

    for (( INTENTO=1; INTENTO<=MAX_INTENTOS; INTENTO++ )); do
        local INTENTOS_RESTANTES=$(( MAX_INTENTOS - INTENTO ))
        while true; do
            echo ""
            read -rp "  Tu respuesta (intento $INTENTO de $MAX_INTENTOS): " RESPUESTA_USUARIO
            [[ "$RESPUESTA_USUARIO" =~ ^[0-9]+$ ]] && break
            echo "    Entrada inválida. Ingresa un número entero positivo."
        done
        if [[ "$RESPUESTA_USUARIO" -eq "$RESPUESTA_CORRECTA" ]]; then
            echo ""
            echo "   ¡Correcto! ¡Brillante!"
            echo "     $DIVIDENDO ÷ $B = $RESPUESTA_CORRECTA"
            echo ""
            return 0
        else
            echo ""
            echo "   Respuesta incorrecta."
            [[ $INTENTOS_RESTANTES -gt 0 ]] && echo "     Te quedan $INTENTOS_RESTANTES oportunidad(es)."
        fi
    done

    echo ""
    echo "     Has agotado tus oportunidades. ¡Vuelve después!"
    echo "     La respuesta correcta era: $DIVIDENDO ÷ $B = $RESPUESTA_CORRECTA"
    echo ""
    return 1
}

while true; do
    clear
    echo ""
    echo "  ╔══════════════════════════════════════════╗"
    echo "  ║              CALCULADORA                  ║"
    echo "  ║        Practica tus operaciones           ║"
    echo "  ╚══════════════════════════════════════════╝"
    echo ""
    echo "  ¿Qué operación quieres practicar?"
    echo ""
    echo "    1)  +  Suma"
    echo "    2)  -  Resta"
    echo "    3)  *   Multiplicación"
    echo "    4)  /  División"
    echo "    5)    Salir"
    echo ""
    echo "  ════════════════════════════════════════════"

    read -rp "  Elige una opción (1-5): " OPCION

    case $OPCION in
        1) clear; _suma;          echo ""; read -rp "  Presiona ENTER para volver al menú..." _ ;;
        2) clear; _resta;         echo ""; read -rp "  Presiona ENTER para volver al menú..." _ ;;
        3) clear; _multiplicacion; echo ""; read -rp "  Presiona ENTER para volver al menú..." _ ;;
        4) clear; _division;      echo ""; read -rp "  Presiona ENTER para volver al menú..." _ ;;
        5)
            clear
            echo ""
            echo "  ╔══════════════════════════════════════════╗"
            echo "  ║       ¡Hasta pronto!                      ║"
            echo "  ╚══════════════════════════════════════════╝"
            echo ""
            exit 0
            ;;
        *)
            echo ""
            echo "    Opción inválida. Por favor elige un número del 1 al 5."
            echo ""
            read -rp "  Presiona ENTER para continuar..." _
            ;;
    esac
done