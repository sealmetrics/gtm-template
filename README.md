# Sealmetrics Tracking - Google Tag Manager Template

Template oficial de Sealmetrics para Google Tag Manager. Permite trackear pageviews, microconversiones y conversiones de forma sencilla y sin cookies.

## Instalación

### Opción 1: Importar manualmente

1. Descarga el archivo `template.tpl`
2. En Google Tag Manager, ve a **Templates** > **Tag Templates** > **New**
3. Haz clic en los tres puntos (⋮) y selecciona **Import**
4. Selecciona el archivo `template.tpl` descargado
5. Haz clic en **Save**

### Opción 2: Community Template Gallery (próximamente)

El template estará disponible en la galería oficial de Google Tag Manager.

## Uso

### 1. Pageview (Páginas vistas)

Para trackear visitas a páginas:

1. Crea un nuevo Tag y selecciona **Sealmetrics Tracking**
2. **Event Type**: Pageview
3. **Account ID**: Tu ID de cuenta de Sealmetrics
4. **Content Grouping** (opcional): Categoría de la página (ej: "blog", "producto")
5. **Trigger**: All Pages

### 2. Microconversion (Añadir al carrito, formularios, etc.)

Para trackear acciones intermedias:

1. Crea un nuevo Tag y selecciona **Sealmetrics Tracking**
2. **Event Type**: Microconversion
3. **Account ID**: Tu ID de cuenta
4. **Event Label**: Nombre del evento (ej: "add_to_cart", "newsletter_signup")
5. **Don't count as pageview**: ✅ Activado (recomendado)
6. **Custom Properties** (opcional): Añade datos adicionales
   - `product-id`: `12345`
   - `product-price`: `49.99`
7. **Trigger**: El evento que dispara la acción (clic en botón, envío de formulario, etc.)

### 3. Conversion (Compra, Lead, etc.)

Para trackear conversiones completadas:

1. Crea un nuevo Tag y selecciona **Sealmetrics Tracking**
2. **Event Type**: Conversion
3. **Account ID**: Tu ID de cuenta
4. **Event Label**: Nombre de la conversión (ej: "purchase", "lead")
5. **Conversion Value**: Valor monetario (ej: "99.99")
6. **Don't count as pageview**: ✅ Activado (recomendado)
7. **Custom Properties** (opcional): Datos adicionales de la conversión
8. **Trigger**: Página de confirmación o evento de compra

## Campos del Template

| Campo | Tipo | Descripción |
|-------|------|-------------|
| Event Type | Selector | Tipo de evento: Pageview, Microconversion, Conversion |
| Account ID | Texto | Tu ID de cuenta de Sealmetrics (obligatorio) |
| Event Label | Texto | Nombre descriptivo del evento (micro/conversión) |
| Conversion Value | Texto | Valor monetario de la conversión |
| Content Grouping | Texto | Categoría de la página (solo pageview) |
| Don't count as pageview | Checkbox | Evita contar como pageview adicional |
| Enable session tracking | Checkbox | Mantiene continuidad de sesión |
| Custom Properties | Tabla | Propiedades personalizadas key-value |

## Ejemplos de Custom Properties

### Add to Cart
```
product-id: SKU12345
product-name: Camiseta Azul
product-price: 29.99
product-category: Ropa
quantity: 2
```

### Purchase
```
order-id: ORD-2024-001
payment-method: credit-card
shipping-method: express
coupon-code: WELCOME10
```

## Características

- **Cookieless**: Tracking sin cookies, 100% compatible con GDPR
- **Session Tracking**: Mantiene la sesión del usuario sin cookies
- **Custom Properties**: Añade datos personalizados a cada evento
- **Fácil configuración**: Interfaz intuitiva con campos condicionales

## Soporte

- Documentación: https://docs.sealmetrics.com
- Web: https://www.sealmetrics.com
- Email: support@sealmetrics.com

## Licencia

Apache License 2.0
