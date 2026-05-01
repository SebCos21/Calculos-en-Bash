#!/bin/env bash
# =============================================================================
# main.sh — Menú Principal
# Proyecto: Calculadora Educativa Interactiva
# =============================================================================
# CONFIGURACIÓN
# Obtenemos la ruta absoluta del directorio donde está main.sh.
# Esto permite ejecutar main.sh desde cualquier ubicación del sistema
# y que siempre encuentre los demás scripts correctamente.
# =============================================================================
DIRECTORIO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# =============================================================================
# BUCLE PRINCIPAL
# El menú se repite indefinidamente hasta que el usuario elige "Salir" (5).
# Usamos 'while true' porque no sabemos cuántas veces iterará el usuario.
# =============================================================================
while true; do

    # -------------------------------------------------------------------------
    # LIMPIAR PANTALLA Y MOSTRAR MENÚ
    # 'clear' limpia la terminal antes de mostrar el menú cada vez.
    # -------------------------------------------------------------------------
    clear

    echo ""
    echo "  ╔══════════════════════════════════════════╗"
    echo "  ║    🧮  CALCULADORA EDUCATIVA              ║"
    echo "  ║        Practica tus operaciones           ║"
    echo "  ╚══════════════════════════════════════════╝"
    echo ""
    echo "  ¿Qué operación quieres practicar?"
    echo ""
    echo "    1)  ➕  Suma"
    echo "    2)  ➖  Resta"
    echo "    3)  ✖️   Multiplicación"
    echo "    4)  ➗  División"
    echo "    5)  🚪  Salir"
    echo ""
    echo "  ════════════════════════════════════════════"

    # -------------------------------------------------------------------------
    # LECTURA DE OPCIÓN
    # Usamos -rp para mostrar el prompt en la misma línea que la entrada.
    # -------------------------------------------------------------------------
    read -rp "  Elige una opción (1-5): " OPCION

    # -------------------------------------------------------------------------
    # EVALUACIÓN CON CASE
    # 'case' es ideal para menús: más limpio que múltiples if/elif.
    # Cada patrón termina con ;; (equivale a un 'break' en otros lenguajes).
    # El patrón * al final captura cualquier entrada no válida.
    # -------------------------------------------------------------------------
    case $OPCION in

        1)
            # --- SUMA ---
            clear
            bash "$DIRECTORIO/suma.sh"
            # Pausa para que el usuario lea el resultado antes de volver al menú
            echo ""
            read -rp "  Presiona ENTER para volver al menú..." _PAUSA
            ;;

        2)
            # --- RESTA ---
            clear
            bash "$DIRECTORIO/resta.sh"
            echo ""
            read -rp "  Presiona ENTER para volver al menú..." _PAUSA
            ;;

        3)
            # --- MULTIPLICACIÓN ---
            clear
            bash "$DIRECTORIO/multiplicacion.sh"
            echo ""
            read -rp "  Presiona ENTER para volver al menú..." _PAUSA
            ;;

        4)
            # --- DIVISIÓN ---
            clear
            bash "$DIRECTORIO/division.sh"
            echo ""
            read -rp "  Presiona ENTER para volver al menú..." _PAUSA
            ;;

        5)
            # --- SALIR ---
            clear
            echo ""
            echo "  ╔══════════════════════════════════════════╗"
            echo "  ║       ¡Hasta pronto!                      ║"
            echo "  ║       Sigue practicando matemáticas       ║"
            echo "  ╚══════════════════════════════════════════╝"
            echo ""
            exit 0
            ;;

        *)
            # --- OPCIÓN INVÁLIDA ---
            # No limpiamos pantalla aquí para que el usuario vea su error
            # antes de que el bucle vuelva a mostrar el menú.
            echo ""
            echo "    Opción inválida. Por favor elige un número del 1 al 5."
            echo ""
            read -rp "  Presiona ENTER para continuar..." _PAUSA
            ;;

    esac

done