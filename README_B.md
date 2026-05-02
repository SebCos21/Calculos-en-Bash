#  Calculadora Educativa Interactiva en Bash

Proyecto desarrollado en **Bash Script puro** para consola UNIX/Linux.
Permite practicar operaciones matemáticas básicas de forma interactiva con un sistema de intentos y retroalimentación inmediata.

---

##  Estructura del proyecto

```
calculadora/
└── calculadora.sh      
```



---

##  Configuración de cada operación

| Operación       | Número A      | Número B         | Regla especial                          |
|-----------------|---------------|------------------|-----------------------------------------|
| Suma            | 0 – 100       | 0 – 100          | Ninguna                                 |
| Resta           | 0 – 100       | 0 – A            | Resultado siempre ≥ 0                   |
| Multiplicación  | 0 – 100       | 0 – 10           | Rangos distintos entre A y B            |
| División        | 1 – 20        | 1 – 10           | Dividendo = A×B, siempre exacta, sin decimales |

---

##  Funcionamiento del juego

1. El sistema genera dos números aleatorios según los rangos de cada operación.
2. Muestra la operación sin revelar el resultado.
3. El usuario tiene **3 oportunidades** para responder correctamente.
4. En cada intento:
   - Si **acierta** → mensaje de felicitación y regresa al menú.
   - Si **falla** → muestra cuántos intentos quedan (excepto en el último).
5. Si **agota los 3 intentos** → muestra la respuesta correcta.

---

##  Requisitos

- Sistema operativo **Linux / UNIX** o **WSL** en Windows.
- **Bash** instalado (versión 4 o superior recomendada).

### Verificar si Bash está instalado

```bash
bash --version
```

### Instalar Bash si no está disponible

**Alpine Linux / WSL Alpine:**
```bash
apk add bash
```

**Ubuntu / Debian:**
```bash
sudo apt update && sudo apt install bash
```

---

##  Instalación y ejecución

### 1. Descargar el script

Coloca `calculadora.sh` en cualquier carpeta.

### 2. Dar permisos de ejecución

```bash
chmod +x calculadora.sh
```

### 3. Ejecutar el programa

```bash
bash calculadora.sh
```


---

##  Ejecución desde Windows con WSL

### Paso 1 — Identificar la ruta de montaje

| Configuración WSL     | Ruta de acceso a C:\     |
|-----------------------|--------------------------|
| WSL estándar (Ubuntu) | `/mnt/c/`                |
| WSL Alpine / custom   | `/mnt/host/c/`           |

```bash
ls /mnt/
```

### Paso 2 — Copiar el script al sistema Linux

```bash
cp "/mnt/host/c/Users/TU_USUARIO/ruta/hacia/calculadora.sh" ~/calculadora.sh
```

### Paso 3 — Dar permisos y ejecutar

```bash
chmod +x ~/calculadora.sh
bash ~/calculadora.sh
```

### Alternativa rápida — Abrir WSL directo desde el Explorador

1. Navega hasta la carpeta en el Explorador de Windows.
2. Haz clic en la **barra de direcciones**, escribe `wsl` y presiona **Enter**.
3. Ejecuta `chmod +x calculadora.sh && bash calculadora.sh`.

>  **Problema con OneDrive:** Haz clic derecho → **"Mantener siempre en este dispositivo"** antes de ejecutar desde WSL.

---

##  Arquitectura del código

```
calculadora.sh
  ├── _suma()           — función: lógica de suma
  ├── _resta()          — función: lógica de resta
  ├── _multiplicacion() — función: lógica de multiplicación
  ├── _division()       — función: lógica de división
  └── while true        — menú principal
        └── case $OPCION
              ├── 1) → llama _suma
              ├── 2) → llama _resta
              ├── 3) → llama _multiplicacion
              ├── 4) → llama _division
              └── 5) → exit 0
```

Cada función sigue esta estructura interna:

```
_operacion()
  ├── Genera A y B aleatorios (con RANDOM)
  ├── Calcula la respuesta correcta
  ├── Muestra la operación al usuario
  └── Bucle for (3 intentos)
        ├── Valida entrada con expresión regular
        ├── Compara respuesta del usuario
        ├── Si acierta  → felicita y return 0
        └── Si falla    → muestra intentos restantes
```

---

##  Conceptos clave de Bash utilizados

| Concepto                   | Uso en el proyecto                              |
|----------------------------|-------------------------------------------------|
| `RANDOM`                   | Generación de números aleatorios                |
| `$(( ))`                   | Aritmética entera                               |
| `for (( i=1; i<=N; i++ ))` | Bucle de intentos                               |
| `while true`               | Menú principal y validación de entrada          |
| `case`                     | Selección de operación en el menú               |
| `[[ =~ ]]`                 | Validación con expresiones regulares            |
| `read -rp`                 | Lectura de entrada del usuario                  |
| `chmod +x`                 | Permisos de ejecución                           |
| `functions / local`        | Encapsulamiento de lógica por operación         |
| `return 0 / return 1`      | Códigos de salida por función (éxito / fallo)   |
| `exit 0`                   | Salida limpia del programa                      |

---