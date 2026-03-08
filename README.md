# Sealmetrics Tracking - Google Tag Manager Template

Official Sealmetrics template for Google Tag Manager. Track pageviews, microconversions, and conversions with cookieless, GDPR-compliant analytics.

## Installation

### Option 1: Community Template (template.tpl)

1. Download the `template.tpl` file
2. In Google Tag Manager, go to **Templates** > **Tag Templates** > **New**
3. Click the three dots (⋮) and select **Import**
4. Select the downloaded `template.tpl` file
5. Click **Save**

### Option 2: Container Import (sealmetrics-gtm-template.json)

If you prefer a ready-to-use container with pre-configured tags, triggers, and variables:

1. Download `sealmetrics-gtm-template.json`
2. In Google Tag Manager, go to **Admin** > **Import Container**
3. Upload the JSON file
4. Choose **"Merge"** and select **"Rename conflicting tags"**
5. Go to **Variables** and update `SealMetrics Account ID` with your Account ID

## Usage

### 1. Pageview

Track page visits:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Pageview
3. **Account ID**: Your Sealmetrics Account ID
4. **Pixel URL**: Leave default (`https://t.sealmetrics.com`) unless using a custom domain
5. **Content Grouping** (optional): Page category (e.g., "blog", "product")
6. **Trigger**: All Pages

The tracker automatically handles SPA navigation (History API), so you only need one pageview tag.

### 2. Microconversion (Add to Cart, Form Submissions, etc.)

Track intermediate actions:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Microconversion
3. **Account ID**: Your Account ID
4. **Event Label**: Event name (e.g., "add_to_cart", "newsletter_signup")
5. **Custom Properties** (optional): Add additional data
   - `product-id`: `12345`
   - `product-price`: `49.99`
6. **Trigger**: The event that fires the action (button click, form submission, etc.)

### 3. Conversion (Purchase, Lead, etc.)

Track completed conversions:

1. Create a new Tag and select **Sealmetrics Tracking**
2. **Event Type**: Conversion
3. **Account ID**: Your Account ID
4. **Event Label**: Conversion name (e.g., "purchase", "lead")
5. **Conversion Value**: Monetary value (e.g., "99.99")
6. **Custom Properties** (optional): Additional conversion data
7. **Trigger**: Confirmation page or purchase event

## Template Fields

| Field | Type | Description |
|-------|------|-------------|
| Event Type | Dropdown | Event type: Pageview, Microconversion, Conversion |
| Account ID | Text | Your Sealmetrics Account ID (required) |
| Pixel URL | Text | Pixel service URL (default: `https://t.sealmetrics.com`) |
| Event Label | Text | Descriptive event name (micro/conversion only) |
| Conversion Value | Text | Monetary value of the conversion |
| Content Grouping | Text | Page category (pageview only) |
| Custom Properties | Table | Custom key-value properties |

## How It Works

The template uses the SealMetrics v2 tracker (`t.sealmetrics.com/t.js`):

- **Pageview tags** inject the tracker script, which auto-tracks the pageview on load
- **Conversion/Micro tags** inject the same script (cached, loads once), then call `sealmetrics.conv()` or `sealmetrics.micro()`
- The tracker automatically detects SPA navigation via the History API — no extra configuration needed
- No cookies, no localStorage — fully cookieless tracking

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
payment-method: credit-card
shipping-method: express
coupon-code: WELCOME10
```

## Support

- Documentation: https://docs.sealmetrics.com
- Website: https://www.sealmetrics.com
- Email: support@sealmetrics.com

## License

Apache License 2.0
