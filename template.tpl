___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Sealmetrics Tracking Tag",
  "description": "Track pageviews, conversions and custom events with Sealmetrics cookieless analytics.",
  "categories": [
    "ANALYTICS",
    "CONVERSIONS"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "SELECT",
    "name": "eventType",
    "displayName": "Event type",
    "macrosInSelect": false,
    "selectItems": [
      {
        "value": "pageview",
        "displayValue": "Pageview"
      },
      {
        "value": "microconversion",
        "displayValue": "Microconversion"
      },
      {
        "value": "conversion",
        "displayValue": "Conversion"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "pageview",
    "help": "Choose what you want to track. Use <strong>Pageview</strong> for page loads, <strong>Microconversion</strong> for actions like add-to-cart or form submissions, and <strong>Conversion</strong> for completed goals like purchases."
  },
  {
    "type": "TEXT",
    "name": "accountId",
    "displayName": "Account ID",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "help": "Enter your Sealmetrics Account ID. You'll find it in your <a href=\"https://app.sealmetrics.com\">Sealmetrics dashboard</a> under Settings.",
    "valueHint": "000000000000000000001234",
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "eventLabel",
    "displayName": "Event label",
    "simpleValueType": true,
    "help": "Give this event a descriptive name, e.g., <em>purchase</em>, <em>add_to_cart</em>, or <em>newsletter_signup</em>.",
    "valueHint": "purchase",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "microconversion",
        "type": "EQUALS"
      },
      {
        "paramName": "eventType",
        "paramValue": "conversion",
        "type": "EQUALS"
      }
    ],
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ],
    "alwaysInSummary": true
  },
  {
    "type": "TEXT",
    "name": "conversionValue",
    "displayName": "Conversion value",
    "simpleValueType": true,
    "help": "Enter the monetary value of this conversion, e.g., <em>99.99</em>. Leave empty if not applicable.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "conversion",
        "type": "EQUALS"
      }
    ],
    "valueHint": "99.99"
  },
  {
    "type": "TEXT",
    "name": "contentGrouping",
    "displayName": "Content grouping",
    "simpleValueType": true,
    "help": "Group pages by category, e.g., <em>blog</em>, <em>product</em>, or <em>checkout</em>. This helps organize your analytics data.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "pageview",
        "type": "EQUALS"
      }
    ],
    "valueHint": "blog"
  },
  {
    "type": "CHECKBOX",
    "name": "ignorePageview",
    "checkboxText": "Don't count as pageview",
    "simpleValueType": true,
    "help": "Enable this if you're firing a conversion or microconversion on the same page where a pageview tag already fires. This prevents duplicate pageview counts.",
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "microconversion",
        "type": "EQUALS"
      },
      {
        "paramName": "eventType",
        "paramValue": "conversion",
        "type": "EQUALS"
      }
    ],
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "superPrivacy",
    "checkboxText": "Enable super-privacy mode",
    "simpleValueType": true,
    "help": "When enabled, tracking works in aggregated-data mode without attributing conversions to traffic sources. Use this for maximum privacy compliance.",
    "defaultValue": false
  },
  {
    "type": "GROUP",
    "name": "customPropertiesGroup",
    "displayName": "Custom properties",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "customProperties",
        "displayName": "",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "Property name",
            "name": "key",
            "type": "TEXT",
            "valueHint": "product-id"
          },
          {
            "defaultValue": "",
            "displayName": "Property value",
            "name": "value",
            "type": "TEXT",
            "valueHint": "12345"
          }
        ],
        "help": "Add custom key-value pairs to attach additional data to this event, e.g., <em>product-id</em>, <em>order-total</em>, or <em>payment-method</em>."
      }
    ],
    "enablingConditions": [
      {
        "paramName": "eventType",
        "paramValue": "microconversion",
        "type": "EQUALS"
      },
      {
        "paramName": "eventType",
        "paramValue": "conversion",
        "type": "EQUALS"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const injectScript = require('injectScript');
const setInWindow = require('setInWindow');
const makeTableMap = require('makeTableMap');
const getType = require('getType');

// Build configuration object
const config = {
  account: data.accountId,
  event: data.eventType
};

// Enable session tracking unless super-privacy mode is on
if (!data.superPrivacy) {
  config.use_session = 1;
}

// Add event label for microconversions and conversions
if (data.eventType !== 'pageview' && data.eventLabel) {
  config.label = data.eventLabel;
}

// Add conversion value
if (data.eventType === 'conversion' && data.conversionValue) {
  config.amount = data.conversionValue;
}

// Add content grouping for pageviews
if (data.eventType === 'pageview' && data.contentGrouping) {
  config.content_grouping = data.contentGrouping;
}

// Prevent duplicate pageview counting
if (data.eventType !== 'pageview' && data.ignorePageview) {
  config.ignore_pageview = 1;
}

// Add custom properties
if (data.customProperties && getType(data.customProperties) === 'array' && data.customProperties.length > 0) {
  config.properties = makeTableMap(data.customProperties, 'key', 'value');
}

// Set configuration in window
setInWindow('oSm', config, true);

// Load and execute tracker
const trackerUrl = 'https://app.sealmetrics.com/tag/tracker';
injectScript(trackerUrl, data.gtmOnSuccess, data.gtmOnFailure);


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "vpiId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "vpiId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://app.sealmetrics.com/*"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "vpiId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "oSm"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "smTrackerLoaded"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "sm.tracker.track"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": true
                  }
                ]
              },
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "sm"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios: []


___NOTES___

Created on 17/12/2024, 12:00:00
