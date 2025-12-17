# Sealmetrics Tracking - Google Tag Manager Template

Official Sealmetrics template for Google Tag Manager. Track pageviews, microconversions, and conversions easily with cookieless analytics.

## Installation

### Option 1: Manual Import

1. Download the `template.tpl` file
2. In Google Tag Manager, go to **Templates** > **Tag Templates** > **New**
3. Click the three dots (⋮) and select **Import**
4. Select the downloaded `template.tpl` file
5. Click **Save**

### Option 2: Community Template Gallery (coming soon)

The template will be available in the official Google Tag Manager gallery.

## Usage

### 1. Pageview

To track page visits:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Pageview
3. **Account ID**: Your Sealmetrics Account ID
4. **Content Grouping** (optional): Page category (e.g., "blog", "product")
5. **Trigger**: All Pages

### 2. Microconversion (Add to Cart, Form Submissions, etc.)

To track intermediate actions:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Microconversion
3. **Account ID**: Your Account ID
4. **Event Label**: Event name (e.g., "add_to_cart", "newsletter_signup")
5. **Don't count as pageview**: ✅ Enabled (recommended)
6. **Custom Properties** (optional): Add additional data
   - `product-id`: `12345`
   - `product-price`: `49.99`
7. **Trigger**: The event that fires the action (button click, form submission, etc.)

### 3. Conversion (Purchase, Lead, etc.)

To track completed conversions:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Conversion
3. **Account ID**: Your Account ID
4. **Event Label**: Conversion name (e.g., "purchase", "lead")
5. **Conversion Value**: Monetary value (e.g., "99.99")
6. **Don't count as pageview**: ✅ Enabled (recommended)
7. **Custom Properties** (optional): Additional conversion data
8. **Trigger**: Confirmation page or purchase event

## Template Fields

| Field | Type | Description |
|-------|------|-------------|
| Event Type | Dropdown | Event type: Pageview, Microconversion, Conversion |
| Account ID | Text | Your Sealmetrics Account ID (required) |
| Event Label | Text | Descriptive event name (micro/conversion) |
| Conversion Value | Text | Monetary value of the conversion |
| Content Grouping | Text | Page category (pageview only) |
| Don't count as pageview | Checkbox | Prevents counting as additional pageview |
| Enable Super-Privacy Tracking | Checkbox | Aggregated data mode without attribution |
| Custom Properties | Table | Custom key-value properties |

## Custom Properties Examples

### Add to Cart
```
product-id: SKU12345
product-name: Blue T-Shirt
product-price: 29.99
product-category: Clothing
quantity: 2
```

### Purchase
```
order-id: ORD-2024-001
payment-method: credit-card
shipping-method: express
coupon-code: WELCOME10
```

## Features

- **Cookieless**: Cookie-free tracking, 100% GDPR compliant
- **Super-Privacy Mode**: Aggregated data without source attribution
- **Custom Properties**: Add custom data to each event
- **Easy Configuration**: Intuitive interface with conditional fields

## Support

- Documentation: https://docs.sealmetrics.com
- Website: https://www.sealmetrics.com
- Email: support@sealmetrics.com

## License

Apache License 2.0
