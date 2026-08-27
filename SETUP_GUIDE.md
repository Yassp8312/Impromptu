# Guía de Configuración de Supabase

## 📋 Pasos para Configurar Supabase en el Proyecto

### 1. Instalar el Cliente de Supabase

Debido a posibles problemas de red con pnpm, usa npm para instalar el cliente:

```bash
npm install @supabase/supabase-js
```

Si npm también tiene problemas, puedes intentar:

```bash
# Usar yarn si está disponible
yarn add @supabase/supabase-js

# O instalar manualmente editando package.json
# Agrega "@supabase/supabase-js": "^2.x.x" a dependencies
# Luego ejecuta: pnpm install
```

### 2. Configurar Variables de Entorno

1. Copia el archivo `.env.example`:
   ```bash
   cp .env.example .env.local
   ```

2. Obtén tus credenciales de Supabase:
   - Ve a [supabase.com](https://supabase.com)
   - Inicia sesión en tu cuenta
   - Selecciona el proyecto "Impromptu"
   - Ve a Settings → API
   - Copia:
     - `Project URL` → `NEXT_PUBLIC_SUPABASE_URL`
     - `anon public` key → `NEXT_PUBLIC_SUPABASE_ANON_KEY`

3. Actualiza `.env.local` con tus credenciales:
   ```env
   NEXT_PUBLIC_SUPABASE_URL=https://hnjytbjsisotroaxxskd.supabase.co
   NEXT_PUBLIC_SUPABASE_ANON_KEY=tu_anon_key_real
   ```

### 3. Ejecutar el Script SQL

**Opción A: Desde el Dashboard de Supabase**

1. Ve a tu proyecto en Supabase
2. Navega a SQL Editor (ícono de consola en el sidebar)
3. Crea un nuevo query
4. Copia el contenido de `supabase/setup.sql`
5. Pega el script en el editor
6. Haz clic en "Run" para ejecutar

**Opción B: Usando la CLI de Supabase**

Si tienes la CLI de Supabase instalada:

```bash
# Instalar CLI si no está instalada
npm install -g supabase

# Login en Supabase
supabase login

# Link al proyecto
supabase link --project-ref hnjytbjsisotroaxxskd

# Ejecutar el script
supabase db push
```

### 4. Verificar la Configuración

1. Verifica que las tablas se crearon correctamente:
   - Ve a Table Editor en Supabase
   - Deberías ver las tablas `categories` y `topics`
   - Verifica que contienen los datos iniciales

2. Inicia el servidor de desarrollo:
   ```bash
   pnpm dev
   ```

3. Abre `http://localhost:3000` en tu navegador
4. La aplicación debería cargar los temas desde Supabase

### 5. Solución de Problemas

**Error: "NEXT_PUBLIC_SUPABASE_URL is not defined"**
- Verifica que `.env.local` existe y contiene las variables correctas
- Reinicia el servidor de desarrollo después de crear el archivo

**Error: "Failed to fetch" al cargar temas**
- Verifica que las credenciales de Supabase sean correctas
- Asegúrate de que las políticas RLS permitan acceso público
- Revisa la consola del navegador para más detalles

**Error: "supabase is not defined"**
- Verifica que `@supabase/supabase-js` esté instalado
- Revisa `package.json` para confirmar la dependencia
- Reinicia el servidor de desarrollo

**Las tablas están vacías**
- Ejecuta nuevamente el script SQL
- Verifica que no haya errores en la ejecución del script
- Revisa el log de ejecución en el SQL Editor

### 6. Agregar Nuevos Temas

**Desde el Dashboard de Supabase:**

1. Ve a Table Editor
2. Selecciona la tabla `categories` para agregar nuevas categorías
3. Selecciona la tabla `topics` para agregar nuevos temas
4. Para temas de investigación profunda, establece `mode` = 'profundo'

**Usando SQL:**

```sql
-- Agregar nueva categoría
INSERT INTO categories (name, icon) VALUES ('Tecnología', '⚡');

-- Agregar nuevo tema de improvisado
INSERT INTO topics (title, category_id, mode) 
VALUES ('La importancia de la ciberseguridad', 
        (SELECT id FROM categories WHERE name = 'Tecnología'), 
        'improvisado');

-- Agregar nuevo tema de investigación profunda
INSERT INTO topics (title, category_id, mode) 
VALUES ('Inteligencia Artificial y ética', 
        (SELECT id FROM categories WHERE name = 'Tecnología'), 
        'profundo');
```

### 7. Configuración de Producción

Para desplegar en producción:

1. **Vercel:**
   - Conecta tu repositorio a Vercel
   - Agrega las variables de entorno en Project Settings
   - Despliega automáticamente

2. **Otras plataformas:**
   - Configura las mismas variables de entorno
   - Asegúrate de que la URL de Supabase sea la de producción
   - Usa la `anon key` de producción

### 8. Seguridad

- Nunca compartas tu `service_role_key` (solo para backend)
- La `anon_key` es segura para uso en frontend
- Considera implementar autenticación si quieres restringir el acceso
- Las políticas RLS actuales permiten acceso público para facilitar el desarrollo

---

¿Necesitas ayuda con algún paso específico? Revisa la documentación oficial de [Supabase](https://supabase.com/docs) o crea un issue en el repositorio.
