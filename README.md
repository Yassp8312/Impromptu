# Impromptu

Aplicación web para practicar oratoria mediante ejercicios de improvisación e investigación profunda. El usuario recibe un tema al azar, organiza sus ideas y practica una exposición breve con un temporizador integrado.

## Características

- Modo **Improvisado** con temas organizados por categorías.
- Modo **Investigación profunda** para estudiar un tema y explicarlo después.
- Mazo aleatorio con contador y animación de tarjetas.
- Temporizador de un minuto para las exposiciones.
- Selector de tema claro u oscuro.
- Opciones para compartir la aplicación.
- Temas y categorías administrados desde Supabase.
- Diseño adaptable para computadoras y dispositivos móviles.
- Metadatos SEO, Open Graph, Twitter Cards, `robots.txt` y `sitemap.xml`.
- Vercel Analytics en producción.

## Tecnologías

- [Next.js 16](https://nextjs.org/) con App Router
- [React 19](https://react.dev/)
- [TypeScript](https://www.typescriptlang.org/)
- [Tailwind CSS 4](https://tailwindcss.com/)
- [Supabase](https://supabase.com/) para la base de datos
- [Lucide](https://lucide.dev/) para iconos
- [Vercel Analytics](https://vercel.com/analytics)

## Requisitos

- Node.js 20 o una versión posterior compatible con Next.js 16.
- npm o pnpm.
- Un proyecto de Supabase.

## Instalación local

1. Clona el repositorio y entra en su carpeta:

   ```bash
   git clone <URL_DEL_REPOSITORIO>
   cd Impromptu
   ```

2. Instala las dependencias:

   ```bash
   npm install
   ```

3. Crea `.env.local` a partir de `.env.example` y completa las variables:

   ```env
   NEXT_PUBLIC_SITE_URL=http://localhost:3000
   NEXT_PUBLIC_SUPABASE_URL=https://tu-proyecto.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=tu_clave_anonima
   ```

4. Prepara la base de datos ejecutando [`supabase/setup.sql`](supabase/setup.sql) en el SQL Editor de Supabase.

5. Inicia el servidor de desarrollo:

   ```bash
   npm run dev
   ```

6. Abre [http://localhost:3000](http://localhost:3000).

## Variables de entorno

| Variable | Obligatoria | Descripción |
| --- | --- | --- |
| `NEXT_PUBLIC_SUPABASE_URL` | Sí | URL pública del proyecto de Supabase. |
| `NEXT_PUBLIC_SUPABASE_ANON_KEY` | Sí | Clave anónima pública de Supabase. No uses la `service_role`. |
| `NEXT_PUBLIC_SITE_URL` | En producción | URL pública completa; por ejemplo, `https://impromptu.com`. |

En Vercel, la aplicación puede detectar automáticamente la URL del despliegue. Para un dominio propio, configura siempre `NEXT_PUBLIC_SITE_URL` para que el canonical, Open Graph, `robots.txt` y `sitemap.xml` utilicen el dominio correcto.

## Base de datos

La aplicación utiliza dos tablas:

### `categories`

Guarda las categorías disponibles para el modo improvisado.

| Campo | Tipo | Uso |
| --- | --- | --- |
| `id` | UUID | Identificador principal. |
| `name` | VARCHAR | Nombre único de la categoría. |
| `icon` | VARCHAR | Símbolo mostrado en el selector. |
| `created_at` | TIMESTAMPTZ | Fecha de creación. |
| `updated_at` | TIMESTAMPTZ | Fecha de actualización. |

### `topics`

Guarda las tarjetas de ambos modos.

| Campo | Tipo | Uso |
| --- | --- | --- |
| `id` | UUID | Identificador principal. |
| `title` | VARCHAR | Texto del tema. |
| `category_id` | UUID | Categoría relacionada. |
| `mode` | VARCHAR | `improvisado` o `profundo`. |
| `created_at` | TIMESTAMPTZ | Fecha de creación. |
| `updated_at` | TIMESTAMPTZ | Fecha de actualización. |

Para agregar una tarjeta de investigación profunda:

```sql
INSERT INTO topics (title, category_id, mode)
VALUES (
  'El impacto de la inteligencia artificial en la educación',
  (SELECT id FROM categories LIMIT 1),
  'profundo'
);
```

> [!IMPORTANT]
> El script inicial incluye políticas públicas de escritura para facilitar la configuración. Antes de publicar una aplicación con administración desde el cliente, restringe las políticas de `INSERT`, `UPDATE` y `DELETE` y conserva únicamente los permisos que realmente necesites.

## Comandos disponibles

| Comando | Acción |
| --- | --- |
| `npm run dev` | Inicia Next.js en desarrollo usando Webpack. |
| `npm run build` | Genera la compilación de producción. |
| `npm run start` | Sirve una compilación de producción existente. |

Si el binario nativo de SWC no está disponible en Windows, puedes compilar explícitamente con Webpack:

```bash
npx next build --webpack
```

## Estructura principal

```text
app/
  favicon.ico        Icono del sitio
  layout.tsx         Metadatos y layout global
  page.tsx           Página principal
  robots.ts          Reglas para buscadores
  sitemap.ts         Mapa del sitio
components/
  impromptu-app.tsx  Interfaz y lógica principal
lib/
  site-url.ts        Resolución de la URL pública
  supabase.ts        Cliente y tipos de Supabase
public/
  og-image.png       Imagen para compartir en redes
supabase/
  setup.sql          Esquema y datos iniciales
```

## Despliegue en Vercel

1. Importa el repositorio en Vercel.
2. Añade las variables de entorno de Supabase.
3. Añade `NEXT_PUBLIC_SITE_URL` si utilizarás un dominio propio.
4. Despliega el proyecto.
5. Comprueba estas rutas en producción:

   - `/robots.txt`
   - `/sitemap.xml`
   - `/favicon.ico`
   - `/og-image.png`

Después de conectar un dominio propio, solicita la indexación de la página desde [Google Search Console](https://search.google.com/search-console/about).

## Créditos

Creado por **J.C/Yassper**. Idea original de **Francisco Annoni**.
