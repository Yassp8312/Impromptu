# Impromptu 🎤

Una aplicación web para practicar y mejorar la oratoria a través de ejercicios de improvisación e investigación profunda.

## 🚀 Características

- **Modo Improvisado**: Elige una categoría y deja que el azar te dé un tema para practicar tu oratoria por 1 minuto
- **Investigación Profunda**: Tómate 15 minutos para investigar un tema y luego explícalo en 1 minuto
- **Temporizador Integrado**: Timer de 1 minuto para controlar tus exposiciones
- **Temas Dinámicos**: Los temas se cargan desde una base de datos de Supabase, facilitando la actualización constante
- **Interfaz Moderna**: Diseño elegante con modo claro/oscuro
- **Audio Feedback**: Efectos de sonido al girar el mazo de temas

## 🛠️ Stack Tecnológico

- **Frontend**: Next.js 16, React 19, TypeScript
- **UI**: Tailwind CSS, Base UI, Lucide Icons
- **Backend**: Supabase (PostgreSQL)
- **Cliente Supabase**: @supabase/supabase-js
- **Analytics**: Vercel Analytics

## 📋 Requisitos Previos

- Node.js (v18 o superior)
- pnpm o npm
- Cuenta de Supabase

## 🏗️ Instalación

1. **Clonar el repositorio**
   ```bash
   git clone <tu-repositorio>
   cd Impromptu
   ```

2. **Instalar dependencias**
   ```bash
   pnpm install
   # o
   npm install
   ```

3. **Configurar variables de entorno**
   
   Copia el archivo `.env.example` a `.env.local`:
   ```bash
   cp .env.example .env.local
   ```
   
   Actualiza las variables con tus credenciales de Supabase:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=https://tu-proyecto.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=tu_anon_key
   ```

4. **Configurar la base de datos en Supabase**
   
   Ejecuta el script SQL en tu dashboard de Supabase:
   - Ve a tu proyecto en Supabase
   - Navega a SQL Editor
   - Copia y ejecuta el contenido de `supabase/setup.sql`
   
   Esto creará las tablas necesarias e insertará los datos iniciales.

5. **Ejecutar el servidor de desarrollo**
   ```bash
   pnpm dev
   # o
   npm run dev
   ```

6. **Abrir en el navegador**
   
   Navega a `http://localhost:3000`

## 📚 Estructura del Proyecto

```
Impromptu/
├── app/                    # Páginas de Next.js
│   ├── layout.tsx         # Layout principal
│   ├── page.tsx            # Página de inicio
│   └── globals.css        # Estilos globales
├── components/             # Componentes React
│   ├── impromptu-app.tsx  # Componente principal de la aplicación
│   └── ui/                # Componentes UI reutilizables
├── lib/                    # Utilidades y configuraciones
│   ├── supabase.ts        # Cliente de Supabase
│   └── utils.ts           # Funciones utilitarias
├── supabase/              # Scripts de base de datos
│   └── setup.sql          # Script de inicialización
├── public/                # Archivos estáticos
└── package.json           # Dependencias del proyecto
```

## 🗄️ Esquema de Base de Datos

### Tabla `categories`
Almacena las categorías de temas para el modo improvisado.

- `id` (UUID): Identificador único
- `name` (VARCHAR): Nombre de la categoría
- `icon` (VARCHAR): Icono representativo
- `created_at`, `updated_at` (TIMESTAMP): Fechas de registro

### Tabla `topics`
Almacena los temas individuales para ambos modos de práctica.

- `id` (UUID): Identificador único
- `title` (VARCHAR): Título del tema
- `category_id` (UUID): Referencia a la categoría (solo para modo improvisado)
- `mode` (VARCHAR): 'improvisado' o 'profundo'
- `created_at`, `updated_at` (TIMESTAMP): Fechas de registro

## 🎯 Cómo Usar

### Modo Improvisado
1. Selecciona una categoría (Oratoria, Economía, Cultura, De todo)
2. Haz clic en "Girar el mazo" para obtener un tema aleatorio
3. Tómate 30 segundos para pensar
4. Expón el tema en 1 minuto usando el temporizador

### Modo Investigación Profunda
1. Selecciona el modo "Investigación profunda"
2. Haz clic en "Girar el mazo" para obtener un tema complejo
3. Tómate 15 minutos para investigar el tema
4. Expón lo aprendido en 1 minuto

### Agregar Nuevos Temas

Para agregar nuevos temas a la base de datos:

1. Ve al dashboard de Supabase
2. Navega a Table Editor
3. Agrega nuevas categorías en la tabla `categories`
4. Agrega nuevos temas en la tabla `topics`
5. Los cambios se reflejarán automáticamente en la aplicación

## 🎨 Personalización

### Modificar Temas Iniciales
Edita el archivo `supabase/setup.sql` para agregar o modificar los temas iniciales antes de ejecutar el script.

### Estilos
Los estilos principales se encuentran en `app/globals.css` y usan Tailwind CSS.

## 🚀 Despliegue

### Vercel
1. Conecta tu repositorio a Vercel
2. Configura las variables de entorno en Vercel
3. Despliega automáticamente

### Otros Proveedores
Asegúrate de configurar las variables de entorno `NEXT_PUBLIC_SUPABASE_URL` y `NEXT_PUBLIC_SUPABASE_ANON_KEY` en tu plataforma de hosting.

## 🤝 Contribución

Las contribuciones son bienvenidas. Por favor:

1. Fork el proyecto
2. Crea una rama para tu feature (`git checkout -b feature/AmazingFeature`)
3. Commit tus cambios (`git commit -m 'Add some AmazingFeature'`)
4. Push a la rama (`git push origin feature/AmazingFeature`)
5. Abre un Pull Request

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

## 👨‍💻 Autor

**Desarrollado por J.C/Yassper**
Idea original de Francisco Annoni

## 🙏 Agradecimientos

- A Francisco Annoni por la idea original del proyecto
- A la comunidad de open source por las herramientas utilizadas

---

**© 2026 Impromptu. Todos los derechos reservados.**
