#  Calculadora Educativa Interactiva en Bash

Proyecto desarrollado en **Bash Script puro** para consola UNIX/Linux.
Permite practicar operaciones matemáticas básicas de forma interactiva con un sistema de intentos y retroalimentación inmediata.

---

##  Estructura del proyecto

```
calculadora/
├── main.sh              # Menú principal y controlador
├── suma.sh              # Problemas de suma
├── resta.sh             # Problemas de resta
├── multiplicacion.sh    # Problemas de multiplicación
└── division.sh          # Problemas de división
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

### 1. Clonar o descargar el proyecto

Coloca todos los archivos `.sh` dentro de una carpeta llamada `calculadora/`.

### 2. Dar permisos de ejecución

```bash
chmod +x main.sh suma.sh resta.sh multiplicacion.sh division.sh
```

### 3. Ejecutar el programa

```bash
bash main.sh
```


---

##  Ejecución desde Windows con WSL

Si tienes Windows con WSL instalado y tu proyecto está en una carpeta de Windows, sigue estos pasos:

### Paso 1 — Identificar la ruta de montaje

WSL monta tu unidad `C:\` de Windows. Según tu configuración puede ser:

| Configuración WSL     | Ruta de acceso a C:\     |
|-----------------------|--------------------------|
| WSL estándar (Ubuntu) | `/mnt/c/`                |
| WSL Alpine / custom   | `/mnt/host/c/`           |

Para verificar cuál es la tuya:
```bash
ls /mnt/
```

### Paso 2 — Copiar el proyecto al sistema Linux

```bash
cp -r "/mnt/host/c/Users/TU_USUARIO/ruta/hacia/CalculadoraA" ~/calculadora
```

>  Reemplaza `TU_USUARIO` y la ruta con los valores reales de tu equipo.
> Usa comillas si la ruta contiene **espacios**.

### Paso 3 — Entrar a la carpeta

```bash
cd ~/calculadora
```

### Paso 4 — Instalar Bash (solo Alpine Linux)

```bash
apk add bash
```

### Paso 5 — Dar permisos y ejecutar

```bash
chmod +x main.sh suma.sh resta.sh multiplicacion.sh division.sh
bash main.sh
```

### Alternativa rápida — Abrir WSL directo desde el Explorador

1. Navega hasta la carpeta `CalculadoraA` en el Explorador de Windows.
2. Haz clic en la **barra de direcciones**.
3. Escribe `wsl` y presiona **Enter**.
4. WSL se abre directamente en esa carpeta.
5. Ejecuta `chmod +x *.sh && bash main.sh`.

>  **Problema con OneDrive:** Si tus archivos están en OneDrive y WSL no los encuentra,
> haz clic derecho sobre la carpeta en el Explorador → **"Mantener siempre en este dispositivo"**
> y espera que se descarguen antes de volver a intentarlo.

---

##  Arquitectura del código

```
main.sh
  └── Bucle while true
        └── case $OPCION
              ├── 1) → llama suma.sh
              ├── 2) → llama resta.sh
              ├── 3) → llama multiplicacion.sh
              ├── 4) → llama division.sh
              └── 5) → exit 0
```

Cada script de operación sigue esta estructura interna:

```
operacion.sh
  ├── Genera A y B aleatorios (con RANDOM)
  ├── Calcula la respuesta correcta
  ├── Muestra la operación al usuario
  └── Bucle for (3 intentos)
        ├── Valida entrada con expresión regular
        ├── Compara respuesta del usuario
        ├── Si acierta  → felicita y exit 0
        └── Si falla    → muestra intentos restantes
```

---

##  Conceptos clave de Bash utilizados

| Concepto                  | Uso en el proyecto                              |
|---------------------------|-------------------------------------------------|
| `RANDOM`                  | Generación de números aleatorios                |
| `$(( ))`                  | Aritmética entera                               |
| `for (( i=1; i<=N; i++ ))` | Bucle de intentos                              |
| `while true`              | Menú principal y validación de entrada          |
| `case`                    | Selección de operación en el menú               |
| `[[ =~ ]]`                | Validación con expresiones regulares            |
| `read -rp`                | Lectura de entrada del usuario                  |
| `chmod +x`                | Permisos de ejecución                           |
| `$(dirname)`+ `pwd`       | Rutas absolutas portables entre sistemas        |
| `exit 0 / exit 1`         | Códigos de salida (éxito / fallo)               |

---