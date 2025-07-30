___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "GA4 Items to Meta/Facebook Object Converter",
  "description": "This variable template easily converts GA4 Items structure to the Meta/Facebook object structure.\nIt is useful to track the ecommerce events of the FB Pixel and FB Conversion API through the GA4 Items.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "defaultCurrency",
    "displayName": "Default currency",
    "simpleValueType": true,
    "help": "Enter the default currency (eg. USD, EUR, GBP etc.)",
    "alwaysInSummary": true,
    "defaultValue": "EUR"
  },
  {
    "type": "SELECT",
    "name": "productType",
    "displayName": "Content Type",
    "macrosInSelect": true,
    "selectItems": [
      {
        "value": "product",
        "displayValue": "product"
      },
      {
        "value": "product_group",
        "displayValue": "product_group"
      },
      {
        "value": "home_listing",
        "displayValue": "home_listing"
      },
      {
        "value": "hotel",
        "displayValue": "hotel"
      },
      {
        "value": "flight",
        "displayValue": "flight"
      },
      {
        "value": "destination",
        "displayValue": "destination"
      },
      {
        "value": "vehicle",
        "displayValue": "vehicle"
      }
    ],
    "simpleValueType": true,
    "defaultValue": "product",
    "alwaysInSummary": true,
    "help": "It should be set to \u0027product\u0027 or \u0027product_group\u0027:\u003cul\u003e\u003cli\u003eUse \u0027product\u0027, if the keys you send represent products. Sent keys could be content_ids or contents.\u003c/li\u003e\u003cli\u003eUse \u0027product_group\u0027, if the keys you send in content_ids represent product groups. Product groups are used to distinguish products that are identical but have variations such as color, material, size or pattern.\u003c/li\u003e\u003c/ul\u003e"
  },
  {
    "type": "CHECKBOX",
    "name": "use_datalayer",
    "checkboxText": "Use Data Layer (GA4 Items structure)",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": true,
    "help": "You can use \u003ca href\u003d\"https://tagmanager.google.com/gallery/#/owners/matteo-zambon-gtm/templates/EEC-dataLayer-Builder-for-GA4\" target\u003d\"_blank\"\u003eEEC dataLayer Builder for GA4\u003c/a\u003e variable if you use Google Universal Analytics ecommerce object",
    "subParams": [
      {
        "type": "SELECT",
        "name": "alternative_items",
        "displayName": "Read Data Items Object from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "alternative_value",
        "displayName": "Read transaction value from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      },
      {
        "type": "SELECT",
        "name": "alternative_transaction_id",
        "displayName": "Read transaction id from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_datalayer",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "CHECKBOX",
    "name": "use_default_events",
    "checkboxText": "Use GA4 default events",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": true,
    "help": "You can use \u003ca href\u003d\"https://tagmanager.google.com/gallery/#/owners/matteo-zambon-gtm/templates/EEC-dataLayer-Builder-for-GA4\" target\u003d\"_blank\"\u003eEEC dataLayer Builder for GA4\u003c/a\u003e variable if you use Google Universal Analytics ecommerce object",
    "subParams": [
      {
        "type": "SELECT",
        "name": "alternative_eventName",
        "displayName": "Read Data from Variable",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "enablingConditions": [
          {
            "paramName": "use_default_events",
            "paramValue": true,
            "type": "NOT_EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "LABEL",
    "name": "label1",
    "displayName": "Add custom parameters. These parameters will override the other default parameters."
  },
  {
    "type": "TEXT",
    "name": "itemIdFormat",
    "displayName": "Item ID Format",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "defaultValue": "[[item_id]]",
    "help": "Define the format for the Item ID. Use {{Variable Name}} for GTM variables directly (they will be resolved by GTM) and [[item_property]] for GA4 item properties (e.g., product_{{Language}}_[[item_id]]_[[item_variant]])."
  },
  {
    "type": "SIMPLE_TABLE",
    "name": "custom_parameters_table",
    "displayName": "Add Key and Values to the Meta object",
    "simpleTableColumns": [
      {
        "defaultValue": "",
        "displayName": "Key",
        "name": "custom_parameters_key",
        "type": "TEXT"
      },
      {
        "defaultValue": "",
        "displayName": "Value",
        "name": "custom_parameters_value",
        "type": "TEXT"
      }
    ],
    "help": "Define the format for the custom parameters. Use {{Variable Name}} for GTM variables directly (they will be resolved by GTM) and [[item_property]] for GA4 item properties (e.g., product_{{Language}}_[[item_id]]_[[item_variant]]).\nThese parameters will override the other default parameters."
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const dl = require('copyFromDataLayer');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const ga4Events = ['view_item_list', 'select_item', 'view_item', 'remove_from_cart', 'add_to_cart', 'add_to_wishlist', 'view_promotion', 'select_promotion', 'view_cart', 'begin_checkout', 'add_shipping_info', 'add_payment_info', 'purchase', 'refund'];

var ecommerce_items = [];
var ecommerce = [];
var event = '';
const customParametersTable = data.custom_parameters_table;
let itemIdFormat = data.itemIdFormat;
if (!itemIdFormat) {
  itemIdFormat = '[[item_id]]';
}

if(data.use_datalayer === false){  
  ecommerce_items = data.alternative_items;
  ecommerce = data.alternative_items;
}
else{
  ecommerce_items = dl('ecommerce', 1).items;
  ecommerce = dl('ecommerce', 1);
}

if(data.use_default_events === false){
  event = data.alternative_eventName;
}
else{
  event = dl('event');  
}

// Funzione helper per risolvere solo i placeholder delle proprietà dell'item (es. [[item_id]])
const resolveItemId = (formatString, item) => {
  let resolvedId = formatString;
  let startIndex = -1;
  let endIndex = -1;

  // Ciclo per trovare e sostituire tutte le occorrenze di [[proprietà]]
  while ((startIndex = resolvedId.indexOf('[[')) !== -1) {
    endIndex = resolvedId.indexOf(']]', startIndex + 2);

    if (endIndex === -1) {
      // Formato non valido, es. "[[prop" senza "]]"
      break;
    }

    const propName = resolvedId.substring(startIndex + 2, endIndex);
    const itemPropertyValue = item.hasOwnProperty(propName) ? item[propName] : '';
    const replacementValue = itemPropertyValue !== undefined && itemPropertyValue !== null ? itemPropertyValue.toString() : '';

    // Sostituisci il placeholder con il valore risolto
    resolvedId = resolvedId.substring(0, startIndex) +
                 replacementValue +
                 resolvedId.substring(endIndex + 2);
  }

  return resolvedId;
};

if(ga4Events.indexOf(event) >= 0){
  let fbObj = {};    
  let totalValue;
  let prods = ecommerce_items;

  let idList = prods.map(function(prod) {
      return resolveItemId(itemIdFormat, prod);
/*    
     if(prod.hasOwnProperty('item_id')){
      return prod.item_id.toString();
    }
*/      
  });

  if(event === 'purchase'){
    if(data.use_datalayer === false){  
      totalValue = data.alternative_value;
      fbObj.order_id = data.alternative_transaction_id;
    }
    else
    {
      totalValue = ecommerce.value;
      fbObj.order_id = ecommerce.transaction_id;
    }
  }
  else{
    totalValue = prods.reduce(function(cur, acc) {
      if (!(acc.quantity)){
        acc.quantity = 1;
      }
      if(acc.hasOwnProperty('price')){
        return cur + (acc.price * acc.quantity);
      }
    }, 0);
  }

  let totalQuantity = prods.reduce(function(cur, acc) {
    if (!(acc.quantity))
      acc.quantity = 1;
    return cur + makeInteger(acc.quantity);
  }, 0);

  let contentsArray = prods.map(function(prod) {
    if (!(prod.quantity)){
      prod.quantity = 1;
    }
    if(prod.hasOwnProperty('item_id') && prod.hasOwnProperty('price'))
      return {
//        id: prod.item_id.toString(),
        id: resolveItemId(itemIdFormat, prod),
        item_price: makeNumber(prod.price),
        quantity: makeInteger(prod.quantity)
      };
  });

  fbObj.content_ids = idList;
  fbObj.value = totalValue;
  fbObj.num_items = totalQuantity;
  fbObj.contents = contentsArray;   
  fbObj.content_type = data.productType;
  if(ecommerce.hasOwnProperty('currency')){
    fbObj.currency = ecommerce.currency;
  }
  else{
    fbObj.currency = data.defaultCurrency;
  }

    // 2. Aggiungi i parametri personalizzati dalla tabella a gadsObj
    // Controllo "simile ad array" senza isArray
    if (typeof customParametersTable === 'object' && customParametersTable !== null && typeof customParametersTable.length === 'number') {
        // Tentiamo di prendere il primo item per i placeholder, se l'array prods non è vuoto
        const firstProd = (typeof prods === 'object' && prods !== null && typeof prods.length === 'number' && prods.length > 0) ? prods[0] : {};

        customParametersTable.forEach(function(param) {
            const key = param.custom_parameters_key;
            const valueFormat = param.custom_parameters_value;
            if (key && valueFormat) {
                fbObj[key] = resolveItemId(valueFormat, firstProd);
            }
        });
    }   
  
  return fbObj;
}
else{
  return {};
}


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "read_data_layer",
        "versionId": "1"
      },
      "param": [
        {
          "key": "allowedKeys",
          "value": {
            "type": 1,
            "string": "specific"
          }
        },
        {
          "key": "keyPatterns",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "event"
              },
              {
                "type": 1,
                "string": "ecommerce.*"
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

Created on 6/11/2021, 5:03:51 PM
